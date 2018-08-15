#lang curr/lib

@(design-recipe-exercise "is-collision" (list "Write a function \"is-collision\", which takes FOUR inputs:"
@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"Are the coordinates of the player within 50 pixels of the coordinates of the other character?")
        #:lang 'pyret
                         #:domain-list (list "Number" "Number" "Number" "Number")
                         #:range "Boolean"
			 #:purpose "Is the Player (px, py) within 50 pixels of another Character (cx, cy)?"
                         #:num-examples 2
			 #:example-list (list
        (list 25 75 30 270 "distance(25, 75, 30, 270) < 50")
        (list 25 75 100 75 "distance(25, 75, 100, 75) < 50")
       )
			 #:show-examples (list #f #f)
                         #:param-list (list "px" "py" "cx" "cy")
                         #:show-params? #f
                         #:body "distance(px, py, cx, cy) < 50"
                         #:show-body? #f
                         )
