#lang curr/lib

@(design-recipe-exercise "update-danger" "Utiliza la Receta de Diseño para escribir la función 'update-danger', que tome la coordenada X correspondiente a peligro y produzca la siguiente coordenada X, ubicada 50 píxeles a la izquierda."
			 #:domain-list (list "number")
			 #:range "number"
			 #:purpose "Produce new coordinate by subtracting 50 from the given number"
                         #:num-examples 2
			 #:example-list '((100 (- 100 50)) (35 (- 35 50)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(- x 50)
                         #:show-body? #f
                         )