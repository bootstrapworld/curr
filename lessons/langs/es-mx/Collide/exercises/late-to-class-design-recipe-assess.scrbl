#lang curr/lib
@; Unit 8
@(assess-design-recipe "late-to-class?" 
                       "Llegará tarde a la clase si tiene que caminar más de 25 píxeles para llegar allí. Escriba una función que tenga en cuenta la coordenada x y la coordenada y y la coordenada x y la coordenada y del aula y devuelve verdadero si llegará tarde a la clase y falso si llegará a tiempo."
                       #:domain-list (list "number" "number" "number" "number")
                       #:range "boolean"
                       #:purpose "Toma los coorindates de mi ubicación y un salón de clases y devuelve verdadero si la distancia es más de 25 y falso si es menor a 25."                  
                       #:buggy-example-list '(((late-to-class? 40 55 65 80) (> 25 (distance 40 55 65 80)))
                                              ((late-to-class? 40 55 65 80) (< 25 (distance 40 55 65 80))))
                       #:param-list (list "student-x" "student-y" "school-x" "school-y")
                       #:body '((< 25 (distance student-x student-y school-x school-y)))
                       )
                       
                                
