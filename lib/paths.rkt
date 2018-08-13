#lang racket/base

(require racket/runtime-path
         (for-syntax racket/base)
         "system-parameters.rkt")


(provide (all-defined-out))



(define-runtime-path root-path (build-path 'up))


(define (lessons-dir)
  (build-path courses-base 'up "lessons"  "langs" (getenv "LANGUAGE")))

(define-runtime-path lessons-dir-alt-eng
  (build-path 'up "lessons"  "langs" "en-us"))
(define-runtime-path lessons-dir-alt-spa
  (build-path 'up "lessons"  "langs" "es-mx"))

(define-runtime-path courses-base
  (build-path 'up "courses"))


(define (static-pages-path)
  (build-path "static-pages" "langs" (getenv "LANGUAGE")))

(define (get-units-dir)
  (build-path courses-base (current-course) "units" "langs" (getenv "LANGUAGE")))

(define (get-course-main)
  (build-path courses-base (current-course) "langs" (getenv "LANGUAGE") "main.scrbl"))

(define (get-resources)
  ;  (build-path (get-units-dir) "_resources"))
  (build-path courses-base (current-course) "resources"))

;;never seem to be called
(define (get-resources-deploy)
  (cond [(string=? (getenv "BUILD-FOR") "codeorg")
         (build-path (root-deployment-dir) "courses" (current-course) "units" "_resources")]
        [else (get-resources)]))
;;never seem to be called
(define (get-resources-distrib-loc)
  (cond [(string=? (getenv "BUILD-FOR") "codeorg")
         (build-path (root-deployment-dir) "_resources")]
        [else (get-resources)]))

(define (get-workbook-dir)
  (build-path (get-resources) "workbook" "langs" (getenv "LANGUAGE")))

(define (get-teachers-guide)
  (build-path courses-base (current-course) "resources" "teachers" "teachers-guide" "teachers-guide.scrbl"))

(define (get-worksheet-pdf-path)
  (build-path courses-base (current-course) "resources" "workbook" "StudentWorkbook.pdf"))
