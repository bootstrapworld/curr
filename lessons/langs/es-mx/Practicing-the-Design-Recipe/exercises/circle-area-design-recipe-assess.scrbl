#lang curr/lib
@; Unit 5
@(assess-design-recipe "circle-area" 
                       "Escribe una función que devuelve el área de un círculo dado su diámetro."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Toma el diámetro de un círculo y calcula el área multiplicando el cuadrado del radio por pi."
                       #:example-list '((10  (* (sqr (/ 10 2)) pi))   
                                        (50  (* (sqr (/ 50 2)) pi)))
                       #:buggy-funname-defn "area"
                       #:param-list (list "diameter")
                       #:body '(* (sqr diameter) pi)
                       )
