#lang curr/lib

@(design-recipe-exercise "distance" (list "Escribe una unción, “distance”, que toma CUATRO entradas:"
@(itemlist @(item "px: La coordenada x del jugador")
           @(item "py: La coordenada Y del jugador")
           @(item "cx: La coordenada X de otro personaje del juego")
           @(item "cy: La coordenada Y de otro personaje del juego"))

"Debería devolver la distancia entre los dos, utilizando la fórmula Distancia. (SUGERENCIA: ¡mira cómo lo resolviste en la página anterior!)")
                         #:domain-list '("number" "number" "number" "number")
                         #:range "number"
			 #:purpose "Producir la distancia entre 2 puntos con coordinados dados"
                         #:num-examples 2
			 #:example-list '((0 0 3 4 (sqrt (+ (sq (line-length 3 0)) (sq (line-length 4 0))))) (10 20 13 24 (sqrt (+ (sq (line-length 13 10)) (sq (line-length 24 20))))))
                         #:param-list (list "px" "py" "cx" "cy")
                         #:show-params? #f
                         #:body '(sqrt (+ (sqr (line-length px cx))
                                          (sqr (line-length py cy))))
                         #:show-body? #f
                         )