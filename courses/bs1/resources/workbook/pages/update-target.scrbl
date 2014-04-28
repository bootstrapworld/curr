#lang curr/lib

@(design-recipe-exercise "update-target" "Write a function 'update-target', which takes in the target's x-coordinate and prodices the next x-coordinate, which is 50 pixels to the right."
                         #:num-examples 2
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body "(+ x 50)"
                         #:show-body? '(#f)
                         )