#lang curr/lib

@(design-recipe-exercise "cost" "Luigi's Pizza has hired you as a programmer. They offer Pepperoni ($10.50), Cheese ($9.00), Chicken ($11.25) and Broccoli ($10.25). Write a function called cost which takes in the name of a topping and outputs the cost of a pizza with that topping."
			 #:domain-list (list "string")
			 #:range "number"
			 #:purpose "Produce cost of a pizza with given topping"
                         #:num-examples 2
                         #:example-list '(("pepperoni" "$$10.50") ("chicken" "$$11.25")) 
                         #:show-examples '((#t #t #f) #f)
                         #:param-list (list "topping")
                         #:show-params? #f
                         #:body '(cond [(string=? "cheese" topping) "$$9.00"]
                                       [(string=? "pepperoni" topping) "$$10.50"]
                                       [else "That's not on the menu!"])
                         #:show-body? '(cond (#f #f) #f #f)
                         #:grid-lines? #t
                         )