#lang racket

;; TODO
;; - generate some negative numbers
;; - generate some real numbers

(require "javascript-support.rkt")
(provide gen-arith-sexp)

(define MATHOPS '(+ * -))
(define MAXNUM 25)

;; generate number between 1 and MAXNUM, inclusive
(define (gen-num)
  (add1 (random MAXNUM)))

;; choose operator from MATHOPS list at random
(define (gen-num-op)
  (list-ref MATHOPS (random (length MATHOPS))))

;; generate a random sexpression with depth from 1 to the given depth
(define (gen-random-sexp gen-op gen-atom depth)
  (if (= depth 0) 
      (gen-atom)
      (list (gen-op) 
            (gen-random-sexp gen-op gen-atom (random depth))
            (gen-random-sexp gen-op gen-atom (random depth)))))
           
;; generator for binary arithmetic expressions
(define (gen-arith-sexp depth)
  (gen-random-sexp gen-num-op gen-num depth))

;; sketch of generator -- moved into form-elements.rkt
;; leaving here until we confirm usage and API -- need more than form-elements version??
;(define (sexp->html sexp)
;  (define (sexp->html/aux sexp)
;    (if (not (list? sexp)) (list (format "~a" sexp))
;        `((div (@ (class "operator")) ,(format "~a" (first sexp)))
;          (div (@ (class "argument")) ,@(sexp->html/aux (second sexp)))
;          (div (@ (class "argument")) ,@(sexp->html/aux (third sexp))))))
;  `(div (@ (class "sexp")) ,@(sexp->html/aux sexp)))