#!/usr/bin/env racket
#lang racket/base
(require racket/file
         racket/path
         racket/system
         racket/promise)

;; Translates an HTML file in the current working directory,
;; using wkhtmltopdf.
;;
;; http://code.google.com/p/wkhtmltopdf/


(provide translate-html-to-pdf)

(define wkhtmltopdf-exe-promise
  (delay
    (or (find-executable-path "wkhtmltopdf")
        (find-executable-path "wkhtmltopdf.exe")
        (error 'translate-pdf "The wkhtmltopdf executable cannot be found in the current PATH."))))



(define (translate-html-to-pdf html-path #:dest [dest #f])
  (define-values (base name dir?) (split-path (simple-form-path html-path)))
  (define output-directory (if dest
                               (simple-form-path dest)
                               (simple-form-path base)))
  (parameterize ([current-directory base])
    (system* (force wkhtmltopdf-exe-promise)
	     "--print-media-type"
             name
             (build-path output-directory
                         (regexp-replace #px".html$" (path->string name) ".pdf")))))
