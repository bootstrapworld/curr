#lang curr/lib
@(require 2htdp/image)
@(require scribble/core)

@(define graph-image (bitmap "images/5.1.png"))

@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Danger Movement" #:duration "20 min" #:prerequisites "Coordinate-Planes, Introducing-the-Design-Recipe"]{
@;The students should probably have their game code files open. 
@itemlist/splicing[@item{In our last class, you learned how to use the Design Recipe to solve word problems. In this lesson, all of the word problems will be about making your videogame characters move!}
          @pedagogy{@item{Draw a 640x480 "game screen" on the board, and have students help you label the axes and corners.}}
          @tag[selftaught]{@item{@think-about[#:question "Draw a 640x480 'game screen' on the board, and label the axes and corners."]}}
          @item{Here I've drawn a really boring game: my Danger is the letter "D", my Target is the letter "T", and my Player is just the letter "P". I've also labeled all the coordinates for where they are on the screen. @graph-image}
          @item{@think-about[#:question "What is the Danger's x-coordinate? Its y-coordinate?"
                             #:answer "Danger's x-coordinate is 500 and its y-coordinate is 100"]}
          @item{@think-about[#:question "Suppose my Danger is moving to the left. What is changing, the x- or the y-coordinate?"
                             #:answer "The x-coordinate is changing since you are moving horizontally."]}
          @tag[selftaught]{@item{Draw an arrow to the NEW location, and label the coordinates.}}
          @item{@think-about[#:question "Suppose it moved to the right, by 50 pixels. What are the new coordinates?"
                             #:answer "The new coordinates are (550, 100)"]}
          @item{I want my Danger to always move @italic{left by 50 pixels}, each time the screen is redrawn. So it goes from (550, 100) to (500, 100).}
          @item{@think-about[#:question "What if it starts at (100, 100)? Where will go next? What if it's at (400, 600)? What if it's off the screen, at (650, 50)?"
                             #:answer "(50, 100), (350, 600), (600,50)"]}
          @item{What we have here is a @bold{word problem}, which describes how the danger should move! Given any x-coordinate, @code{update-danger} should produce the next x-coordinate, which is fifty pixels to the left.}
          @item{Turn to @worksheet-link[#:page 15 #:name "Design-Recipe-Update-Danger"] for @code{update-danger}. @pedagogy{Have a student read the Word Problem out loud.} @tag[selftaught]{Read the Word Problem.}}
          @item{@think-about[#:question "Can you find the function name in this word problem? Underline it."
                             #:answer @list{"The function name is " @code{update-danger}}]}
          @item{@think-about[#:question "Can you find the Domain and Range? Underline them, too."
                             #:answer "The input is the x-coordinate of Danger and the output is the x-coordinate of Danger minus 50. Both of these are Numbers, which means the Domain and Range are both @code{Number}."]}
            @pedagogy{@item{Who would like to act out @code{update-danger}? Take a volunteer.}
                      @item{@exercise{According to the word problem, what's your name? What's your Domain? Your Range? Given an x-coordinate for the danger, you'll need to tell me what work gets done in order to calculate the new x-coordinate. For example, if I say "update-danger 75", you'll need to say "minus 75 50", because that's the work you'll do to move the danger to 25. Let's try it out: "update-danger 200!" }}
                      @item{Have the class do some practice call-and-response with the volunteer.}}
          @item{@tag[group]{As a team:} Complete the Design Recipe for @code{update-danger}. @pedagogy{Raise your hand when you're done with each step, so I can check your contracts and examples before you move on to code. Don't forget to circle the things that change between your examples!} @tag[selftaught]{Write the code for @code{update-danger}}}]}
