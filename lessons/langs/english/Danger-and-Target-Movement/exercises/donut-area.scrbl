#lang curr/lib
@; Unit 5
@(design-recipe-exercise "donut-area" 
                       "A donut has two radii (the inner circle and the outer circle). Write a function 'donut-area', that computes the area of a donut when given the two radii. (HINT: can you use a function you've written before?)"
                       #:domain-list (list "Number Number")
                       #:range "Number"
                       #:purpose "Consumes the inner and outer radii of a donut, and computes the area of the donut"
                       #:num-examples 2
                       #:example-list '((1 3 (- (circle-area 3) (circle-area 1)))   
                                        (4 9 (- (circle-area 9) (circle-area 4))))
                       #:param-list (list "innerR outerR")
                       #:show-params? #f
                       #:body '(- (circle-area outerR) (circle-area innerR))
                       #:show-body? #f
                       )