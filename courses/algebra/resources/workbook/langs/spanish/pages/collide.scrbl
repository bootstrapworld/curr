#lang curr/lib

@(design-recipe-exercise "collide?" (list "Escribe una funcion llamada chocar?, la cual toma cuatro entradas:"


@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"Are the coordinates of the player within 50 pixels of the coordinates of the other character?")
                         #:domain-list (list "number" "number" "number" "number")
                         #:range "boolean"
			 #:purpose "Esta el jugador (px,py) dentro de 50 pixeles de otro personaje (cxm cy)?"
                         #:num-examples 2
			 #:example-list '((25 75 30 270 (< (distance 25 75 30 270) 50)) (25 75 100 75 (< (distance 25 75 100 75) 50)))
			 #:show-examples (list #f #f)
                         #:param-list (list "px" "py" "cx" "cy")
                         #:show-params? #f
                         #:body '(< (distance px py cx cy) 50)
                         #:show-body? #f
                         )