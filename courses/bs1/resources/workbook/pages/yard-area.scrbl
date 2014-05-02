#lang curr/lib

@(design-recipe-exercise "yard-area" "Use the Design Recipe to write a function 'yard-area', which takes in the width and length of a yard, and returns the area of the yard. (Don't forget: area = length * width!)"
			 #:domain-list (list "number" "number")
			 #:range "number"
			 #:purpose "Produce area of yard with given length and width"
                         #:num-examples 2
			 #:example-list '((10 20 200) (5 5 25))
                         #:param-list (list "length" "width")
                         #:show-params? #f
                         #:body '(* length width)
                         #:show-body? #f
                         )