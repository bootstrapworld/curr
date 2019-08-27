#!/usr/bin/env racket
#lang racket/base
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         racket/list
         racket/match
         racket/vector
         (for-syntax racket/base)
         (planet neil/csv:1:=7)
         "lib/system-parameters.rkt"
         "lib/translate-pdfs.rkt"
         "lib/paths.rkt"
         "lib/build-helpers.rkt"
         "lib/build-modes.rkt"
         "lib/scribble-pdf-helpers.rkt"
         "lib/pdf-lesson-exercises.rkt"
         "lib/warnings.rkt"
         scribble/render
         file/zip)



;; This is a toplevel build script which generates scribble files for
;; the lessons and courses.  These scribble files will be translated
;; to HTML files, written under the deployment directory for simple
;; distribution.

;; In some cases, we need a distribution with a different directory 
;; structure (e.g. code.org needs everything in the units directories).
;; Distribution configuration occurs in update-resource-paths, and is
;; currently limited in flexibility.  Will expand that as needed.

;; The default deployment directory is "distribution"
(root-deployment-dir (simple-form-path "distribution"))
(current-deployment-dir (root-deployment-dir))

;;This lists all courses which are currently able to be built
#;(define available-course-specs '(("algebra" "en-us" "es-mx")
                                 ("algebra-pyret" "en-us")
                                 ("reactive" "en-us")
                                 ("data-science" "en-us")
                                 ("physics" "en-us")
                                 ;("blank-course" "en-us")
                                 ))
#;(define available-courses (map (lambda (course-spec) (first course-spec)) available-course-specs))

;; Depending on who we are generating for, we need to relocate the resources dirs.
;; May be able to do unit-to-resources-path in the bootstrap case using find-relative path
(define (update-resource-paths)
  (deploy-resources-dir (build-path (root-deployment-dir) "courses" (current-course) (getenv "LANGUAGE") "resources"))
  (unit-to-resources-path (build-path 'up 'up "resources")))
 

