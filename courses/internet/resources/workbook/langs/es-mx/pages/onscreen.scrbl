#lang curr/lib

@(design-recipe-exercise "onscreen?"
"¿Utilizar la receta de diseño para escribir una función 'en pantalla?', Que toma en cuenta la coordenada x y comprueba si Sam está a salvo a la izquierda Y salvo a la derecha." 
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Ver si cuando Sam esta en la pantalla su coordenada x esta salvo a la izquierda y salvo a la derecha."
                         #:num-examples 2
			 #:example-list '((10 (and (safe-left? 10) (safe-right? 10))) (-15 (and (safe-left? -15) (safe-right? -15))))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(and (safe-left? x) (safe-right? x))
                         #:show-body? #f
                         )