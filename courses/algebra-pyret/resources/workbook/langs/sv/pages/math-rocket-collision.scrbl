#lang curr/lib

@(design-recipe-exercise "rocket-collide" "A rocket leaves Earth, headed for Mars at 80 miles per second. At the exact same time, an asteroid leaves Mars traveling towards Earth, moving at 70 miles per second. If the distance from the Earth to Mars is 50,000,000 miles, how long will it take for them to meet?"

        #:lang 'pyret
                         #:domain-list (list "Number")
                         #:range "Number"
			 #:purpose "Given the distance between a rocket (moving at 80mi/s) and an asteroid (moving at 70mi/s), produces the time until their collision."
                         #:num-examples 4
			 #:example-list (list
        (list 0 "0 / (70 + 80)")
        (list 2000 "2000 / (70 + 80)")
        (list 15000 "15000 / (70 + 80)")
        (list 50000000 "50000000 / (70 + 80)")
       )
			 #:show-examples (list #t #f #f #f)
                         #:param-list (list "distance")
                         #:show-params? #f
                         #:body "distance / (70 + 80)"
                         #:show-body? #f
                         )
