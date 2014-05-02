#lang curr/lib

@(design-recipe-exercise "update-target" "Write a function 'update-target', which takes in the target's x-coordinate and produces the next x-coordinate, which is 50 pixels to the right."
			 #:domain-list (list "number")
			 #:range "number"
			 #:purpose "Produce new coordinate by adding 50 to the given number"
                         #:num-examples 2
			 #:example-list '((0 50) (20 70))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(+ x 50)
                         #:show-body? #f
                         )