#lang curr/lib

@(design-recipe-exercise "collide?" (list "Write a function collide?, which takes FOUR inputs:"
@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"It should return true if the coordinates of the player are within 50 pixels of the coordinates of the other character. Otherwise, false.")
                         #:domain-list (list "number" "number" "number" "number")
                         #:range "boolean"
			 #:purpose "Determine whether player coordinates are within 50 pixels of character coordinates"
                         #:num-examples 2
			 #:example-list '((25 75 30 70 #t) (25 75 100 75 #f))
			 #:show-examples (list #f #f)
                         #:param-list (list "px" "py" "cx" "cy")
                         #:show-params? #f
                         #:body '(< (distance px py cx cy) 50)
                         #:show-body? #f
                         )