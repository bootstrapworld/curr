

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
(define available-courses '("algebra" "reactive" "data-science" "physics" "blank-course"));

;; Depending on who we are generating for, we need to relocate the resources dirs.
;; May be able to do unit-to-resources-path in the bootstrap case using find-relative path
(define (update-resource-paths)





  
  ;;TODO: ???









  
    (deploy-resources-dir (build-path (root-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "resources"))
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

;; filter-output-dir: path -> path
;; filters an output directory so that it is agnostic to the language structure used to produce it
;; This effectively makes the build script produce the "distributions" directory in the same way that
;; it did prior to when translation capability was added
;; added by jake and kielan 13 jun
(define (filter-output-dir dir)
  (build-path (string-replace (path->string dir) (string-append "/langs/" (getenv "LANGUAGE")) "")))
 
;; add-language path -> path
;; adds a language section under course in an output dir
;; added by jake and kielan 26 jul
(define (add-language dir)
  (build-path (string-replace (path->string dir) (current-course) (string-append (current-course) "/" (getenv "LANGUAGE")))))
 



;; run-scribble: path -> void
;; Runs scribble on the given file.
(define (run-scribble scribble-file #:outfile (outfile #f)
                                    #:never-generate-pdf? [never-generate-pdf? #f]
                                    #:include-base-path? [include-base-path? #t])
  
  (define output-dir (add-language
                      (filter-output-dir
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
                                  base)]))))
  (define-values (base name dir?) (split-path scribble-file))

  
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  
  (parameterize ([current-directory base]
                 [current-namespace document-namespace]
                 [current-document-output-path output-path])
    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (if outfile (list outfile) (list name))
	    #:dest-dir output-dir
            ;; Comment out next line to use default scribble.css file
            #:style-file (build-path root-path "lib" "css-files-units" "scribble.css")
            )
    (when (and (not never-generate-pdf?) (current-generate-pdf?))
      (translate-html-to-pdf
       (build-path output-dir
                   (regexp-replace #px".scrbl$"
                                   (path->string name)
                                   ".html")))))
  (void))


;; parse-course-args: list/of string -> list/of string
;; This parses the list of course arguments, ensuring that they are all valid course names
(define (parse-course-args rest-args)
  (cond
    [(empty? rest-args) empty]
    [(cons? rest-args)
     ;;checks if next argument is a command-line argument tag, rather than a course name
     (let [(course-name (first rest-args))]
       (if (member course-name available-courses)
           (cons course-name (parse-course-args (rest rest-args)))
           (error (format (string-append "Build got unrecognized target course: " course-name "\n expected one of the following:\n~a\n")
                  available-courses))))]))




;;;;;;;;;;;;;;;;;;;;;;; Warnings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; parse-sw-args: list/of string -> list/of string
;; This parses the list of suppress-warning arguments, ensuring that they are all valid warning tags
(define (parse-sw-args rest-args)
  (cond
    [(empty? rest-args) empty]
    [(cons? rest-args)
     ;;checks if next argument is a command-line argument tag, rather than a course name
     (let [(sw-tag (string->symbol (first rest-args)))]
       (if (member sw-tag ignore-warning-tags)
           (cons sw-tag (parse-sw-args (rest rest-args)))
           (error (format (string-append "Build got unrecognized warning suppression tag: "
                                         (symbol->string sw-tag) "\n expected one of the following:\n~a\n")
                  (map (lambda (x) (symbol->string x))
                       ignore-warning-tags)))))]))

(define (parse-lang-args args)
  (filter (lambda (arg)
            (unless (member arg available-languages)
                (error "Build got unrecognized target language: " arg " -- expected english or spanish"))
            (member arg available-languages))
            args))


;;collects all warnings, to be printed at the end of the build script
(void (putenv "COLLECTED-WARNINGS" ""))

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable

;; Hard-set list. This is optionally replaced with command-line arguments below
;(define courses (list "algebra" "reactive" )) ;  "data-science" "physics"))
(define courses available-courses)

(define available-languages (list "english" "spanish"))

(define run-languages (list "english" "spanish"))

(void (putenv "AUDIENCE" "teacher")
(putenv "CURRENT-SOLUTIONS-MODE" "off")
(putenv "TARGET-LANG" "pyret")
(putenv "LANGUAGE" "english")

;; warnings to be ignored when running the build script. This can be populated using the
;; command-line tag "--suppress-warnings a_b_c" or "--sw a_b_c" to suppress warning types a, b, and c.
;; Alternatively, "--sw all" can be used to suppress all WARNINGs.
(putenv "IGNORED-WARNINGS" ""))



