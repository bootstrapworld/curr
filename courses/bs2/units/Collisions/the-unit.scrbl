#lang curr/lib

@declare-tags[management]

@title{Feature: Adding Collisions}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
				       )]{

@unit-descr{Using what they know from Bootstrap:1, students write a distance function and collision detection function to handle collisions in their games, this time using the Data Structures and Reactor from their games.}
}
@unit-lessons{
@lesson/studteach[#:title "The Distance Formula"
        #:duration "30 minutes"
        #:overview "Using the Pythagorean theorem and what they know from Bootstrap:1, students write a distance function for their games"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "8.G.6-8" "8.F.1-3" "F-IF.1-3" "F-LE.5" "A-SSE.1-2" "A-CED.1-4" "BS-M" "BS-CE" "BS-PL.3" "BS-PL.4" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}
                            @item{Cutouts of Cat and Dog images}
                            @item{Cutouts of Pythagorean Theorem packets [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 per cluster}]
                           
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{So far, none of the animations we've created included any distance or collision-detection functions. 
                                However, if you want to make a game where the player has to hit a target, avoid an enemy, jump onto platforms, 
                                or reach a specific part of the screen, we'll need to account for collisions.  This is going to require a 
                                little math, but luckily it's exactly the same as it was in Bootstrap:1.} 
                       @teacher{This lesson is part of a series of features meant to come at the end of the Bootstrap:2 units. Once students 
                                have made a number of simple animations and games, they will have @italic{lots} of ideas for what they want to
                                make next and add to their existing games. We've included a number of the most requested features in these 
                                lessons. Because each students' game will be different, we've used a Pyret version of the original Ninja Cat 
                                game as an example program, but this lesson can be adapted to add collision detection to any game.}}
                 @point{@student{@bitmap{images/numberline.png}                               
                                @activity[#:forevidence (list "N-Q&1&1" "6.NS.5-8&1&6" "7.EE.3-4&1&3")]{
                                           @itemlist[@item{In the image above, how far apart are the cat and dog?}
                                                     @item{If the cat was moved one space to the right, how far apart would they be?}
                                                     @item{What if the cat and dog switched positions?}]}

Finding the distance in one dimesion is pretty easy: if the characters are on the same number line, we subtract the @italic{smaller} coordinate from
the @italic{larger} one, and we have our distance.
@activity[#:forevidence (list "6.NS.5-8&1&4")]{When the cat and dog were switched, did you still subtract the dog's position from the cat's, 
                                               or subtract the cat's position from the dog's? Why?}}
                        @teacher{Draw a number line on the board, with the cutouts of the cat and dog at the given positions. Ask 
                                 students to tell you the distance between them, and move the images accordingly. Having students act 
                                 this out can also work well: draw a number line, have two students stand at different points on the 
                                 line, using their arms or cutouts to give objects of different sizes. Move students along the number 
                                 line until they touch, then compute the distance on the number line.}}
                 
                 @point{@student{Unfortunately, most distances aren't only measured in one dimention. We'll need some code to 
                                 calculate the distance between two points in two dimentions.
                                @bitmap{images/ABCgraph.png}
                                @activity{@itemlist[@item{How could you find the distance between the two points shown in this image?}
                                                     @item{How could you find the length of the C, also called the @vocab{Hypotenuse}?}]}
                                Let's start with what we do know: if we treat the x- and y-intercepts of C as lines A and B, we have a right triangle.
                                @activity[#:forevidence (list "6.NS.5-8&1&6")]{
                                   What is the line-length of A? Would it be different if the triangle pointed downward, and intercepted the point (0, -4)?}
                                }
                        @teacher{Draw this image on the board, with the lines labeled "A", "B", and "C".}}
                 
                 @point{@student{Ancient civilizations had the same problem: they also struggled to find the distance between points 
                                 in two dimensions. Let’s work through a way to think about this problem: what expression computes 
                                 the length of the hypotenuse of a right triangle?}
                       @teacher{This exercise is best done in small groups of students (2-3 per group). Pass out Pythagorean Proof 
                                materials [@(resource-link #:path "images/pythag1.png" #:label "1"), 
                                @(resource-link #:path "images/pythag2.png" #:label "2")] to each group, and have them review all of their materials:
                                @itemlist[@item{A large, white square with a smaller one drawn inside}
                                           @item{Four gray triangles, all the same size}]
                                 Everyone will have a packet with the same materials, but each group's triangles are a little different. 
                                 The activity workes with triangles of all sizes, so each pair will get to test it out on their own triangles. 
                                 Draw the diagram on the board.}
                        }
                @point{@student{@bitmap{images/csquared.png}For any right triangle, it is possible to draw a picture where the hypoteneuse 
                                 is used for all four sides of a square. In the diagram shown here, the white square is surrounded by four 
                                 gray, identical right-triangles, each with sides A and B. The square itself has four identical sides of 
                                 length C, which are the hypoteneuses for the triangles. If the area of a square is expressed by 
                                 @math{side * side}, then the area of the white space is @math{C^{2}}.}
                        @teacher{Have students place their gray triangles onto the paper, to match the diagram.}}
                @point{@student{@animated-gif{images/Pythag_anim.gif} By moving the gray triangles, it is possible to create two rectangles
                                 that fit inside the original square. While the space taken up by the triangles has shifted, it hasn't gotten 
                                 any bigger or smaller. Likewise, the white space has been broken into two smaller squares, but in total it 
                                 remains the same size. By using the side-lengths A and B, one can calculate the area of the two squares.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{
                                      What is the area of the smaller square? The larger square?}}
                       @teacher{You may need to explicitly point out that the side-lengths of the triangles can be used as the side-lengths of the squares.}
                       }
                @point{@student{@bitmap{images/absquare.png}The smaller square has an area of @math{A^{2}}, and the larger square has an 
                                 area of @math{B^{2}}. Since these squares are just the original square broken up into two pieces, we 
                                 know that the sum of these areas must be equal to the area of the original square:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{Does the same equation work for any values of A and B?}}
                       @teacher{}
                       }
                @point{@student{To get C by itself, we take the square-root of the sum of the areas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                                Pythagoras proved that you can get the square of the hypotenuse by adding the squares of the other two 
                                sides. In your games, you're going to use the horizontal and vertical distance between two characters 
                                as the two sides of your triangle, and use the Pythagorean theorem to find the length of that third side.}
                       @teacher{Remind students that A and B are the horizontal and vertical lengths, which are calculated by @code{line-length}.}
                       }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&4" "BS-PL.3&1&3")]{@itemlist[
                                    @item{Turn to @worksheet-link[#:page 35 #:name "distance-formula"] of your workbook - you'll see the formula written out.} 
                                     @item{Draw out the circle of evaluation, starting with the simplest expression you can see first.}
                                     @item{Once you have the circle of evaluation, translate it into Pyret code at the bottom of the page, starting with 
@code[#:multi-line #true]{check: 
         distance(4, 2, 0, 5) is...
       end}}]}
Now you've got code that tells you the distance between the points (4, 2) and (0, 5). But we want to have it work for @italic{any} two points. 
It would be great if we had a function that would just take the x's and y's as input, and do the math for us.}
                        @teacher{}}
                @point{@student{@activity[#:forevidence (list "BS-M&1&1" "BS-PL.3&1&2" "BS-PL.3&1&3" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                 @itemlist[@item{Turn to @worksheet-link[#:page 36 #:name "distance"], and read the problem statement and 
                                                 function header carefully.}
                                            @item{Use the Design Recipe to write your distance function. Feel free to use the work from the 
                                                  previous page as your first example, and then come up with a new one of your own.}
                                            @item{When finished, type your @code{distance} functions into your game, and see what happens.}
                                            @item{Does anything happen when things run into each other?}]}
You still need a function to check whether or not two things are colliding.}
                        @teacher{Pay careful attention to the order in which the coordinates are given to the @code{distance} function. 
                                The player's x-coordinate (@code{px}) must be given first, followed by the player's y (@code{py}), 
                                character's x (@code{cx}), and character's y (@code{cy}). Just like with making data structures, order
                                matters, and the distance function will not work otherwise. Also be sure to check that students are 
                                using @code{num-sqr} and @code{num-sqrt} in the correct places. }
                        }
                ]}
       
       

