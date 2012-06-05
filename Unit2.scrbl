#lang planet dyoo/scribble-bootstrap:5

@declare-tags[group pedagogy selftaught]
@title{Unit 2: Contracts, Strings and Images}
Unit Overview:



Students are introduced to a set-mapping representation for functions, in which the function object exists as a means of translating points
from a Domain into a Range. Coupled with their understanding of Circles of Evaluation, students generalize their understanding of functions to
include other datatypes, including Strings and Images. 

@objectives[@item{Learn Racket syntax and grammar, using the Circle of Evaluation}
        @item{Learn how to define values to be used later, as variables}
        @item{Learn syntax for simple strings and image-composition expressions}]
@product-outcomes[
        @item{Students learn to make and manipulate the basic elements of their games--numbers, strings, and images}]
See @(hyperlink "http://insertlinkhere.com" "Bootstrap Standards Matrix") for State Standards



Length: 90 minutes
@tag[pedagogy]{
@materials[@item{Student workbook folders @tag[group]{- in pairs! - with names on folders}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            
            @;How to make an entire item tagged?
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
             @item{Display class posters and Language Table}
             @item{Seating arrangements: ideally with clusters of desks/tables}
             @item{Optional: demo machine with projector to show the interactions and definitions windows}]}


@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist[@item{Welcome back! Do you remember what we did in the last class?}
           @item{At the end of class, you learned something extremely important: the Circles of Evaluation, and how to write simple programs in Racket.}
           @item{Suppose I have the math expression "2+3." How would I draw a circle of evaluation for this? How would I convert this into code?}
           @;add image
           @item{@think-about[#:question "How about \"2+3 divided by 1-2\"?"
                             #:answer "MAKE A PICTURE!!!!"]}
           @item{Let's do a review challenge:
                 @itemlist[@item{Turn to @(hyperlink "http://page6.com" "Page 6") in your workbooks, where it says "Circles Competition." On each row there is a mathematical expression in the first column,
                                 with room to draw the Circle of Evaluation and the Racket Code on the second and third columns.}
                           @item{Each row will be a round for this activity, so for Round 1 we'll just be looking at the first row. For this first row, we've even helped you out a little.}
                           @item{@tag[group]{You will have one minute to do the following in groups:} Draw the Circle
                                  of Evaluation, and then convert it to Racket code. @tag[group]{Everyone must have the answer
                                                                                                         written down for your group to win points. GO!}}
                           @item{@tag[pedagogy]{During the minute, walk around and see how groups are doing. Comment on good teamwork when you see it. Don't tutor much; let kids fail: they'll get it in review before the next round.
                                                      When time is up (really 1 minute: the idea is to go quickly), give them a countdown: "30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention.}}
                           @item{@tag[pedagogy]{Review and discuss. Assign points.}}
                           @item{Repeat for each additional round}
                           ]}
           @item{@tag[pedagogy]{Have kids complete the competition - give as little help as possible at this point. After the time is up, have students volunteer their answers. Review as necessary.}}
           ]}
@lesson[#:title "Contracts"
        #:duration "15 minutes"]{
@itemlist[@item{Suppose you have to describe a soda machine. You know that the input to this machine will be money, and you have to get a soda in return. When you use a soda machine, does it only give you one type of soda? Wouldn't it be lame if you had to have a different machine for Coke than you did for Sprite?}
          @item{A soda machine, for example, takes in money and outputs soda.
                @code[#:contract "Soda-machine : Money Selection -> Soda"]{
                 ; Takes money and gives soda
                                                                           }}
          @item{This description talks about outputs  without having to say what those outputs are.}
          @item{This explanation of a soda machine just talks about some soda, but not any specific type of soda. It just says what kind of thing comes out, not which particular thing.}
          @item{How would you describe a coffeemaker? What kind of stuff goes into a coffeemaker? What kind of stuff comes out?}
          @item{How would you describe a lightbulb? @tag[pedagogy]{Have the students brainstorm a few other machines, and their inputs and outputs.} @tag[selftaught]{Try to brainstorm a few other machines and their inputs and outputs.}}
          @item{The things that go into a machine are called the inputs, and what comes out is called the output. But the kinds of things that go in is the Domain, and the kind of thing that comes out is the Range. @think-about[#:question "A soda machine's domain is money. Can you think of an example input?" 
                                                                                                                                                                                                                                    #:answer "Any type of money: quarters, dimes, dollars"] It's range is soda.}
          @item{@think-about[#:question "What is the domain and range of a coffeemaker?"
                             #:answer "The domain is coffee ingredients: coffee beans, water, etc. The range is types of coffee."]}
          @item{Functions in Racket are the same: the addition function needs two numbers as its domain, but those numbers don't have to be 4
                and 5. They can be any numbers.}
          @item{Okay, so you already know about a bunch of functions in Racket from math class: plus, minus, times, divide, etc.}
          @item{In Racket, a description of a function is called the contract. The contract tells you just what you need to know to use the function.}
          @item{A contract is also a promise: if you give the machine the kinds of things in its Domain, then you'll get something in the Range. If you give a pizza shop your order and some money, it promises to give you some hot, delicious pizza.}
          @item{Same thing in Racket: if you give plus two numbers, it will give you another number back.}
          @item{We'd like to create a list of contracts for ourselves, so that we can keep track of these functions and exactly how they work. Once we've practiced entering these contracts into our book, I'll show you new functions that let you work with words and pictures!}
          @item{Are you ready? Turn to the front of your workbooks, to the MOST IMPORTANT PAGE, where it says @(hyperlink "contracts.com" "Contracts").}
          @item{A contract specifies @itemlist[#:style 'ordered
                                                        @item{the name of the function,}
                                                        @item{the domain, and}
                                                        @item{the range.}]}
          @item{@tag[pedagogy]{Show the contract for "+" on the board, and have students volunteer the contracts for the other math functions covered so far.}
                @tag[selftaught]{@think-about[#:question "Can you think of the contract for "+"? What about the ones for "/" and "*"? Enter them on the @(hyperlink  "asfd" "Contracts") page and check your answers below" 
                                              #:answer "@code[#:contract "+ : Number Number -> Number"]{
                                                                         ; Takes two numbers and gives their sum}"
                                                       "@code[#:contract "/ : Number Number -> Number"]{
                                                                         ; Takes two numbers and returns the first divided by the second}"
                                                       "@code[#:contract "* : Number Number -> Number"]{
                                                                         ; Takes two numbers and gives their product}"]
                                  }}
          @;must have some sort of answers here
          @item{@tag[pedagogy]{Add other functions, like "/" and "*".  Leave these contracts written on the board.}}
          @item{@tag[pedagogy]{If students already know about square roots or squaring, you can add these functions as well. If not, take a moment to review what they do.}
                @tag[selftaught]{@think-about[#:question "If you already know about square roots or squaring, try to figure out the contracts for these as well. Check with the answers below!"
                                             #:hint "Both of these function only take one number as input"
                                             #:answer @code{    ; sqrt : Number -> Number
                                                   ; sqr : Number -> Number
                                                            }]}
                @tag[pedagogy]{@code{    ; sqrt : Number -> Number
                                         ; sqr : Number -> Number
                                    }}}
          ]}
@lesson[#:title "Strings"
        #:duration "10 minutes"]{
@itemlist[@item{One of the following does not belong. Can you find it? 6, "cat", 0, -2, 7.5}
           @item{Why doesn't "cat" belong? Why isn't 7.5 the odd one out? Or -2? @tag[pedagogy]{Circle "cat"}}
           @item{What you have all stumbled onto is that not all values are the same. Some of them are Numbers and some are words.}
           @item{Words like "cat" are called Strings. A String is anything in quotation marks. 5 is not the same as "5"! The first is a number, and the second is a string.}
           @item{You'll notice that our math functions don't really work on Strings.}
           @item{What does it mean to add three and the word "cat"? It doesn't make sense, does it?}
           @item{To create a Number in Racket, we just typed it in. To create a String, you type in the word or words that you want, and put quotation marks on either side.
                 @tag[group]{With your partner:} Try creating a few strings on your own.}
           @item{Racket also gives us functions we can use to work with Strings. For example, there's a function called string-length. What do you think it does? I'll give you one hint: the contract.
                 @tag[pedagogy]{Write the contract on the board, but without the labels Name, Domain, and Range:}
                 @tag[selftaught]{@think-about[#:question "Try to write the contract for string-length and check below."
                                              #:answer @code{; string-length: String -> Number
                                       }]}
                 @tag[pedagogy]{@code{; string-length: String -> Number
                                       }}}
           @item{@think-about[#:question "What is the domain of this function? What is the range?"
                               #:answer "The domain is Strings, and the range is Numbers"]}
           @item{@tag[pedagogy]{Now that the students have written down the contract, let them turn on their monitors and experiment, see if they can figure out what string-length does!}
                 @tag[selftaught]{Now that you have written out the contract, turn on your monitor and see if you can figure out what string-length does!}}
                 
           ]}
@lesson[#:title "Creating Images"
        #:duration "35 minutes"]{
@itemlist[@item{Let's talk about graphics.}
           @item{@tag[pedagogy]{On the board, draw the Circle of Evaluation for 
                                  @code{(circle 100 "solid" "red")}}}
           @item{@tag[selftaught]{"insert image here for selfies"}}
           @item{@tag[pedagogy]{Can someone tell me how to convert this into Racket code? Copy their answer on the board.}
                                         @tag[selftaught]{@think-about[#:question "How would you convert this to racket code? Check your answer below."
                                                                     #:answer @code{(circle 100 "solid" "red")}]}}
           @item{This uses a new function, which you've never seen before! What is its name?}
           @item{Every contract has three parts! @tag[pedagogy]{Raise your hand if you can tell me what they are! (Name, domain, and range)}
                       @tag[selftaught]{@think-about[#:question "What are they?"
                                                    #:answer "Name, domain, and range"]}}
           @item{Can you figure out the contract for circle? Based on the example, can you tell me what's in its Domain?@tag[pedagogy]{ Follow along on the board...
                                                                                           @code{; circle: Number String String -> ...
                                                                                                 (circle 100 "solid" "red")}}}
           @item{So what's the Range? What do you think this thing is going to give us back? A Number? A String? Type it in and try it out!}
           @item{What it gives back is a new Type: Image!}
           @item{@tag[group]{Now we're going to do the next step as a group.}}
           @item{@exercise{I'm going to show you the contract for another function. This time around, you're not allowed to touch the keyboard until you have copied the contract into your contract table, along with the contract for circle
. Once you've done that, @tag[pedagogy]{"I want to see you "}try to draw a rectangle! GO!} @code{; rectangle: Number Number String String -> Image}}
           @item{@exercise{I'm going to show you a few more contracts. Once again, you have to have them written down before touching the keys. You'll have five minutes to figure out how to use each of these functions to make a shape! GO!}
                  @code{; ellipse: Number Number String String -> Image
                        ; triangle: Number String String -> Image
                        ; star: Number String String -> Image
                        ; radial-star: Number Number Number String String -> Image
                        ; text: String Number String -> Image
                        }} 
           @item{@tag[pedagogy]{Let kids experiment with these functions and point out interesting results to the class.}}
           @item{Going Further - If time allows, you can go further into @(hyperlink "http://manipulatingimages.com" "Manipulating Images") or @(hyperlink "http://makingflags.com" "Making Flags")!}
           ]}
@lesson[#:title "Closing"
        #:duration "5 minutes"]{
    @tag[pedagogy]{@itemlist[@item{Who can tell us one thing we learned today?}
                             @item{Who saw someone else in the class do something great?}
                             @item{Cleanup, dismissal.}]}
    @tag[selftaught]{@itemlist[@item{Think about what you learned today.}
                               @item{Remember contracts and how to make them.}
                               @item{Think of strings and what differentiates a string from a different type.}
                               @item{Think about images and what goes into creating an image.}
                               @item{Have an awesome day!}]}}