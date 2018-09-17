#lang curr/lib
@; Unit 7
@(assess-design-recipe "state-tax" 
                       "Algunos estados tienen tasas de impuestos diferentes. Nueva York es 8%, Pennsylvania es 3% y
Delaware es 0%. Todos los otros estados son 5%. Escribe un funct"
                       #:domain-list (list "string")
                       #:range "number"
                       #:purpose "Dado el estado y el precio de un artículo, devuelve el impuesto sobre ese artículo"                  
                       #:buggy-example-list '(((tax "Delaware") (+ 0.00 price))
                                              ((tax "Georgia") (+ 0.05 price)))
                       #:param-list (list "state" "price")
                       #:body '(cond 
                                  [(string=? state "Pennsylvania") (* 0.03 price)]
                                  [(string=? state "New York") (* 0.08 price)]
                                  [(string=? state "Delaware") (* 0.00 price)]
                                  [else (* 0.05 price)])
                       )
                                
