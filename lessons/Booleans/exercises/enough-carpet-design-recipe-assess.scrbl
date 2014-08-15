#lang curr/lib
@; Unit 8
@(assess-design-recipe "enough-carpet?" 
                       "You have 100 square feet of carpet to put down in your room. Write a function that takes in the length and width of your room 
and returns true if you have enough carpet and false if you don't."
                       #:domain-list (list "number" "number")
                       #:range "number"
                       #:purpose "Given length and width of a room, is the area less than 100 sq feet?"                  
                       #:example-list '(((10 15) (< (* 10 15) 100))
                                        ((9 10)  (< (* 9 10)  100)))                                              
                       #:param-list (list "length" "width")
                       #:body '(< (* length width) 100)
                       )
                       
                                
