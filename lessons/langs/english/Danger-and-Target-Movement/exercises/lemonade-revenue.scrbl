#lang curr/lib
@; Unit 5
@(assess-design-recipe "revenue" 
                       "Sally sells lemonade for $1.50/glass. Write a function 'revenue', which takes in the number of lemonades sold and produces the total revenue she earned."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Consumes the number of glasses, and multiplies by $1.50 to produce the revenue"
                       #:example-list '((2 (* 2 1.50))   
                                        (3 (* 3 1.50)))
                       #:buggy-funname-defn "revenue"
                       #:param-list (list "glasses")
                       #:body '(* glasses 1.50)
                       )

