#lang curr/lib
@; Unit 6
@(assess-design-recipe "long-name?"
                       "Names that are longer than 20 characters are considered long names. Write a function that takes in a person's name and returns true if it is a long name and false if it is not." 
                       #:domain-list (list "string")
                       #:range "boolean"
                       #:purpose "Check if a name is longer than 20 characters"
                       #:example-list '(("John Joseph Jingleheimer Schmidt" (> (string=? "John Joseph Jingleheimer Schmidt") 10))   
                                        ("Joe Jones" (> (string=? "Joe Jones") 10)))
                       #:buggy-funname-defn "long?"
                       #:param-list (list "name")
                       #:body '(< name 20)
                       )
