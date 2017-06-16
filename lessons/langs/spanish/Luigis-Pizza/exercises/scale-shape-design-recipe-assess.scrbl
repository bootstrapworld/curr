#lang curr/lib
@; Unit 7
@(assess-design-recipe "scale-image" 
                       "Write a function which takes an image and a string, representing what to scale the image by. The function should return a smaller image if the string is 'smaller' and a bigger image if the string is 'bigger'."
                       #:domain-list (list "image" "string")
                       #:range "image"
                       #:purpose "Make the image bigger or smaller, depending on the given string"                  
                       #:buggy-example-list '((scale-image (circle 5 "solid" "red") "bigger" (circle 10 "solid" "red"))
                                              (scale-triangle (triangle 20 "solid" "blue") "smaller" (triangle 10 "solid" "blue")))
                       #:param-list (list "original-image" "scale-factor")
                       #:body '(cond 
                                  [(string=? scale-factor "bigger") (scale 2 original-image)]
                                  [(string=? scale-factor "smaller") (scale .5 original-image)]
                                  [else original-image])
                       )
                                
