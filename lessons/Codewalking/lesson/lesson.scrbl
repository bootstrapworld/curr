#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Codewalking"
        #:duration "20 minutes"]{
          @itemlist/splicing[
@pedagogy{@item{MONITORS ON!}}
@item{Open up Ninja World and click run. What happens?}
@item{Does it do the same thing we did in our simulation last week? No! Let's walk through it and figure out what's wrong.}
@item{At the top of the screen, you see the DATA section. This is where we define what everything we need to keep track of during the animation.}
@item{As you can see, we have used @code{define-struct} to define our World structure here. @tag[pedagogy]{Raise your hand if you can tell me what's in this world struct.}}
@item{Next take a look at the section labelled STARTING WORLD. We have defined here a variable, @code{START}. What is @code{START}? It's a world! How would we get the @code{dogX} out of the @code{START} world?}
@item{If the dog is moving ten to the right each time, what should the world be in the next frame? @tag[pedagogy]{You have ten seconds: }Define another world called @code{NEXT}.}
@item{As you can see, we also defined a bunch of values for images, which we'll use in our game. What are they images of? Type in their names in the interactions window to find out.}
@item{Now that we've got our world structure, we need to know how to draw it. Scroll down to where you see "GRAPHICS". There is a function defined here, which takes in a world and draws us a picture. What is the name of this function? @code{draw-world}. This function takes in a world and produces an Image. What is the Domain of this function? The Range?}
@item{Now let's look at the body of the function. It's using a new function you have never seen before, called @code{put-image}. @tag[pedagogy]{Raise your hand if you think you know, just by looking at this function, what it does. Take a few guesses.}}
@item{@code{put-image} takes in the first image, and then places it on top of another image, using the x- and y-coordinates to determine where to put it. In this example it is placing the @code{DOG} onto the @code{BACKGROUND}. What is it using for the dog's x-coordinate? The dog's y-coordinate?}
@pedagogy{@item{Before we move on, I want you to think for a moment about how our simulation worked.} Every time it ran, @code{draw-world} had to check what the current world was, for the @code{dogX}, before it could draw it. Where in @code{draw-world} is it checking the current world? It's not! We're not looking at the world that we're taking in, so we have no way to change the position of the dog!}
@item{How would you get the @code{dogX} out of the world? @code{world-dogX}. Which world are we going to use? @code{w}.}
@item{Now...where are we going to put this @code{(world-dogX w)}? Which number here represents the x-coordinate of the @code{DANGER} on the @code{BACKGROUND}?}
@item{Suppose we want to add the @code{CLOUD}, at the position (500, 400). How could you use @code{put-image} to stick them on the @code{BACKGROUND}?}
@pedagogy{@item{Write the code with the kids, since this is their first time with put-image. They'll have time to practice on their own later!}}
@code[#:multi-line #t]{;; draw-world: world -> Image
;; place DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image CLOUD 
               500 400
               (put-image DANGER
						  300 200
						  BACKGROUND)))}
@item{Click run, and take a look at that cloud!}
@item{Now scroll down to where it says UPDATING FUNCTIONS. This code is responsible for changing the World - and in fact we already wrote it!}
@item{What does @code{update-world} DO to the world? It makes a new world and it adds 10 to the dog's x-coordinate! What does that mean, in terms of how the dog moves? Does it go to the right, left, up, down?}
@item{If the dog is at 100, where will it be next? After that?}
@item{@tag[pedagogy]{Take 30 seconds: }Write a second example involving your NEXT world, instead of START. @tag[pedagogy]{Count down.}}
@item{How could you make the dog move faster? Slower? Backwards?}]}