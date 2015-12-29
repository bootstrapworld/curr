 #lang curr/lib

@(design-recipe-exercise "red-shape" "Write a function called red-shape, which takes in the name of a shape ('circle', 'triangle', 'star', or 'rectangle'), and produces a solid, red version of that shape. 
Use 50 as the radius of the circle and star, and as the side-length of the triangle. Make the rectangle 100 long by 200 wide."
			 #:domain-list (list "string")
			 #:range "image"
			 #:purpose "Create a solid red shape of the given kind"
                         #:num-examples 4
                         #:example-list '(("circle" (circle 50 "solid" "red"))
                                          ("triangle" (triangle 50 "solid" "red"))
                                          ("rectangle" (rectangle 50 9 "solid" "red"))
                                          ("star" (triangle 50 "solid" "red")))
                         #:show-examples'((#t #t #t) #f)
                         #:param-list (list "shape")
                         #:show-params? #f
                         #:body '(cond [(string=? "circle" shape) (circle 50 "solid" "red")]
                                       [(string=? "triangle" shape) (triangle 50 "solid" "red")]
                                       [(string=? "rectangle" shape) (rectangle 50 9 "solid" "red")]
                                       [(string=? "star" shape) (star 50 "solid" "red")]
                                       [else (text 20 "???" "red")])
                         #:show-body? '(cond (#f #t) #f #f #f #f)
                         #:grid-lines? #t
                         )