#lang curr/lib
@; Unit 6
@(assess-design-recipe "long-name?"
                       "Names that are longer than 20 characters are considered long names. Write a function that takes in a person's name and returns true if it is a long name and false if it is not." 
                       #:domain-list (list "string")
                       #:range "boolean"
                       #:purpose "Takes in a name and returns true if its length is greater than 10 and false if it its length is less than or equal to 20."
                       #:example-list '(("John Joseph Jingleheimer Schmidt" (> (string=? "John Joseph Jingleheimer Schmidt") 10))   
                                        ("Joe Jones" (> (string=? "Joe Jones") 10)))
                       #:buggy-funname-defn "long?"
                       #:param-list (list "name")
                       #:body '(< name 20)
                       )
