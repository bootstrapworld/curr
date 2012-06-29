#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Blue Circle" #:duration "10 minutes"
                #:prerequisites "Fast-Functions"]{

@itemlist/splicing[
          @item{Now it's your turn!}
          @tag[selftaught]{@item{INSERT VIDEO FOR SELFTAUGHT HERE}}
          @tag[pedagogy]{@item{Raise your hand if you want to help me act out this next function. We'll come up with some examples together, and your group will have to write two more on paper!}}
          @tag[pedagogy]{@item{Hand the student the sign that says "bc" and ask them to come to the whiteboard.}}
          @tag[pedagogy]{@item{@skit{When I say "bc 50", you'll draw a solid blue circle of size 50. Let's try it out. "bc fifty!". Wait for student to draw a circle. Then have several other students give examples to your function, by calling out "bc" and a number. Make sure that the student answering gives an appropriately sized circle return every time.}}}
          @item{I want to write a function called @code{bc}, which takes in a number and draws me a solid, blue circle that is whatever size the number was. @tag[pedagogy]{Just like our volunteer here.}}
          @item{First, you need to write down the CONTRACT for this function. @tag[pedagogy]{Once again, everyone in your group needs to have the correct answer! You'll have 2 minutes. GO!}}
          @item{Now it's time to write some examples. Let's look at the first example "bc" drew on the board, for @code{(bc @code{50})}. @think-about[#:question "What shape did they draw? What color? What size? How would you write the code to draw that shape?" #:answer @list{@tag[pedagogy]{(write on the board):} @code{ (EXAMPLE (bc @code{50}) (circle @code{50} @code{"solid" "blue"} ))}}]}
          @tag[group]{@item{You have 2 minutes for EVERYONE in your group to write out 2 examples of your own. ALL OF THEM have to be correct for your team to get this point. GO!}}
          @tag[pedagogy]{@item{Countdown: 30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES ON ME. (Don't forget to wait for total silence, attention.)}}
          @tag[pedagogy]{@item{Give points, praise kids for neat handwriting and good teamwork.}}
          @tag[pedagogy]{@item{Give the countdown, then review answers with the class and assign points. }}
          @item{Time for the last part: writing the function header and body. @tag[group]{Your team will have 2 minutes to complete this. GO!}}
          @tag[pedagogy]{@item{Give the countdown, then review answers with the class and assign points. }}
          @tag[selftaught]{@item{@embedded-wescheme[#:id "Blue Circle"
                   #:definitions-text "; Try out Blue Circle"]}}
          ]}