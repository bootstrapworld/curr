#lang curr/lib
@; Unit 7
@(assess-design-recipe "state-tax" 
                       "Some states have different tax rates. New York is 8%, Pennsylvania is 3%, and Delaware is 0%. All other states are 5%. Write a function that takes in the price of an item and returns how much the tax will be on the item."
                       #:domain-list (list "string")
                       #:range "number"
                       #:purpose "Given the state and an item's price, returns the the tax on that item"                  
                       #:buggy-example-list '(((tax "Delaware") (+ 0.00 price))
                                              ((tax "Georgia") (+ 0.05 price)))
                       #:param-list (list "state" "price")
                       #:body '(cond 
                                  [(string=? state "Pennsylvania") (* 0.03 price)]
                                  [(string=? state "New York") (* 0.08 price)]
                                  [(string=? state "Delaware") (* 0.00 price)]
                                  [else (* 0.05 price)])
                       )
                                
