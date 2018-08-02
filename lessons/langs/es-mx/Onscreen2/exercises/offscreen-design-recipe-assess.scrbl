#lang curr/lib
@; Unit 6
@(assess-design-recipe "offscreen?" 
                       "Escribe una función, fuera de pantalla ?, que devuelve verdadero si la coordenada x de Sam la mariposa es
menos de -50 o más de 690."
                       #:domain-list (list "number")
                       #:range "boolean"
                       #:purpose "Dada una coordenada x, devuelve verdadero si la coordenada es menor que -50 o mayor que 690"
                       #:example-list '((60 (true))   
                                        (800 (false)))
                       #:buggy-funname-defn "off-screen"
                       #:param-list (list "x-coord")
                       #:body '(and (< x-coord -50) (> x-coord 690))
                       )
