#lang racket

(require "choose.rkt")
(choose (require "langs/english/translated.rkt") (require "langs/spanish/translated.rkt"))

(provide translate)
;takes a symbol and returns the assoiated string from a list of symbol-string pairs
;provided as trabslations
(define (translate symbol) (second (if (assoc symbol translations) (assoc symbol translations)
                                       (error (format "cannot find translation tag: ~a" (symbol->string symbol))))))