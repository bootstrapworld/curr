#!/usr/bin/env racket
#lang racket/base
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         racket/list
         (lib "curr/lib/system-parameters.rkt")
         "lib/translate-pdfs.rkt"
         "lib/paths.rkt"
         scribble/render
         file/zip)




;; This is a toplevel build script which generates scribble files for
;; the lessons and courses.  These scribble files will be translated
;; to HTML files, written under the deployment directory for simple
;; distribution.


;; The default deployment directory is "distribution"
(current-deployment-dir (simple-form-path "distribution"))


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
(define (run-scribble scribble-file #:never-generate-pdf? [never-generate-pdf? #f]
                                    #:include-base-path? [include-base-path? #t])
  (define output-dir (cond [(current-deployment-dir)
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
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  (parameterize ([current-directory base]
                 [current-namespace document-namespace]
                 [current-document-output-path output-path])
    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (list name)
	    #:dest-dir output-dir)
    (when (and (not never-generate-pdf?) (current-generate-pdf?))
      (translate-html-to-pdf
       (build-path output-dir
                   (regexp-replace #px".scrbl$"
                                   (path->string name)
                                   ".html")))))
  (void))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable
(putenv "AUDIENCE" "volunteer")
(putenv "CURRENT-SOLUTIONS-MODE" "off")
(putenv "TARGET-LANG" "racket")
(define current-contextual-tags
  (command-line
   #:program "build"
   #:once-each
   ;; Going to remove this option: it's obsolete, as we always
   ;; build bs1 and bs2.
   #;[("--course") -course "Choose course (default bs1)"
      (current-course -course)]
   ;; removed option for now, since not scribbling workbook
   ;; option is set in main entry point at end of file
   #;[("--worksheet-links-to-pdf") "Direct worksheet links to StudentWorkbook.pdf" 
    (putenv "WORKSHEET-LINKS-TO-PDF" "true")]
   [("--audience") -audience "Indicate student (default), teacher, volunteer, or self-guided"
    (putenv "AUDIENCE" -audience)]
   [("--deploy") -deploy-dir "Deploy into the given directory, and create a .zip.  Default: deploy" 
    (current-deployment-dir (simple-form-path -deploy-dir))]
   [("--lang") -lang "Indicate which language (Racket or Pyret) to generate"
    (putenv "TARGETLANG" -lang)]
   [("--pdf") "Generate PDF documentation"
    (current-generate-pdf? #t)]
   
   #:args tags
   tags))




;; Note: this should be called first, because it can potentially wipe
;; out other subdirectories in the current deployment directory
;; otherwise.  The intent is for generated files to overwrite static
;; resources.
(define (make-fresh-deployment-and-copy-static-pages)
  (when (directory-exists? (current-deployment-dir))
    (delete-directory/files (current-deployment-dir)))
  (make-directory (current-deployment-dir))
  (for ([base (directory-list static-pages-path)])
    (define source-full-path (build-path static-pages-path base))
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
          #:when (directory-exists? (build-path (get-units-dir) subdir)))
      (define scribble-file (simple-form-path (build-path (get-units-dir) subdir "the-unit.scrbl")))
      (cond [(file-exists? scribble-file)
             (printf "build.rkt: Building ~a\n" scribble-file)
             (copy-file (build-path "lib" "box.gif") 
                        (build-path (get-units-dir) subdir "box.gif")
                        #t)
             (run-scribble scribble-file #:never-generate-pdf? (= phase 0))]
            [else
             (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                     (build-path (get-units-dir) subdir))])))
    
      ;; copy exercises from individual lessons into units that reference them 
    (for ([subdir (directory-list (get-units-dir))]
          #:when (directory-exists? (build-path (get-units-dir) subdir)))
      (let ([exercises-dir (build-path (get-units-dir) subdir "exercises")]
            [deploy-exercises-dir (build-path (current-deployment-dir) "courses" (current-course)
                                              "units" subdir "exercises")])
        (when (directory-exists? exercises-dir)
          (delete-directory/files exercises-dir))
        (make-directory exercises-dir)
        (make-directory deploy-exercises-dir)
        (let ([exer-list-path (build-path (get-units-dir) subdir "exercise-list.rkt")])
          (when (file-exists? exer-list-path)
            (let ([unit-exercises (with-input-from-file exer-list-path read)])
              ;; copies all exercise from relevant lessons into units
              ;; - this will cause problems if exercises generate images, as
              ;;   png files will overwrite one another.  Ideally need something
              ;;   more intelligent, but don't see what that is just yet
              (let ([lessonnames (remove-duplicates
                                  (map (lambda (exer-path-str)
                                         (let* ([exer-path (string->path exer-path-str)]
                                                [path-elts (explode-path exer-path)])
                                           (if (< (length path-elts) 2)
                                               (error "WARNING: problem with path ~a in build ~n" path-elts)
                                               (second path-elts))))
                                       unit-exercises))])
                (for-each (lambda (lessonname)
                            (let ([lessonexerpath (build-path lessons-dir lessonname "exercises")])
                              (for ([exerfile (directory-list lessonexerpath)])
                                ; don't copy some file extensions
                                (unless (or (regexp-match #px".*\\.scrbl$" exerfile)
                                            (regexp-match #px".*\\.bak$" exerfile)
                                            (regexp-match #px".*\\.*~$" exerfile))
                                  (copy-file (build-path lessonexerpath exerfile)
                                             (build-path deploy-exercises-dir exerfile)
                                             #t)))))
                          lessonnames))
              
;              #'(for-each (lambda (exer-str) 
;                          ;(printf "trying exercise ~a~n" exer-str)
;                          (let ([exer-path (string->path exer-str)])
;                            (when (file-exists? exer-path)
;                              (let-values ([(base filename dir?) (split-path exer-path)])
;                                (let ([target (build-path exercises-dir filename)]
;                                      [target-deploy (build-path deploy-exercises-dir filename)])
;                                  (printf "copying exercise ~a to ~a ~n" exer-str target)
;                                  (copy-file exer-path target #t)
;                                  (copy-file exer-path target-deploy #t)
;                                  )))))
;                        unit-exercises)
              )))))

  (printf "build.rkt: building ~a main\n" (current-course))
  (run-scribble (get-course-main)))


;; Building the lessons
(define (build-lessons)
  (printf "build.rkt: building lessons\n")
  (for ([subdir (directory-list lessons-dir)]
        #:when (directory-exists? (build-path lessons-dir subdir)))
    (define scribble-file (simple-form-path (build-path lessons-dir subdir "lesson" "lesson.scrbl")))
    (cond [(file-exists? scribble-file)
           (printf "build.rkt: Building ~a\n" scribble-file)
           (run-scribble scribble-file #:never-generate-pdf? #t)]
          [else
           (printf "Could not find a \"lesson.scrbl\" in directory ~a\n"
                   (build-path lessons-dir subdir))]))
  )

;; Building exercise handouts
(define (build-exercise-handouts)
  (for ([subdir (directory-list lessons-dir)]
        #:when (directory-exists? (build-path lessons-dir subdir)))
    (when (directory-exists? (build-path lessons-dir subdir "exercises"))
      (for ([worksheet (directory-list (build-path lessons-dir subdir "exercises"))]
            #:when (regexp-match #px".scrbl$" worksheet))
        (printf "build.rkt: building exercise handout ~a: ~a\n" subdir worksheet)
        (run-scribble (build-path lessons-dir subdir "exercises" worksheet))))))

;; Building exercise handout solutions
;;  need putenv rather than parameter to communicate with form-elements.rkt -- not sure why
(define (build-exercise-handout-solutions)
  (putenv "CURRENT-SOLUTIONS-MODE" "on")
  (parameterize ([current-deployment-dir (build-path (current-deployment-dir) "courses" (current-course) "resources" "teachers" "solutions")])
    (unless (directory-exists? (current-deployment-dir))
      (make-directory (current-deployment-dir))) 
    (for ([subdir (directory-list lessons-dir)]
          #:when (directory-exists? (build-path lessons-dir subdir)))
      (let ([exercises-path (build-path lessons-dir subdir "exercises")])
        (when (directory-exists? exercises-path)
          (for ([worksheet (directory-list exercises-path)]
                #:when (regexp-match #px".scrbl$" worksheet))
            (printf "build.rkt: building exercise handout solution ~a: ~a\n" subdir worksheet)
            (run-scribble #:include-base-path? #f (build-path exercises-path worksheet)))))))
  (putenv "CURRENT-SOLUTIONS-MODE" "off")
  )

(define (build-worksheets)
  ;; and the worksheets
  (for ([subdir (directory-list lessons-dir)]
        #:when (directory-exists? (build-path lessons-dir subdir)))
    (when (directory-exists? (build-path lessons-dir subdir "worksheets"))
      (for ([worksheet (directory-list (build-path lessons-dir subdir "worksheets"))]
            #:when (regexp-match #px".scrbl$" worksheet))
        (printf "build.rkt: building worksheet ~a: ~a\n" subdir worksheet)
        (run-scribble (build-path lessons-dir subdir "worksheets" worksheet))))))



(define (build-drills)
  ;; and the drills
  (for ([subdir (directory-list lessons-dir)]
        #:when (directory-exists? (build-path lessons-dir subdir)))
    (when (directory-exists? (build-path lessons-dir subdir "drills"))
      (for ([drill (directory-list (build-path lessons-dir subdir "drills"))]
            #:when (regexp-match #px".scrbl$" drill))
        (printf "build.rkt: building drill ~a: ~a\n" subdir drill)
        (run-scribble (build-path lessons-dir subdir "drills" drill))))))



(define (build-resources)
  ;; Under deployment mode, include the resources.
  (when (current-deployment-dir)
    (when (directory-exists? (get-resources))
      
      (let ([input-resources-dir (get-resources)]
            [output-resources-dir
             (build-path (current-deployment-dir) "courses" (current-course)
                         "resources")])
        (when (directory-exists? output-resources-dir)
          (delete-directory/files output-resources-dir))
        (copy-directory/files input-resources-dir
                              (simple-form-path output-resources-dir))
   
        ; keep only certain files in workbook resources dir
        (let ([keep-workbook-files (list "workbook.pdf")])
          (for ([wbfile (directory-list (build-path output-resources-dir "workbook"))])
            (unless (member (path->string wbfile) keep-workbook-files)
              (if (directory-exists? (build-path output-resources-dir "workbook" wbfile))
                  (delete-directory/files (build-path output-resources-dir "workbook" wbfile))
                  (delete-file (build-path output-resources-dir "workbook" wbfile))))))
        ; ideally, modify workbook build process to generate right filename from the
        ; outset.  In the meantime, this puts the right filename in the distribution
        ; the "when" is there to avoid error in bs2 (which has no workbook yet)
        (when (file-exists? (build-path output-resources-dir "workbook" "workbook.pdf"))
          (rename-file-or-directory (build-path output-resources-dir "workbook" "workbook.pdf")
                                    (build-path output-resources-dir "workbook" "StudentWorkbook.pdf")))
      
        (let ([sourcefiles (build-path output-resources-dir "source-files")]
              [sourcezip (build-path output-resources-dir "source-files.zip")])
          (when (file-exists? sourcezip)
            (delete-file sourcezip))
          (zip sourcezip sourcefiles))
        )))

  ;; copy auxiliary files into units within distribution
  (when (current-deployment-dir)
    (for ([subdir (directory-list (get-units-dir))])
      (copy-file (build-path "lib" "box.gif")
                 (build-path (current-deployment-dir) "courses"
                             (current-course) "units" subdir "box.gif")
                 #t)))


  ;; Subtle: this must come after we potentially touch the output
  ;; resources subdirectory.
  (cond [(file-exists? (get-teachers-guide))
         (printf "build.rkt: building teacher's guide\n")
         (run-scribble (get-teachers-guide))]
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main entry point:
(make-fresh-deployment-and-copy-static-pages)
(define bootstrap-courses '("bs1" "bs2"))
;; remove next line if ever want to generate links to web docs instead of PDF
(putenv "WORKSHEET-LINKS-TO-PDF" "true")
(putenv "CURRENT-SOLUTIONS-MODE" "off")
(initialize-tagging-environment)
(build-exercise-handouts)
(for ([course (in-list bootstrap-courses)])
  (parameterize ([current-course course])
    (build-course-units)
    (build-resources)))  
;(build-exercise-handouts)
(create-distribution-lib)
;(build-exercise-handout-solutions)
;(build-lessons)
;(build-worksheets)
;(build-drills)

;(archive-as-zip)
