#lang curr/lib

@title{Unit 8: Collision Detection}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < strings-equal and or}))]{   
@unit-descr{Students return to the Pythagorean Theorem and distance formula they used in Bootstrap 1, this time with data structures and the full update-world function.}
}
@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}
                            @item{Cutouts of Cat and Dog images}
                            @item{Cutouts of Pythagorean Theorem packets [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 per cluster}
                            @item{The Ninja World 5 file [NW5.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "hTE94bR2V5" "WeScheme"] preloaded on students' machines}]
        #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Right now, in both Ninja World and your games, nothing happens when the player collides with another 
                                game character. We need to write a function change that. This is going to require a 
                                little math, but luckily it's exactly the same as it was in Bootstrap: 1.
                                @bitmap{images/numberline.png}                               
                                @activity{@itemlist[@item{In the image above, how far apart are the cat and dog?}
                                                     @item{If the cat was moved one space to the right, how far apart would they be?}
                                                     @item{What if the cat and dog switched positions?}]}
                                
                                In one dimension, such as on a number line, finding the distance is pretty easy. If the characters 
                                are on the same line, you just subtract one coordinate from another, and you have your distance. 
                                However, if all we did was subtract the second number from the first, the function would only 
                                work half the time!

                                @activity{When the cat and dog were switched, did you still subtract the dog's position from the 
                                          cat's, or subtract the cat's position from the dog's? Why?}}
                        @teacher{Draw the number line on the board, with the cutouts of the cat and dog at the given positions.
                                 Ask students to tell you the distance between them, and move the images accordingly. 
                                 Having students act this out can also work well: draw a number line, have two students stand at different 
                                 points on the line, using their arms or cutouts to give objects of different sizes. Move students along 
                                 the number line until they touch, then compute the distance on the number line.}}
                 ]
         }

@lesson/studteach[#:title "1D Distance"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Distances cannot be negative, so we have to make sure we are always subtracting the smaller 
                                number from the bigger one. If the characters are on the same plane, there are two conditions:
                                if the first number is bigger, and the other is if the second is bigger.
                                @activity{@itemlist[@item{What kind of function do we need, when we have multiple 
                                                          @italic{conditions}?}
                                                     @item{Turn to @worksheet-link[#:page 36 #:name "Design Recipe Line Length"].}
                                                     @item{What is the Name of this function? Domain? Range?}
                                                     @item{Write two examples for @code{line-length} so that it subtracts the 
                                                           smaller number from the bigger one. Start with an example using 
                                                           the numbers 23 and 5, then do a second example with 5 and 23 in 
                                                           the @italic{other order}.}]}
@code[#:multi-line #t]{check:
                           line-length(23, 5) is 23 - 5
                           line-length(5, 23) is 23 - 5
                       end}}
                        @teacher{}}
                 @point{@student{Now we have an idea of the results for the @code{ask} statement, but a @code{ask} function also 
                                needs tests. We want to @italic{test} to see whether the first 
                                number given to @code{line-length} is greater than the second number. 
                                @activity{@itemlist[@item{How would you write that test in Pyret code?}
                                                     @item{And what would the result for that test be? If @code{a} is
                                                           greater than @code{b}, which number would we subtract from 
                                                           which?}
                                                     @item{How could you include a test for wheather the two numbers are equal,
                                                           @italic{without} adding a third @code{ask} branch?}
                                                     @item{Write down the definition for @code{line-length}.}]}     
@code[#:multi-line #t]{fun line-length(a :: Number, b :: Number) -> Number:
                           ask:
                             | a > b then: a - b
                             | b >= a then: b - a
                           end
                       end}}
                        @teacher{It is possible to replace the second test with @code{otherwise}, because there will only be two options:
                                 @code{line-length} will either subtract @code{b} from @code{a}, or @code{a} from @code{b}. (If the 
                                 numbers are equal, it doesn't matter which is subtracted.) However, having students write out the full 
                                 test and result gets them thinking about what exactly is being tested in each branch of the function.
                                 
                                 It is possible to avoid using a conditional entirely by taking the absolute value of the difference 
                                 (the function @code{num-abs} does this); if you are working with older students who already know about
                                 absolute value you could show it. Using @code{ask}, however, emphasizes how code structure arises 
                                 from examples.}}
                 ]
         }

