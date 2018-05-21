#lang curr/lib

@(design-recipe-exercise "red-square" "Use la receta de diseño para escribir una función 'cuadro-rojo', que toma un número (la longitud de cada lado del cuadrado) y regresa un rectángulo rojo sólido cuya longitud y ancho son del mismo tamaño."

			 #:domain-list (list "number")
			 #:range "image"
			 #:purpose "Producir un rectángulo con el número dado como ancho y altura"

                         #:num-examples 2
			 #:example-list '((4 (rectangle 4 4 "solid" "red"))	
					  (12 (rectangle 12 12 "solid" "red")))
                         #:param-list (list "size")
                         #:show-params? #f
                         #:body '(rectangle size size "solid" "red")
                         #:show-body? #f
                         )