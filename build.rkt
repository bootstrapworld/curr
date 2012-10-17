#!/usr/bin/env racket
#lang racket/base
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         "lib/system-parameters.rkt"
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
                             "lib/system-parameters.rkt"))
(define (make-fresh-document-namespace)
  (define ns (make-base-namespace))
  (for ([mod shared-modules])
    (namespace-attach-module (namespace-anchor->namespace this-anchor) mod ns))
  ns)


;; run-scribble: path -> void
;; Runs scribble on the given file.
(define (run-scribble scribble-file)
  (define output-dir (cond [(current-deployment-dir)
                            ;; Rendering to a particular deployment directory.
                            (let-values ([(base name dir?) 
                                          (split-path 
                                           (find-relative-path (simple-form-path root-path)
                                                               (simple-form-path scribble-file)))])
                              (simple-form-path (build-path (current-deployment-dir) base)))]
                           [else
                            ;; In-place rendering
                            (let-values ([(base name dir?)
                                          (split-path (simple-form-path scribble-file))])
                              base)]))
  (define-values (base name dir?) (split-path scribble-file))
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  (parameterize ([current-directory base]
                 [current-namespace (make-fresh-document-namespace)]
                 [current-document-output-path output-path])
    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (list name)
	    #:dest-dir output-dir))
  (void))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable
(define current-contextual-tags
  (command-line
   #:program "build"
   #:once-each
   [("--course") -course "Choose course (default bs1)"
                 (current-course -course)]
   [("--worksheet-links-to-pdf") "Direct worksheet links to StudentWorkshop.pdf" 
                                 (putenv "WORKSHEET-LINKS-TO-PDF" "true")]
   
   [("--deploy") -deploy-dir "Deploy into the given directory, and create a .zip.  Default: deploy" 
                 (current-deployment-dir (simple-form-path -deploy-dir))]
   
   #:args tags
   tags))





(void (putenv "SCRIBBLE_TAGS" (string-join current-contextual-tags " ")))
(printf "build.rkt: tagging context is: ~s\n" current-contextual-tags)
(printf "deployment path: ~s\n" (current-deployment-dir))
(printf "-------\n")




;; Building the units of the course.
;; We must do this twice to resolve cross references for lessons.
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
           (run-scribble scribble-file)]
          [else
           (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                   (build-path (get-units-dir) subdir))])))

;; Building the lessons
(printf "build.rkt: building lessons\n")
(for ([subdir (directory-list lessons-dir)]
      #:when (directory-exists? (build-path lessons-dir subdir)))
  (define scribble-file (simple-form-path (build-path lessons-dir subdir "lesson" "lesson.scrbl")))
  (cond [(file-exists? scribble-file)
         (printf "build.rkt: Building ~a\n" scribble-file)
         (run-scribble scribble-file)]
        [else
         (printf "Could not find a \"lesson.scrbl\" in directory ~a\n"
                 (build-path lessons-dir subdir))]))

;; and the long-lessons
(printf "build.rkt: building long lessons\n")
(for ([subdir (directory-list lessons-dir)]
      #:when (directory-exists? (build-path lessons-dir subdir)))
  (define scribble-file (simple-form-path (build-path lessons-dir subdir "lesson" "lesson-long.scrbl")))
  (cond [(file-exists? scribble-file)
         (printf "build.rkt: Building ~a\n" scribble-file)
         (run-scribble scribble-file)]))

;; and the worksheets
(for ([subdir (directory-list lessons-dir)]
      #:when (directory-exists? (build-path lessons-dir subdir)))
  (when (directory-exists? (build-path lessons-dir subdir "worksheets"))
    (for ([worksheet (directory-list (build-path lessons-dir subdir "worksheets"))]
          #:when (regexp-match #px".scrbl$" worksheet))
      (printf "build.rkt: building worksheet ~a: ~a\n" subdir worksheet)
      (run-scribble (build-path lessons-dir subdir "worksheets" worksheet)))))

;; and the drills
(for ([subdir (directory-list lessons-dir)]
      #:when (directory-exists? (build-path lessons-dir subdir)))
  (when (directory-exists? (build-path lessons-dir subdir "drills"))
    (for ([drill (directory-list (build-path lessons-dir subdir "drills"))]
          #:when (regexp-match #px".scrbl$" drill))
      (printf "build.rkt: building drill ~a: ~a\n" subdir drill)
      (run-scribble (build-path lessons-dir subdir "drills" drill)))))

(printf "build.rkt: building ~a main\n" (current-course))
(run-scribble (get-course-main))



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
                            (simple-form-path
                             (build-path output-resources-dir))))))

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
       (printf "build.rkt: no teacher's guide found; skipping\n")])


;;  Finally, zip up the deployment directory
(when (current-deployment-dir)
  (let-values ([(base file dir?) (split-path (current-deployment-dir))])
    (parameterize ([current-directory base])
      (define output-file (build-path base (format "~a.zip" (path->string file))))
      (when (file-exists? output-file)
        (delete-file output-file))
      (zip output-file file))))
