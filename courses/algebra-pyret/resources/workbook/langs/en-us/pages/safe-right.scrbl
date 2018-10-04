 #lang curr/lib

@(design-recipe-exercise "is-safe-right" "Use the Design Recipe to write a function 'is-safe-right', which takes in an x-coordinate and checks to see if the x-coordinate is less than 690." 
       #:lang 'pyret
			 #:domain-list (list "Number")
			 #:range "Boolean"
			 #:purpose "Determine whether given number is less than 690"
                         #:num-examples 2
			 #:example-list (list
                                (list 100 "100 < 690")
                                (list 820 "820 < 690"))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body "x < 690"
                         #:show-body? #f
                         )
