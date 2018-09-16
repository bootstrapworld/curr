#lang curr/lib

@(design-recipe-exercise "rocket-height" "Un cohete dispara, viajando a 7 metros por segundo. Escribe una funcion llamada 'cohete-altura' que toma en cuenta el numero de segundos que han pasado desde que el cohete despego, y que produce la altura del cohete en ese momento."
			 #:domain-list (list "number")
			 #:range "number"
			 #:purpose "Produce la altura del cohete despues                                           de un numero dado de segundos."
                 #:num-examples 2
			 #:example-list '((0 (* 0 7)) (10 (* 10 7))) 
			 #:param-list (list "seconds")
			 #:show-params? #f
                         #:body '(* seconds 7)
                         #:show-body? #f
                         )