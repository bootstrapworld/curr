#lang curr/lib

@(assess-design-recipe "calc-pencils" 
                       "Todos los estudiantes reciben cinco (5) lápices al comienzo del año escolar. Escribe un
función llamada calc-pencils que toma el número de estudiantes en la escuela y calcula el
cantidad de lápices necesarios para esa escuela."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Toma un número de estudiantes y da la cantidad de lápices"
                       #:example-list '((100 (* 100 5))   
                                        (40 (* 40 6)))
                       #:buggy-funname-defn "calculate-pencils"
                       #:param-list (list "p")
                       #:body '(* p 5)
                       )
