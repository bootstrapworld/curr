#lang racket
(require
  "langs/english/translated.rkt")
(provide translate)
;takes a symbol and returns the assoiated string from a list of symbol-string pairs
;provided as trabslations
(define (translate symbol) (second (or (assoc symbol translations) '("" "NOT FOUND"))))