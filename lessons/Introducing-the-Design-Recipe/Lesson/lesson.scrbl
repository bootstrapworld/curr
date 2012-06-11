#lang curr/lib

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
     @item{@tag[pedagogy]{Copy these answers onto the board:} @code[#:contract  "rocket-height : Number -> Number"]{}}
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
     @item{@tag[pedagogy]{All right. Now let's have a little bonus round.}}
     @item{@tag[(group pedagogy)]{One point to every team who can figure out how to make the rocket fly twice as fast. You'll have 1 minute. GO!}}
     @item{@tag[(group pedagogy)]{One point to every team who can figure out how to make the rocket fly backwards. You'll have 1 minute. GO!}}
     @item{@tag[(group pedagogy)]{One point to every team who can figure out how to make the rocket fly faster over time, so it gets faster and faster as it gets higher. You'll have 1 minute. GO!}}
     ] }