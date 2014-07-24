#lang curr/lib

@(design-recipe-exercise "calc-pencils" 
                         "All students are given five (5) pencils at the beginning of the school year.  
                          Write a function called calc-pencils that takes the number of students in the school and 
                          calculates the number of pencils needed for that school."
                         #:show-funname-contract? #t
                         #:domain-list (list "number")
                         #:show-domains? #t
                         #:range "number"
                         #:show-range? #t
                         #:purpose "Takes a number of students and gives the number of pencils"
                         #:show-purpose? #t
                         #:num-examples 2
                         #:example-list '((100 (* 100 5))   
                                          (40 (* 40 6)))
                         #:show-examples '(#t #t)
                         #:show-funname-defn? #t
                         #:buggy-funname-defn "calculate-pencils"
                         #:param-list (list "p")
                         #:show-params? #t
                         #:body '(* p 5)
                         #:show-body? #t
                         )
