 #lang curr/lib

@(design-recipe-exercise 
"safe-right?" "Utilizar la receta de diseño para escribir una función 'safe-right?', Que toma una coordenada x y comprueba si es menos de 690."
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Determinar si el número dado es menos de 690"
                         #:num-examples 2
			 #:example-list '((100 (< 100 690)) (820 (< 820 690)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(< x 690)
                         #:show-body? #f
                         )