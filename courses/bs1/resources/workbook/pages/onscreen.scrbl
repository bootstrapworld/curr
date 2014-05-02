#lang curr/lib

@(design-recipe-exercise "onscreen?" "Use the Design Recipe to write a function 'onscreen?', which takes in the target's x-coordinate and checks to see if Sam is protected on the left AND protected on the right." 
			 #:domain-list (list "number")
			 #:range "boolean"
			 #:purpose "Determine whether given x-coordinate is on the screen"
                         #:num-examples 2
			 #:example-list '((10 #t) (-15 #f))
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body '(and (safe-left? x) (safe-right? x))
                         #:show-body? #f
                         )