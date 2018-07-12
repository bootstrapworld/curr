#!/usr/bin/env racket
#lang racket/base

(require racket/list
         racket/string
         (lib "curr/lib/system-parameters.rkt")
         )

(provide (all-defined-out))

;;This lists all courses which are currently able to be built
(define available-course-specs '(("algebra" "en-us" "es-mx")
                                 ("algebra-pyret" "en-us")
                                 ("reactive" "en-us")
                                 ("data-science" "en-us")
                                 ("physics" "en-us")
                                 ("intro" "en-us")
                                 ))
(define available-courses (map (lambda (course-spec) (first course-spec)) available-course-specs))

(define bootstrap-course-specs available-course-specs)

(define available-languages (list "en-us" "es-mx"))

;(define run-languages (list "en-us" "es-mx"))

;; create-path-dirs :: (cons path (list [string]))
;; takes components of a path to build and creates all subpaths as needed
(define (create-path-dirs curr-path path-elts)
  (unless (directory-exists? curr-path)
    (make-directory curr-path))
  (unless (empty? path-elts)
    (create-path-dirs (build-path curr-path (first path-elts)) (rest path-elts))))

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

;; parse-unit-args: list/of string -> list/of string
;; This parses the list of unit arguments
(define (parse-unit-args rest-args)
  (cond
    [(empty? rest-args) empty]
    [(cons? rest-args)
     ;;checks if next argument is a command-line argument tag, rather than a Unit name
     (let [(unit-name (first rest-args))]
       (if (string-contains? unit-name "unit")
           (cons unit-name (parse-unit-args (rest rest-args)))
           (error (format (string-append "Build got unrecognized target Unit " unit-name "\n expected something that looks like Unitx")))))]))

;; parse-lang-args : list/of string -> list/of string
;; parse the lang arguments into the list of langs mentioned
(define (parse-lang-args args)
  (filter (lambda (arg)
            (unless (member arg available-languages)
                (error "Build got unrecognized target language: " arg " -- expected en-us or es-mx"))
            (member arg available-languages))
            args))

(define (update-lang-fields language)
  (putenv "LANGUAGE" language)
  (printf "\n\nbuild-sols.rkt: building in language ~a~n" (getenv "LANGUAGE"))
  (current-translations (with-input-from-file (string-append "lib/langs/" (getenv "LANGUAGE") "/translated.rkt") read))
  (current-glossary-terms (with-input-from-file (string-append "lib/langs/" (getenv "LANGUAGE") "/glossary-terms.rkt") read)))
