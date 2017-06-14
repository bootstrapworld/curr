#lang racket/base

(require racket/runtime-path
         (for-syntax racket/base)
         "system-parameters.rkt")


(provide (all-defined-out))



(define-runtime-path root-path (build-path 'up))

(define-runtime-path lessons-dir
  (build-path 'up "lessons"  "langs" "english"))

(define-runtime-path courses-base
  (build-path 'up "courses"))

(define-runtime-path static-pages-path
  (begin
  (build-path 'up "static-pages" "langs" "english")))

(define (get-units-dir)
  (build-path courses-base (current-course) "units" "langs" "english"))

(define (get-course-main)
  (build-path courses-base (current-course) "langs" "english" "main.scrbl"))

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
  (build-path (get-resources) "workbook"))
  
(define (get-teachers-guide)
  (build-path courses-base (current-course) "resources" "teachers" "teachers-guide" "teachers-guide.scrbl"))

(define (get-worksheet-pdf-path)
  (build-path courses-base (current-course) "resources" "workbook" "StudentWorkbook.pdf"))
