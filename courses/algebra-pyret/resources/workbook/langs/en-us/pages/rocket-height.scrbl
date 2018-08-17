#lang curr/lib

@(design-recipe-exercise "rocket-height" "A rocket blasts off, traveling at 7 meters per second. Write a function called 'rocket-height' that takes in the number of seconds that have passed since the rocket took off, and which produces the height of the rocket at that time."
       #:lang 'pyret
			 #:domain-list (list "Number")
			 #:range "Number"
			 #:purpose "Produce height of rocket after given number of seconds"
       #:num-examples 2
			 #:example-list '((0 "0 * 7") (10 "10 * 7")) 
			 #:param-list (list "seconds")
			 #:show-params? #f
                         #:body "seconds * 7"
                         #:show-body? #f
                         )
