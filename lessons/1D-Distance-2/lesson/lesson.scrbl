#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "1D Distance"
        #:duration "10 minutes"]{
          @itemlist/splicing[
            @item{We have to make sure we are always subtracting the bigger number from the smaller one!}
            @item{So there are really two conditions: one is if the first number is bigger, and the other is if the second is bigger. What do we do, when we have multiple conditions?}
            @item{Turn to page 36, and see if you can write examples for this function so that it subtracts the smaller number from the bigger one. Start with an example for 23 and 5...then do an example with 5 and 23 in the other order.}
            @item{Now we have an idea of the results for our @code{cond} statement. But what's the other thing that we need in @code{cond}? Tests! We want to see whether the first number is greater than the second number...how would we write that in Racket code?}
            @item{And what would the result for that test be? If a is greater than b, which would we subtract from which?}
            @item{@tag[pedagogy]{Take one minute: }Write down the definition for line-length.}]}