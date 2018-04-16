#lang curr/lib

@(design-recipe-exercise "distance" (list "Escribe una funcion distancia, que toma cuatro entradas:on distance, which takes FOUR inputs:"
@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"It should return the distance between the two, using the Distance formula. (HINT: look at what you did on the previous page!)")
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