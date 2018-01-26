#lang curr/lib
@; Unit 5
@(assess-design-recipe "revenue" 
                       "Sally sells lemonades for $1.50/glass and it costs her $0.30 to buy the sugar, lemons and ice for each glass. Write a function 'profit', which takes in the number of lemonades sold and produces the total profit she earned. (HINT: can you use functions you've written before?)"
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Consumes the number of glasses ($1.50 in revenue and $0.30 in cost), and produces the total profit"
                       #:example-list '((2 (- (revenue 2) (cost 2)))   
                                        (3 (- (revenue 3) (cost 3))))
                       #:buggy-funname-defn "profit"
                       #:param-list (list "glasses")
                       #:body '(- (revenue glasses) (cost glasses))
                       )

