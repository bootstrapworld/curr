#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Now that you have a function which will check whether something is colliding, we can go back to modifying our game code! Out of the four major functions in our game (update-world, draw-world, keypress and big-bang), which do you think we'll need to edit to handle collisions? update-world. We need to make some more branches for cond.}
            @item{In Ninja World, what do we want to happen when the cat collides with the dog? Let's put the dog offscreen, so that he can come back to attack again!}
            @item{Let's start with the test. How can we check whether the cat and dog are colliding? Do we have a function to check that? What do the inputs need to be? Do we have a catX in our world? How do we know what it is?}
            @item{Since the Cat's x-coordinate is always the same, let's check draw-world so that we can put it in. 360! How do we pull the catY out of the world? How do we pull the dogX out of the world? Is there a dogY in the world? Where can we get that number?}
            @item{Remember that update-world gives back a world, so what should we do first in our result? make-world.}
            @item{And what did we want to happen when our cat and dog collide? We wanted the dog to go off screen. Raise your hand if you can think of a number that puts the dog offscreen. Excellent!}
            @item{How about rubyX? Do we want it to change when the dog and cat collide? No! How about catY? No!}
            @item{It's time to figure out what happens in your games! Turn to page 40 and write some more tests and results. When you've figured out what happens when each thing collides with your player and have written it down, you can type it into the computer.}
            @item{Work in small groups to complete collision branches}]}