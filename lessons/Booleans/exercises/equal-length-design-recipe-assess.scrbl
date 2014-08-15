#lang curr/lib
@; Unit 6
@(assess-design-recipe "equal-length?" 
                       "Write a function that takes in two strings and returns true if their lengths are equal and false otherwise."
                       #:domain-list (list "string" "string")
                       #:range "boolean"
                       #:purpose "Given two strings, check if they are the same length"
                       #:example-list '((("yes" "no")  (equal? (string-length "yes") (string-length "no")))   
                                        (("dog" "cat") (equal? (string-length "dog") (string-length "cat"))))
                       #:param-list (list "string1" "string2")
                       #:body '(equal? string1 string2)
                       )
