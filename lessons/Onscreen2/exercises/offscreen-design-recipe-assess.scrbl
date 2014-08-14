#lang curr/lib
@; Unit 6
@(assess-design-recipe "offscreen?" 
                       "Write a function, offscreen?, which returns true if Sam the butterfly's x-coordinate is less than -50 or greater than 690."
                       #:domain-list (list "number")
                       #:range "boolean"
                       #:purpose "Given an x-coordinate, returns true if the coordinate is less than -50 or greater than 690"
                       #:example-list '((60 (true))   
                                        (800 (false)))
                       #:buggy-funname-defn "off-screen"
                       #:param-list (list "x-coord")
                       #:body '(and (< x-coord -50) (> x-coord 690))
                       )
