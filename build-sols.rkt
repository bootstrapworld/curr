#!/usr/bin/env racket
#lang racket/base

;; Ideally, this should only run when we are building for bootstrap.  We haven't
;; yet set up the arguments from the main script (which knows the build target) to
;; tell this one whether or not to run.  

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
(root-deployment-dir (simple-form-path "distribution"))
(current-deployment-dir (root-deployment-dir))
(deploy-resources-dir (build-path (root-deployment-dir) "courses" (current-course) "resources"))

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


;; Building exercise handout solutions
(define (build-exercise-handout-solutions)
  (when (or (not (getenv "BUILD-FOR")) (string=? (getenv "BUILD-FOR") "bootstrap"))
    (putenv "CURRENT-SOLUTIONS-MODE" "on")
    (unless (directory-exists? (deploy-resources-dir))
      (make-directory (deploy-resources-dir)))
    (unless (directory-exists? (build-path (deploy-resources-dir) "teachers"))
      (make-directory (build-path (deploy-resources-dir) "teachers")))
    (unless (directory-exists? (build-path (deploy-resources-dir) "teachers" "solutions"))
      (make-directory (build-path (deploy-resources-dir) "teachers" "solutions")))
    (parameterize ([current-deployment-dir (build-path (deploy-resources-dir) "teachers" "solutions")])
      (for ([subdir (directory-list (lessons-dir))]
            #:when (directory-exists? (build-path (lessons-dir) subdir)))
        (let ([exercises-path (build-path (lessons-dir) subdir "exercises")])
          (when (directory-exists? exercises-path)
            (for ([worksheet (directory-list exercises-path)]
                  #:when (regexp-match #px".scrbl$" worksheet))
              (printf "build.rkt: building exercise handout solution ~a: ~a\n" subdir worksheet)
              (run-scribble (build-path exercises-path worksheet)))))))
    (putenv "CURRENT-SOLUTIONS-MODE" "off")
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main entry point:
(putenv "TARGET-LANG" "racket")
(putenv "RELEASE-STATUS" "mature")
(build-exercise-handout-solutions)
;; need to create an index file for the solutions
;; ideally include solutions to the activities as well
