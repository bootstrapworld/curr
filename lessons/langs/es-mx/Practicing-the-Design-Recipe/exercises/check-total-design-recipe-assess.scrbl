#lang curr/lib
@; Unit 5
@(assess-design-recipe "check-total" 
                       "Es costumbre dar una propina del 20% en una factura en un restaurante. Escribe una función que tome el
el costo total de los alimentos y devuelve el nuevo total, incluida la propina"
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Devuelve el total de un cheque con el 20% del costo agregado"
                       #:buggy-example-list '(((total 20)   (20   (+ (0.20 * 20)    20)))   
                                             ((total 56.67) (56.67(+ (0.20 * 56.67) 56.67))))
                       #:param-list (list "food-total")
                       #:body '(* (+ 0.20  food-total) food-total)
                       )
