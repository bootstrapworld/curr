#lang curr/lib

@(design-recipe-exercise "cost" "Luigi's Pizza has hired you as a programmer. They offer Pepperoni ($10.50), Cheese ($9.00), Chicken ($11.25) and Broccoli ($10.25). Write a function called \"cost\" which takes in the name of a topping and outputs the cost of a pizza with that topping."
        #:lang 'pyret
			 #:domain-list (list "String")
			 #:range "Number"
			 #:purpose "Produce cost of a pizza with given topping"
                         #:num-examples 5
                         #:example-list '(("pepperoni" 10.5) ("cheese" 9) ("chicken" 11.25) ("broccoli" 10.25) ("space-pizza" 1000000))
                         #:show-examples '((#t #t #f) #f #f #f #f)
                         #:param-list (list "topping")
                         #:show-params? #f ;; == used here to avoid formatting issues
                         #:body '(if ["\"pepperoni\" == topping" 10.5]
                                      ["\"cheese\" == topping" 9]
                                      ["\"chicken\" == topping" 11.25]
                                      ["\"broccoli\" == topping" 10.25]
                                      [else 1000000])
                         #:show-body? '(cond (#f #f) #f #f #f (#f #f))
                         #:grid-lines? #t
                         )
