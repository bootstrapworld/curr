#lang curr/lib
@; Unit 5
@(assess-design-recipe "check-total" 
                       "It is customary to tip 20% on a bill at a restaurant. Write a function that takes the
 total cost of the food and returns the new total including tip."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Returns the total of a check with 20% of the cost added"
                       #:buggy-example-list '(((total 20)   (20   (+ (0.20 * 20)    20)))   
                                             ((total 56.67) (56.67(+ (0.20 * 56.67) 56.67))))
                       #:param-list (list "food-total")
                       #:body '(* (+ 0.20  food-total) food-total)
                       )
