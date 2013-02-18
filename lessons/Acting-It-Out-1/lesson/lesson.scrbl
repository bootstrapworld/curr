#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Acting Out Ninja World"
        #:duration "25 minutes"]{
          @itemlist/splicing[
@item{Do you remember the Ninja Cat game from Bootstrap 1? In this course, we're going to completely deconstruct the game, and re-make it using a world structure to make it more complex.}
@item{This version of Ninja Cat might look a bit different than you remember... @pedagogy{Open the NW1 file and press "Run" and watch the dog fly across the screen}}
@item{What do we see in this world? A Dog. Let's be a little more specific, and look at our world struct. Who can raise their hand and tell me how we've defined our world?}
@item{Our world is just one thing: @code{dogX}. What does @code{dogX} represent in the game? What kind of thing is that?}
@item{Take a look at the section labelled STARTING WORLD. We have defined here a variable, START. What is START? It’s a world! How did we make this world?} 
@item{Let's skip a bit farther down to where it says "Graphics Functions". What is the name of the function defined here? What's it's domain and range?}
@item{I need a volunteer to be the @code{draw-world} function. @pedagogy{Give them the "draw-world" sign, and the dog cutout.} Your name is now "draw-world". You take in the current world, and put the image of the dog on the screen at its x-coordinate (@code{dogX}) , and 400 on the y axis.}
@pedagogy{@item{Draw a large rectangle on the board, representing the game screen.}}
@item{If I were to say "Draw-world START!", what would you do? @pedagogy{The student should place the cutout of the dog on the rectangle at (0, 400).}}             
@item{Great! Stay here, because I'll need to use draw-world again in just a second.}
@item{I need a volunteer to be the @code{update-world} function. @pedagogy{Give them the "update-world" sign.}}
@item{What's your name? Your domain? Your range?}
@item{Every time @code{update-world} runs, it makes a new world, adding 10 to the @code{dogX} of the original world.}
@item{If I say, "update-world START!", what will you return?" @pedagogy{The student should reply "make-world 10".}}
@item{
      
@item{I need one more volunteer to be @code{big-bang}. @pedagogy{Give them the "big-bang" sign.} You're kind of like the quarterback here: you
 @item{
                 }]}