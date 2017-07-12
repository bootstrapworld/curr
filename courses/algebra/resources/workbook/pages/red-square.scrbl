#lang curr/lib

@(design-recipe-exercise "red-square" "Use the Design Recipe to write a function 'red-square', which takes in a number (the length of each side of the square) and outputs a solid red rectangle whose length and width are the same size."
			 #:domain-list (list "number")
			 #:range "image"
			 #:purpose "Produce rectangle with given number as width and height"
                         #:num-examples 2
			 #:example-list '((4 (rectangle 4 4 "solid" "red"))	
					  (12 (rectangle 12 12 "solid" "red")))
                         #:param-list (list "size")
                         #:show-params? #f
                         #:body '(rectangle size size "solid" "red")
                         #:show-body? #f
                         )