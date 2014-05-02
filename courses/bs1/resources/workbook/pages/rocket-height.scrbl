#lang curr/lib

@(design-recipe-exercise "rocket-height" "A rocket blasts off, traveling at 7 meters per second. Write a function called 'rocket-height' that takes in the number of seconds that have passed since the rocket took off, and which produces the height of the rocket at that time."
			 #:domain-list (list "number")
			 #:range "number"
			 #:purpose "Produce height of rocket after given number of seconds"
                         #:num-examples 2
			 #:example-list '((0 0) (10 70)) 
			 #:param-list (list "seconds")
			 #:show-params? #f
                         #:body '(* seconds 7)
                         #:show-body? #f
                         )