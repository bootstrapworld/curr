#lang curr/lib

@(design-recipe-exercise "cost" 
"Luigi's Pizza lo ha contratado como programador y ofrece Pepperoni ($10.50), Queso ($9.00), Pollo ($11.25) y Brócoli ($10.25) Escribir una función llamada 'cost' que toma el nombre de un topping y genera el costo de una pizza con esa cobertura."
			 #:domain-list (list "string")
			 #:range "number"
			 #:purpose "Producir el costo de una pizza con topping dado"
                         #:num-examples 4
                         #:example-list '(("pepperoni" 10.5) ("cheese" 9) ("chicken" 11.25) ("broccoli" 10.25)) 
                         #:show-examples '((#t #t #f) #f #f #f)
                         #:param-list (list "topping")
                         #:show-params? #f
                         #:body '(cond [(string=? "pepperoni" topping) 10.5]
                                       [(string=? "cheese" topping) 9]
                                       [(string=? "chicken" topping) 11.25]
                                       [(string=? "broccoli" topping) 10.25]
                                       [else 1000000])
                         #:show-body? '(cond (#f #f) #f #f #f #f)
                         #:grid-lines? #t
                         )