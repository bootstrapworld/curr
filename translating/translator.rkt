#lang racket
(require
  "translated.rkt")
(provide translate)


;this is the method that takes a symbol and finds the associated string
;from a list of symbol-string pairs given as translations
(define (translate symbol) (second (or (assoc symbol translations) '("" "NOT FOUND"))))