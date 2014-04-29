#lang curr/lib

@(design-recipe-exercise "onscreen?" "Use the Design Recipe to write a function 'onscreen?', which takes in the target's x-coordinate and checks to see if Sam is protected on the left AND protected on the right." 
                         #:num-examples 2
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body "(and (safe-left? x) (safe-right? x))"
                         #:show-body? #f
                         )