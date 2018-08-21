#lang curr/lib

@(design-recipe-exercise "update-danger" "Use the Design Recipe to write a function 'update-danger', which takes in the danger's x-coordinate and y-coordinate and produces the next x-coordinate, which is 50 pixels to the left."
       #:lang 'pyret
			 #:domain-list (list "Number" "Number")
			 #:range "Number"
			 #:purpose "Produce new coordinate by subtracting 50 from the x-coordinate (the first parameter)"
                         #:num-examples 2
			 #:example-list (list (list 100 200 "100 - 50") (list 35 200 "35 - 50"))
                         #:param-list (list "x" "y")
                         #:show-params? #t
                         #:body "x - 50"
                         #:show-body? #f
                         )
