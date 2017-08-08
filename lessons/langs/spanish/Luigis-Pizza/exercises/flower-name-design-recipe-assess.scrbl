#lang curr/lib
@; Unit 7
@(assess-design-recipe "flower-name" 
                       "You are putting together a list of flowers in your garden based on their color. You have red roses, purple tulips, and yellow daisies. 
Write a function that takes in the color of a flower and returns the name of the flower."
                       #:domain-list (list "string")
                       #:range "string"
                       #:purpose "Takes the name of the flower and returns its color"                  
                       #:example-list '(("red"    "rose")
                                        ("tulip"  "purple")
                                        ("yellow" "daisy"))
                       #:param-list (list "color")
                       #:body '(cond 
                                  [(string=? color "red")    "rose"]
                                  [(string=? color "purple") "tulip"]
                                  [(string=? color "yellow") "daisy"]
                                  [else "That flower isn't in the garden!"])
                       )
                                
