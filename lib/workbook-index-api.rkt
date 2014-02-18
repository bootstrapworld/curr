#lang racket

(require "paths.rkt")

(provide
 get-workbook-page/name
 )

;; the workbook index is a list of lists of the form
;;  (tag[str] page[num] <and perhaps more to come later>)
(define get-pagenum second)
(define get-name first)

(define WORKBOOK-INDEX-FILE "workbook-index.rkt")

(define (read-workbook-index) 
  (with-input-from-file (build-path root-path "lib" WORKBOOK-INDEX-FILE) read))

;; get-workbook-page/tag : string -> num or #f
;; return page number associated with tag, or #f if tag not in workbook index
(define (get-workbook-page/name wbtag)
  (let* ([wb (read-workbook-index)]
         [entry (assoc wbtag wb)])
    (if entry (get-pagenum entry)
        (begin (printf (format "WARNING: no workbook index entry for tag ~a~n" wbtag))
               #f))))