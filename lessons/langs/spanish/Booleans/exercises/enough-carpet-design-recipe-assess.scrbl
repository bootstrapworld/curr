#lang curr/lib
@; Unit 8
@(assess-design-recipe "enough-carpet?" 
                       "Tienes 100 pies cuadrados de alfombra para poner en tu habitación. Escribe una función que
toma el largo y ancho de su habitación y regresa verdadero si tiene suficiente alfombra y es falsa
si no lo haces"
                       #:domain-list (list "number" "number")
                       #:range "number"
                       #:purpose "Dado el largo y ancho de una habitación, ¿el área es menos de 100 pies cuadrados?"                  
                       #:example-list '(((10 15) (< (* 10 15) 100))
                                        ((9 10)  (< (* 9 10)  100)))                                              
                       #:param-list (list "length" "width")
                       #:body '(< (* length width) 100)
                       )
                       
                                
