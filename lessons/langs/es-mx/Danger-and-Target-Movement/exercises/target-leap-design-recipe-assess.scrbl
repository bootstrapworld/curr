#lang curr/lib
@; Unit 5
@(assess-design-recipe "target-leap" 
                       "Write a function which takes in the target's x-coordinate and makes a player leap by returning an x-coordinate that is double the original x-coordinate."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Takes the x-coordinate and returns a new one, multiplied by 2"
                       #:example-list '((100 (200))   
                                        (40 (200)))
                       #:buggy-funname-defn "leap"
                       #:param-list (list "x-coor")
                       #:body '(* x 5)
                       )

