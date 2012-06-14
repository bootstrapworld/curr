#lang curr/lib
@(require 2htdp/image)

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Contracts"
        #:duration "15 minutes"]{
@itemlist/splicing[@item{Suppose you have to describe a soda machine. You know that the input to this machine will be money, and you have to get a soda in return. When you use a soda machine, does it only give you one type of soda? Wouldn't it be lame if you had to have a different machine for Coke than you did for Sprite? @bitmap{Images/2.1.png}}
          @item{A soda machine, for example, takes in money and outputs soda.
                @code[#:contract "Soda-machine : Money Selection -> Soda"]{
                 ; Takes money and gives soda
                                                                           }}
          @item{This description talks about outputs  without having to say what those outputs are.}
          @item{This explanation of a soda machine just talks about some soda, but not any specific type of soda. It just says what kind of thing comes out, not which particular thing.}
          @item{How would you describe a coffeemaker? What kind of stuff goes into a coffeemaker? What kind of stuff comes out?}
          @item{How would you describe a lightbulb? @tag[pedagogy]{Have the students brainstorm a few other machines, and their inputs and outputs.} @tag[selftaught]{Try to brainstorm a few other machines and their inputs and outputs.}}
          @item{The things that go into a machine are called the inputs, and what comes out is called the output. But the kinds of things that go in is the Domain, and the kind of thing that comes out is the Range. @think-about[#:question "A soda machine's domain is money. Can you think of an example input?"  #:answer "Any type of money: quarters, dimes, dollars"] Its range is soda.}
          @item{@think-about[#:question "What is the domain and range of a coffeemaker?"
                             #:answer "The domain is coffee ingredients: coffee beans, water, etc. The range is types of coffee."]}
          @item{Functions in Racket are the same: the addition function needs two numbers as its domain, but those numbers don't have to be 4
                and 5. They can be any numbers.}
          @item{Okay, so you already know about a bunch of functions in Racket from math class: plus, minus, times, divide, etc.}
          @item{In Racket, a description of a function is called the contract. The contract tells you just what you need to know to use the function.}
          @item{A contract is also a promise: if you give the machine the kinds of things in its Domain, then you'll get something in the Range. If you give a pizza shop your order and some money, it promises to give you some hot, delicious pizza.}
          @item{Same thing in Racket: if you give plus two numbers, it will give you another number back.}
          @item{We'd like to create a list of contracts for ourselves, so that we can keep track of these functions and exactly how they work. Once we've practiced entering these contracts into our book, I'll show you new functions that let you work with words and pictures!}
          @item{Are you ready? Turn to the front of your workbooks, to the MOST IMPORTANT PAGE, where it says @worksheet-link[#:page 0 #:name"Contracts"].}
          @item{A contract specifies @itemlist[#:style 'ordered
                                                        @item{the name of the function,}
                                                        @item{the domain, and}
                                                        @item{the range.}]}
         @tag[pedagogy]{@item{Show the contract for "+" on the board, and have students volunteer the contracts for the other math functions covered so far.}}
                 @;NOTE: may have to split into three questions
                @tag[selftaught]{@item{@think-about[#:question "Can you think of the contract for \"+\"? What about the ones for \"/\" and \"*\"? Enter them on the contracts page and check your answers below"
                                              #:answer @list{@code[#:contract "+ : Number Number -> Number"
                                                                        #:purpose
                                                                         "Takes two numbers and gives their sum"
                                                                        ]
                                                       @code[#:contract "/ : Number Number -> Number"
                                                                        #:purpose "Takes two numbers and returns the first divided by the second"]
                                                       @code[#:contract "* : Number Number -> Number" #:purpose "Takes two numbers and gives their product"]}]}}
          @;must have some sort of answers here
          @tag[pedagogy]{@item{Add other functions, like "/" and "*".  Leave these contracts written on the board.}}
          @tag[pedagogy]{@item{If students already know about square roots or squaring, you can add these functions as well. If not, take a moment to review what they do.
                               @code[#:contract "sqrt : Number -> Number"]}}
          @tag[selftaught]{@item{@think-about[#:question "If you already know about square roots or squaring, try to figure out the contracts for these as well. Check with the answers below!"
                                             #:hint "Both of these function only take one number as input"
                                             #:answer @list{@code[#:contract "sqrt : Number -> Number"]
                                             @code[#:contract "sqt : Number -> Number"]}]}}]}