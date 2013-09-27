#!/usr/bin/env racket
#lang racket/base
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         (lib "curr/lib/system-parameters.rkt")
         "lib/translate-pdfs.rkt"
         "lib/paths.rkt"
         scribble/render
         file/zip)

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
(define (run-scribble scribble-file #:never-generate-pdf? [never-generate-pdf? #f])
  (define output-dir (current-deployment-dir)) 
  (define-values (base name dir?) (split-path scribble-file))
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  (parameterize ([current-directory base]
                 [current-namespace document-namespace]
                 [current-document-output-path output-path])
    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (list name)
	    #:dest-dir output-dir)
    )  
  (void))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable
(putenv "CURRENT-SOLUTIONS-MODE" "on")
(define current-contextual-tags
  (command-line
   #:program "build-sols"
   #:once-each
   [("--deploy") -deploy-dir "Deploy into the given directory, and create a .zip.  Default: deploy" 
    (current-deployment-dir (simple-form-path -deploy-dir))]
   #:args tags
   tags))


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


;; Building exercise handout solutions
(define (build-exercise-handout-solutions)
  (parameterize ([current-deployment-dir (build-path (current-deployment-dir) "solutions")])
    (unless (directory-exists? (current-deployment-dir))
      (make-directory (current-deployment-dir))) 
    (for ([subdir (directory-list lessons-dir)]
          #:when (directory-exists? (build-path lessons-dir subdir)))
      (let ([exercises-path (build-path lessons-dir subdir "exercises")])
        (when (directory-exists? exercises-path)
          (for ([worksheet (directory-list exercises-path)]
                #:when (regexp-match #px".scrbl$" worksheet))
            (printf "build.rkt: building exercise handout solution ~a: ~a\n" subdir worksheet)
            (run-scribble (build-path exercises-path worksheet)))))))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main entry point:
(build-exercise-handout-solutions)
;; need to create an index file for the solutions
;; ideally include solutions to the activities as well
