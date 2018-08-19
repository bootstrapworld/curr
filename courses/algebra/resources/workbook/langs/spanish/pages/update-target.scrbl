#lang curr/lib

@(design-recipe-exercise "update-target" "Escribe la función 'update-target', que tome la coordenada X del objetivo y produzca la siguiente coordenada X, ubicada 50 píxeles a la derecha."
			 #:domain-list (list "number")
			 #:range "number"
			 #:purpose "Produce new coordinate by adding 50 to the given number"
                         #:num-examples 2
			 #:example-list '((0 (+ 0 50)) (20 (+ 20 50)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(+ x 50)
                         #:show-body? #f
                         )