@lesson/studteach[#:title "Collision Detection"
        #:duration "30 minutes"
        #:overview "Students write a collision detection function, and modify their next-state-tick function to handle collisions in their games"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students add collision-detection to their games}]
        #:standards (list "BS-M" "BS-CE" "BS-PL.3" "BS-PL.4" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}
                            @item{Student Games @italic{or} the @editor-link[#:public-id "0B9rKDmABYlJVT1FBd3RpQWFqbGM" "Pyret Ninja Cat Starter"] file preloaded on students' machines}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{So what do we want to do with this distance? 
                                @activity{How close should your danger and your player be, before they hit each other?}
                                At the top of @worksheet-link[#:page 37 #:name "is-collision"] you'll find the Word Problem 
                                for @code{is-collision}. 
                                @activity[#:forevidence (list "BS-M&1&1" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                   @itemlist[@item{Fill in the Contract, two examples, and then write the code. Remember: you WILL need to make use of the @code{distance} function you just wrote!}
                                              @item{When you're done, type it into your game, underneath @code{distance}.}]}}
                        @teacher{Using visual examples, ask students to guess the distance between a danger and a player at 
                                 different positions. How far apart do they need to be before one has hit the other? Make sure 
                                 students understand what is going on by asking questions: If the collision distance is small,
                                 does that mean the game is hard or easy? What would make it easier?}
                        }
                
                @point{@student{Now that you have a function which will check whether two things are colliding, you can use it 
                                in your game! For extra practice, You can also implement collision detection into this 
                                @editor-link[#:public-id "0B9rKDmABYlJVT1FBd3RpQWFqbGM" "Pyret Ninja Cat game"]. This is the program we'll be altering for this lesson, as an example. In Ninja Cat, when the cat collides with the dog, we want to put the dog offscreen so that he can come back to attack again.  
                         @activity[#:forevidence (list "BS-R&1&4")]{
                                   Out of the major functions in the game (@code{next-state-tick}, @code{draw-state}, or @code{next-state-key}), which do you think you'll need to edit to handle collisions, changing the @code{GameState} when two characters collide?} 
                         We'll need to make some more @code{if} branches for @code{next-state-tick}.}
                        @teacher{}}
                 @point{@student{@activity[#:forevidence (list "BS-PL.4&1&1" "BS-DR.4&1&3" "BS-DS.1&1&5")]{
                                     @itemlist[@item{Start with the test: how could you check whether the cat and dog are colliding? Have you written a function to check that?}
                                                @item{What do the inputs need to be?}
                                                @item{How do you get the @code{playery} out of the GameState? @code{playerx}?}
                                                @item{How do you get the @code{dangerx} out of the GameState? @code{dangery}?} ]}
@code[#:multi-line #t]{if is-collision(
    g.playerx, 
    g.playery, 
    g.dangerx, 
    g.dangery):   ...result...}
Remember that @code{next-state-tick} produces a GameState, so what function should come first in our result?
@code[#:multi-line #t]{if is-collision(
    g.playerx, 
    g.playery, 
    g.dangerx, 
    g.dangery):
  game(
    ...playerx..., 
    ...playery..., 
    ...dangerx..., 
    ...dangery..., 
    ...dangerspeed...
    ...targetx...
    ...targety...
    ...targetspeed...)}
                                @activity[#:forevidence (list "BS-PL.4&1&1")]{
                                   And what should happen when the cat and dog collide? Can you think of a number that puts the dog 
                                   off the screen on the left side? What about the dog's y-coordinate? We could choose a number and 
                                   always place it at the same y-coordinate each time, but we know a function that can place him at 
                                   a @italic{random} y-coordinate...}
             @code[#:multi-line #t]{if is-collision(
    g.playerx, 
    g.playery, 
    g.dangerx, 
    g.dangery):
  game(
    g.playerx, 
    200, 
    num-random(480),
    0, 
    0, 
    g.targetx, 
    g.targety, 
    g.targetspeed) }
             }
                        @teacher{Collision detection must be part of the @code{next-state-tick} function because the game should 
                                be checking for a collision @italic{each time} the GameState is updated, on every tick. Students 
                                may assume that @code{draw-state} should handle collision detection, but point out that the Range 
                                of @code{draw-state} is an Image, and their function must return a new GameState in order to set 
                                the locations of the characters after a collision.}}
                 
                 
                  @point{@student{@activity[#:forevidence (list "BS-PL.4&1&1" "BS-DR.4&1&3" "BS-DS.1&1&5")]{
                              Once you've finished, write another branch to check whether the player 
                              and the target have collided. @bold{Challenges:} 
                              @itemlist[@item{Change your first condition so that the danger gets reset only when the player and 
                                              danger collide @italic{AND} the cat is jumping. (What must be true about the player's 
                                              y-coordinate for it to be jumping?)}
                                         @item{Add another condition to check whether the player has collided with the danger 
                                               while the player is on the ground. This could be a single expression within 
                                               @code{next-state-tick}, or you can write a @vocab{helper function} called 
                                               @code{game-over} to do this work, and use it in other functions as well 
                                               (maybe the GameState is drawn differently once the game is over.)}] 
                                }}
                                  
                   @teacher{For reference, a complete version of the Pyret Ninja Cat game can be @editor-link[#:public-id "0B9rKDmABYlJVTjVydm93eGptc0k" "found here"].}}
                
                ]
         }

    }

                                 
                        
       
   
          