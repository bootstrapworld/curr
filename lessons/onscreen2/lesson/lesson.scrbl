#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "onscreen? 2.0" 
        #:duration "25 minutes"
        #:prerequisites "onscreen1 Boolean-Function"]{
     @itemlist/splicing[
         @item{Now it's time to put it all together. Right now, you know how to keep Sam safe on the left side of the screen, and how to keep him safe on the right side. But how do we keep him safe on BOTH sides at the same time?}
         @item{Turn to @worksheet-link[#:page 21 #:name "Design-Recipe-Onscreen"] and read the word problem.}
         @pedagogy{@item{Have the @code{onscreen?} volunteer stand again.}}
         @tag[selftaught]{@item{Pretend you are the @code{onscreen?} function.}}
         @item{What is your name? What is your domain? What is your Range?}
         @item{Sam is onscreen only when he is safe on the left AND the right. How can we use one of those functions we just learned to do this? @pedagogy{'d like my volunteers @code{safe-left?} and @code{safe-right?} to stand up again.}}
         @pedagogy{@item{When I yell out "onscreen? fifty", @code{onscreen?} is going to call @code{safe-left?} and @code{safe-right?} with that number. Depending on what they give back, @code{onscreen?} will tell me true or false}}
         @pedagogy{@item{Try this out, making sure that students are actually talking to one another, calling the functions properly by name. When you call out "onscreen? eighty!", the @code{onscreen?} volunteer should call out "safe-left? eighty" and "safe-right? eighty", and listen their answers before giving back an answer of their own. Run through a bunch of examples here, to make sure it's clear.}}
         @tag[selftaught]{@item{When @code{onscreen?} is given a number, it will call @code{safe-left?} and @code{safe-right?} with that number. Depending on what they give back, @code{onscreen?} will tell me true or false}}                        
         @item{It's time to write the contract and examples!  Don't forget what we just went over! @pedagogy{Raise your hands so I can check your work at each step}}
         @pedagogy{@item{Guide students as necessary, and eventually have them write the code on the computer.}}
         @tag[selftaught]{@item Once you have your contract and examples written, fill in the rest of the worksheet with the code for @code{onscreen?}.}
         @item{Guess what? These functions are exactly what we need in our game file, and to have your characters come back once they've gone off the screen!
               @;FILEALTERNATIVE
               }
         @item{Copy and paste the three functions @code{safe-left?}, @code{safe-right?}, and @code{onscreen?} into your game files.}
                  @item{There are two ways to go about solving this word problem: 
               @code[#:multi-line #t]{(define (onscreen? x)
                     (and (> x -50) (< x 690)))}
               and...
               @code[#:multi-line #t]{(define (onscreen? x)
                     (and (safe-left? x) (safe-right? x)))}}
         @item{Does it matter? Both will work just fine when you type them in...so why care?}
         @item{There's more to being a writer than putting down grammatically-correct sentences. There's more to being an architect or an artist than building a bridge or coloring in a canvas. All of these disciplines involved an element of @italic{design}.}
         @item{Likewise, there is more to being a Programmer than just writing code. You've gotten decent at writing code, and now you're able to write sophisticated programs that include multiple functions - congratulations! But that also means you're ready to consider what it means to @italic{design} the code that you write.}
         @item{The first solution puts all of the logic into one function: the left boundary and the right boundary are both tested by @code{onscreen?}. In the second solution, @code{onscreen?} uses both helper functions, each of which only tests one boundary at a time. Can you think of a reason why one might be better than another? Is it better to have a single, complex function that does all the work, or to have multiple simple functions that only do one thing apiece?}
         @item{Suppose you just built a car, but it's not working right. What would you do? Ideally, you'd like to test each part of the car (the engine, the transmission, etc) @italic{one at a time}, to see which one was broken. The same is true for code! If you have a bug, it's much easier to find when every function is simple and easy to test, and the only complex functions are just built out of simpler ones.}
         @item{Another reason to like the second example is the fact that it lets programmers be lazy. Suppose you have a few characters in a videogame, all of which need to be kept on the screen.  Some of them might only need @code{safe-left?}, others might only need @code{safe-right?}, and only a few might need @code{onscreen?}. What happens if the game suddenly needs to run on computers with differently-sized monitors, where the boundary is 1000 instead of 690? If you have simple and complex functions spread throughout your code, you'll need to change them all. If your complex functions just use the simpler ones, you'd only need to change them in one place!}
         @item{Badly designed programs can work just fine, but they are hard to read, hard to test, and easy to screw up if things change. As you grow and develop as a programmer, you'll need to think beyond just "making code work". It's not good enough if it just works - as artists, we should care about whether or not code is @italic{well designed}, too.}
         @item{This is what functions allow us to do! Everyone from programmers to mathematicians uses functions to carve up complex problems into simpler pieces, which make it possible to design elegant solutions to difficult problems.}
         @item{So the next time you sit down to solve a problem, think about algebraic abstraction, and how you might design a beautiful solution out of simple functions, rather than a huge, complex one.}]}