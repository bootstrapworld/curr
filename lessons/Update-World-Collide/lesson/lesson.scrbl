#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "update-world"
        #:duration "40 minutes"]{
          @itemlist/splicing[
            @item{Now that you have a function which will check whether something is colliding, we can go back to modifying your game code! Out of the four major functions in our game (@code{update-world}, @code{draw-world}, @code{keypress} and @code{big-bang}), which do you think we'll need to edit to handle collisions? @code{update-world}. We need to make some more branches for @code{cond}.}
            @item{In Ninja World, what do we want to happen when the cat collides with the dog? We want to put the dog offscreen, so that he can come back to attack again!}
            @item{Let's start with the test. How can we check whether the cat and dog are colliding? Do we have a function to check that? What do the inputs need to be? Do we have a @code{catX} in our world? How do we know what it is?}
            @item{Since the Cat's x-coordinate is always the same, let's check @code{draw-world} so that we can put it in. 360! How do we pull the @code{catY} out of the world? How do we pull the @code{dogX} out of the world? Is there a @code{dogY} in the world? Where can we get that number?}
             @code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) ...result...]}
            @item{Remember that @code{update-world} gives back a world, so what should we do first in our result? @code{make-world}.}
             @code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) (make-world ...dogX...
					                                                          ...rubyX...
					                                                          ...catY...)]}
            @item{And what did we want to happen when our cat and dog collide? We wanted the dog to go off screen. Can you think of a number that puts the dog off the screen?}
             @code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) (make-world -100
					                                                          ...rubyX...
					                                                          ...catY...)]}
            @item{How about @code{rubyX}? Do we want it to change when the dog and cat collide? No! How about @code{catY}? No!}
             @code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) (make-world -100
					                                                          (world-rubyX w)
					                                                          (world-catY w))]}
            @item{It's time to figure out what happens in your game! Turn to page 40 and write some more tests and results. When you've figured out what happens when each thing collides with your player and have written it down, type it into the computer.}
            @pedagogy{@item{Work in small groups to complete collision branches}}]}