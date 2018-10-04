#lang curr/lib
@; Unit 7
@(assess-design-recipe "flower-name" 
                       "La tienda de comestibles cobra $ 2 / libra por un pavo por las primeras 5 libras, y luego
$ 1 / libra por cada libra después de eso. Escribe una función que tome el peso de un pavo y
devuelve cuánto costará."
                       #:domain-list (list "string")
                       #:range "string"
                       #:purpose "Toma el nombre de la flor y devuelve su color"                  
                       #:example-list '(("red"    "rose")
                                        ("tulip"  "purple")
                                        ("yellow" "daisy"))
                       #:param-list (list "color")
                       #:body '(cond 
                                  [(string=? color "red")    "rose"]
                                  [(string=? color "purple") "tulip"]
                                  [(string=? color "yellow") "daisy"]
                                  [else "¡Esa flor no está en el jardín!"])
                       )
                                
