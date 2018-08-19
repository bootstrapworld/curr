
 #lang curr/lib

@(design-recipe-exercise "red-shape" 
"Escribe una función llamada 'red-shape', que toma el nombre de una forma y dibuja esa forma (sólida y roja).  Agregue una cláusula else que produzca una salida sensible. " 

			 #:domain-list (list "string")
			 #:range "image"
			 #:purpose "Crear una forma roja solida de la clase dada"
                         #:num-examples 4
                         #:example-list '(("circle" (circle 50 "solid" "red"))
                                          ("triangle" (triangle 50 "solid" "red"))
                                          ("rectangle" (rectangle 99 9 "solid" "red"))
                                          ("star" (triangle 50 "solid" "red")))
                         #:show-examples'((#t #t #t) #f)
                         #:param-list (list "shape")
                         #:show-params? #f
                         #:body '(cond [(string=? "circle" shape) (circle 50 "solid" "red")]
                                       [(string=? "triangle" shape) (triangle 50 "solid" "red")]
                                       [(string=? "rectangle" shape) (rectangle 99 9 "solid" "red")]
                                       [(string=? "star" shape) (star 50 "solid" "red")]
                                       [else (text 20 "???" "red")])
                         #:show-body? '(cond (#f #t) #f #f #f #f)
                         #:grid-lines? #t
                         )