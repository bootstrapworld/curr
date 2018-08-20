#lang curr/lib

@(design-recipe-exercise "lawn-area" "Utilizando la Receta de Diseno para escribe una funcion 'lawn-area', la cual toma lo ancho y largo de un area de cesped, y calcula el area del cesped. (Recuerda: area = largo * ancho!)"
			 #:domain-list (list "number" "number")
			 #:range "number"
			 #:purpose "Producir el area de un cesped dados su largo y ancho"
                         #:num-examples 2
			 #:example-list '((10 20 (* 10 20)) (50 5 (* 50 5)))
                         #:param-list (list "length" "width")
                         #:show-params? #f
                         #:body '(* length width)
                         #:show-body? #f
                         )