#lang curr/lib

@title{Feature: Making Pong}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       )]{
@unit-descr{Students use the Animation Design Worksheet to decompose a 2-player game of Pong, and implement it in Pyret.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Setting up the paddles"
     #:duration "45 minutes"
     #:overview "Students begin creating a game of Pong"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students create the first stage of a game of Pong, including a game board and two paddles}
                                   @item{Students build interactivity into the game, allowing each paddle to be controlled by
                                         keypresses.}]
     #:standards (list "BS-DS.1" "BS-DS.2" "BS-R")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}
                            @item{Animation Design Worksheet}]
     #:preparation @itemlist[@item{}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@animated-gif{images/pong.gif}In Unit 3, you practiced decomposing simple animations into their data structures and functions. Let's consider how a 
                               2-player game of Pong works: There are two "players", each represented by a paddle on either side of the screen. Each paddle
                               can move up and down, as long as they remain on the screen. There is also a ping-pong ball, which moves at any angle and can 
                               be on or off the screen. Let's start out by adding the paddles, making sure they can move up and down, and then we'll add the ball 
                               later. @activity{Using a blank Animation Design Worksheet, figure out how the paddles behave throughout the game,
                                                and decide what Data Structure you'll need to represent those behaviors.}
                               }
                       @teacher{Students should realize that each paddle is simply a y-coordinate, since neither paddle can ever move left or right.}
                       }
                 @point{@student{Here is one possible structure that we could use to model the two players:
                                @code[#:multi-line #t]{
# a PongState has the y-coordinate 
# of paddle1 and paddle2
# (no x-coordinate needed, since
# the paddles only go up/down!)
data pongState:
 | pong(
     paddle1Y :: Number,
     paddle2Y :: Number)
end
                                                       }
                                We can imagine a few sample @code{pongState} instances, in which the paddles are at different locations on the screen. If you 
                                haven't already, it would be a good idea to define a sample state for when the game starts, and maybe two other states
                                where the paddles are at other locations.}
                        @teacher{}
                        }
                 @point{@student{We'll need to answer some questions, in order to write our @code{draw-state} function.
                               @activity{@itemlist[@item{What will the paddles look like?}
                                                    @item{What does the background look like?}
                                                    @item{How wide is the background? How tall is it?}
                                                     @item{Define the function @code{draw-state}, and try drawing your sample @code{PongState} instances to 
                                                           make sure they look the way you expect them to.}]}}
                        @teacher{}
                        }
                 @point{@student{The paddles don't move on their own, so right now there's no @code{next-state-tick} function. However, they DO move
                                when a user hits a key! That means we'll need to define @code{next-state-key}, and answer a few questions in the process:
                                @activity{@itemlist[@item{What key makes @code{paddle1Y} increase? Decrease?}
                                                     @item{What key makes @code{paddle2Y} increase? Decrease?}
                                                     @item{How much does each paddle move when it goes up or down?}
                                                     @item{What happens if some @italic{other} key is pressed?}
                                                     @item{Use the Design Recipe to write the code for @code{next-state-tick}}]}}
                        @teacher{Have students discuss their answers to these questions, before moving on to @code{next-state-tick}.}
                        }
                 @point{@student{At this point, we know how to change the @code{pongState} in response to a keypress and how to draw that @code{pongState}
                                as an image. Let's build a @code{reactor}, which uses a @code{pongState} instance as the starting state and hooks
                                up these functions to the @code{on-tick} and @code{to-draw} event handlers.
                                @code[#:multi-line #t]{
pong-react = reactor:
  init: pongState(200, 200),
  on-key: next-state-key,
  to-draw: draw-state
end
}
                                When you run this reactor with @code{interact(pong-react)}, you should see your initial instance drawn on the screen,
                                and the paddle positions should change based on the keys you press! Do all four keys do what you expect
                                them to do? What happens if you hit some @italic{other} key?}
                        @teacher{}
                        }
                 @point{@student{Right now, what happens if you keep moving one of the paddles up or down? Will it go off the edge of the 
                                screen? We should prevent that! @activity{Take a few minutes and discuss with your partner: 
                                what needs to change to stop the paddles from going offscreen? You can use an Animation Design
                                Worksheet if you want to be precise. Once you have a strategy that you feel confident about, take 15 
                                minutes to try it out!}}
                        @teacher{Give the class 2-3 minutes to discuss, and then have different teams share back @italic{before}
                                 they start to implement.}
                        }
                 ]}

