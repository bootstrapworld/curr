#lang curr/lib
@; Unit 6
@(assess-design-recipe "long-name?"
                       "Los nombres que tienen más de 20 caracteres se consideran nombres largos. Escribe un
función que toma el nombre de una persona y devuelve verdadero si es un nombre largo y falso si no lo es." 
                       #:domain-list (list "string")
                       #:range "boolean"
                       #:purpose "Verificar si un nombre tiene más de 20 caracteres"
                       #:example-list '(("John Joseph Jingleheimer Schmidt" (> (string=? "John Joseph Jingleheimer Schmidt") 10))   
                                        ("Joe Jones" (> (string=? "Joe Jones") 10)))
                       #:buggy-funname-defn "long?"
                       #:param-list (list "name")
                       #:body '(< name 20)
                       )
