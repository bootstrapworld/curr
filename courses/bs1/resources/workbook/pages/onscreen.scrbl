#lang curr/lib

@(design-recipe-exercise "onscreen?" "Use the Design Recipe to write a function 'onscreen?', which takes in the x-coordinate and checks to see if Sam is safe on the left AND safe on the right." 
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Sam is on the screen if his x-coordinate is safe on the left and safe on the right."
                         #:num-examples 2
			 #:example-list '((10 (and (safe-left? 10) (safe-right? 10))) (-15 (and (safe-left? -15) (safe-right? -15))))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(and (safe-left? x) (safe-right? x))
                         #:show-body? #f
                         )