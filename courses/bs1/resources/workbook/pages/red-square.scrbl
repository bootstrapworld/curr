#lang curr/lib

@(design-recipe-exercise "red-square" "Use the Design Recipe to write a function 'red-square', which takes in a number (the size of the square) and outputs a solid red rectangle whose length and width are the same size."
                         #:num-examples 2
                         #:param-list (list "n")
                         #:show-params? #f
                         #:body "(rectangle n n \"solid\" \"red\")"
                         #:show-body? '(#f)
                         )