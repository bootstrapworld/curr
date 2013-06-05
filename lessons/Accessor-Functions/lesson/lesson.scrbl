#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Accessor Functions"
        #:duration "5 minutes"]{
          @itemlist/splicing[ 
            @item{Suppose you want to get the model OUT of @code{new-car}. The computer has a function for that, called @code{auto-model}. I can type @code{(auto-model new-car)} and get out @code{"Taurus"}. @pedagogy{Show this on the board.}}
            @item{I want you to practice taking the model out of your autos. Take @tag[pedagogy]{a minute and pull }the model out of EVERY auto you have, using @code{auto-model}}
            @item{@tag[pedagogy]{Flip back to your contract sheets. }What's the first part of a contract? The name! So what's the name of this function? @code{auto-model}}
            @item{What's the second part? The Domain! What do you think the domain is for auto-model? It's an auto!}
            @item{And finally, what's the third part? The Range! So what's the range of auto-model? A string!}
            @item{Write the contract for @code{auto-model} on your contract sheet. What do you think the contract for @code{auto-hp} is? Write it down too!}
            @item{@tag[pedagogy]{Take two minutes and write}@tag[selftaught]{Write} down the contracts for @code{auto-rims}, @code{auto-color} and @code{auto-value}. @tag[pedagogy]{When you show me that you've written them, you can}@tag[selftaught]{Now} try them out on your autos.}]}