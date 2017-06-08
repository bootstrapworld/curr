#lang racket
(require
  "translated.rkt")
(provide translate)
(define (translate symbol) (second (or (assoc symbol glossary) '("" "NOT FOUND"))))