;;;;;;;;;;;;;;;;;;;; Command-line Usage Guideline ;;;;;;;;;;;;;;;;;;
;
;;; General Usage
; To run build with command-lines arguments, run "./build-notes --<tag> <arg> ...".
; You can run build using multiple tags. Each tag can only have one argument follow it, BUT
; some of our command-line arguments need to be able to take multiple arguments. To fix this,
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
;;NOTE: These first three were added in Summer 2017 by Kielan Donahue and Jacob Jackson
;
; --course
; This selects which courses are to be produced. Can take multiple arguments (seperated by underscores)
;
; --language
; Not to be confused with "--lang", this selects what human languages to print documents in (currently only spanish or english)
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
   [("--language") -language "Select what language you are printing the curriculum for. Default: english"
                   (set! run-languages (parse-lang-args (string-split -language "_")))]
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
(unless (string=? (getenv "IGNORED-WARNINGS") "")
  (printf "Ignoring the following warning types: ~a\n" (string-split (getenv "IGNORED-WARNINGS") "/")))
(printf "\n\n"))




;; Note: this should be called first, because it can potentially wipe
;; out other subdirectories in the current deployment directory
;; otherwise.  The intent is for generated files to overwrite static
;; resources.
(define (make-fresh-deployment-and-copy-static-pages)
  (when (directory-exists? (current-deployment-dir))
    (delete-directory/files (current-deployment-dir)))
  (make-directory (current-deployment-dir))
  (for ([base (directory-list (static-pages-path))])
    (define source-full-path (build-path (static-pages-path) base))
    (define target-full-path (build-path (current-deployment-dir) base))
    (when (or (file-exists? target-full-path)
              (directory-exists? target-full-path))
      (delete-directory/files target-full-path))
    (copy-directory/files source-full-path target-full-path)))




(define (initialize-tagging-environment)
  (void (putenv "SCRIBBLE_TAGS" (string-join current-contextual-tags " ")))
  (printf "build.rkt: tagging context is: ~s\n" current-contextual-tags)
  (printf "deployment path: ~s\n" (current-deployment-dir))
  (printf "-------\n"))



