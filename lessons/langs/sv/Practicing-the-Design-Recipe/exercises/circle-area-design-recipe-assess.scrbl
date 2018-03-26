#lang curr/lib
@; Unit 5
@(assess-design-recipe "circle-area" 
                       "Write a function that returns the area of a circle given its diameter."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Takes the diameter of a circle and calculates the area by multiplying the square of the radius by pi."
                       #:example-list '((10  (* (sqr (/ 10 2)) pi))   
                                        (50  (* (sqr (/ 50 2)) pi)))
                       #:buggy-funname-defn "area"
                       #:param-list (list "diameter")
                       #:body '(* (sqr diameter) pi)
                       )
