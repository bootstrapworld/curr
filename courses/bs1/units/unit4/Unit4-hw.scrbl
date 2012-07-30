#lang curr/lib

@title{Unit Four Homework}

@lesson[#:title "Question One:"]{You are planning a trip to the grocery store, and want to make a list and determine the total cost of the trip at the same time. Three grocery items are defined below as an example. Their values are the cost of the item.
@itemlist/splicing[@item[@code{(define NUTELLA 6.99)}]
                   @item[@code{(define EGGS 2.50)}]
                   @item[@code{(define BANANAS 2.50)}]]
Define two more items for your grocery list.

@fill-in-the-blank[#:id "grocery1"]

@fill-in-the-blank[#:id "grocery2"]
                   
Write an expression (using your newly-defined items) which will give you the total cost of the items on your grocery list.

@fill-in-the-blank[#:id "exp1" #:columns 80]

When you get to the checkout line, you discover an old gift card in your pocket, worth $12.50. Define a new variable called “GIFTCARD”. 

@fill-in-the-blank[#:id "gc"]

Finally, write another expression using your variables which calculates the new value of all your groceries once you've used the gift card.

@fill-in-the-blank[#:id "exp2" #:columns 800]}
                                
@lesson[#:title "Question Two:"]{Why do you think it is important to write examples before writing code?
                                 
@free-response[#:id "fr1"]}

@include-section["lilypad.scrbl"]
@include-section["design-rec.scrbl"]
