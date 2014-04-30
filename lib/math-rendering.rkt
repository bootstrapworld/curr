#lang racket

; Defines functions for creating new styles for bootstrap content

(require (prefix-in neturl: net/url) ;; so we can load mathjax from a url
         scriblib/render-cond
         "sxml.rkt"
       )

(provide mathjax-url
	 math
         sexp->math)

;;;;;;;;;;;;;;; URLS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define mathjax-url
  (neturl:string->url 
   "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML,http://www.cs.wpi.edu/~kfisler/mathjaxlocal.js"))
  
;;;;;;;;;;;;; Formatting ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; generate math rendering towards the MathJax library
(define (math body)
  (cond-element
   [html (sxml->element `(script (@ (type "math/tex"))
                                 ,body))]
   [(or latex pdf)
    (printf "WARNING: IMPLEMENT MATH MODE for latex/pdf")])) 

;; generate math rendering from an sexp
;; used in exercise handouts, but can't move
;;   there without factoring out mathjax handling
(define (sexp->math sexp #:wrap [wrap #f])
  (math (sexp->arith-str sexp #:wrap wrap)))

;; tostring for sexps, useful in exercise generation
;;   wrap indicates whether to wrap result in parens
;;   special handling for / so that it renders as a fraction
(define (sexp->arith-str sexp #:wrap [wrap #f])
  (cond [(number? sexp) (format "~a" sexp)]
        [else 
         (cond [(eq? (first sexp) '/) (format "{~a\\over~a}" 
                                              (sexp->arith-str (second sexp))
                                              (sexp->arith-str (third sexp)))]
               [else
                (let ([base (format "~a ~a ~a" 
                                    (sexp->arith-str (second sexp) #:wrap #t) 
                                    (first sexp) 
                                    (sexp->arith-str (third sexp) #:wrap #t))])
                  (if wrap (format "(~a)" base) base))])]))


