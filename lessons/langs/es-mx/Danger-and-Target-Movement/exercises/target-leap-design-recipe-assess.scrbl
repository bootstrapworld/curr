#lang curr/lib
@; Unit 5
@(assess-design-recipe "target-leap" 
                       "Escribe una función que capte la coordenada x del objetivo y haga un salto de jugador
devolviendo una coordenada x que es el doble de la coordenada x original."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Toma la coordenada xy devuelve una nueva, multiplicada por 2"
                       #:example-list '((100 (200))   
                                        (40 (200)))
                       #:buggy-funname-defn "leap"
                       #:param-list (list "x-coor")
                       #:body '(* x 5)
                       )

