#lang curr/lib
@; Unit 7
@(assess-design-recipe "scale-image" 
                       "Escriba una función que toma una imagen y una cadena, representando qué escalar
imagen por. La función debería devolver una imagen más pequeña si la cadena es 'más pequeña' y una imagen más grande
si la cadena es 'más grande'."
                       #:domain-list (list "image" "string")
                       #:range "image"
                       #:purpose "Haga la imagen más grande o más pequeña, dependiendo de la cadena dada"                  
                       #:buggy-example-list '((scale-image (circle 5 "solid" "red") "bigger" (circle 10 "solid" "red"))
                                              (scale-triangle (triangle 20 "solid" "blue") "smaller" (triangle 10 "solid" "blue")))
                       #:param-list (list "original-image" "scale-factor")
                       #:body '(cond 
                                  [(string=? scale-factor "bigger") (scale 2 original-image)]
                                  [(string=? scale-factor "smaller") (scale .5 original-image)]
                                  [else original-image])
                       )
                                
