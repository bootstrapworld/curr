#lang racket/base

;; This is an implementation of our checker language.
(provide [struct-out constraint]
         [struct-out constraint:and]
         [struct-out constraint:string-eq]
         [struct-out value]
         [struct-out value:string]
         [struct-out value:form]
         
         constraint->js)


;; A constraint is either
(struct constraint ())
(struct constraint:and constraint (c1 c2))
(struct constraint:string-eq constraint (v1 v2))


;; A value is either:
(struct value ())
(struct value:string (s))
(struct value:form (id))


;; constraint->js: constraint -> string
;; Returns a JavaScript boolean expression string that's true
;; if the constraint holds.
(define (constraint->js c)
  (cond
    [(constraint:and? c)
     "function(){ alert('not done yet');}"]
    [(constraint:string-eq? c)
     (format "(~a === ~a)"
             (value->js (constraint:string-eq-v1 c))
             (value->js (constraint:string-eq-v2 c)))]))


;; value->javascript: value -> string
(define (value->js v)
  (cond [(value:string? v) 
         (format "~s" (value:string-s v))]
        [(value:form? v) 
         (format "document.getElementById(~s).value"
                 (value:form-id v))]))
         