;; The following is a bit of namespace magic to avoid funkiness that 
;; several of our team members observed when running this build script
;; under DrRacket with debugging enabled.  We must make sure to use
;; a fairly clean namespace, but one that shares some critical modules
;; with this build script.
(define-namespace-anchor this-anchor)
(define shared-modules (list 'scribble/render
                             '(lib "curr/lib/system-parameters.rkt")))
(define (make-fresh-document-namespace)
  (define ns (make-base-namespace))
  (for ([mod shared-modules])
    (namespace-attach-module (namespace-anchor->namespace this-anchor) mod ns))
  ns)


(define document-namespace (make-fresh-document-namespace))

;; run-scribble: path -> void
;; Runs scribble on the given file.
(define (run-scribble scribble-file #:outfile (outfile #f)
                      #:never-generate-pdf? [never-generate-pdf? #f]
                      #:include-base-path? [include-base-path? #t])

  (define output-dir
    (cond [(current-deployment-dir)
           ;; Rendering to a particular deployment directory.
           (if include-base-path?
               (let-values ([(base name dir?) 
                             (split-path 
                              (find-relative-path (simple-form-path root-path)
                                                  (simple-form-path scribble-file)))])
                 (simple-form-path (build-path (current-deployment-dir) base)))
               (current-deployment-dir))]
          [else
           (error 'run-scribble "No deployment directory?")
           ;; In-place rendering
           #;(let-values ([(base name dir?)
                           (split-path (simple-form-path scribble-file))])
               base)]))
  (define-values (base name dir?) (split-path scribble-file))

  (define namestr (path->string name))

  (when (scribble-again? namestr base output-dir)
  
    (define output-path 
      (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" namestr ".html"))))
    
    (parameterize ([current-directory base]
                   [current-namespace document-namespace]
                   [current-document-output-path output-path])
      (render (list (dynamic-require `(file ,namestr) 'doc))
              (if outfile (list outfile) (list name))
              #:dest-dir output-dir
              ;; Comment out next line to use default scribble.css file
              #:style-file (build-path root-path "lib" "css-files-units" "scribble.css")
              )
      (when (and (not never-generate-pdf?) (current-generate-pdf?))
        (translate-html-to-pdf
         (build-path output-dir
                     (regexp-replace #px".scrbl$"
                                     namestr
                                     ".html")))))
  )
  (void))



;;;;;;;;;;;;;;;;;;;;;;; Warnings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;collects all warnings, to be printed at the end of the build script
(void (putenv "COLLECTED-WARNINGS" ""))

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable
;; Hard-set list. This is optionally replaced with command-line arguments below
;(define courses (list "algebra" "reactive" )) ;  "data-science" "physics"))
(define courses available-courses)

(units '())

(define run-languages (list "en-us" "es-mx"))

(define run-exercises? #t)

;(void
(putenv "CURRENT-SOLUTIONS-MODE" "off")
(putenv "TARGET-LANG" "pyret")
(putenv "LANGUAGE" "en-us")
      
;; warnings to be ignored when running the build script. This can be populated using the
;; command-line tag "--suppress-warnings a_b_c" or "--sw a_b_c" to suppress warning types a, b, and c.
;; Alternatively, "--sw all" can be used to suppress all WARNINGs.
(putenv "IGNORED-WARNINGS" "")



;;;;;;;;;;;;;;;;;;;; Command-line Usage Guideline ;;;;;;;;;;;;;;;;;;
;
;;; General Usage
; To run build with command-lines arguments, run "./build-notes --course <course> --language <lang>".
; You can run build using multiple tags. Each argument can only have one <value> follow it, BUT
; some of our command-line arguments need to be able to take multiple <values>. To fix this,
; enter your arguments seperated by underscores. Example:
;
;     ./build-notes --course algebra_reactive_physics
;
; The above command would build the algebra, reactive, and physics courses
;
;
;
;
;
;
;;; Different command-line tags and how to use them:
;;NOTE: These first four were added in Summer 2017 by Kielan Donahue and Jacob Jackson
;
; --course
; This selects which courses are to be produced. Can take multiple arguments (seperated by underscores)
;
; --language
; Not to be confused with "--lang", this selects what human languages to print documents in (currently only en-us or es-mx)
; This can take multiple arguments seperated by underscores.
;
; --sw or --suppress-warnings
; Denotes which types of WARNINGs are to be ignored while running build. Can be useful for WARNINGs that we expect
; and don't care about like evidence statements. In "lib/warnings.rkt" there is a list of all WARNING types. If the
; names are unclear, search for where that tag is used in the repo; almost all are from "lib/form-elements.rkt".
; NOTE: --sw can take multiple arguments, seperated by underscores. It can ALSO take "--sw all" to suppress all WARNINGs.
;;
;
; --deploy
; This indicates the directory to which to deploy the output
;
; --lang
; Indicate which language (Racket or Pyret) to generate
;
; --pdf
; Indicates the build to generate PDF documentation
;
;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define current-contextual-tags
  (command-line
   #:program "build"
   #:once-each
   
   ;; removed option for now, since not scribbling workbook
   ;; option is set in main entry point at end of file
   #;[("--worksheet-links-to-pdf") "Direct worksheet links to StudentWorkbook.pdf" 
                                   (putenv "WORKSHEET-LINKS-TO-PDF" "true")]
   [("--deploy") -deploy-dir "Deploy into the given directory, and create a .zip.  Default: deploy" 
                 (current-deployment-dir (simple-form-path -deploy-dir))]
   [("--language") -language "Select what language you are printing the curriculum for. Default: en-us"
                   (set! run-languages (parse-lang-args (string-split -language "_")))]
   [("--skip-exers") "Dictate if you'd like to skip building exercises"
                     (set! run-exercises? #f)]
   [("--suppress-warnings" "--sw") -sw "Dictate any types of warnings that you want to be suppressed in the output of running the Build script. Default: none."
                                   (for-each
                                    (lambda (sw-tag)
                                      (set-ignored-warnings sw-tag))
                                    (if (string=? -sw "all")
                                        ignore-warning-tags
                                        (parse-sw-args (string-split -sw "_"))))]
   [("--lang") -lang "Indicate which language (Racket or Pyret) to generate"
               (putenv "TARGET-LANG" -lang)]
   [("--course") -course "List all courses that you want to build. They MUST be separated by \"_\"_. Default: All available courses"
                 (set! courses (parse-course-args (string-split -course "_")))]
   [("--pdf") "Generate PDF documentation"
              (current-generate-pdf? #t)]
   
   #:args tags
   tags))


(define (print-build-intro-summary)
  (printf "\n\nPrinting documents in ~a \n" run-languages)
  (printf "Building courses: ~a\n" courses)
  (printf "Building units ~a\n" (units))
  (unless (string=? (getenv "IGNORED-WARNINGS") "")
    (printf "Ignoring the following warning types: ~a\n" (string-split (getenv "IGNORED-WARNINGS") "/")))
  (printf "\n\n"))



;; Note: this should be called first, because it can potentially wipe
;; out other subdirectories in the current deployment directory
;; otherwise.  The intent is for generated files to overwrite static
;; resources.
(define (make-fresh-deployment-and-copy-static-pages)
  ;;If the directory already exists, wipe it and make a new one
  (when (directory-exists? (current-deployment-dir))
      (delete-directory/files (current-deployment-dir)))
  (make-directory (current-deployment-dir))

  (cond
    [(and (directory-exists? (current-deployment-dir))
          (directory-exists? (build-path (current-deployment-dir) "lessons" (getenv "LANGUAGE")))
          (not (build-exercises?)))
     (for ([subdir (directory-list (current-deployment-dir))]
           #:when (not (string=? (path->string subdir) "lessons")))
       (delete-directory/files (build-path (current-deployment-dir) subdir)))]
    [else (when (directory-exists? (current-deployment-dir))
            (delete-directory/files (current-deployment-dir)))
          (make-directory (current-deployment-dir))
          (make-directory (build-path (current-deployment-dir) "lessons"))])

  (for ([base (directory-list (static-pages-path))])
    (define source-full-path (build-path (static-pages-path) base))
    (define target-full-path (build-path (current-deployment-dir) base))
    (when (or (file-exists? target-full-path)
              (directory-exists? target-full-path))
      (delete-directory/files target-full-path))
    (copy-directory/files source-full-path target-full-path)))

;; Building the units of the course.
;; We must do this twice to resolve cross references for lessons.
(define (build-course-units)
  ;; build the units
  (when (directory-exists? (get-units-dir)) 
    (printf "build.rkt: building ~a\n" (current-course))
    (when (directory-exists? (get-units-dir))
      (for ([phase (in-range 2)])
        (printf "Phase ~a\n" phase)
        
        ;;checks to see if you want to use all the units. if no units specified, uses all units
        (define units-to-use (directory-list (get-units-dir)))
        
        (for ([subdir units-to-use]
              #:when (directory-exists?  (build-path (get-units-dir) subdir)))
          
          (define scribble-file (simple-form-path (build-path (build-path courses-base (current-course) "units" "langs" (getenv "LANGUAGE"))
                                                              subdir "the-unit.scrbl"))); langs path
          (cond [(file-exists? scribble-file)
                 (printf "build.rkt: Building ~a\n" scribble-file)
                 (copy-file (build-path "lib" "box.gif") 
                            (build-path (get-units-dir) subdir "box.gif")
                            #t)
                 (parameterize ([current-unit (path->string subdir)]
                                [current-deployment-dir
                                 (build-path (root-deployment-dir) "courses" (current-course) (getenv "LANGUAGE") "units" subdir)])
                   (run-scribble scribble-file #:outfile "index" #:never-generate-pdf? (= phase 0) #:include-base-path? #f))
                 ]
                [else
                 (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                         (build-path (get-units-dir) subdir))])))
      
      ;; copy exercises from individual lessons into units that reference them 
      (for ([subdir (directory-list (get-units-dir))]
            #:when (directory-exists? (build-path (get-units-dir) subdir)))
        (let (;[exercises-dir (build-path (get-units-dir) subdir "exercises")]
              [deploy-exercises-dir (build-path (current-deployment-dir) "courses" (current-course) (getenv "LANGUAGE")
                                                "units"
                                                subdir "exercises")])
          (unless (directory-exists? deploy-exercises-dir)
            ; (unless (directory-exists? (build-path (current-deployment-dir) "courses" (current-course) (getenv "LANGUAGE") "units")))
              
            (make-directory deploy-exercises-dir))
          
          (let ([exer-list-path (build-path (get-units-dir) subdir "exercise-list.rkt")])
            (when (file-exists? exer-list-path)
              (let ([unit-exercises (with-input-from-file exer-list-path read)])
                ;; copies all exercise from relevant lessons into units
                (let ([lessonnames (remove-duplicates
                                    (map (lambda (exer-path-str)
                                           (let* ([exer-path (string->path exer-path-str)]
                                                  [path-elts (explode-path exer-path)])
                                             (if (< (length path-elts) 2)
                                                 (error "ERROR: unexpected exercise path ~a during build ~n" exer-path)
                                                 (second path-elts))))
                                         unit-exercises))])
                  (for-each (lambda (lessonname)
                              (let* ([lessonpath (build-path (current-deployment-dir) "lessons" (getenv "LANGUAGE") lessonname)]
                                     [lessonexerpath (build-path lessonpath "exercises")]
                                     [deploy-exer-path (build-path deploy-exercises-dir lessonname)])
                                (unless (directory-exists? deploy-exer-path)
                                  (make-directory deploy-exer-path))
                                (unless (directory-exists? lessonpath)
                                  (make-directory lessonpath)
                                  (make-directory lessonexerpath))
                                (for ([exerfile (directory-list lessonexerpath)])
                                  ; don't copy some file extensions
                                  (unless (or (regexp-match #px".*\\.scrbl$" exerfile)
                                              (regexp-match #px".*\\.bak$" exerfile)
                                              (regexp-match #px".*\\.*~$" exerfile))
                                    (copy-file (build-path lessonexerpath exerfile)
                                               (build-path deploy-exer-path exerfile)
                                               #t
                                               )))))
                            lessonnames))
                )))))
      ))

  ;; build the main page
  (printf "build.rkt: building ~a main\n" (current-course))
  (parameterize ([current-deployment-dir
                  (build-path (current-deployment-dir) "courses" (current-course) (getenv "LANGUAGE"))])
    (run-scribble (get-course-main) #:outfile "index" #:include-base-path? #f))

  ;; rename the course directory
  (printf "build.rkt: renaming directory for ~a \n" (current-course))
  (rename-file-or-directory (build-path (current-deployment-dir) "courses" (current-course) (getenv "LANGUAGE") "index.html")
                            (build-path (current-deployment-dir) "courses" (current-course) (getenv "LANGUAGE") "index.shtml")
                            #t)
  (unless (directory-exists? (get-units-dir)) 
    (WARNING (format "No units directory found for course ~a in language ~a" 
                     (current-course) (getenv "LANGUAGE")) 'no-course-dir))
  )

;; Building the lessons
(define (build-lessons)
  (printf "build.rkt: building lessons\n")
  (for ([subdir (directory-list (lessons-dir))]
        #:when (directory-exists? (build-path (lessons-dir) subdir)))
    (define scribble-file (simple-form-path (build-path (lessons-dir) subdir "lesson" "lesson.scrbl")))
    (cond [(file-exists? scribble-file)
           (printf "build.rkt: Building ~a\n" scribble-file)
           (run-scribble scribble-file #:never-generate-pdf? #t)]
          [else
           (WARNING (format "Could not find a \"lesson.scrbl\" in directory ~a\n"
                            (build-path (lessons-dir) subdir))
                    'missing-lessons)])
    )
  )


(define (build-exercise-handouts)
  ;(make-directory (build-path (root-deployment-dir) "lessons" (getenv "LANGUAGE")))
  (for ([subdir (directory-list (lessons-dir))]
        #:when (directory-exists? (build-path (lessons-dir)  subdir)))
    (when (directory-exists? (build-path (lessons-dir) subdir "exercises"))
      (let ([old-deployment-dir (current-deployment-dir)])
        (parameterize ([current-deployment-dir (build-path (current-deployment-dir) "lessons" (getenv "LANGUAGE") subdir "exercises")])
          (for ([worksheet (directory-list (build-path (lessons-dir) subdir "exercises"))]
                #:when (regexp-match #px".scrbl$" worksheet))
            (printf "building exercise at: ~a \n" (path->string (build-path (lessons-dir) subdir "exercises" worksheet)))
            (run-scribble (build-path (lessons-dir) subdir "exercises" worksheet) #:include-base-path? #f)
            (copy-file (build-path "lib" "backlogo.png")
                       ;(build-path (current-deployment-dir) "lessons" (getenv "LANGUAGE") subdir "exercises" "backlogo.png")
                       (build-path (current-deployment-dir) "backlogo.png")
                       #t))
          ;; if some lesson only has .pdf exercises (not sourced from scrbl), the subdir won't exist
          (unless (directory-exists? (current-deployment-dir))
            (create-path-dirs old-deployment-dir (list "lessons" (getenv "LANGUAGE") subdir))
            (make-directory (current-deployment-dir))
            )
          ;; copy over .pdf exercises that do not come from corresponding .scrbl files
          (for ([worksheet (directory-list (build-path (lessons-dir) subdir "exercises"))]
                #:when (and (regexp-match #px".pdf$" worksheet)
                            (not (file-exists? (build-path (lessons-dir) subdir "exercises" (regexp-replace #px"\\.pdf$" (path->string worksheet) ".scrbl"))))))
            (let ([worksheet-distrib-file (build-path old-deployment-dir "lessons"  (getenv "LANGUAGE") subdir "exercises" worksheet)])
              (unless (file-exists? worksheet-distrib-file) 
                (copy-file (build-path (lessons-dir) subdir "exercises" worksheet)
                           worksheet-distrib-file
                           #t))))
          )))))

;; Decide whether or not the lesson exercises need to be rebuilt. Note that right now this is only done in algebra
;; TODO: Fill in this stub to accurately check if we want build to build the exercises.
(define (build-exercises?)
  run-exercises?)

(define (build-worksheets)
  ;; and the worksheets
  (for ([subdir (directory-list (lessons-dir))]
        #:when (directory-exists? (build-path (lessons-dir) subdir)))
    (when (directory-exists? (build-path (lessons-dir) subdir "worksheets"))
      (for ([worksheet (directory-list (build-path (lessons-dir) subdir "worksheets"))]
            #:when (regexp-match #px".scrbl$" worksheet))
        (printf "build.rkt: building worksheet ~a: ~a\n" subdir worksheet)
        (run-scribble (build-path (lessons-dir) subdir "worksheets" worksheet))))))

;; build extra PDF worksheet-style pages
;;
;; ideally, this function will generate the .pdf files directly into the lessons
;; distribution directory.  Trying to do that is running into problems with the
;; path specifications.  For now, generate PDF in non-distrib dir,
;; then copy it over to the distrib dir
(define (build-extra-pdf-exercises)
  (for-each (lambda (lesson-spec)
              (let* ([lesson-name (first lesson-spec)]
                     [exer-files (second lesson-spec)]
                     ;; TODO: This is a hack. Regular (lessons-dir) creates absurd distribution directories, so we rely
                     ;;     on this hacky use of define-runtime-paths from paths.rkt, which have to be deliberately selected based on the langauge being used
                     [exer-dir (build-path (match (getenv "LANGUAGE")
                                             ["en-us" lessons-dir-alt-eng]
                                             ["es-mx" lessons-dir-alt-spa])
                                           lesson-name "exercises")]
                     [exer-deploy-dir (build-path (root-deployment-dir) "lessons" (getenv "LANGUAGE") lesson-name "exercises")])
                (let ([fresh-pdfs-made?
                        (parameterize [(current-deployment-dir exer-dir)]
                          (scribble-to-pdf exer-files exer-dir))])
                    (for ([exerfile exer-files])
                         (let* ([exerfile-pdf (regexp-replace #px"\\.scrbl$" exerfile ".pdf")]
                                [exerfile-path (build-path exer-dir exerfile-pdf)]
                                [deploy-exerfile-pdf (build-path exer-deploy-dir exerfile-pdf)])
                        (when (or fresh-pdfs-made? (not (file-exists? deploy-exerfile-pdf)))
                           (copy-file exerfile-path
                                      (build-path exer-deploy-dir exerfile-pdf)
                                      #t)))))))
            pdf-lesson-exercises))


;; This assumes that the first line of the csv for teacher contributions has titles;
;;   get rid of the "rest" in the definition of csv-list if there is no title line
(define (process-teacher-contributions)
  (let* ([csv-path (build-path "courses" (current-course) "resources" "teachers" "langs" (getenv "LANGUAGE") "exercises.csv")]
         [csv-list (if (file-exists? csv-path) (rest (csv->list (make-csv-reader (open-input-file csv-path))))
                       '())]
         [source-exercise-directory (simple-form-path (build-path csv-path 'up "exercises"))])

    (unless (file-exists? csv-path)
      (WARNING (format "cannot find teacher-contributions in ~a.\n" (current-course)) 'teacher-contributions))
    
    ;; copy teacher files into their place in distribution
    ;(copy-directory/files source-exercise-directory target-exercise-directory)


    ;; pre-process csv-list to a hash map of units to lists of hyperlinks
    (hash-clear! current-teacher-contr-xref)

    (for ([exercise csv-list])
      (let* ([timestamp (first exercise)]
             [name (second exercise)]
             [school (third exercise)]
             [grade (fourth exercise)]
             [descr (fifth exercise)]
             [URL (sixth exercise)]
             [units (string-split (seventh exercise) ", ")]
             [title (eighth exercise)]
             [link (if (string=? URL "")
                       (build-path (current-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "resources" "teachers" "exercises" title)
                       URL)])

        (for ([unit units])
          (when (not (hash-has-key? current-teacher-contr-xref unit)) (hash-set! current-teacher-contr-xref unit '()))
          (hash-update! current-teacher-contr-xref unit
                        (lambda (exer-list)
                          (cons (list name school grade descr link) exer-list) )))))))
             




;(define (build-drills)
;  ;; and the drills
;  (for ([subdir (directory-list (lessons-dir))]
;        #:when (directory-exists? (build-path (lessons-dir) subdir)))
;    (when (directory-exists? (build-path (lessons-dir) subdir "drills"))
;      (for ([drill (directory-list (build-path (lessons-dir) subdir "drills"))]
;            #:when (regexp-match #px".scrbl$" drill))
;        (printf "build.rkt: building drill ~a: ~a\n" subdir drill)
;        (run-scribble (build-path (lessons-dir) subdir "drills" drill))))))
;


;; the use of deploy-resources-dir in setting output-resources-dir enables
;; configuration of where the resources directory lives.  All scribble files 
;; will have been generated in the current-deployment-dir before this runs.
;; This function mainly copies materials from other parts of the build into
;; the distribution directories
(define (copy-resources)
  ;; Under deployment mode (currently always enabled), include the resources.
  (when (and (current-deployment-dir) (directory-exists? (get-resources)))
      
    ; first copy over all of the resources files to the deployment resources dir
    (let ([input-resources-dir (get-resources)]
          [output-resources-dir (deploy-resources-dir)])
     ; (when (directory-exists? output-resources-dir)
     ;   (delete-directory/files output-resources-dir))

      (make-directory output-resources-dir)
      (for ([subdir (directory-list input-resources-dir)])
        ;; this created new directories for each of the four subdirs contained in resources, at the distribution end
        (match (path->string subdir)
          [(or "teachers" "workbook" "misc")
           (when (directory-exists? (build-path input-resources-dir subdir "langs" (getenv "LANGUAGE") ))
             (copy-directory/files (build-path input-resources-dir subdir "langs" (getenv "LANGUAGE") )
                                   (build-path (simple-form-path output-resources-dir) subdir)))]
          [(or "images" "source-files")
           (copy-directory/files (build-path input-resources-dir subdir)
                                 (build-path (simple-form-path output-resources-dir) subdir))]
          [_
           (unless (equal? ".DS_Store" (path->string subdir))
             (copy-file (build-path input-resources-dir subdir)
                        (build-path (simple-form-path output-resources-dir) subdir )
                        #t))]))

      ; move sensitive teacher resources into protected directory
      ; 7/5/18 -- this core code appears in build, build-workbook, build-sols -- abstract to helper
      (let* ([teacher-resources (build-path output-resources-dir "teachers")]
             [teacher-protected (build-path teacher-resources "protected")])
        (unless (directory-exists? teacher-protected)
          (make-directory teacher-protected))
        (when (equal? (current-course) "algebra")
          (rename-file-or-directory (build-path teacher-resources "buggy-DR-answer-key.pdf")
                                    (build-path teacher-protected "buggy-DR-answer-key.pdf"))
          ;; remove the docx file -- shouldn't be in distribution
          (delete-file (build-path teacher-resources "buggy-DR-answer-key.docx")))
        ;; copy the .htaccess file to protected
        (copy-file (build-path input-resources-dir "teachers" ".htaccess")
                   (build-path teacher-protected ".htaccess"))       
        )

      ; keep only certain files in workbook resources dir
      (when (directory-exists? (build-path output-resources-dir "workbook"))
        (let ([keep-workbook-files (list "workbook.pdf")])
          (for ([wbfiledir (directory-list (build-path output-resources-dir "workbook"))])
            (unless (member (path->string wbfiledir) keep-workbook-files)
              (if (directory-exists? (build-path output-resources-dir "workbook" wbfiledir))
                  (delete-directory/files (build-path output-resources-dir "workbook" wbfiledir))
                  (delete-file (build-path output-resources-dir "workbook" wbfiledir)))))))
      ; ideally, modify workbook build process to generate right filename from the
      ; outset.  In the meantime, this puts the right filename in the distribution
      ; the "when" is there to avoid error in reactive (which has no workbook yet)
      (when (file-exists? (build-path output-resources-dir "workbook" "workbook.pdf"))
        (rename-file-or-directory (build-path output-resources-dir "workbook" "workbook.pdf")
                                  (build-path output-resources-dir "workbook" "StudentWorkbook.pdf")))
      
      (let ([sourcefiles (build-path output-resources-dir "source-files")]
            [sourcezip (build-path output-resources-dir "source-files.zip")])
        (when (file-exists? sourcezip)
          (delete-file sourcezip))
        (when (directory-exists? sourcefiles)
          (parameterize ([current-directory sourcefiles])
            (let ([allfiles (directory-list sourcefiles)])
              (apply zip (cons sourcezip allfiles))))))
        
      ;; copy the background logo to the resources directory
      (copy-file (build-path "lib" "backlogo.png")
                 (build-path (current-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "resources" "backlogo.png")
                 #t)
        
      ))

  ;; copy auxiliary files into units within distribution
  (when (and (current-deployment-dir) (directory-exists? (get-units-dir)))
    (for ([subdir (directory-list (get-units-dir))])
      ;; ignore contents starting with .
      (unless (string=? "." (substring (path->string subdir) 0 1))
        (copy-file (build-path "lib" "box.gif")
                   (build-path (current-deployment-dir) "courses"
                               (current-course)(getenv "LANGUAGE") "units" subdir "box.gif")
                   #t)
        (copy-file (build-path "lib" "backlogo.png")
                   (build-path (current-deployment-dir) "courses"
                               (current-course)(getenv "LANGUAGE") "units"  subdir "backlogo.png")
                   #t))))


  ;; Process the teacher materials: for any deployment other than our default,
  ;;   omit the teacher resources from the distribution
  ;; Subtle: this must come after we potentially touch the output
  ;; resources subdirectory.

  (cond [(file-exists? (get-teachers-guide))
         (printf "build.rkt: building teacher's guide\n")
         (parameterize ([current-deployment-dir (build-path (deploy-resources-dir) "teachers" "teachers-guide")])
           (run-scribble (get-teachers-guide) #:include-base-path? #f))
         (let ([deploy-teachers-dir (build-path (deploy-resources-dir) "teachers" "teachers-guide")])
           ; remove the scrbl file from the distribution
           (when (file-exists? (build-path deploy-teachers-dir "teachers-guide.scrbl"))
             (delete-file (build-path deploy-teachers-dir "teachers-guide.scrbl")))
           ;; copy the teacher workbook into place
           ;; THIS ASSUMES WORKBOOK SOLS ALREADY BUILT -- SHOULDN'T BE IN THIS FILE
           ;; ideally, need a separate script to create distribution that cleans up
           ;;   all of the mess around the resources-deploy paths.  This isn't part of
           ;;   notes building, so shouldn't be here, but this trashes the dirs so
           ;;   needs to be here until we get the scripts refactored
           ;; Once building reactive workbook sols, need to check that get-resources here gets the right dir
           (let ([workbooksols (build-path (get-resources) "workbook"  "langs" (getenv "LANGUAGE") "workbooksols.pdf")]
                 [oldsols (build-path (deploy-resources-dir) "teachers" "TeacherWorkbook.pdf")])
             (when (and (not (file-exists? oldsols)) (file-exists? workbooksols))
             ;(when (file-exists? workbooksols)
               (let ([oldsols (build-path (deploy-resources-dir) "teachers" "TeacherWorkbook.pdf")])
                 ;(when (file-exists? oldsols)
                 ;  (delete-file oldsols))
                 ;;;; kathi added may 28 to fix up language paths -- this may address large comment just above ...
                 (unless (directory-exists? (deploy-resources-dir))
                   (printf "Creating resources dir~n")
                   (make-directory (deploy-resources-dir)))
                 (unless (directory-exists? (build-path (deploy-resources-dir) "teachers"))
                   (make-directory (build-path (deploy-resources-dir) "teachers")))
                 ;;;; end may 28 addition
                 (printf "Copying teachers workbook solutions into distribution~n")
                 (let* ([teacher-resources (build-path (deploy-resources-dir) "teachers")]
                        [teacher-protected (build-path teacher-resources "protected")])
                   (unless (directory-exists? teacher-protected)
                     (make-directory teacher-protected))
                   (printf "about to copy teacherworkbook into place~n")
                   (copy-file workbooksols (build-path teacher-protected "TeacherWorkbook.pdf")))))
             ))]
        [else
         (printf "build.rkt: no teacher's guide found; skipping\n")]))

(define (archive-as-zip)
  ;;  Finally, zip up the deployment directory
  (when (current-deployment-dir)
    (let-values ([(base file dir?) (split-path (current-deployment-dir))])
      (parameterize ([current-directory base])
        (define output-file (build-path base (format "~a.zip" (path->string file))))
        (when (file-exists? output-file)
          (delete-file output-file))
        (zip output-file file)))))


(define (create-distribution-lib)
  (let ([distrib-lib-dir (build-path (current-deployment-dir) "lib")])
    (if (directory-exists? distrib-lib-dir)
        (delete-directory/files distrib-lib-dir)
        (make-directory distrib-lib-dir))
    (copy-file (build-path "lib" "mathjaxlocal.js")
               (build-path distrib-lib-dir "mathjaxlocal.js")
               #t)))

(define (remove-lessons-dir-from-distribution)
  (printf "deployment dir is ~a~n" (current-deployment-dir))
  (when (directory-exists? (build-path (current-deployment-dir) "lessons"))
    (delete-directory/files (build-path (current-deployment-dir) "lessons"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main entry point:
(make-fresh-deployment-and-copy-static-pages)

;; remove next line if ever want to generate links to web docs instead of PDF
(void (putenv "WORKSHEET-LINKS-TO-PDF" "true"))
(print-build-intro-summary)
;;TODO: run-languages
(for ([course-spec (in-list bootstrap-course-specs)]
      #:when (member (first course-spec) courses))
  (let ([course (first course-spec)]
        [languages (rest course-spec)])
    (parameterize ([current-course course]
                   [current-course-languages languages])
      (for ([language (in-list languages)]
            #:when (member language run-languages))
        
        (update-lang-fields language)
        (solutions-mode-off)
        (putenv "RELEASE-STATUS" "mature")
        (process-teacher-contributions)
        (when (equal? course "algebra")
          (putenv "TARGET-LANG" "racket")
          (if (build-exercises?)
              (begin (build-exercise-handouts) ; not needed for reactive
                     (workbook-styling-on)
                     ;; when did we move the following into units? 
                     ;(build-extra-pdf-exercises); not needed for reactive
                     )
              (workbook-styling-on))
          )
        (when (or (equal? course "reactive") (equal? course "algebra-pyret"))
          (putenv "TARGET-LANG" "pyret")
          ;; formerly set "RESLEASE-STATUS" to "beta" here
          )
        (when (equal? course "data-science")
          (putenv "TARGET-LANG" "pyret")
          (if (build-exercises?)
              (begin (build-exercise-handouts)
                     (workbook-styling-on)
                     ;(build-extra-pdf-exercises)
                           )
              (workbook-styling-on))
          )
        (textbook-styling-on)
        (update-resource-paths)
        (when (member course '("algebra" "data-science"))
          (workbook-styling-on)
          (build-extra-pdf-exercises)
          (textbook-styling-on))
        (build-course-units)
        (copy-resources)
        ))))
(remove-lessons-dir-from-distribution)
(create-distribution-lib)
(print-warnings)
;(build-lessons)
