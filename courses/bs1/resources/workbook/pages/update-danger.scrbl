#lang curr/lib

@(design-recipe-exercise "update-danger" "Use the Design Recipe to write a function 'update-danger', which takes in the danger's x-coordinate and produces the next x-coordinate, which is 50 pixels to the left."
			 #:domain-list (list "number")
			 #:range "number"
			 #:purpose "Produce new coordinate by subtracting 50 from the given number"
                         #:num-examples 2
			 #:example-list '((50 0) (35 -15))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(- x 50)
                         #:show-body? #f
                         )