#lang curr/lib

@(design-recipe-exercise "is-safe-left" "Use the Design Recipe to write a function 'is-safe-left', which takes in an x-coordinate and checks to see if the x-coordinate is greater than -50" 
       #:lang 'pyret
			 #:domain-list (list "Number")
			 #:range "Boolean"
			 #:purpose "Determine whether given number is greater than -50"
                         #:num-examples 2
			 #:example-list '((25 (25 > -50))
                        (-51 (-51 > -50)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(x > -50)
                         #:show-body? #f
                         )
