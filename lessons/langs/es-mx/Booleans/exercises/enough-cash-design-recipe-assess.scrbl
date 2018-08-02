#lang curr/lib
@; Unit 6
@(assess-design-recipe "enough-cash?" 
                       "Vaya a la tienda con $ 1.50 en su bolsillo. Escribe una función que acepte el precio
de un artículo y devuelve verdadero si tiene suficiente dinero para comprar el artículo y falso si no lo tiene."
                       #:domain-list (list "string")
                       #:range "boolean"
                       #:purpose "Verifique si el artículo cuesta menos de 1.50"
                       #:example-list '(("gum" (< gum 1.50))   
                                        ("soda" (< gum 150)))
                       #:param-list (list "item")
                       #:body '(< item 1.50)
                       )
