#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "1D Distance" 
        #:duration "10 minutes"
        #:prerequisites "Cond-Example-With-Pizza-Toppings"]{
        @itemlist[@item{If all we did was subtract the second number from the first, the function would only work half the time! Suppose your target is standing at 20, and the player is at 10. What is 20 minus 10? What if their positions were reversed?}
                   @item{We have to make sure we are always subtracting the bigger number from the smaller one!}
                   @item{So actually there are two conditions: one is if the first number is bigger, and the other is if the second is bigger. What do we do, when we have multiple conditions?}
                   @item{Turn to @worksheet-link[#:page 26 #:name "Design-Recipe-Line-Length"], and see if you can write this function so that it always subtracts the smaller number from the bigger one. We've already done the examples for you, but you'll need to first fill out the contract, and then move on to the code.}
                   @item{What should we do if a is less than or equal to b? Figure it out, and write the code. We've put in two EXAMPLES for you, but you'll need to uncomment them (delete the semicolons at the front). Make sure both EXAMPLES work!}
                   @item{Now look at the definition of @code{*distances-color*} Currently it's just the empty string: "". Try changing it to a real color, like "black" or "white" or "magenta".
                                                       @;FILEALTERATIVE
                                                       }
                   @item{When you click Run, you will now see lines representing the x-length, y-length, and distance between the target, danger and player. These numbers come from your line-length function! Make sure there are no negative numbers!}]}