@lesson/studteach[#:title "The Distance Formula"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Reinforce their understanding of the distance formula}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[ @item{Students will write the distance function}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Unfortunately you don't have any code to calculate the distance in two dimensions.
                                All you have so far is something that tells you the length in only the x- or y-dimension.                   
                                @bitmap{images/ABCgraph.png}
                                @activity{@itemlist[@item{How could you find the distance between the two points shown
                                                          in this image?}
                                                     @item{How could you find the length of the dotted line, also 
                                                           called the @vocab{Hypotenuse}?}]}
                                Let's start with what we do know: the dotted line sort of makes a triangle, and we can
                                find out the length of the other two sides, labeled "A," "B" and "C." 
                                @activity{What is the line-length of A?}
                                To make your life easier, you can use the function you already wrote: @code{line-length}.
                                In this example, line-length(A) is 4 and line-length(B) is 3, but we still don't know C.}
                        @teacher{@management{Draw this image on the board, with the lines labeled "A", "B", and "C".}}}
                 @point{@student{Ancient civilizations had the same problem: they also struggled to find the distance
                                 between points in two dimensions. Let’s work through a way to think about this problem:
                                 what expression computes the length of the hypotenuse of a right triangle?}
                       @teacher{@management{This exercise is best done in small groups of students (2-3 per group).} 
                                 Pass out Pythagorean Proof materials [@(resource-link #:path "images/pythag1.png" #:label "1"), 
                                 @(resource-link #:path "images/pythag2.png" #:label "2")] to each group, and have them
                                 review all of their materials:@itemlist[@item{A large, white square with a smaller one drawn inside}
                                                                          @item{Four gray triangles, all the same size}]
                                 Everyone will have a packet with the same materials, but each group's triangles are
                                 a little different. The activity workes with triangles of all sizes, so each pair will
                                 get to test it out on their own triangles. @management{Draw the diagram on the board.}}
                        }
                @point{@student{@bitmap{images/csquared.png}For any right triangle, it is possible to draw a picture 
                                 where the hypoteneuse is used for all four sides of a square. In the diagram shown 
                                 here, the white square is surrounded by four gray, identical right-triangles, each 
                                 with sides A and B. The square itself has four identical sides of length C, which 
                                 are the hypoteneuses for the triangles. If the area of a square is expressed by 
                                 @math{side * side}, then the area of the white space is @math{C^{2}}.}
                        @teacher{Have students place their gray triangles onto the paper, to match the diagram.}
                       }
                @point{@student{@animated-gif{images/Pythag_anim.gif} By moving the gray triangles, it is possible 
                                 to create two rectangles that fit inside the original square. While the space 
                                 taken up by the triangles has shifted, it hasn't gotten any bigger or smaller.
                                 Likewise, the white space has been broken into two smaller squares, but in total
                                 it remains the same size. By using the side-lengths A and B, one can calculate
                                 the area of the two squares.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&1" "8.G.6-8&1&3")]{
                                      What is the area of the smaller square? The larger square?}}
                       @teacher{You may need to explicitly point out that the side-lengths of the triangles can be
                                used as the side-lengths of the squares.}
                       }
                @point{@student{@bitmap{images/absquare.png}The smaller square has an area of @math{A^{2}}, and the
                                 larger square has an area of @math{B^{2}}. Since these squares are just the original
                                 square broken up into two pieces, we know that the sum of these areas must be equal 
                                 to the area of the original square:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{
                                     Does the same equation work for any values of A and B?}}
                       @teacher{}
                       }
                @point{@student{To get C by itself, we take the square-root of the sum of the areas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                                Pythagoras proved that you can get the square of the hypotenuse by adding the squares 
                                of the other two sides. In your game, you're going to use the horizontal and vertical
                                distance between two characters as the two sides of your triangle, and use the 
                                Pythagorean theorem to find the length of that third side.}
                       @teacher{Remind students that A and B are the horizontal and vertical lengths, which are
                                calculated by @code{line-length}.}
                       }
                @point{@student{@activity{@itemlist[@item{Turn to @worksheet-link[#:page 37 #:name "Distance-Formula-With-Numbers"] 
                                                          of your workbook - you'll see the formula written out.} 
                                                     @item{Draw out the circle of evaluation, starting with the 
                                                           simplest expression you can see first.}
                                                     @item{Once you have the circle of evaluation, translate it 
                                                           into Pyret code at the bottom of the page, starting 
                                                           with @code[#:multi-line #true]{check: 
                                                                          distance(4, 2, 0, 5) is...
                                                                      end}}]}
                                 Now you've got code that tells you the distance between the points (4, 2) and (0, 5).
                                 But we want to have it work for @italic{any} two points. It would be great if we had a 
                                 function that would just take the x's and y's as input, and do the math for us.}
                        @teacher{}}
                @point{@student{@activity{@itemlist[@item{Turn to @worksheet-link[#:page 38 #:name "Distance"], 
                                                           and read the problem statement and function header 
                                                           carefully.}
                                                      @item{Use the Design Recipe to write your distance function. 
                                                            Feel free to use the work from the previous page as your 
                                                            first example, and then come up with a new one of your own.}
                                                      @item{When finished, type your @code{line-length} and 
                                                            @code{distance} functions into your game, and see what happens.}
                                                      @item{Does anything happen when things run into each other?}]}
                                 You still need a function to check whether or not two things are colliding.}
                        @teacher{Pay careful attention to the order in which the coordinates are given to the 
                                 @code{distance} function. The player's x-coordinate (@code{px}) must be given first,
                                 followed by the player's y (@code{py}), character's x (@code{cx}), and character's y 
                                 (@code{cy}). Inside the body of the function, @code{line-length} can only calculate 
                                 lengths on the same axis (@code{line-length(px, cx)} and @code{line-length(cx, cy)}).
                                 Just like with making data structures, order matters, and the distance function will 
                                 not work otherwise. Also be sure to check that students are using @code{sq} and 
                                 @code{sqrt} in the correct places. }
                        }
                ]
         }
       
@lesson/studteach[#:title "Collide"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will write the collide function}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{So what do we want to do with this distance? 
                                @activity{How close should your danger and your player be, before they hit 
                                          each other?}
                                At the top of @worksheet-link[#:page 39 #:name "collide"] you'll find the 
                                Word Problem for @code{collide}. 
                                @activity{@itemlist[@item{Fill in the Contract, two test cases, and then write the
                                                          code. Remember: you WILL need to make use of the 
                                                          @code{distance} function you just wrote!}
                                                     @item{When you're done, type it into your game, under
                                                           @code{collide}.}]}}
                        @teacher{Using visual examples, ask students to guess the distance between a danger
                                 and a player at different positions. How far apart do they need to be before
                                 one has hit the other? 
                                 @management{Make sure students understand what is going on by asking questions:
                                             If the collision distance is small, does that mean the game is hard 
                                             or easy? What would make it easier?}}
                        }
                 ]
         }
            
@lesson/studteach[#:title "update-world"
        #:duration "40 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Identify collision as yet another sub-domain which requires different behavior of the update-world function}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use different Ask branches to identify collisions in their games}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that you have a function which will check whether something is colliding, 
                                you can go back to modifying Ninja World.
                                @activity{Out of the four major functions in the game (@code{update-world}, 
                                          @code{draw-world}, @code{keypress}, and @code{big-bang}), which 
                                          do you think you'll need to edit to handle collisions?}
                                We'll need to make some more branches for @code{ask} in @code{update-world}. 
                                What should happen when the cat collides with the dog? We want to put the dog 
                                offscreen, so that he can come back to attack again.}
                        @teacher{}}
                 @point{@student{@activity{@itemlist[@item{Start with the test: how could you check whether the
                                                          cat and dog are colliding? Have you written a function 
                                                          to check that?}
                                                     @item{What do the inputs need to be?}
                                                     @item{How do you get the @code{catY} out of the world?}
                                                     @item{What about the Cat's x-coordinate? She's always in the
                                                           center of the screen, so what will her x-coordinate 
                                                           always be?}
                                                     @item{How do you get the @code{dogX} out of the world?} 
                                                     @item{Is there a @code{dogY} in the world? Where in the 
                                                           game can you look to get that number? (Hint: in which
                                                           function do you @italic{draw} the images on the game 
                                                           screen?)}]}
@code[#:multi-line #t]{| collide(360, w.catY, w.dogX, 400) then: ...result...}
Remember that @code{update-world} gives back a world, so what function should come first in our result?
@code[#:multi-line #t]{| collide(360, w.catY, w.dogX, 400) then: world(...dogX..., ...rubyX..., ...catY...)}
                                @activity{And what should happen when the cat and dog collide? Can you think of a 
                                          number that puts the dog off the screen on the left side?}
             @code[#:multi-line #t]{| collide(360, w.catY, w.dogX, 400) then: world(-100, ...rubyX..., ...catY...)}
                                @activity{Does the @code{rubyX} change when the dog and cat collide? How about 
                                          @code{catY}? How do you get each of those things out of the world?}
             @code[#:multi-line #t]{| collide(360, w.catY, w.dogX, 400) then: world(-100, w.rubyX, w.catY)}}
                        @teacher{Collision detection must be part of the @code{update-world} function because the
                                 game should be checking for a collision @italic{every time} the world is updated. Students may
                                 assume that @code{draw-world} should handle collision detection, but point out that the
                                 Range of @code{draw-world} is an Image, and their function must return a new world in order to
                                 set the locations of the characters after a collision.}}
                 
                 @point{@student{Now it's time to handle collisions in your game...
                                 @activity{Turn to @worksheet-link[#:page 40 #:name "Collide-Examples"] and write 
                                           some more tests and results. What characters in your game could collide 
                                           with each other? What should happen as a result? When you have written 
                                           each test and result down, type it into your game.}}
                         @teacher{Work in small groups to complete collision branches.}}
                ]
         }

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Congratulations! You've finished every lesson, and now it's up to you to make your 
                                game even better. Take some time to brainstorm...what else do you want your game to 
                                do? Next unit you can add even more things, so that your games are even cooler.}
                        @teacher{@management{Have students show each other their finished games, and start thinking about what 
                                 features they want to add next!}}}
                 ]
         }
       }

       
   