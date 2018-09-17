#lang curr/lib
@; Unit 7
@(assess-design-recipe "turkey-price" 
                       "La tienda de comestibles cobra $ 2 / libra por un pavo por las primeras 5 libras, y luego
$ 1 / libra por cada libra después de eso. Escribe una función que tome el peso de un pavo y
devuelve cuánto costará."
                       #:domain-list (list "weight")
                       #:range "number"
                       #:purpose "Devuelve el precio del pavo."                 
                       #:example-list '((3 (* 2 3))
                                        (6 (+ 10 (* 1 (- 6 5)))))
                       #:param-list (list "weight")
                       #:body '(cond [(< weight 5) (* 2 weight)]
                                     [else (+ 10 (* 1 (- weight 5)))])
                       )
                                
