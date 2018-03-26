#lang racket
(require "system-parameters.rkt")

(provide translate)

;takes a symbol and returns the assoiated string from a list of symbol-string pairs
;provided as trabslations
(define (translate symbol)
  (second (if (assoc symbol (current-translations))
	      (assoc symbol (current-translations))
	      (error (format "cannot find translation tag: ~a" (symbol->string symbol))))))
