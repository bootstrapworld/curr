;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname the-unit) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#lang curr/lib

@declare-tags[]
@title{Feature: Nested Structures}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Students refactor code from an existing Ninja Cat game and their own video games to include structures within structures}
}

@unit-lessons{
@lesson/studteach[#:title "Managing Complexity with Nested Structures"
        #:duration "45 minutes"
        #:overview "Students reinforce their understanding of structures as they are used in their games"
        #:learning-objectives @itemlist["BS-DS.1" "BS-DS.2" "BS-R"]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use nested structures to add complexity to their games}]
        #:standards  (list "N-Q" "BS-M" "BS-PL.3" "BS-DS.1" "BS-DS.2" "BS-W")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{Student Games @italic{or} the @editor-link[#:public-id "0B9rKDmABYlJVVkpkTmEyd1ZTaE0" "Pyret Ninja Cat"] file preloaded on students' machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that you know all about data structures and how to use them, you can make video games that are even more complex. However, a structure with tons of things in it can easily get @italic{too} complex and confusing. Take a look at the structure for our Ninja Cat video game, called @code{GameState}:

@code[#:multi-line #t]{
data GameState:
    game(
      playerx :: Number,
      playery :: Number,
      dangerx :: Number,
      dangery :: Number,
      dangerspeed :: Number,
      targetx :: Number,
      targety :: Number,
      targetspeed :: Number, 
      score :: Number)
end }

We have three distinct characters, each with their own x and y-coordinates. This makes our @code{GameState} data structure very long and unwieldy. To clean up this structure, and make it easier to add more game characters later, we can define a new structure to represent a position- a single set of x and y-coordinates:

@code[#:multi-line #t]{
# A PositionState is an x and y-coordinate
data PositionState:
    coord(
      x :: Number,
      y :: Number)
end }

Now, we can use this structure as a datatype within our @code{GameState} structure, like so:

@code[#:multi-line #t]{
data GameState:
    game(
      player-pos :: PositionState,
      danger-pos :: PositionState,  
      dangerspeed :: Number,
      target-pos :: PositionState,
      targetspeed :: Number,
      score :: Number)
end }

Since our @code{GameState} now consists of @italic{nested} structures (the @code{GameState} structure now contains @code{PositionState}s), we'll need to re-write each @code{GameState} @vocab{instance} in our code. We're no longer passing nine numbers to the @code{game()} constructor function. Instead, we'll need to give it three @code{PositionState}s and three numbers. 

@code[#:multi-line #t]{
START = game(coord(320, 100), coord(600, 75), 5, coord(1500, 250), 10, 0)
PLAY  = game(coord(320, 100), coord(600, 75), 5, coord(300, 250), 20, 0)
}

@activity{@bold{Before moving on: } How do you think you would get the @italic{player's x-coordinate} out of @code{START}? What about the danger's y-coordinate? Finally, how would you get the target's speed out of @code{PLAY}?}

When working with nested structures, the same rules for @vocab{dot-accessors} still apply. However, we'll need to use two dots to access parts of the internal structure(s). For example, if we wanted to get the player's x-coordinate out of @code{START}, we would write: @code{START.player-pos.x}, which would evaluate to 320. Likewise:
@itemlist[ @item{ @code{START.danger-pos.y} evaluates to 75}
                @item{ @code{PLAY.target-pos.y} evaluates to 250}
                @item{ @code{PLAY.targetspeed} evaluates to 20} ]

@activity{Why @italic{don't} we need two dot-accessors to get the @code{targetspeed} out of a @code{GameState}?}

Since we've changed the @code{GameState} structure, each function in our code that uses this structure, or refers to part of it, will need to be changed. Every instance of @code{g.playerx}, @code{g.playery}, @code{g.dangerx}, etc. will need to be changed to @code{g.player-pos.x}, @code{g.player-pos.y}, and @code{g.danger-pos.x}, respectively.}
                        
                        @teacher{It's worth spending some time reinforcing students understanding here: instead of simply taking the @code{playerx} out of the @code{GameState} as before, now we're going two levels deep, and taking the @code{x} out of the @code{PositionState}, which is itself within the @code{GameState}.}}
                 
                 @point{@student{Depending on your video game, you may not need a separate data structure for positions. Instead, you may want to create a new structure representing a character, with whatever information makes sense for your game. For instance, a @code{CharacterState} might contain a character's image, a number representing its health, and a Boolean representing whether or not the character is on the screen. With data structures, you can make your game or animations as simple or complex as you like!

@activity{How would the data structures in the Ninja Cat game change if we wanted to turn each character into its own data structure, containing an x-coordinate, y-coordinate, and speed?}}
                         
                         @teacher{}}
                 
                 @point{@student{As you change the structures in your game, you may find the conditional branches in your @code{next-state-tick} or @code{draw-state} functions becoming unwieldy. For instance, instead of asking if the cat has collided with the ruby like so:
@code[#:multi-line #t]{
# if player and target collide, reset target and increase score
  else if is-collision(g.playerx, g.playery, g.targetx, g.targety):
      game(g.playerx, g.playery, g.dangerx, g.dangery, g.dangerspeed, -400, 0, 0, g.score + 30) }
The code becomes:
@code[#:multi-line #t]{
# if player and target collide, reset target and increase score
  else if is-collision(g.player-pos.x, g.player-pos.y, g.target-pos.x, g.target-pos.y):
    game(g.player-pos, g.danger-pos, g.dangerspeed, coord(-400, 0), 0, g.score + 30) }

Which is a lot of dot-accessors to keep track of, and leaves our @code{next-state-tick} function looking awfully messy and complex. A good way to simplify the code for ourselves, and anyone reading our code, is to use @vocab{helper functions}. By writing functions that handle @italic{one small piece} of a complex system, understanding our code becomes a lot easier.}
                         
                         @teacher{}}
                 ]
         }
       }


