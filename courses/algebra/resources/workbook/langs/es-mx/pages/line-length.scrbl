#lang curr/lib

@(design-recipe-exercise "line-length" "Escribe una función llamada 'line-length', que toma dos números y regresa la * diferencia positiva * entre ellos.
Siempre debe restar el número más pequeño de la más grande, y si son iguales debe regresar un cero."
                         #:domain-list '("number" "number")
                         #:range "number"
			 #:purpose "Producir la diferencia positiva entre dos numeros dados"
                         #:num-examples 2
                         #:example-list '((10 5 (- 10 5)) (2 8 (- 8 2))) 
                         #:show-examples '((#t #t #t) (#t #t #t))
                         #:param-list (list "a" "b")
                         #:show-params? #f
                         #:body '(cond [(> a b) (- a b)]
                                       [(< a b) (- b a)])
                         #:show-body? '(cond #f #f)
                         #:grid-lines? #t
                         )