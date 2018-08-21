 #lang curr/lib

@(design-recipe-exercise "red-shape" "Write a function called \"red-shape\", which takes in the name of a shape and draws that shape (solid and red).
 Add an otherwise clause that produces a sensible output."
       #:lang 'pyret
			 #:domain-list (list "string")
			 #:range "image"
			 #:purpose "Create a solid red shape of the given kind"
                         #:num-examples 5
                         ;; NOTE(joe): intentionally wrong answers below to avoid line-wrap 
                         #:example-list '(("circle" "circle(50, \"solid\", \"red\")")
                                          ("triangle" "triangle(50, \"solid\", \"red\")")
                                          ("rectangle" "rectangle(5, 1, \"solid\", \"red\")")
                                          ("star" "star(50, \"solid\", \"red\")")
                                          ("garbanzo" "text(\"???\", 20, \"red\")"))
                         #:show-examples'(#f #f)
                         #:param-list (list "shape")
                         #:show-params? #f
                         ;; NOTE(joe): intentionally using == rather than string-equal
                         ;; below to not line-wrap annoyingly
                         #:body '(if ["\"circle\" == shape" "circle(50, \"solid\", \"red\")"]
                                      ["\"triangle\" == shape" "triangle(50, \"solid\", \"red\")"]
                                      ["\"rectangle\" == shape" "rectangle(9, \"solid\", \"red\")"]
                                      ["\"star\" == shape" "star(50, \"solid\", \"red\")"]
                                      [else "text(20, \"???\", \"red\")"])
                         #:show-body? '(cond #f #f #f #f #f)
                         #:grid-lines? #t
                         )
