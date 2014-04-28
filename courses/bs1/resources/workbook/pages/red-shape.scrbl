#lang curr/lib

@(design-recipe-exercise "red-shape" "Write a function called red-shape, which takes in the name of a shape ('circle', 'triangle', 'star', or 'rectangle'), and draws that shape. All shapes should be solid and red, and can be whatever size you choose."
                         #:num-examples 4
                         #:example-list '(("circle" (circle 50 "solid" "red")))
                         #:show-examples'((#t #t #t))
                         #:grid-lines? #t
                         )