#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Acting Out Ninja World"
        #:duration "30 minutes"]{
        @itemlist/splicing[@item{Do you remember the Ninja Cat game from Bootstrap 1? In this course, we're going to completely deconstruct the game, and re-make it using a world structure to make it more complex.}
@item{This version of Ninja Cat might look a bit different than you remember... @pedagogy{Open the NW1 file and press "Run" and watch the dog fly across the screen}}
@item{What do we see in this world? A Dog. Let's be a little more specific, and look at our world struct. Who can raise their hand and tell me how we've defined our world?}
@item{Our world is just one thing: @code{dogX}. What does @code{dogX} represent in the game? What kind of thing is that?}
@item{Take a look at the section labelled STARTING WORLD. We have defined here a variable, START. What is START? It’s a world! How did we make this world? @pedagogy{Write @code{(make-world 0)} on the board}} 
@item{Let's skip a bit farther down to where it says "Updating Functions". What is the name of the function defined here? What's it's domain and range?}
@item{Can someone raise their hand and tell me what @code{update-world} is doing?}
@item{Every time @code{update-world} runs, it makes a new world, adding 10 to the @code{dogX} of the original world.}
@item{Now skip down to the last function defined in our code: @code{big-bang}.}
@item{Big-bang is a special function that will begin an animation, but it needs help from other functions to update and draw the world.}
@item{Take a look back at our START world, @code{(make-world 0)}. If I were to evaluate just @code{(big-bang START)}, what do you think would happen? @pedagogy{Take a few guesses, then type it into the interactions window.}}
@item{Nothing happens! We see our background, (make-world 0), but nothing's changing or happening! Let's fix that.}
@item{In our code, @code{big-bang} is calling on a few different functions. Who can raise their hand and read me the second line in our big-bang function?}
@item{The function @code{on-tick} acts kind of like a timer, and on each "tick", it updates the world. What did we say was in our world structure? Just one number, representing the x-coordinate of the dog.}
@item{So on every tick, we want @code{update-world} to update the world. How does it do that? It adds 10 to the @code{dogX} of the world!}
@item{Try typing @code{(big-bang START (on-tick update-world))} in to the interactions window and see what happens.}
@item{We've got our world structure updating, and now we need to know how to draw it. Scroll up to where you see "GRAPHICS FUNCTIONS". What is the name of this function? @code{draw-world}. This function takes in a world and draws us an Image. What is the Domain of this function? The Range?}
@item{Now let's look at the body of the function. It's using a new function you have never seen before, called @code{put-image}. @tag[pedagogy]{Raise your hand if you think you know, just by looking at this function, what it does. Take a few guesses.}}
@item{@code{put-image} takes in the first image, and then places it on top of another image, using the x- and y-coordinates to determine where to put it. In this example it is placing the @code{DOG} onto the @code{BACKGROUND}. What is it using for the dog's x-coordinate? The dog's y-coordinate?}
@item{OK, let's put all these functions together.}
@item{I need a volunteer to be the @code{update-world} function. @pedagogy{Give them the "update-world" sign.} What's your name? Your domain? Your range?}
@item{How are you updating the world? Each time you're called on, you'll make a new world, adding 10 to the @code{dogX} of the original world.}
@item{So if I were to say "@code{(update-world (make-world 0))}", what will you return?" @pedagogy{The student should erase the 0 and write a 10. If they are stuck, refer to the code.}}
@item{Great job! Let's practice this a few times: "update-world, this world!" @pedagogy{Point to (make-world 10) on the board. Go through a few iterations, updating the new world each time.}}
@item{Thank you, @code{update-world}! Stay here, because I’ll need to use update-world again in just a second.}
@item{I need another volunteer to be the @code{draw-world} function. @pedagogy{Give them the "draw-world" sign, and the dog cutout.} Your name is now "draw-world". How does this function work? You take in the current world, and put the image of the dog on the screen at its x-coordinate (@code{dogX}) , and 400 on the y axis.}
@pedagogy{@item{Draw a large rectangle on the board, representing the game screen.}}
@item{If I were to say "Draw-world (make-world 0)", what would you do? @pedagogy{The student should place the cutout of the dog on the rectangle at (0, 400).}}             
@item{What about "draw-world (make-world 400)"? @pedagogy{go through a few iterations.}}
@item{OK, I need one last volunteer to be @code{big-bang}, so we can bring all these functions together. @pedagogy{Give them the "big-bang" sign.} Do you remember what you're doing? You start the animation, and you have a timer. The class will yell "tick!" every five seconds, and you’re going to tell update-world to update the world, just like I did. Let’s try it out - on every tick, I want you to give the current world to update-world, who will then update it and replace it with the new world. Ready? GO!}
@item{But @code{big-bang} calls on one more function to complete the animation. What are we missing? @code{draw-world}!}
@item{So, @code{big-bang}, once @code{update-world} updates the world, you're going to call on @code{draw-world} to draw that updated world.}
@item{Let's try it all out. Every "tick" the class makes, @code{big-bang} will tell @code{update-world} to update this world on the board, and after that, will tell @code{draw-world} to draw that world. Ready? @pedagogy{Go through a few iterations, so the class can see the world structure change, and the dog move across the screen as they tick.}}
@item{Excellent! Let's give our volunteers a hand. @pedagogy{Reclaim function signs, and have the students return to their seats.}}
@item{Fortunately, Racket has the capability to run all these functions and more in a fraction of the time, to create and draw a smooth, complete game. In the next few classes, we'll be using structs to extend this world into an actual, complex game, and writing functions for Ninja World and your own games to make them playable and unique.}     
      ]}