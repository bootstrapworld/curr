#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "onscreen? 2.0" 
        #:duration "25 minutes"
        #:prerequisites "onscreen1 Boolean-Function"]{
     @itemlist/splicing[
         @item{@exercise{Now it's time to put it all together. Right now, you know how to protect Sam on the left side of the screen, and how to protect him on the right side. But how do we protect him on BOTH sides at the same time?}}
         @item{Turn to @(hyperlink "page21.com" "Page 21") and read the problem statement.}
         @tag[pedagogy]{@item{I need a volunteer to be the onscreen? function. (take a volunteer)}}
         @tag[selftaught]{@item{Pretend you are the onscreen? function"}}
         @item{What is your name? What is your domain? What is your Range?}
         @item{Sam is onscreen only when he is protected on the left AND the right. How can we use one of those functions we just learned to do this? @tag[pedagogy]{'d like my volunteers protect-left and protect-right to stand up.}}
         @tag[pedagogy]{@item{When I yell out "onscreen? fifty", onscreen? is going to call protect-left and protect-right with that number. Depending on what they give back, onscreen? will tell me true or false}}
         @tag[pedagogy]{@item{Try this out, making sure that students are actually talking to one another, calling the functions properly by name. When you call out "onscreen eighty!", the onscreen? volunteer should call out "protect-left eighty" and "protect-right eighty", and listen their answers before giving back an answer of their own. Run through a bunch of examples here, to make sure it's clear.}}
         @item{It's time to write the contract and examples!  Don't forget what we just went over! @tag[pedagogy]{Raise your hands so I can check your work at each step}}
         @tag[pedagogy]{@item{Guide students as necessary, and eventually have them write the code on the computer.}}
         @tag[selftaught]{@item{Write the contract here -> @fill-in-the-blank[#:id "contract"]}}
         @item{Guess what? This function can be dropped into your game file, and used to have your characters come back once they've gone off the screen!
               @;FILEALTERNATIVE
               }
         @item{Copy and paste the three functions into your game files.}]}