;; Building the units of the course.
;; We must do this twice to resolve cross references for lessons.
(define (build-course-units)
  (printf "build.rkt: building ~a\n" (current-course))
  (for ([phase (in-range 2)])
    (printf "Phase ~a\n" phase)
    (for ([subdir (directory-list (get-units-dir))]
          #:when (directory-exists?  (build-path (get-units-dir) subdir)))
      ;TODO remove
      (printf "im here")
      (define scribble-file (simple-form-path (build-path (build-path courses-base (current-course) "units" "langs" (getenv "LANGUAGE")) subdir "the-unit.scrbl"))); langs path
      (cond [(file-exists? scribble-file)
             (printf "build.rkt: Building ~a\n" scribble-file)
             (copy-file (build-path "lib" "box.gif") 
                        (build-path (get-units-dir) subdir "box.gif")
                        #t)
             (parameterize ([current-unit (path->string subdir)])
             (run-scribble scribble-file #:outfile "index" #:never-generate-pdf? (= phase 0)))
             ]
            [else
             (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                     (build-path (get-units-dir) subdir))])))
    
      ;; copy exercises from individual lessons into units that reference them 
    (for ([subdir (directory-list (get-units-dir))]
          #:when (directory-exists? (build-path (get-units-dir) subdir)))
      (let (;[exercises-dir (build-path (get-units-dir) subdir "exercises")]
            [deploy-exercises-dir (build-path (current-deployment-dir) "courses" (current-course)(getenv "LANGUAGE")
                                              "units" subdir "exercises")])
        ;(when (directory-exists? exercises-dir)
        ;  (delete-directory/files exercises-dir))
        ;(make-directory exercises-dir)
        (make-directory deploy-exercises-dir)
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
                            (let ([lessonexerpath (build-path (current-deployment-dir) "lessons" lessonname "exercises")]
                                  [deploy-exer-path (build-path deploy-exercises-dir lessonname)])
                              (unless (directory-exists? deploy-exer-path)
                                (make-directory deploy-exer-path))
                              (for ([exerfile (directory-list lessonexerpath)])
                                ; don't copy some file extensions
                                (unless (or (regexp-match #px".*\\.scrbl$" exerfile)
                                            (regexp-match #px".*\\.bak$" exerfile)
                                            (regexp-match #px".*\\.*~$" exerfile))
                                  (copy-file (build-path lessonexerpath exerfile)
                                             (build-path deploy-exer-path exerfile)
                                             )))))
                          lessonnames))
              )))))

  (printf "build.rkt: building ~a main\n" (current-course))
  (run-scribble (get-course-main) #:outfile "index")
  (printf "build.rkt: renaming directory for ~a \n" (current-course))

  (rename-file-or-directory (build-path (current-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "index.html")
                            (build-path (current-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "index.shtml")
                            #t)
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
           (printf "Could not find a \"lesson.scrbl\" in directory ~a\n"
                   (build-path (lessons-dir) subdir))])
    )
  )

;; Building exercise handouts
(define (build-exercise-handouts)
  ;(make-directory (build-path (root-deployment-dir) "lessons" (getenv "LANGUAGE")))
  (for ([subdir (directory-list (lessons-dir))]
        #:when (directory-exists? (build-path (lessons-dir) subdir)))
    (when (directory-exists? (build-path (lessons-dir) subdir "exercises"))
      (for ([worksheet (directory-list (build-path (lessons-dir) subdir "exercises"))]
            #:when (regexp-match #px".scrbl$" worksheet))
        (printf "build.rkt: building exercise handout ~a: ~a\n" subdir worksheet)
        (printf "building exercise at: ~a \n" (path->string (build-path (lessons-dir) subdir "exercises" worksheet)))
        (run-scribble (build-path (lessons-dir) subdir "exercises" worksheet) )
        (copy-file (build-path "lib" "backlogo.png")
                   (build-path (current-deployment-dir) "lessons" (getenv "LANGUAGE") subdir "exercises" "backlogo.png")
                   #t)
        ))))

;; Building exercise handout solutions
;;  need putenv rather than parameter to communicate with form-elements.rkt -- not sure why
(define (build-exercise-handout-solutions)
    (solutions-mode-on)
    ; generating sols to our internal distribution dir, not the public one
    (parameterize ([current-deployment-dir (build-path (root-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "resources")])
      (unless (directory-exists? (current-deployment-dir))
        (make-directory (current-deployment-dir))) 
      (for ([subdir (directory-list (lessons-dir))]
            #:when (directory-exists? (build-path (lessons-dir) subdir)))
        (let ([exercises-path (build-path (lessons-dir) subdir "exercises")])
          (when (directory-exists? exercises-path)
            (for ([worksheet (directory-list exercises-path)]
                  #:when (regexp-match #px".scrbl$" worksheet))
              (printf "build.rkt: building exercise handout solution ~a: ~a\n" subdir worksheet)
              (run-scribble #:include-base-path? #f (build-path exercises-path worksheet)))))))
    (solutions-mode-off))

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
                     [exer-dir (build-path lessons-dir-alt  lesson-name "exercises")]
		     [exer-deploy-dir (build-path (root-deployment-dir) "lessons" (getenv "LANGUAGE") lesson-name "exercises")])
                (parameterize [(current-deployment-dir exer-dir)]
                  (scribble-to-pdf exer-files exer-dir))
                (for ([exerfile exer-files])
                  (let* ([exerfile-pdf (regexp-replace #px"\\.scrbl$" exerfile ".pdf")]
                         [exerfile-path (build-path exer-dir exerfile-pdf)])
                    (copy-file exerfile-path
                               (build-path exer-deploy-dir exerfile-pdf))))
                ))
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
             




(define (build-drills)
  ;; and the drills
  (for ([subdir (directory-list (lessons-dir))]
        #:when (directory-exists? (build-path (lessons-dir) subdir)))
    (when (directory-exists? (build-path (lessons-dir) subdir "drills"))
      (for ([drill (directory-list (build-path (lessons-dir) subdir "drills"))]
            #:when (regexp-match #px".scrbl$" drill))
        (printf "build.rkt: building drill ~a: ~a\n" subdir drill)
        (run-scribble (build-path (lessons-dir) subdir "drills" drill))))))



;; the use of deploy-resources-dir in setting output-resources-dir enables
;; configuration of where the resources directory lives.  All scribble files 
;; will have been generated in the current-deployment-dir before this runs.
;; This function mainly copies materials from other parts of the build into
;; the distribution directories
(define (build-resources)
  ;; Under deployment mode (currently always enabled), include the resources.
  (when (current-deployment-dir)
    (when (directory-exists? (get-resources))
      
      ; first copy over all of the resources files to the deployment resources dir
      (let ([input-resources-dir (get-resources)]
            [output-resources-dir (deploy-resources-dir)])
        (when (directory-exists? output-resources-dir)
          (delete-directory/files output-resources-dir))
        ;(printf (string-append "subdirs: " (directory-list input-resources-dir)))
        (make-directory  output-resources-dir )
        (for ([subdir (directory-list input-resources-dir)])
          (printf "Copying from ~a to ~a ~n" (path->string (build-path input-resources-dir subdir)) (path->string (build-path output-resources-dir subdir)))
          ;; this created new directories for each of the four subdirs contained in resources, at the distribution end
          (match (path->string subdir)
            [(or "teachers" "workbook" "misc.")
             (copy-directory/files (build-path input-resources-dir subdir "langs" (getenv "LANGUAGE") )
                              (build-path (simple-form-path output-resources-dir) subdir))]
            [(or "images" "source-files")
             (copy-directory/files (build-path input-resources-dir subdir)
                              (build-path (simple-form-path output-resources-dir) subdir))]
            [_
             (if (equal? ".DS_Store" (path->string subdir))
                           (printf "what is subdir")
                           (copy-file (build-path input-resources-dir subdir)
                                      (build-path (simple-form-path output-resources-dir) subdir )
                                      #t))]))


        
        


        
        ; keep only certain files in workbook resources dir
        (let ([keep-workbook-files (list "workbook.pdf")])
          (for ([wbfiledir (directory-list (build-path output-resources-dir "workbook"))])
            (unless (member (path->string wbfiledir) keep-workbook-files)
              (if (directory-exists? (build-path output-resources-dir "workbook" wbfiledir))
                  (delete-directory/files (build-path output-resources-dir "workbook" wbfiledir))
                  (delete-file (build-path output-resources-dir "workbook" wbfiledir))))))
        ; ideally, modify workbook build process to generate right filename from the
        ; outset.  In the meantime, this puts the right filename in the distribution
        ; the "when" is there to avoid error in reactive (which has no workbook yet)
        (when (file-exists? (build-path output-resources-dir "workbook" "langs" (getenv "LANGUAGE")"workbook.pdf"))
          (rename-file-or-directory (build-path output-resources-dir "workbook" "langs" (getenv "LANGUAGE") "workbook.pdf")
                                    (build-path output-resources-dir "workbook" "StudentWorkbook.pdf")))
      
        (let ([sourcefiles (build-path output-resources-dir "source-files")]
              [sourcezip (build-path output-resources-dir "source-files.zip")])
          (when (file-exists? sourcezip)
            (delete-file sourcezip))
          (parameterize ([current-directory sourcefiles])
            (let ([allfiles (directory-list sourcefiles)])
              (apply zip (cons sourcezip allfiles)))))
        
        ;; copy the background logo to the resources directory
        (copy-file (build-path "lib" "backlogo.png")
                   (build-path (current-deployment-dir) "courses" (current-course) "resources" "backlogo.png")
                   (build-path (current-deployment-dir) "courses" (current-course)(getenv "LANGUAGE") "resources" "backlogo.png")
                   #t)
        
        )))

  ;; copy auxiliary files into units within distribution
  (when (current-deployment-dir)
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
                (run-scribble (get-teachers-guide))
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
                  (let ([workbooksols (build-path (get-resources) "workbook" "workbooksols.pdf")])
                    (when (file-exists? workbooksols)
                      (let ([oldsols (build-path (deploy-resources-dir) "teachers" "TeacherWorkbook.pdf")])
                        (when (file-exists? oldsols)
                          (delete-file oldsols))
                        (printf "Copying teachers workbook solutions into distribution~n")
                        (copy-file workbooksols (filter-output-dir oldsols)))))
                  )
                ]
               [else
                (printf "build.rkt: no teacher's guide found; skipping\n")]))
         
(define (update-lang-fields language)
  (putenv "LANGUAGE" language)
  (printf "\n\nbuild.rkt: building in language ~a~n" (getenv "LANGUAGE"))
  (current-translations (with-input-from-file (string-append "lib/langs/" (getenv "LANGUAGE") "/translated.rkt") read))
  (current-glossary-terms (with-input-from-file (string-append "lib/langs/" (getenv "LANGUAGE") "/glossary-terms.rkt") read)))


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
(define bootstrap-courses courses)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main entry point:
(make-fresh-deployment-and-copy-static-pages)

;; remove next line if ever want to generate links to web docs instead of PDF
(void (putenv "WORKSHEET-LINKS-TO-PDF" "true"))
(print-build-intro-summary)
(build-languages run-languages)
(for ([language (in-list run-languages)])
  (update-lang-fields language)
(for ([course (in-list bootstrap-courses)])
  (parameterize ([current-course course])
    (solutions-mode-off)
    (putenv "RELEASE-STATUS" "mature")
    (process-teacher-contributions)
    (when (equal? course "algebra")
      (putenv "TARGET-LANG" "racket")
      (build-exercise-handouts) ; not needed for reactive
      (workbook-styling-on)
      (build-extra-pdf-exercises) ; not needed for reactive
      )
    (when (equal? course "reactive")
      (putenv "TARGET-LANG" "pyret")
      ;; formerly set "RESLEASE-STATUS" to "beta" here
      )
    (textbook-styling-on)
    (update-resource-paths)
    (build-course-units)
    (build-resources)
    )))
(create-distribution-lib)
(print-warnings)
;(build-lessons)
;(build-worksheets)
;(build-drills)

;(archive-as-zip)