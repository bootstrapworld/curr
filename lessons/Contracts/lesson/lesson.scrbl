#lang curr/lib
@(require 2htdp/image)

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Contracts"
        #:duration "15 minutes"]{
@itemlist/splicing[@item{Suppose you have to describe a soda machine. You know that the input to this machine will be money, and you have to get a soda in return. When you use a soda machine, does it only give you one type of soda? Wouldn't it be lame if you had to have a different machine for Coke than you did for Sprite? @bitmap{images/2.1.png}}
          @item{A soda machine, for example, takes in money and your selection, and gives you soda.
                @code[#:multi-line #t]{; soda-machine : Money Selection -> Soda
                                       ; Takes money and gives soda}}
          @item{This explanation of a soda machine just talks about what goes in and what comes out. It doesn't talk about exactly how it works, and it doesn't require only a special kind of soda (like Coke or Sprite). It's useful to think about machines in this way, when all we want to know is how to use them. When you walk up to a soda machine, all you care about it tha you have some cash and you'd like to make a selection. Why worry about the details?}
          @item{How would you describe a coffeemaker? What kind of stuff goes into a coffeemaker? What kind of stuff comes out?}
          @item{How would you describe a lightbulb? @pedagogy{Have the students brainstorm a few other machines, and their inputs and outputs.} @tag[selftaught]{Try to brainstorm a few other machines and their inputs and outputs.}}
          @item{The @bold{kinds of things} that go into a machine are called the Domain, and the @bold{kind of thing} that comes out is the Range.  When we pick a specific example (like selecting "Pepsi"), we are talking about inputs and outputs. So with our soda machine, the Domain would be "money and selection", while "one dollar and mountain dew" would be example inputs. @think-about[#:question "A soda machine's range is Soda. Can you think of an example output?"  #:answer "Any type of money: quarters, dimes, dollars"] Its range is soda.}
          @item{@think-about[#:question "What is the domain and range of a coffeemaker?"
                             #:answer "The domain is coffee ingredients: coffee beans, water, etc. The range is types of coffee."]}
          @item{Functions in Racket are the same: the addition function needs two numbers as its domain, but those numbers don't have to be 4
                and 5. They can be any numbers.}
          @item{You already know about a bunch of functions in Racket from math class: addition, subtraction, multiplication, division, etc.}
          @item{In Racket, a description of a function is called the @bold{contract}. The contract tells you just what you need to know to use the function.}
          @item{A contract is also a promise: if you give the machine the kinds of things in its Domain, then you'll get something in the Range. If you give a pizza shop your order and some money, it promises to give you some hot, delicious pizza.}
          @item{Same thing in Racket: if you give plus two numbers, it will give you another number back.}
          @item{When we write a contract in Racket, it's like writing a note to ourselves about how to use the program. Just like with our soda machine, we don't care how it works when we're writing the contract. All that matters is @italic{how to use the function.} }
          @item{Since Contracts are for use by humans (and not computers), we put a semicolon (@code{;}) at the beginning when we write them into the computer. This tells the computer to ignore the line: it's for Humans Only!}
          @item{We'd like to create a list of contracts for ourselves, so that we can keep track of these functions and exactly how they work. Once we've practiced entering these contracts into our book, I'll show you new functions that let you work with words and pictures!}
          @item{Are you ready? Turn to the front of your workbooks, to the MOST IMPORTANT PAGE, where it says \"Contracts\".}
          @item{A contract specifies @itemlist[#:style 'ordered
                                                        @item{the name of the function,}
                                                        @item{the domain, and}
                                                        @item{the range.}]}
         @pedagogy{@item{Show the contract for @code{+} on the board, and have students volunteer the contracts for the other math functions covered so far.}}
                 @;NOTE: may have to split into three questions
         @tag[selftaught]{@item{@think-about[#:question @list{"Can you think of the contract for " @code{+} "? What about the ones for " @code{/} " and " @code{*} "? Enter them on the contracts page and check your answers below"}
                                              #:answer @list{@code[#:multi-line #t]{; + : Number Number -> Number
                                                                                   ; Takes two numbers and gives their sum}
                                                              @code[#:multi-line #t]{; / : Number Number -> Number
                                                                                    ; Takes two numbers and returns the first divided by the second}
                                                              @code[#:multi-line #t]{; * : Number Number -> Number
                                                                                     ; Takes two numbers and gives their product}}]}}
          @;must have some sort of answers here
          @pedagogy{@item{Add other functions, like @code{/} and @code{*}.  Leave these contracts written on the board.}}
          @pedagogy{@item{If students already know about square roots or squaring, you can add these functions as well. If not, take a moment to review what they do.
                               @code[#:multi-line #t]{; sqrt : Number -> Number
                                                      ; sqr : Number -> Number}}}
          @tag[selftaught]{@item{@think-about[#:question "If you already know about square roots or squaring, try to figure out the contracts for these as well. Check with the answers below!"
                                             #:hint "Both of these function only take one number as input"
                                             #:answer @list{@code{; sqrt : Number -> Number}]
                                             @code{; sqt : Number -> Number}}]}}]}