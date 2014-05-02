#lang curr/lib

@(design-recipe-exercise "update-player" "Write a function called update-player, which takes in the player's y-coordinate and the name of the key pressed, and returns the new y-coordinate."
			 #:domain-list (list "number" "string")
			 #:range "number"
			 #:purpose "Produce new y-coordinate depending on key press"
                         #:num-examples 4
                         #:example-list '((128 "up" (+ y 20)) (451 "down" (- y 20)))
                         #:show-examples '((#t #t #f) (#t #t #f))
                         #:param-list (list "y" "key")
                         #:show-params? #f
                         #:body '(cond [(string=? "up" key) (+ y 20)]
                                       [(string=? "down" key) (- y 20)]
                                       [else y])
                         #:show-body? #f
                         #:grid-lines? #t
                         )