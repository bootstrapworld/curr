#lang curr/lib

@(design-recipe-exercise "update-danger" "Use the Design Recipe to write a function 'update-danger', which takes in the danger's x-coordinate and produces the next x-coordinate, which is 50 pixels to the left."
                         #:num-examples 2
                         #:param-list (list "x")
                         #:show-params? #f
                         #:body "(- x 50)"
                         #:show-body? '(#f)
                         )