#lang curr/lib
@; Unit 5
@(assess-design-recipe "cost" 
                       "Sally sells glases of lemonade, and it costs her $0.30 to buy the sugar, lemons and ice for each glass. Write a function 'cost', which takes in the number of lemonades sold and produces the total cost she has to pay for materials."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Consumes the number of glasses, and multiplies by $0.30 to produce the cost"
                       #:example-list '((6 (* 6 0.30))   
                                        (8 (* 8 0.30)))
                       #:buggy-funname-defn "cost"
                       #:param-list (list "glasses")
                       #:body '(* glasses 0.30)
                       )

