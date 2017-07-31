
#lang racket

(provide (all-defined-out))


;; TODO:
;; This is not working right now because ignored-warnings and collected-warnings
;; cannot be set! from other documents it seems. I have yet to think of a good way around this.
;; I know using environment variables will work, but that feels like a hack because I'd have to make them each a string,
;; which seems awful. Is there another option???



;; provides a list of the available tags that can be ignored when running the build script.
;; search for where these tags are found if you're unsure what WARNINGs they refer to (NOTE: They are almost all in form-elements)
(define ignore-warning-tags (list 'evidence-statements
                                  'teacher-contributions
                                  'lesson-refs                                 
                                  'prereq
                                  'copyright
                                  'vocab-terms
                                  'exercise-langstart
                                  'exercise-end
                                  'weScheme-links
                                  'editor-link-lang
                                  'run-link
                                  'lookup-tags
                                  'missing-unit-descr
                                  'incomplete-worksheet
                                  'missing-lessons))




(define (print-warnings)
  (printf "\n\n\nThe following WARNINGs were found throughout this build:\n~a\n\nBuilding complete.\n" (getenv "COLLECTED-WARNINGS")))


(define (set-ignored-warnings iw)
  (putenv "IGNORED-WARNINGS" (string-append (getenv "IGNORED-WARNINGS") "/" (symbol->string iw))))

(define (ignored-warnings)
  (string-split (getenv "IGNORED-WARNINGS") "/"))

(define (set-collected-warnings text)
  (putenv "COLLECTED-WARNINGS" (string-append text "/" (getenv "COLLECTED-WARNINGS"))))
  

;;prints WARNING, unless the type of warning is tagged to be ignored (through hard-code or command-line)
(define (WARNING text tag)
  (unless (member (symbol->string tag) (ignored-warnings))
    (set-collected-warnings text)
    (printf "WARNING: ~a\n" text)))

