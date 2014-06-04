#lang racket

;; API for build modes set through env parameters

(provide solutions-mode?)

(define (solutions-mode?)
  (equal? (getenv "CURRENT-SOLUTIONS-MODE") "on"))

