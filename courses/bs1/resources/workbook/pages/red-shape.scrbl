#lang curr/lib

@(design-recipe-exercise "red-shape" "Write a function called red-shape, which takes in the name of a shape ('circle', 'triangle', 'star', or 'rectangle'), and draws that shape. All shapes should be solid and red, and can be whatever size you choose."
                         #:num-examples 4
                         #:example-list '(("circle" (circle 50 "solid" "red")))
                         #:show-examples'((#t #t #t ))
                         #:param-list (list "shape")
                         #:show-params? #f
                         #:body "(cond [(string=? \"circle\" shape) (circle 50 \"solid\" \"red\")]
                                       [(string=? \"triangle\" shape) (triangle 50 \"solid\" \"red\")]
                                       [(string=? \"rectangle\" shape) (rectangle 50 40 \"solid\" \"red\")]
                                       [(string=? \"star\" shape) (star 50 \"solid\" \"red\")]
                                       [else \"Try another shape!\"])"
                         #:show-body? '(cond (#f #t) #f #f #f #f)
                         #:grid-lines? #t
                         )