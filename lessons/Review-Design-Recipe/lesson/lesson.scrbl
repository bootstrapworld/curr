#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[@item{You remember how to define variables, and you know how to use contracts for pre-built functions. Let's see if you remember how to define a function of your own! Turn to page 4 in your workbook.}
          @item{Here we have a function definition:
                @code[#:multi-line #t]{;double : Number -> Number
;takes a number and multiplies it by two
(define (double n)
	(* n 2))}}
            @item{What is the name of this function? @code{double.} How do you know? It's in the contract!}
            @item{How many inputs does it have in its domain? One. How do you know? It's in the contract!}
            @item{What kind of data is the domain? A number. How do you know? It's in the contract! }
            @item{What is the name given to this input? @code{n}. How do you know? It's in the beginning of the definition! }
            @item{What's the Range of this function? Number. How do you know? The contract!}
            @item{Now let's talk about what the function does to its input. Look at the two EXAMPLEs, written in the gray boxes. @tag[pedagogy]{Raise your hand if you can tell me what happens when I type @code{(double 0)}.} @tag[selftaught]{What happens when I type @code{(double 0)}?} What about the next example?}
            @item{What would happen if I changed the name of the input @code{n} to something else, like @code{x}. What else would have to change? @tag[pedagogy]{Keep asking more questions, to make sure they understand.}}
            @tag[pedagogy]{@item{Okay..now it's time for a little team competition!}
            @item{I'm going to give your teams some new function descriptions, and you'll need to create the contract, two examples, and the definition.}}
            @item{@tag[pedagogy]{We'll do one to practice: } @tag[selftaught]{Let's practice defining functions:} First write only the contract and examples! The contract and each example will be worth one point apiece, for a maximum of three points. Write a function called @code{triple}, which takes in a number as its input and multiplies it by 3. @tag[pedagogy]{You have one minute! GO!}}
            @tag[pedagogy]{@item{Walk around and help, while counting down... 3! 2! 1! Eyes on me!}}
            @item{Now look at your two examples. What is the only thing that changes from one to the other? The number being multiplied by three! That is the only thing that is changeable, or variable.}
            @item{Now take another minute, and write the function header and body for triple. Don't forget to replace the changing thing with a variable!}
            @tag[pedagogy]{@item{Walk around and help, while counting down... 3! 2! 1! Eyes on me!}}
            @tag[pedagogy]{@item{Okay, you all did a great job on the practice round. Now I'm going to give you 2 min. to write the entire function, contract, and examples for the next function description. You MUST write your contract and examples first! When you are done, raise your hand so I can check it! If you move on to writing the definition before I have checked your examples, your team will lose a point! Repeat the competition for each of the following examples:}}
            @itemlist/splicing[
                               @item{Write a function @code{plus1}, that takes in a number and adds one to it}
                               @item{Write a function @code{mystery}, that takes in a number and subtracts 4}
                               @item{Write a function @code{redspot}, that takes in a number and draws a solid red circle, using the number as the radius}
            ]
            @tag[pedagogy]{@item{NOTE: the last one is very difficult, and kids probably won't know quite what to do. This is intentional! Given them some time to be frustrated with it, and then cut it short.}}]}