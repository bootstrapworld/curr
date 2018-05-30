 #lang curr/lib

@(design-recipe-exercise "red-shape" "Write a function called \"red-shape\", which takes in the name of a shape and draws that shape (solid and red).
 Add an otherwise clause that produces a sensible output."
       #:lang 'pyret
			 #:domain-list (list "string")
			 #:range "image"
			 #:purpose "Create a solid red shape of the given kind"
                         #:num-examples 5
                         ;; NOTE(joe): intentionally wrong answers below to avoid line-wrap 
                         #:example-list '(("circle" (circle 50 "solid" "red"))
                                          ("triangle" (tri 50 "solid" "red"))
                                          ("rectangle" (rect 99 9 "solid" "red"))
                                          ("star" (star 50 "solid" "red"))
                                          ("garbanzo" (square 50 "solid" "red")))
                         #:show-examples'(#f #f)
                         #:param-list (list "shape")
                         #:show-params? #f
                         ;; NOTE(joe): intentionally using == rather than string-equal
                         ;; below to not line-wrap annoyingly
                         #:body '(ask [("circle" == shape) (circle(50 "solid" "red"))]
                                      [("triangle" == shape) (triangle(50 "solid" "red"))]
                                      [("rectangle" == shape) (rect(99 9 "solid" "red"))]
                                      [("star" == shape) (star(50 "solid" "red"))]
                                      [otherwise (text 20 "???" "red")])
                         #:show-body? '(cond #f #f #f #f #f)
                         #:grid-lines? #t
                         )
