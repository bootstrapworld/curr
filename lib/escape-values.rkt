#lang racket

;; functions for recognizing and removing escapes needed for formatting
;; atomic values in our scribbled material

(provide money-escaped?
         rem-money-escape)

(define MONEY-ESCAPE "$$")

;; bootstrap needs escapes for certain numeric formatting
;; this function determines whether string reps a dollar amount
(define (money-escaped? str)
  (and (>= (string-length str) 2) (string=? MONEY-ESCAPE (substring str 0 2))))

;; assumes input string has length at least 2
(define (rem-money-escape str)
  (let* ([escaped (substring str (string-length MONEY-ESCAPE) (string-length str))]
         [n (string->number escaped)])
    (if n n (error 'rem-money-escape "money-escaped value isn't a number"))))
        
