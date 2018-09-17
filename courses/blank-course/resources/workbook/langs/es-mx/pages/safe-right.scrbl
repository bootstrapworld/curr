 #lang curr/lib

@(design-recipe-exercise "safe-right?" "Use the Design Recipe to write a function 'safe-right?', which takes in an x-coordinate and checks to see if it is less than 690." 
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Determine whether given number is less than 690"
                         #:num-examples 2
			 #:example-list '((100 (< 100 690)) (820 (< 820 690)))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(< x 690)
                         #:show-body? #f
                         )