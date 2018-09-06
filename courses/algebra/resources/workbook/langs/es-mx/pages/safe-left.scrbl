#lang curr/lib

@(design-recipe-exercise "safe-left?" "¿Utilizar la receta de diseño para escribir una función 'safe-left?', Que toma una coordenada x y comprueba si es mayor que -50" 
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Determinar si es que un numero dado es mayor que -50"
                         #:num-examples 2
			 #:example-list '((25 (> 25 -50)) (-51 (> -51 -50)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(> x -50)
                         #:show-body? #f
                         )