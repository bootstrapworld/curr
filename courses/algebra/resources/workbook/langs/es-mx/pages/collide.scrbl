#lang curr/lib

@(design-recipe-exercise "collide?" (list "Escribe una funcion llamada 'collide?', la cual toma cuatro entradas:"


@(itemlist @(item "px: La coordenada x del jugador")
           @(item "py: La coordenada Y del jugador")
           @(item "cx: La coordenada X de otro personaje del juego")
           @(item "cy: La coordenada Y de otro personaje del juego"))
"¿Están las coordenadas del jugador dentro de los 50 píxeles de las 
             coordenadas del otro personaje?")
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