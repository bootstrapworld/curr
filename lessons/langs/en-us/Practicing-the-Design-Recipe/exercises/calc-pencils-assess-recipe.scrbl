#lang curr/lib

@(assess-design-recipe "calc-pencils" 
                       "All students are given five (5) pencils at the beginning of the school year.  
                        Write a function called calc-pencils that takes the number of students in the school and 
                        calculates the number of pencils needed for that school."
                       #:domain-list (list "number")
                       #:range "number"
                       #:purpose "Takes a number of students and gives the number of pencils"
                       #:example-list '((100 (* 100 5))   
                                        (40 (* 40 6)))
                       #:buggy-funname-defn "calculate-pencils"
                       #:param-list (list "p")
                       #:body '(* p 5)
                       )
