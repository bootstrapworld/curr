#lang curr/lib
@(require 2htdp/image)


@declare-tags[pedagogy group selftaught]
@lesson[#:title "Introducing the Design Recipe"
        #:duration "25 minutes"]{
  @itemlist/splicing[
     @item{Now it's time to start thinking about animation, since you'll need it for your videogame!}
     @item{You already know most of the steps from the last lesson, but we're going to do a few practice exercises before turning you loose on your own games.}
     @pedagogy{@item{How many of you know what a flip-book animation is? Explain if necessary.}}
     @tag[selftaught]{@item{Ever hear of flip-book animation?}}
     @item{When you make a flip-book, you draw each page a little differently from the page before it. We can use functions to do just that! Suppose we had a function that drew a rocket ship a little higher up on each page of a flip-book. What would it look like if you moved through the pages quickly? It would look like the rocket was flying! You've already learned how to draw one frame of your videogame with the characters at certain coordinates, and now we'll learn how a program can change those coordinates. @bold{Today, you're going to learn how to animate a rocket}, then next time you will use what you learned today to animate the characters in your games!}
     @item{Believe it or not, you're 90% of the way towards being able to write an animation function! All the steps you took to write those functions before are actually part of a process that real programmers use, called the Design Recipe.}
     @item{Engineers all over the world use the Design Recipe to write functions. It's a way of thinking through each step of programming and making sure that you're on the right path before you even touch the keyboard.}
     @item{Each step in the Design Recipe tells you a little more about the function you're writing, allowing you to find the answer in pieces instead of having to come up with it all at once.}
     @item{We're going to try using the Design Recipe to animate a rocket@tag[group]{, and for this you'll be working in pairs}.}
     @item{First, let's take a look at some BUGGY code that someone else wrote, since they forgot to use the Design Recipe.}
     @item{Open the Rocket file, and @bold{click run.}}
     @item{In the Interactions window, type @code{(start rocket-height)} to see what happens. A window appears, with our rocket starting out on the ground. At the top of the window, you can see the number of seconds that have passed since blastoff, and the height of the rocket at that time. How many seconds have passed? How high is the rocket?}
     @item{Now @bold{hit the space bar to make time go by}. What happens to the rocket? Nothing! This code has a bug in it! Let's see what went wrong...}
     @item{Turn to @worksheet-link[#:page 11 #:name "Design-Recipe-Rocket-Height"] in your workbook@tag[group]{s}. @pedagogy{Have a student read the Word Problem aloud.} @tag[selftaught]{Read the Word Problem.}}
     @item{Just by reading this Word Problem, we can tell a lot about the function we're going to write. For example, what is the function's name? @tag[group]{Have one person in each pair underline the name on your paper.} @tag[selftaught]{Make a note of the name of the function.}}
     @item{What @italic{kinds of things go into this function?} Numbers? Strings? Images? @italic{What kinds of things does the function give back?} @tag[group]{Now the other person in each pair} Circle these on your paper.}
     @pedagogy{@item{@skit{Who would like to volunteer to @italic{act out} this function?
                                
                                What is your @bold{name}? @code{rocket-height} What is your @bold{Domain}? @code{Number} What is your @bold{Range}? @code{Number}
                                When I give you the number of seconds since blast-off, what do you do? @italic{multiply it by seven}. Let's try it out: "rocket-height three!" (21) "rocket-height zero!" (0) etc.}}}
     @item{@bold{Step 1: Contract}   @bitmap{images/3.1.png}}
     @item{The Contract for a function is like an instruction manual. It tells you the name of function, what types of things it expects, and what type of thing it gives back. It's important to write it down in your code, so that you can always refer back to it when you use that function!}
     @pedagogy{@item{Copy these answers onto the board: 
                          
                          @code{; rocket-height : Number -> Number}}}
     @tag[selftaught]{@item{@code{; rocket-height : Number -> Number}}}
     @item{Copy your contract down into your Design Recipe page!}
     @item{@bold{Step 2: Give Examples}}
     @item{It's always a good idea to work through a few examples, to make sure you understand what the function should do. Then we can use those examples to test our function, to make sure it works the way we expect. You wouldn't build a car without testing it on some sample roads, would you? }
     @item{@pedagogy{@skit{We already tried some examples with our volunteer.}} When we said "rocket-height three" @pedagogy{(@italic{write the accompanying code @code{(EXAMPLE (rocket-height 3) ...)} on the board)}}, what did we get back? 21! But @italic{how} did we get that? By multiplying 3 and 7. Let's write that code into our example:
            @code{(EXAMPLE (rocket-height 3) (* 3 7))}} 
     @tag[(pedagogy selftaught)]{@item{In your notebooks, I want you to come up with another example.}}
     @item{Now we need to circle what's different between these two examples - what's changeable? What does that number represent? Is it the number of astronauts? No, it's the @italic{number of seconds} since blastoff.}
     @item{@bold{Step 3: Code}}
     @item{This next part is easy: it's exactly what you did for fast functions! Can you figure out how to plug in the header? What about the body?}
     @item{Now let's look at the buggy code. Did they get the contract right? What about their examples? Notice that they only wrote one example, and they forgot to write down how that example worked! If they'd written a second example, they would have imnediately seen that something was wrong! But instead, they just raced through the EXAMPLE step and copied the zero into their function body.}
     @item{Add the second EXAMPLE you and your partner came up with, and fix the one that's already there. Then fix the code and let's see that rocket fly!}
     @item{Once you are done, you @tag[group]{and your partner} can type this function into your computer@tag[group]{s}.
                                  @tag[selftaught]{@embedded-wescheme[#:id "example3"
                                                     #:public-id "drawl-youth-fifty-voter-shake"
                                                          #:interactions-text ""]}}
     @item{@pedagogy{Do you guys want to see the rocket fly?} Type @code{(start rocket-height)}
 to see your code in action. We've slowed time down, so that a second passes each time you hit the spacebar.}
     @pedagogy{@item{All right. Now let's have a little bonus round.}}
     @tag[(group pedagogy)]{@item{One point to every team who can figure out how to make the rocket fly twice as fast. You'll have 1 minute. GO!}}
     @tag[(group pedagogy)]{@item{One point to every team who can figure out how to make the rocket fly backwards. You'll have 1 minute. GO!}}
     @tag[(group pedagogy)]{@item{One point to every team who can figure out how to make the rocket fly faster over time, so it gets faster and faster as it gets higher. You'll have 1 minute. GO!}}
     ] } 