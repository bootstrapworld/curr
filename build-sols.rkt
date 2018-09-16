#!/usr/bin/env racket
#lang racket/base

(require racket/string
         racket/cmdline
         racket/path
         (lib "curr/lib/system-parameters.rkt")
         "lib/paths.rkt"
         scribble/render
         "lib/build-helpers.rkt"
         "lib/build-modes.rkt"
         )

;; The default deployment directory is "distribution"
(root-deployment-dir (simple-form-path "distribution"))
(current-deployment-dir (root-deployment-dir))

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

(define run-languages (list "en-us" "es-mx"))
(define courses available-courses)

;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable
(putenv "CURRENT-SOLUTIONS-MODE" "on")
(define current-contextual-tags
  (command-line
   #:program "build-sols"
   #:once-each
   [("--deploy") -deploy-dir "Deploy into the given directory, and create a .zip.  Default: deploy"
    (current-deployment-dir (simple-form-path -deploy-dir))]
   [("--language") -language "Select what language you are printing the curriculum for. Default: en-us"
                   (set! run-languages (parse-lang-args (string-split -language "_")))]
   [("--course") -course "List all courses that you want to build. They MUST be separated by \"_\"_. Default: All available courses"
                 (set! courses (parse-course-args (string-split -course "_")))]
   #:args tags
   tags))


;; Building exercise handout solutions
(define (build-exercise-handout-solutions)
  ;(solutions-mode-on)
  (create-path-dirs (deploy-resources-dir) (list "teachers" "solutions"))
  (parameterize ([current-deployment-dir (build-path (deploy-resources-dir) "teachers" "solutions")])
    (for ([subdir (directory-list (lessons-dir))]
          #:when (directory-exists? (build-path (lessons-dir) subdir)))
      (let ([exercises-path (build-path (lessons-dir) subdir "exercises")])
        (when (directory-exists? exercises-path)
          (for ([worksheet (directory-list exercises-path)]
                #:when (regexp-match #px".scrbl$" worksheet))
            (printf "build-sols.rkt: building exercise handout solution ~a: ~a\n" subdir worksheet)
            (run-scribble (build-path exercises-path worksheet)))))))
  (let* ([teacher-resources (build-path (deploy-resources-dir) "teachers")]
         [teacher-protected (build-path teacher-resources "protected")])
    (unless (directory-exists? teacher-protected)
      (make-directory teacher-protected))
    (rename-file-or-directory (build-path teacher-resources "solutions")
                              (build-path teacher-protected "solutions")
                              #t))
  ;(solutions-mode-off)
  )

;;;;;;;;;;;; Main entry point ;;;;;;;;;;;;;;;;;;;;;;

(putenv "TARGET-LANG" "racket")
(putenv "RELEASE-STATUS" "mature")
(solutions-mode-on)

(for ([course courses])
  (parameterize ([current-course course])
     (for ([language (in-list run-languages)])
       (let ([resource-path-elts (list "courses" (current-course) language "resources")])
         (create-path-dirs (root-deployment-dir) resource-path-elts)
         (parameterize ([deploy-resources-dir (apply build-path (cons (root-deployment-dir) resource-path-elts))])
           (update-lang-fields language)
           (build-exercise-handout-solutions)
           )))))

(solutions-mode-off)
