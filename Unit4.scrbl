#lang scribble/base
@(require "lib/all.rkt")
@title{Unit 4: The Design Recipe}

@declare-tags[group pedagogy selftaught]

Unit Overview

Students are introduced to the Design Recipe and apply it to simple problems.

@objectives[@item{Students will become familiar with the steps of the Design Recipe.}
            @item{Students will practice Racket syntax and the Circles of Evaluation.}]
@product-outcomes[@item{Students@tag[group]{,in pairs,} will write functions to solve simple problems by using the Design Recipe}]

See @(hyperlink "http://standards.com" "Bootstrap Standards Matrix") for state standards.

Length: 90 minutes

@tag[pedagogy]{
@materials[@item{Student workbook folders @tag[group]{- in pairs! - with names on covers}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
              @item{Display Class posters, Language Table, Design Recipe}
              @item{"Rocket" [@(hyperlink "drracketfile" "DrRacket file") + @(hyperlink "teachpack" "teachpack")|@(hyperlink "wescheme" "WeScheme")] preloaded on students' machines}
              @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" "+ - * / sq sqrt expt")
                 (list "String" "string-append string-length")
                 (list "Image" "rectangle circle triangle ellipse radial-star scale rotate put-image"))

@lesson[#:title "Introduction"
        #:duration "15 minutes"]{@itemlist[@item{Review material from previous weeks: Coordinate Planes, Circles of Evaluation, Contracts, Strings, Images, and Functions. @tag[selftaught]{If you are having trouble remembering any of these, look back to previous lessons to refresh your memory.}}]}
                                                            
@lesson[#:title "Introducing the Design Recipe"
        #:duration "25 minutes"]{
  @itemlist[
     @item{Now it's time to define functions to make your characters move!}
     @item{You already know most of the steps from the last lesson, but we're going to do a few practice exercises before turning you loose on your own games.}
     @item{@tag[pedagogy]{How many of you know what a flip-book animation is? Explain if necessary.}@tag[selftaught]{Ever hear of flip-book animation?}}
     @item{When you make a flip-book, you draw each page a little differently from the page before it. We can use functions to do just that! Suppose we had a function that drew a rocket ship a little higher up on each page of a flip-book. What would it look like if you moved through the pages quickly? It would look like the rocket was flying! You've already learned how to draw one frame of your videogame with the characters at certain coordinates, and now we'll learn how a program can change those coordinates. Today, you're going to learn how to animate a rocket, then next time you will use what you learned today to animate the characters in your games!}
     @item{Believe it or not, you're 90% of the way towards being able to write an animation function! All the steps you took to write those functions before are actually part of a process that real programmers use, called the Design Recipe.}
     @item{Engineers all over the world use the Design Recipe to write functions. It's a way of thinking through each step of programming and making sure that you're on the right path before you even touch the keyboard.}
     @item{We're going to try using the Design Recipe to animate a rocket@tag[group]{, and for this you'll be working in pairs}.}
     @item{Turn to @(hyperlink "page11.com" "page 11") in your workbook@tag[group]{s}. @tag[pedagogy]{Have a student read the problem statement aloud.} @tag[selftaught]{Read the problem statement.}}
     @item{Just by reading this Problem Statement, we can tell a lot about the function we're going to write. For example, what is the function's name? @tag[group]{Have one person in each pair underline the name on your paper.} @tag[selftaught]{Make a note of the name of the function.}}
     @item{What does the function take in as an input? What does it give back as an output? @tag[group]{Now the other person in each pair} Circle these on your paper.}
     @item{@tag[pedagogy]{@skit{Who would like to volunteer to act out this function?
                                
                                What is your name? @code{rocket-height} What is your Domain? @code{Number} What is your Range? @code{Number}
                                When I give you the number of seconds since blast-off, what do you do? multiply it by seven. Let's try it out: "rocket-height three!" (21) "rocket-height zero!" (0) etc.}}}
     @item{@bold{Step 1: Contract}}
     @item{@tag[pedagogy]{Copy these answers onto the board: @code{;; rocket-height : Number -> Number}}}
     @item{Copy the contract down into your Design Recipe page!}
     @item{@bold{Step 2: Give Examples}}
     @item{@tag[pedagogy]{@skit{We already tried some examples with our volunteer.}} When we said "rocket-height three" @tag[pedagogy]{(write the accompanying code @code{(EXAMPLE (rocket-height 3) ...)} on the board)}, what did we get back? 21! But how did we get that? By multiplying 3 and 7. Let's write that code into our example:
            @code{(EXAMPLE (rocket-height 3)
                      (* 3 7))}} 
     @item{@tag[(pedagogy selftaught)]{In your notebooks, I want you to come up with another example.}}
     @item{Now we need to circle what's different between these two examples - what's changeable? What does that number represent? Is it the number of astronauts? No, it's the time since blastoff.}
     @item{@bold{Step 3: Code}}
     @item{This next part is easy: it's exactly what you did for fast functions! Can you figure out how to plug in the header? What about the body?}
     @item{Once you are done, you @tag[group]{and your partner} can type this function into your computer@tag[group]{s}.}
     @item{@tag[pedagogy]{Do you guys want to see the rocket fly?} Type (start rocket-height)
 to see your code in action. We've slowed time down, so that a second passes each time you hit the spacebar.}
     @item{All right. Now let's have a little bonus round.}
     @item{@tag[(group pedagogy)]{One point to every team who can figure out how to make the rocket fly twice as fast. You'll have 1 minute. GO!}}
     @item{@tag[(group pedagogy)]{One point to every team who can figure out how to make the rocket fly backwards. You'll have 1 minute. GO!}}
     @item{@tag[(group pedagogy)]{One point to every team who can figure out how to make the rocket fly faster over time, so it gets faster and faster as it gets higher. You'll have 1 minute. GO!}}
     ] }
@lesson[#:title "Practicing the Design Recipe"
        #:duration "20 minutes"]{@itemlist[
                  @item{@tag[pedagogy]{Note: if space allows, this section can also be done on the board with multiple, simultaneous challenges. See the video links for an example.}}
                   @item{@tag[pedagogy]{@skit{I need another volunteer, to act out a new function called @code{red-square}
                                                                                                         
     When I say "red-square fifty", I want you to make a solid, red square where each side is 50 pixels long. "red-square fifty!" "red-square ninety!" etc..}}}
                   @item{Turn to @(hyperlink "page12.com" "Page 12") in your workbooks. You'll have 2 minutes to read the problem statement and to underline the function's name, domain and range. GO!}
                   @item{@tag[pedagogy]{Count down the last 10 seconds, and then collect answers from teams.}}
                   @item{Now you'll have another minute to fill in the contract for your function. GO!}
                   @item{@tag[pedagogy]{Count down the last 10 seconds then collect answers from teams. Keep score!}}
                   @item{@bold{Step 1: Contract}}
                   @item{@think-about[#:question "What's the name of the function we're trying to write? What kind of Domain did we say it expects? Range? Fill these in under as the three parts of your contract."
                                      #:answer "Name: red-square; Domain: Number; Range: Image"]}
                                                                                                 
                   @item{@tag[pedagogy]{Count down the last 10 seconds, and then collect answers from teams.}}
                   @item{Now you have to give two example. Again, you'll have one minute. GO!}
                   @item{@bold{Step 2: Give Examples}}
                   @item{When given the number 20, what should red-square draw? A solid, red square of size 20.
                         @itemlist[@item{@think-about[#:question "How do I write the Racket code for that?"
                                                      #:answer "@code{(rectangle 20 20 solid red)}"]}
                                  @item{Fill in the boxes with the Racket code for the other examples, including the generalized pattern.            }
                                  @item{Now circle everything that changes between the examples, and label it.}]}
                   @item{@tag[pedagogy]{Count down the last 10 seconds then collect answers from teams. Don't forget to keep score!}}
                   @item{Now for the final step! @tag[(pedagogy group)]{This one is worth two points: one for filling in everything on the "define" line and one for filling in the body of the function.} You'll need to fill in the name of your function and a name for the variable. Then you'll need to figure out what goes on the next line for the function's body. You will have two minutes for this. GO!}
                   @item{@bold{Step 3: Code}}
                   @item{As always, we start with the function header: "define", then the name of the function and the names of the inputs from our Domain. @think-about[#:question "What is the name of our function here? What is the name of our input?" #:answer "Name: red-square; Input: size (number is the type)"]}
                   @item{Now you need to fill in the function body. Which pattern can we use for this? The general one.}
                   @item{@tag[pedagogy]{Now you need to fill in the function body. Which pattern can we use for this? The general one.}
                          @tag[selftaught]{Now you should try typing in the code and running some tests to see if it works.}}]}
                                
@lesson[#:title "Even More Practice (Yard Area)"
        #:duration "20 minutes"]{
  @itemlist[
     @item{Okay, now it's time for the final round. When I say go, @tag[group]{teams will } turn to @(hyperlink "page13.com" "page 13"), and begin. @tag[group]{This time, each time will have 5 minutes to }Read the problem statement, write the contract, and fill out the examples. @tag[group]{One point for each section. } Any questions? On your mark ... get set ... GO!}
     @item{@tag[pedagogy]{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @item{Now @tag[group]{you'll have 5 more minutes to }finish the Design Recipe@tag[group]{, } and @tag[group]{to }type in your function and test cases. On your mark ... get set ... GO!}
     @item{@tag[pedagogy]{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @item{@tag[pedagogy]{If time allows, pass out extra Design Recipe worksheets [@(hyperlink "PDF" "PDF") | @(hyperlink "OOo" "OOo")], and run another round: e.g., one of 
           @code{(define (years-ago year) (- 2011 year))
                 (define (plural word) (string-append word "s"))
                 (define (diamond size color) (rotate 45 (rectangle size size "solid" color)))
                 }}}]}
@lesson[#:title "Closing" #:duration "10 minutes"]{@itemlist[
           @item{What you have learned is powerful: a structured way to approach solving any problem. First you state the problem as clearly as you can, then think about the data. Then you come up with examples of how the finished product should look, and write a template using only what you know. Only then do you solve!}
            @item{Engineers use this when they design cars. Journalists use this when they write articles. Chefs use it when they make food. Everyone, in every profession, needs to solve problems. What you have learned is a way of approaching problems that will work in many different places - not just programming. To succeed in this class, you need to be masters of problem solving. If you only learn one thing, let it be these steps.}
            @item{Next time, you will use the Design Recipe to animate the characters in your game! Don't forget the recipe - it will save your life over the next few lessons!}
            @item{@tag[pedagogy]{Who can tell us one thing we learned today?}}
            @item{@tag[pedagogy]{Who saw someone else in the class do something great?}}                                       
            @item{@tag[(pedagogy group)]{Cleanup, dismissal)}}]}
                   
                                 
                              
               
                           
   