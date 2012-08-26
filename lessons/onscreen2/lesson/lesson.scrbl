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
         @item{Copy and paste the three functions @code{safe-left?}, @code{safe-right?}, and @code{onscreen?} into your game files.}]}