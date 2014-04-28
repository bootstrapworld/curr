#lang curr/lib

@(design-recipe-exercise "distance" (list "Write a function distance, which takes FOUR inputs:"
@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"It should return the distance between the two, using the Distance formula. (HINT: look at what you did on the previous page!)")
                         #:num-examples 2
                         #:param-list (list "px" "py" "cx" "cy")
                         #:show-params? #f
                         #:body "(sqrt (+ (sqr (line-length px cx))
                                          (sqr (line-length py cy))))"
                         #:show-body? '(#f)
                         )