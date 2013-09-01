#lang curr/lib

@title{Unit 1: Everything you learned in Bootstrap 1...}

@declare-tags[group pedagogy selftaught]



@overview{
          
@unit-descr{Students review almost all of the material from Bootstrap 1, including Circles of Evaluation, Contracts, Expressions dealing with strings and images, Variable definitions, Function definitions, and the Design Recipe.}


@objectives[@item{Students will become comfortable writing complex expressions, defining variables and functions, and using the Design Recipe}
          ]

@product-outcomes[
          @item{Students define functions to meet a goal, or problem statement.}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{Bootstrap Review [Review.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=pTQwdxSDp2" "WeScheme")], already open on students' computers.}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}
@lesson/studteach[#:title "Introduction"
                  #:duration "5 minutes"]{
      @itemlist/splicing[@item{Welcome back to Bootstrap!}
      @pedagogy{@item{Introduce teaching staff. Have students introduce themselves as well.}
      @item{Review the rules:@itemlist[
         @item{Unless we say otherwise, raise your hand to speak}
         @item{If you're not programming, the computer monitors need to be OFF. When we say "monitors off", everyone should shut off the monitors, stop talking, and give their attention to the teachers. Let's try this one out - everyone make sure the monitors are on...now start talking.....louder!....MONITORS OFF! Repeat as necessary.}
         @item{No one in this class is allowed to put each other down. I don't ever want to hear anyone call each other "stupid", "smart one", "idiot", or anything else. Nobody tells each other to shut up, and everyone is respectful. Is that clear?}]}
      @item{Divide the class into teams of 3-4 students. Give each team a name, and draw a scoreboard at the front of the room.}}
      @item{Today, we're going to be covering everything you did in Bootstrap 1. Let's see how much you remember! @tag[pedagogy]{We're going to start with a bit of a competition today.}}]}

@lesson/studteach[#:title "Expressions"
        #:duration "30 minutes"]{
        @itemlist/splicing[
           @pedagogy{@item{Monitors on!}
           @item{The "review" file should already be open on students' machines and your projector.}
           @item{Review UI of the DrScheme or WeScheme IDE.}}
           @item{At the top of the definitions window, there are a number of variables defined. What is the name of one of the variables?}
           @item{@pedagogy{Raise your hand if you can tell me:} What value is that variable is defined to have?}
           @item{When I click "Run" @pedagogy{(click run)}, and type the name of that variable into the interactions window, what should I get back? @tag[pedagogy]{Try it out for yourselves on your own computers.}}
           @pedagogy{@item{1, 2, 3...Monitors off! Let's focus on the code on the projector for now.}}
           @item{@pedagogy{Raise your hand if you can tell me:} What is the name and value of another variable that is defined here? @pedagogy{(Repeat as necessary)}}
           @item{Look at the variable OUTLINE. What shape will this draw? How big do you think it will be? Will it be solid or outline? What color will it be?}
           @item{@pedagogy{Monitors on.} Try it out! Was the fill what you expected it to be? It says outline in the code... why did it turn out solid? @tag[pedagogy]{Raise your hand if you can explain this.}}
           @item{The problem is that we used a very confusing variable name! The name was outline, but the value was "solid"! Let's remember this: always choose your variable names carefully!}
           @pedagogy{@item{Have teams define two additional Numbers, and practice using them in the interactions window.}
           @item{Have teams define two additional Strings.}
           @item{Have teams define one more Boolean.}
           @item{Have teams define one more Image.}}
;@tag[selftaught]{THINGS}
           @item{Okay, we've got variables, and we know how to define them.}
           @item{However, we've also got some pre-built functions, which let us play around with these values. Do you know a function that works on numbers?}
           @pedagogy{@item{Review circles of evaluation with numbers, as well as how to convert them to Scheme code}}
;@tag[selftaught]{REMEMBER CIRCLES}
           @item{@tag[pedagogy]{Let's have a competition! }Turn to @worksheet-link[#:page 3 #:name "circles-competition"] in your workbooks.} 
           @item{Each row has a math expression. You'll have to convert that math expression into Circles of Evaluation, and then convert the Circle into Racket code.}
           @pedagogy{@item{Each team starts with three points. For every row you get correct, you will get two points. If you get stuck, your team can ask any teacher for help...but it will cost you one point. Questions?}
           @item{On your mark, get set...go!}}]}
                                
@lesson/studteach[#:title "Contracts"
        #:duration "20 minutes"]{
          @itemlist/splicing[@item{It's important for us to keep track of how our functions work - in Bootstrap 1 you also learned about Contracts. Every contract has three parts...@tag[pedagogy]{raise your hand if you know what they are.}}
          @item{@tag[pedagogy]{That's right! }Name, Domain and Range!}
          @pedagogy{@item{Review contracts for +, -, *, etc, making sure that students write them down in their workbooks.}
          @item{Review contracts for image-producing functions like circle, triangle, rectangle, star, etc, making sure that students write them down in their workbooks.}}
;@tag[selftaught]{@item{write some contracts}}
          ]}
                                
@lesson/studteach[#:title "The Design Recipe"
        #:duration "30 minutes"]{
          @itemlist/splicing[@item{You remember how to define variables, and you know how to use contracts for pre-built functions. Let's see if you remember how to define a function of your own! Turn to @worksheet-link[#:page 4 #:name "Fast-Functions"] in your workbook.}
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
            @item{Now let's talk about what the function does to its input. Look at the two EXAMPLEs, written below. @tag[pedagogy]{Raise your hand if you can tell me what happens when I type @code{(double 5)}.} @tag[selftaught]{What happens when I type @code{(double 0)}?} What about the next example?}
            @item{What would happen if I changed the name of the input @code{n} to something else, like @code{x}. What else would have to change? @pedagogy{Keep asking more questions, to make sure they understand.}}
            @pedagogy{@item{Okay, now it's time for a little team competition!}
            @item{I'm going to give your teams some new function descriptions, and you'll need to create the contract, two examples, and the definition.}}
            @item{@tag[pedagogy]{We'll do one to practice: } @tag[selftaught]{Let's practice defining functions:} First write only the contract and examples! The contract and each example will be worth one point apiece, for a maximum of three points. Write the contract and examples for a function called @code{triple}, which takes in a number as its input and multiplies it by 3. @tag[pedagogy]{You have one minute! GO!}}
            @pedagogy{@item{Walk around and help, while counting down... 3! 2! 1! Eyes on me!}}
            @item{Now look at your two examples. What is the only thing that changes from one to the other? The number being multiplied by three! That is the only thing that is changeable, or variable.}
            @item{Now take another minute, and write the function header and body for triple. Don't forget to replace the changing thing with a variable!}
            @pedagogy{@item{Walk around and help, while counting down... 3! 2! 1! Eyes on me!}}
            @pedagogy{@item{Okay, you all did a great job on the practice round. Now I'm going to give you 2 min. to write the entire function, contract, and examples for the next function description. You MUST write your contract and examples first! When you are done, raise your hand so I can check it! If you move on to writing the definition before I have checked your examples, your team will lose a point! Repeat the competition for each of the following examples:}}
            @itemlist/splicing[
                               @item{Write a function @code{plus1}, that takes in a number and adds one to it}
                               @item{Write a function @code{mystery}, that takes in a number and subtracts 4}
                               @item{Write a function @code{redspot}, that takes in a number and draws a solid red circle, using the number as the radius}
            ]
            @pedagogy{@item{NOTE: the last one is very difficult, and kids probably won't know quite what to do. This is intentional! Give them some time to be frustrated with it, and then cut it short.}}]}


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @tag[pedagogy]{
 @itemlist[
  @item{Who can tell us one thing we learned today?}       
  @item{Who saw someone else in the class do something great?}
  @item{Cleanup, dismissal}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]