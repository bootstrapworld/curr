#lang curr/lib
@; Unit 6
@(assess-design-recipe "enough-cash?" 
                       "You go the store with $1.50 in your pocket. Write a function which takes in the price of an item and returns true if you have enough money to buy the item and false if you do not."
                       #:domain-list (list "string")
                       #:range "boolean"
                       #:purpose "Check to see if the item costs less than 1.50"
                       #:example-list '(("gum" (< gum 1.50))   
                                        ("soda" (< gum 150)))
                       #:param-list (list "item")
                       #:body '(< item 1.50)
                       )
