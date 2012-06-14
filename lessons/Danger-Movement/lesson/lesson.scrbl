#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Danger Movement" #:duration "20 min" #:prerequisites "Coordinate-Planes, Introducing-the-Design-Recipe"]{
@;The students should probably have their game code files open. 
@itemlist/splicing[@item{In our last class, you learned how to use the Design Recipe to write functions. Now it's time to write functions to make your game characters move!}
          @item{Who wants to start making their game move?}
          @tag[pedagogy]{@item{Draw a 640x480 "game screen" on the board, and have students help you label the axes and corners.}}
          @tag[selftaught]{@item{@think-about[#:question "Draw a 640x480 'game screen' on the board, and label the axes and corners."]}}
          @item{Here I've drawn a really boring game: my Danger is the letter "D", my Target is the letter "T", and my Player is just the letter "P". I've also labeled all the coordinates for where they are on the screen. @image["5.1.png"]}
          @item{@think-about[#:question "What is the Danger's x-coordinate? Its y-coordinate?"
                             #:answer "Danger's x-coordinate is 500 and its y-coordinate is 100"]}
          @item{@think-about[#:question "Suppose my Danger is moving to the left. What is changing, the x- or the y-coordinate?"
                             #:answer "The x-coordinate is changing since you are moving horizontally."]}
          @tag[selftaught]{@item{Draw an arrow to the NEW location, and label the coordinates.}}
          @item{PUT IMAGE WITH NEW COORDINATES}
          @item{@think-about[#:question "Suppose it moved to the right, by 50 pixels. What are the new coordinates?"
                             #:answer "The new coordinates are (550, 100)"]}
          @item{I want my Danger to always move left by 50 pixels, each time the screen is redrawn. So it goes from (550, 100) to (500, 100).}
          @item{@think-about[#:question "What if it starts at (100, 100)? Where will go next? What if it's at (400, 600)? What if it's off the screen, at (650, 50)?"
                             #:answer "(50, 100), (350, 600), (600,50)"]}
          @item{You will need to write a function that takes an x-coordinate and produces the next x-coordinate, to make your danger move.}
          @item{INSERT TABLE HERE}
          @item{Turn to @worksheet-link[#:page 15 #:name "Design-Recipe-Update-Danger"] for update-danger. @tag[pedagogy]{Have a student read the problem statement out loud.} @tag[selftaught]{Read the problem statement.}}
          @item{@think-about[#:question "Can you find the function name in this problem statement? Underline it."
                             #:answer "The function name is 'update-danger'"]}
          @item{@think-about[#:question "Can you find the inputs and outputs? Underline them, too."
                             #:answer "The input is the x-coordinate of DangerCat and the output is the x-coordinate of DangerCat minus 50."]}
          @item{@tag[group]{As a team:} Complete the Design Recipe for update-danger. @tag[pedagogy]{Raise your hand when you're done with each step, so I can check your contracts and examples before you move on to code. Don't forget to circle the things that change between your examples!} @tag[selftaught]{Write the code for update-danger}}]}