@lesson/studteach[
     #:title "Adding the ball"
     #:duration "45 minutes"
     #:overview "Students extend their program to add a bouncing ball"
     #:learning-objectives @itemlist[@item{}]
     #:evidence-statements @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{Students extend their pongState data structure to include a ball, tracking both its position and direction}
                                   @item{Students add collision detection, allowing the ball to bounce when it hits a wall or paddle.}]
     #:exercises (list )
     #:standards (list "BS-DS.1" "BS-DS.2" "BS-R")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[]
     #:prerequisites (list )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that we've got our paddles set up, it's time to start thinking about the ball. What do you notice about the ball?
                                @activity{@itemlist[@item{When does the ball move? On its own, or only when a key is pressed?}
                                                     @item{Does the ball's position change? If so, by how much?}
                                                     @item{What do we need, to keep track of the ball's position?}
                                                     @item{Does the ball's direction change?}
                                                     @item{What do we need, to keep track of the ball's direction?}
                                                     @item{When does the ball's direction change?}
                                                     ]}}
                        @teacher{Suggestion: don't show the class these questions to start. First, have students volunteer lots of observations, 
                                 and write them on the board. Only add the other questions to spark discussion if students run out of ideas.}
                        }
                 @point{@student{Fortunately, we don't need to think through everything all at once! What would be a good place to start? 
                                 @activity{Use an Animation Design Worksheet to add one part of the ball's behavior to your game.}}
                         @teacher{Students may want to start just by having the ball appear on the screen, moving in one direction. They don't
                                  need to worry about bouncing, changing direction, or going off the screen right away!}
                         }
                 @point{@student{Did your @code{pongState} change as a result? Chances are, you needed to add @code{ballX :: Number} and 
                                 @code{ballY :: Number} fields to your State, to make sure the ball could move in any direction. Did your
                                 @code{draw-state} function need to change? What about @code{next-state-key}? Did you need to write
                                 @code{next-state-tick}? If so, what did you do?}
                         @teacher{Some students will hard-code numbers for moving the ball. That's okay! Once they start thinking about
                                  changing direction, those numbers will have to become fields in @code{pongState}, which change in response
                                  to paddle collisions.}
                         }
                 @point{@student{Now the game is starting to come together! We've got two paddles moving up and down, and we make sure they stay
                                 on the screen. Meanwhile, we have a ball that can move in any direction...but so far the ball doesn't know how
                                 to bounce! It's time to plan out what bouncing will look like, and wire it all together.
                                 @activity{@itemlist[@item{How do you know when the ball has hit the top or bottom wall of the screen?}
                                                      @item{Write @code{is-on-wall}, using the Design Recipe to help you.}]}
                                 }
                         @teacher{The goal of this activity is to have students get their collision-detection working, in preparation for the
                                  bouncing behavior. } 

                         }
                 @point{@student{Of course, we don't want the game to end when the ball hits a wall! Let's re-examine our observations...
                                 @activity{@itemlist[@item{When a ball is moving up and to the right, what is happening to @code{ballX} and @code{ballY}?}
                                                      @item{When that ball hits a wall, what should happen?}
                                                      @item{How does the ball's @italic{direction} change after it hits a wall?}
                                                      @item{After it's changed direction, how does the ball's @italic{position} change?}
                                                      @item{Use the Animation Design Worksheet to plan out the bouncing behavior}
                                                      ]}}
                         @teacher{Warning: this activity is pretty sophisticated! You'll want to make sure there are plenty of visual scaffolds
                                  for students, or (even better!) have them generate these diagrams themselves.}
                         }
                 @point{@student{By now, you may have noticed that the direction of the ball itself needs to change, which means it needs to be
                                 added to our @code{pongState} structure. There are lots of different ways we could represent @italic{direction}:
                                 it could be a String (e.g. "north", "southeast", "west", etc), or it could be a pair of Numbers that represent
                                 how much the ball is moving in the x- and y-direction from frame to frame.
                                 @activity{What other ways could you represent direction? What are the pros and cons of each representation?}}
                         @teacher{Note: the pair-of-numbers representation is deeply aligned to physics, in which the pair represents a vector
                                  that translates the ball's position over time.}
                         }
                 @point{@student{Here is one example of a way to represent this, during Numbers to keep track of direction:
                                 @code[#:multi-line #t]{
# a PongState has the y-coordinates 
# of paddle1 and paddle2, 
# x and y-coordinates of the ball, 
# and x and y-coordinates 
# representing the direction of the ball
data pongState:
 | pong(
     paddle1Y :: Number,
     paddle2Y :: Number,
     ballX    :: Number,
     ballY    :: Number,
     moveX    :: Number,
     moveY    :: Number)
end
                                                       }
                                 When the game begins, we can start out with @code{moveX} and @code{moveY} being specific numbers that move
                                 the ball up and to the right. We can change these later, or even make them randomized every time the game 
                                 starts!
                                 }
                         @teacher{}
                         }
                 @point{@student{Before we worry about the paddles, let's start by thinking about the top and bottom walls of the game screen.
                        @activity{@itemlist[@item{What should happen if the ball hits the top of bottom of the screen?}
                                                      @item{How would you detect a collision with the top or bottom wall?}
                                                      @item{Make the ball bounce off the top and bottom, using the Animation Design
                                                            Worksheet and the Design Recipe to help you if you get stuck!}]}
                                  }
                         @teacher{}
                         }
                 @point{@student{Now let's make some sample instances for when the game begins, when the ball is about to hit a paddle, and
                                 then immediately after:
                                 @code[#:multi-line #t]{    
# an instance where the paddles are 
# at the starting position,
# the ball is in the center (300, 200),
# and moving to the right by 20 
# and up by 10 on each tick
pongStateA = pong(200, 200, 300, 200, 20, 10)

# an instance where the ball (x=150, y=280) 
# is about to hit the top wall
pongStateB = pong(200, 300, 150, 280, 20, 10)

# an instance after the ball (x=550, y=280) 
# hits the top wall
# it's still moving right (20), 
# but now it's moving down instead of up (-10)
pongStateC = pong(200, 300, 550, 320, 20, -10)
}
                                 The ball starts out moving up and to the right, but once it hits a wall the direction needs to change.
                                 Instead of moving up (adding 10 each tick), it's now moving down (adding -10 each tick) after
                                 bouncing off the wall (it's still moving up the screen by 10 each time, so we leave that unchanged).
                                 @bold{Note:} Once the ball hits the wall, its y-position needs to change! If the ball stays where it is,
                                 it will still be considered to have "hit" the wall on the next @code{tick}. This will cause the ball to jitter
                                 back and forth, as it constantly hits the same wall over and over.
                                 @activity{Change @code{next-state-tick} so that it generates the next @code{pongState} using the ball's
                                           previous position and the @code{move} fields. Then, add conditionals to @code{next-state-tick}
                                           so that it will @italic{change the direction} of the ball when it's hit a walll}
                                 }
                         @teacher{Some students may ask about having the ball change angle based on where the it hits the paddle. This is
                                  a terrific question, and students should be encouraged to think about this behavior @italic{after} they've
                                  implemented the simpler behavior.}
                         }
                 @point{@student{Let's walk through our new @code{next-state-tick function}, and make sure we understand it:
                                 @code[#:multi-line #t]{
# next-state-tick : pongState -> pongState
# move the ball, based on direction fields
fun next-state-tick(w):
  if (is-on-wall(w)):
    pong(
      w.paddle1Y,               
      w.paddle2Y,
      # the paddles don't change position
      w.ballX + w.moveX,        
      # the ball keeps moving in the same x-direction
      w.ballY + (w.moveY * -1), 
      # but it bounces off the wall (move backwards by moveY)
      w.moveX * -1,            
      # and the y-direction is reversed
      w.moveY)
  else:
    pong(
      w.paddle1Y,
      w.paddle2Y,
      w.ballX + w.moveX,
      w.ballY + w.moveY,
      w.moveX,
      w.moveY)
  end
end
}
                                 If a collision occurs, we need to do two things. First, we need to move the ball to it's next position,
                                 and make sure that new position is far enough away from the paddle so that it won't be considered another
                                 collision. Second, we need to flip the y-direction so that the ball is moving in the opposite direction.
                                 This is easy to do, by multiplying the @code{moveY} by -1.
                                                            }
                         @teacher{}
                         }
                 @point{@student{Now it's time to start thinking about a different kind of collision: what happens when the ball hits a
                                 paddle?
                                 @activity{@itemlist[@item{How do you know when the ball has hit @code{paddle1}? @code{paddle2}?}
                                                      @item{Write @code{hit-paddle1} and @code{hit-paddle2}, using the Design Recipe to help you.}
                                                      @item{Change @code{next-state-tick} so it checks for a paddle collision in addition to
                                                            the wall collision.}]}
                                 }
                         @teacher{}
                         }
                 ]}
             
                  

@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
           @point{@student{You've got the beginnings of a very nice Pong game! What are some features you might want to add?}
                  @teacher{Let students brainstorm ideas. Some suggestions: keeping score, a game-over event, a splash screen...}}]}
}