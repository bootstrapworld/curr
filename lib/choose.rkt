#lang racket

(require (for-syntax syntax/parse))
(provide (all-defined-out))

;;;;;;;;;;;; language-specific require ;;;;;;;;;;;;;;;;;;;;;;;
(define-for-syntax language (getenv "LANGUAGE"))
(define-syntax (choose stx)
  (syntax-parse stx
    [(_  a b)
     (case language
       [("en-us") #'a]
       [("es-mx") #'b]
       [else #'a])]))