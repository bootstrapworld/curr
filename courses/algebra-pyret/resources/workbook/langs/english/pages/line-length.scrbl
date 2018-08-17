#lang curr/lib

@(design-recipe-exercise "line-length" "Write a function called 'line-length', which takes in two numbers and returns the *positive difference* between them. 
It should always subtract the smaller number from the bigger one, and if they are equal it should return zero."
        #:lang 'pyret
                         #:domain-list '("Number" "Number")
                         #:range "Number"
			 #:purpose "Produce positive difference between two given numbers"
                         #:num-examples 2
                         #:example-list '((10 5 "10 - 5") (2 8 "8 - 2")) 
                         #:show-examples '((#t #t #t) (#t #t #t))
                         #:param-list (list "a" "b")
                         #:show-params? #f
                         #:body '(if ["a > b" "a - b"]
                                      [else "b - a"])
                         #:show-body? '(cond #f #f)
                         #:grid-lines? #t
                         )
