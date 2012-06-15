#!/usr/bin/env racket
#lang racket/base
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         (for-syntax racket/base))

;; This is a toplevel build script which generates scribble files for
;; the lessons and courses.

(define-runtime-path units-dir
  (build-path "courses" "bs1" "units"))

(define-runtime-path lessons-dir
  (build-path "lessons"))

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
;; Command line parsing.  We initialize the SCRIBBLE_TAGS environmental
;; variable
(define current-contextual-tags
  (command-line
   #:program "build"
   #:args tags
   tags))

(void (putenv "SCRIBBLE_TAGS" (string-join current-contextual-tags " ")))
(printf "build.rkt: tagging context is: ~s\n" current-contextual-tags)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Building the bs1 course
(printf "build.rkt: building bs1\n")
(for ([subdir (directory-list units-dir)]
      #:when (directory-exists? (build-path units-dir subdir)))
  (define scribble-file (build-path units-dir subdir "the-unit.scrbl"))
  (cond [(file-exists? scribble-file)
         (printf "build.rkt: Building ~a\n" scribble-file)
         (run-scribble scribble-file)]
        [else
         (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                 (build-path units-dir subdir))]))


;; Building the lessons
;(printf "build.rkt: building lessons\n")
#;(for ([subdir (directory-list lessons-dir)]
      #:when (directory-exists? (build-path lessons-dir subdir)))
  (define scribble-file (build-path lessons-dir subdir "lesson" "lesson.scrbl"))
  (cond [(file-exists? scribble-file)
         (printf "build.rkt: Building ~a\n" scribble-file)
         (run-scribble scribble-file)]
        [else
         (printf "Could not find a \"the-unit.scrbl\" in directory ~a\n"
                 (build-path lessons-dir subdir))]))

;; and the worksheets.
(for ([subdir (directory-list lessons-dir)]
      #:when (directory-exists? (build-path lessons-dir subdir)))
  (when (directory-exists? (build-path lessons-dir subdir "worksheets"))
    (for ([worksheet (directory-list (build-path lessons-dir subdir "worksheets"))]
          #:when (regexp-match #px".scrbl$" worksheet))
       (printf "build.rkt: building worksheet ~a: ~a\n" subdir worksheet)
       (run-scribble (build-path lessons-dir subdir "worksheets" worksheet)))))



(printf "build.rkt: building bs1 main\n")
(run-scribble bs1-main)