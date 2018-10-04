#lang curr/lib
@; Unit 6
@(assess-design-recipe "equal-length?" 
                       "Escribe una función que tenga dos cadenas y devuelva verdadero si sus longitudes son iguales
y falso de lo contrario."
                       #:domain-list (list "string" "string")
                       #:range "boolean"
                       #:purpose "Dadas dos cadenas, comprueba si tienen la misma longitud"
                       #:example-list '((("yes" "no")  (= (string-length "yes") (string-length "no")))   
                                        (("dog" "cat") (= (string-length "dog") (string-length "cat"))))
                       #:param-list (list "string1" "string2")
                       #:body '(= string1 string2)
                       )
