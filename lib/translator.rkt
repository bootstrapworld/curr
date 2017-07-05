#lang racket
(require (for-syntax syntax/parse))

;;;;;;;;;;;; language-specific require ;;;;;;;;;;;;;;;;;;;;;;;
(define-for-syntax language (getenv "LANGUAGE"))
(define-syntax (choose stx)
  (syntax-parse stx
                 [(_  a b)
                  (case language
                    [("english") #'a]
                    [("spanish") #'b])]))
(choose (require "langs/english/translated.rkt") (require "langs/spanish/translated.rkt"))

(provide translate)
;takes a symbol and returns the assoiated string from a list of symbol-string pairs
;provided as trabslations
(define (translate symbol) (second (if (assoc symbol translations) (assoc symbol translations)
                                       (error (format "cannot find translation tag: ~a" (symbol->string symbol))))))