#lang curr/lib
@; Unit 7
@(assess-design-recipe "turkey-price" 
                       "The grocery store charges $2/pound for a turkey for the first 5 pounds, and then $1/pound for every 
pound after that. Write a function that takes in the weight of a turkey and returns how much it will cost."
                       #:domain-list (list "weight")
                       #:range "number"
                       #:purpose "Return the price of the turkey."                 
                       #:example-list '((3 (* 2 3))
                                        (6 (+ 10 (* 1 (- 6 5)))))
                       #:param-list (list "weight")
                       #:body '(cond [(< weight 5) (* 2 weight)]
                                     [else (+ 10 (* 1 (- weight 5)))])
                       )
                                
