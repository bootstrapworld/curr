#lang curr/lib

@(design-recipe-exercise "rocket-time" "A rocket is traveling from Earth to Mars at 80 miles per second. Write a function that describes the time the rocket has been traveling, as a function of distance."

        #:lang 'pyret
                         #:domain-list (list "Number")
                         #:range "Number"
			 #:purpose "Given the distance traveled, produce the time traveled for a rocket moving at 80mi/s"
                         #:num-examples 4
			 #:example-list (list
        (list 0 "0 / 80")
        (list 10 "10 / 80")
        (list 80 "80 / 80")
        (list 560 "560 / 80")
       )
			 #:show-examples (list #f #f #f #f)
                         #:param-list (list "distance")
                         #:show-params? #f
                         #:body "distance / 80"
                         #:show-body? #f
                         )
