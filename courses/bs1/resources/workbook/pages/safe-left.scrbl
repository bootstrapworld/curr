#lang curr/lib

@(design-recipe-exercise "safe-left?" "Use the Design Recipe to write a function 'safe-left?', which takes in the target's x-coordinate and checks to see if it is greater than -50" 
                         #:num-examples 2
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body "(> x -50)"
                         #:show-body? '(#f)
                         )