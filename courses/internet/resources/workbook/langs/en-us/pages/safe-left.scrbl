#lang curr/lib

@(design-recipe-exercise "safe-left?" "Use the Design Recipe to write a function 'safe-left?', which takes in an x-coordinate and checks to see if it is greater than -50" 
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Determine whether given number is greater than -50"
                         #:num-examples 2
			 #:example-list '((25 (> 25 -50)) (-51 (> -51 -50)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(> x -50)
                         #:show-body? #f
                         )