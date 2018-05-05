#!/usr/bin/env racket
#lang racket/base

;; Ideally, this should only run when we are building for bootstrap.  We haven't
;; yet set up the arguments from the main script (which knows the build target) to
;; tell this one whether or not to run.  So this runs regardless of audience, which 
;; in turn puts solutions in our internal distribution files (but not the public one
;; for other organizations).

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

;; The default deployment directory is "distribution"
(root-deployment-dir (simple-form-path "distribution"))
(current-deployment-dir (root-deployment-dir))
(deploy-resources-dir (build-path (root-deployment-dir) "courses" (current-course) "spanish" "resources")) ;(getenv "LANGUAGE")))

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


;;This lists all courses which are currently able to be built
(define available-course-specs '(("algebra" "english" "spanish")
                                 ("algebra-pyret" "english")
                                 ("reactive" "english")
                                 ("data-science" "english")
                                 ("physics" "english")
                                 ;("blank-course" "english")
				 ))
(define available-courses (map (lambda (course-spec) (first course-spec)) available-course-specs))

(define available-languages (list "english" "spanish"))
(define courses available-courses)

;(define bootstrap-course-specs available-course-specs)

(define run-languages (list "english" "spanish"))


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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



;;;;;;;;;;;;;;;;;;;;;;; Warnings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (parse-lang-args args)
  (filter (lambda (arg)
            (unless (member arg available-languages)
                (error "Build got unrecognized target language: " arg " -- expected english or spanish"))
            (member arg available-languages))
            args))


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
   [("--language") -language "Select what language you are printing the curriculum for. Default: english"
                   (set! run-languages (parse-lang-args (string-split -language "_")))]
   [("--course") -course "List all courses that you want to build. They MUST be separated by \"_\"_. Default: All available courses"
                 (set! courses (parse-course-args (string-split -course "_")))]
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

(define (update-lang-fields language)
  (putenv "LANGUAGE" language)
  (printf "\n\nbuild.rkt: building in language ~a~n" (getenv "LANGUAGE"))
  (current-translations (with-input-from-file (string-append "lib/langs/" (getenv "LANGUAGE") "/translated.rkt") read))
  (current-glossary-terms (with-input-from-file (string-append "lib/langs/" (getenv "LANGUAGE") "/glossary-terms.rkt") read)))

(update-lang-fields "spanish")

(build-exercise-handout-solutions)
;; need to create an index file for the solutions
;; ideally include solutions to the activities as well
