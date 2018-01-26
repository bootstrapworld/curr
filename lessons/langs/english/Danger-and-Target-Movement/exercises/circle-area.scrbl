#lang curr/lib
@; Unit 5
@(design-recipe-exercise "circle-area" 
                       "Write a function 'circle-area', which takes in the radius and computes the area of the circle."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Consumes the radius of a circle, and produces the area"
                       #:num-examples 2
                       #:example-list '((4 (* pi (sqr 4)))   
                                        (5 (* pi (sqr 5))))
                       #:param-list (list "r")
                       #:show-params? #f
                       #:body '(* pi (sqr r))
                       #:show-body? #f
                       )

