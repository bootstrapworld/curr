#lang racket/base
(require racket/runtime-path
         racket/system
         (for-syntax racket/base))

;; This is a toplevel build script which generates scribble files for
;; the lessons and courses.

(define-runtime-path units-dir
  (build-path "courses" "bs1" "units"))

(define-runtime-path bs1-main
  (build-path "courses" "bs1" "main.scrbl"))

;; run-scribble: path -> void
;; Runs scribble on the given file.
(define (run-scribble scribble-file)
  (define-values (base name dir?) (split-path scribble-file))
  (parameterize ([current-directory base])
    (system* (find-executable-path "scribble") name))
  (void))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(for ([subdir (directory-list units-dir)])
  (define scribble-file (build-path units-dir subdir "the-unit.scrbl"))
  (cond [(file-exists? scribble-file)
         (printf "build.rkt: Building ~a\n" scribble-file)
         (run-scribble scribble-file)]
        [else
         (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                 (build-path units-dir subdir))]))

(run-scribble bs1-main)