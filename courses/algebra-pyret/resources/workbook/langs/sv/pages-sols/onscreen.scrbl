#lang curr/lib

@(design-recipe-exercise "is-onscreen" "Use the Design Recipe to write a function 'is-onscreen', which takes in an x- and y-coordinate and checks to see if Sam is safe on the left AND safe on the right." 
       #:lang 'pyret
			 #:domain-list (list "Number" "Number")
			 #:range "Boolean"
			 #:purpose "Sam is on the screen if his x-coordinate is safe on the left and safe on the right."
                         #:num-examples 2
			 #:example-list (list 
                                (list 10 "is-safe-left(10) and is-safe-right(10)")
                                (list -15 "is-safe-left(-15) and is-safe-right(-15)"))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body "is-safe-left(x) and is-safe-right(x)"
                         #:show-body? #f
                         )
