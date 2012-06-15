#lang racket/base

;; This is an implementation of our checker language.
(provide [struct-out constraint]
         [struct-out constraint:and]
         [struct-out constraint:string-eq]
         [struct-out value]
         [struct-out value:string]
         [struct-out value:form]
         
         constraint->javascript-thunk)


;; A constraint is either
(struct constraint ())
(struct constraint:and constraint (c1 c2))
(struct constraint:string-eq constraint (v1 v2))


;; A value is either:
(struct value ())
(struct value:string (s))
(struct value:form (id))


;; constraint->javascript-thunk: constraint -> string
(define (constraint->javascript-thunk c)
  (cond
    [(constraint:and? c)
     "function(){ alert('not done yet');}"]
    [(constraint:string-eq? c)
     (format "function() { 
                 var lhs = ~a;
                 var rhs = ~a;
                 if(lhs === rhs) {
                   alert('Congrats! You got it right');
                 }
                 else {
                   alert('Sorry! Try again.');
                 }
             }"
             (value->js (constraint:string-eq-v1 c))
             (value->js (constraint:string-eq-v2 c)))]))


;; value->javascript: value -> string
(define (value->js v)
  (cond [(value:string? v) 
         (format "~s" (value:string-s v))]
        [(value:form? v) 
         (format "document.getElementById(~s).value"
                 (value:form-id v))]))
         
