#lang curr/lib

@(design-recipe-exercise "rocket-distance" "A rocket is flying from Earth to Mars at 80 miles per second. Write a function that describes the distance that the rocket has traveled, as a function of time."

        #:lang 'pyret
                         #:domain-list (list "Number")
                         #:range "Number"
			 #:purpose "Given a number of seconds, produces the distance traveled by a rocket moving at 80mi/s"
                         #:num-examples 4
			 #:example-list (list
        (list 0 "80 * 0")
        (list 1 "80 * 1")
        (list 14 "80 * 14")
        (list 100 "80 * 100")
       )
			 #:show-examples (list #t #f #f #f)
                         #:param-list (list "time")
                         #:show-params? #f
                         #:body "80 * time"
                         #:show-body? #f
                         )
