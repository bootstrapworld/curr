#lang curr/lib

@(design-recipe-exercise "update-player" "Escribe una función llamada ́update-player ́, que tome la coordenada Y del jugador y el nombre de la tecla presionada, y devuelva la nueva coordenada y."
			 #:domain-list (list "number" "string")
			 #:range "number"
			 #:purpose "Produce new y-coordinate depending on key press"
                         #:num-examples 4
                         #:example-list '((320 "up" (+ 320 20)) (100 "up" (+ 100 20)) (320 "down" (- 320 20)) (100 "down" (- 100 20)))
                         #:show-examples '((#t #t #f) (#t #t #f))
                         #:param-list (list "y" "key")
                         #:show-params? #f
                         #:body '(cond [(string=? "up" key) (+ y 20)]
                                       [(string=? "down" key) (- y 20)]
                                       [else y])
                         #:show-body? #f
                         #:grid-lines? #t
                         )