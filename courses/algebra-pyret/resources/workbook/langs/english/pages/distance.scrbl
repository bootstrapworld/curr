#lang curr/lib

@(design-recipe-exercise "distance" (list "Write a function \"distance\", which takes FOUR inputs:"
@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"It should return the distance between the two, using the Distance formula. (HINT: look at what you did on the previous page!)")
      #:lang 'pyret
                         #:domain-list '("Number" "Number" "Number" "Number")
                         #:range "Number"
			 #:purpose "Produce distance between two points with given coordinates"
                         #:num-examples 2
			 #:example-list (list 
                                    (list 0 0 3 4 "num-sqrt(num-sqr(line-length(3, 0)) + num-sqr(line-length(4, 0)))")
                                    (list 10 20 13 24 "num-sqrt(num-sqr(line-length(13, 10)) + num-sqr(line-length(24, 20)))"))
                         #:param-list (list "px" "py" "cx" "cy")
                         #:show-params? #f
                         #:body "num-sqrt(num-sqr(line-length(px, cx)) + num-sqr(line-length(py, cy)))"
                         #:show-body? #f
                         )
