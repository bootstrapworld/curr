#lang curr/lib

@(design-recipe-exercise "update-target" "Write a function 'update-target', which takes in the target's x-coordinate and y-coordinate and produces the next x-coordinate, which is 50 pixels to the right."
       #:lang 'pyret
			 #:domain-list (list "Number" "Number")
			 #:range "Number"
			 #:purpose "Produce new coordinate by adding 50 to the given number"
                         #:num-examples 2
			 #:example-list (list (list 0 120 "0 + 50") (list 20 240 "20 + 50"))
                         #:param-list (list "x" "y")
                         #:show-params? #f
                         #:body "x + 50"
                         #:show-body? #f
                         )
