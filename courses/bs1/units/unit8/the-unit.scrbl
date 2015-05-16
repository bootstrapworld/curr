#lang curr/lib
@title{Unit 8: Collision Detection}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Boolean" @code{= > < string=? and or}))]{
@unit-descr{Students derive, discuss, and prove the Pythagorean theorem, then use this theorem---in conjunction with Booleans---to detect collisions in their games.}
}

@unit-lessons{
@lesson/studteach[
     #:title "1D Distance" 
     #:duration "20 min"
     #:overview "Students act out a collision in their game, and reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students learn how to compute the distance between objects in one dimension}]
     #:evidence-statements @itemlist[@item{Students will be able to explain how a Number line is used to calculate distance in one dimension}
                                     @item{Students will be able to explain why the @code{line-length} function uses a conditional}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.3" "BS-PL.4" "6.NS.5-8")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" "Coordinate Planes")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Suppose two objects are moving through space, each one having its own (x,y) coordinates. When do their edges start to overlap? They certainly overlap if their coordinates are identical (x1=x2, y1=y2), but what if their coordinates are separated by a small distance? Just how small does that distance need to be before their edges touch?}
                       @teacher{[@(hyperlink "https://www.youtube.com/watch?v=Bbq0oCmvSmA" "Video")] Visual aids are key here: be sure to diagram this on the board!}
                       }
                @point{@student{@bitmap{images/numberline.png}In one dimension, it's easy to calculate when two objects overlap. In this example, the red circle has a radius of 1, and the blue circle has a radius of 1.5 The circles will overlap if the distance @italic{between their centers} is @italic{less than the sum of their radii} (@math{1 + 1.5 = 2.5}). How is the distance between their centers calculated? In this example, their centers are 3 units apart, because @math{4 - 1 = 3}. @activity{Would the distance between them change if the circles swapped places? Why or why not?}}
                       @teacher{Work through a number of examples, using a number line on the board and asking students how they calculate the distance between the points.  Having students act this out can also work well: draw a number line, have two students stand at different points on the line, using their arms or cutouts to give objects of different sizes.  Move students along the number line until they touch, then compute the distance on the number line.  The first few seconds of our @(hyperlink "http://www.youtube.com/watch?v=leP3tQ_GZL8&feature=player_embedded" "Bootstrap video") show this exercise in action.}
                       }
                @point{@student{Your game file provides a function called @code{line-length} that computes the difference between two points on a number line.  Specifically, @code{line-length} takes two numbers as input and determines the distance between them.
                       @activity[#:forevidence (list "BS-PL.3&1&3" "BS-PL.4&1&1" "6.NS.5-8&1&6")]{What answers would you expect from each of the following two uses of @code{line-length}:
                                 @itemlist[@item{@code{(line-length 2 5)}}
			                   @item{@code{(line-length 5 2)}}
                                          ]
                                 Do you expect the same answer regardless of whether the larger or smaller input goes first?}}
                       @teacher{If you have time and want to reinforce how conditionals arise from examples, you can have students fill in blanks in Examples such as @code{(EXAMPLE (line-length 2 5) ___)}, circle what's different, and notice that the circle labels are in different orders depending on whether the first or the second input is larger.  This in turn suggests that the code for @code{line-length} will need a conditional.  In this case, one could avoid the conditional by taking the absolute value of the difference (the function @code{abs} does this); if you are working with older students who already know about absolute value you could show it.  Using @code{cond}, however, emphasizes how code structure arises from examples.}}

                @point{@student{Scroll to the @code{line-length} and @code{collide?} functions in your game file.  Notice that @code{line-length} uses a conditional so that it subtracts the smaller number from the bigger one. 
                       @activity[#:forevidence (list "BS-M&1&1" "8.F.5&1&1")]{Can you explain why @code{line-length} needs to use @code{cond}? What are the two conditions?}}
                       @teacher{The two conditions are: @itemlist[@item{A is @italic{less than} B} @item{B is @italic{less than or equal} to A}]}}
                       
                @point{@student{@bitmap{images/3004graph.png}Unfortunately, @code{line-length} can only calculate the distance between points in a single dimension (x or y). How would the distance be calculated between objects moving in 2-dimensions (like your game elements)? @code{line-length} can calculate the vertical and horizontal lines in the graphic shown here, using the distance between the x-coordinates and the distance between the y-coordinates. Unfortunately, it doesn't tell us how far apart the two centers are.}
                       @teacher{}
                       }
                @point{@student{@bitmap{images/3004ABCgraph.png}Drawing a line from the center of one object to the other creates a right-triangle, with sides A, B and C. A and B are the vertical and horizontal distances, with C being the distance between the two coordinates. @code{line-length} can be used to calculate A and B, but how can we calculate C?}
                       @teacher{Students' gamefiles all have a value called @code{*distances-color*}, which is set to the empty string @code{""}. By changing this to a color such as "yellow" or "red", the game will draw right triangles between each game character, and fill in the lengths for each side. You may want to demonstrate this using your own game file, and have the students follow along. Hint: to make it as easy as possible to see these triangles, set your background to be a simple, black rectangle and slow down the animation functions.}
                       }
                @point{@student{In a right triangle, the side opposite the 90-degree angle is called the @vocab{hypoteneuse}. Thinking back to our collision detection, we know that the objects will collide if the hypoteneuse is @italic{less than the sum of their radii}. Knowing the length of the hypoteneuse will be essential to determine when a collision occurs.}
                       @teacher{}
                       }
                ]}
                                                           
@lesson/studteach[
     #:title "2D Distance" 
     #:duration "35 min"
     #:overview "Students explore the Pythagorean Theorem using shapes on paper, then reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students learn that two-dimensional distance corresponds to the hypoteneuse of a right triangle}
                                     @item{Students learn how to compute the distance between objects in two dimensions}]
     #:evidence-statements @itemlist[@item{Students understand that two-dimensional distance needs a different computation than one-dimensional distance}
                                     @item{Students can draw out the right triangles that compute the distance between two coordinates}
                                     @item{Students understand that geometric manipulation is a useful tool for figuring out certain computations}
                                     @item{Some students can use geometric manipulation to derive the Pythagorean Theorem}
                                     @item{Students can state the Pythagorean Theorem}
                                     @item{Students can turn the Pythagorean Theorem into code by writing a @code{distance} function}
                                    ]
     #:product-outcomes @itemlist[@item{Students write the distance function in their game files.}]
     #:standards (list "8.G.6-8" "BS-PL.4" "BS-DR.3")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{All student computers should have their game templates pre-loaded, with their image files linked in}
                           @item{Cutouts of Pythagorean Theorem packets [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 per cluster of students working together}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[ @item{REQUIRED: Hand out @(hyperlink "https://docs.google.com/document/d/1Vkaz30B8AAaze6fMiFJypFb1bOIeH0RzkeaBLCCPf9E/edit?usp=sharing" "Warmup Activity Sheet").}]
     #:prerequisites (list "1D Distance")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Ancient civilizations had the same problem: they also struggled to find the distance between points in two dimensions!  Let's work through a way to think about this problem: what expression computes the length of the hypoteneuse of a right triangle?}
                       @teacher{This exercise is best done in small groups of students (2-3 per group).  Pass out Pythagorean Proof materials [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] to each group, and have them review all of their materials:@itemlist[@item{A large, white square with a smaller one drawn inside}@item{Four gray triangles, all the same size}]}
                       }
                @point{@student{@bitmap{images/csquared.png}For any right triangle, it is possible to draw a picture where the hypoteneuse is used for all four sides of a square. In the diagram shown here, the white square is surrounded by four gray, identical right-triangles, each with sides A and B. The square itself has four identical sides of length C, which are the hypoteneuses for the triangles. If the area of a square is expressed by @math{side * side}, then the area of the white space is @math{C^{2}}.}
                       @teacher{Have students place their gray triangles onto the paper, to match the diagram.}
                       }
                @point{@student{@animated-gif{images\Pythag_anim.gif} By moving the gray triangles, it is possible to create two rectangles that fit inside the original square. While the space taken up by the triangles has shifted, it hasn't gotten any bigger or smaller. Likewise, the white space has been broken into two smaller squares, but in total it remains the same size. By using the side-lengths A and B, one can calculate the area of the two squares.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&1" "8.G.6-8&1&3")]{What is the area of the smaller square? The larger square?}}
                       @teacher{You may need to explicitly point out that the side-lengths of the triangles can be used as the side-lengths of the squares.}
                       }
                @point{@student{@bitmap{images/absquare.png}The smaller square has an area of @math{A^{2}}, and the larger square has an area of @math{B^{2}}. Since these squares are just the original square broken up into two pieces, we know that the sum of these areas must be equal to the area of the original square:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{Does the same equation work for any values of A and B?}}
                       @teacher{}
                       }
                @point{@student{To get C by itself, we take the square-root of the sum of the areas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                        @activity[#:forevidence (list "BS-CE&1&4")]{
                               Turn to @worksheet-link[#:name "distance-example"] in your workbook - you'll see the same formula 
                               written out, this time using @code{line-length} to calculate the distance along the x- and y-axis. The Circle of Evaluation
                               has already been partially-completed here, but you'll have to finish it on your own. Once you're done, convert that circle 
                               into code on the bottom of the page.}}
                        @teacher{Remind students that A and B are the horizontal and vertical lengths, which are calculated by @code{line-length}.}
                        }
                @point{@student{The code on @worksheet-link[#:name "distance-example"] will accurately calculate the distance between two objects whose centers are at (3,0) and (0,4). But what about other points? It would be nice to have a function that calculates the distance for @italic{any} two sets of points.
                                @activity[#:forevidence (list "BS-DR.3&1&1" "BS-PL.4&1&1" "8.G.6-8&1&3" "8.F.1-3&1&1" "8.F.1-3&1&3")]{
                                   Turn to @worksheet-link[#:name "distance"] in your workbook, and use the Design Recipe to write your @code{distance} function. 
                                   Feel free to use the work from the previous page as your first example, and then come up with a new one of your own.}}
                        @teacher{WARNING: make sure students are giving @code{line-length} the proper coordinates! Many students mistakenly pair @code{px} and @code{py} 
                                 together, rather than pairing the x-coordinates. Check student work carefully!}
                        }
                ]}

@lesson/studteach[
     #:title "collide?" 
     #:duration "25 min"
     #:overview "Students reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students learn how to use the distance formula to detect collisions in games}]
     #:evidence-statements @itemlist[@item{Students understand that collisions occur when the distance between objects is below some threshhold}
                                     @item{Students understand how to determine the collision threshhold between two objects}
                                     @item{Students write a @code{collide?} function that determines whether the player and danger elements in their games have collided}]
     #:product-outcomes @itemlist[@item{Students add a @code{collide?} function to their games to detect when the player and danger have collided}]
     #:exercises (list (make-exercise-locator/dr-assess "Collide" "late-to-class-design-recipe-assess" "Are You Late to Class?"))
     #:standards (list "F-IF.1-3" "F-IF.4-6" "8.F.1-3" "A-SSE.1-2" "8.G.6-8")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{All student computers should have their game templates pre-loaded, with their image files linked in}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:prerequisites (list "2D Distance" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{By now, you have defined a function called @code{distance}: it has four Number inputs (representing playerX, playerY, dangerX and dangerY) and produces a Number representing the distance between those coordinates. If the player is standing at (320, 240) and the danger is at (400, 159), the distance can be calculated by evaluating @code{(distance 320 240 400 159)}.
                              @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&4")]{For each of the following player and danger coordinates, write the expression that uses the @code{distance} function to compute the distance between the points.  You may write in code or in a Circle of Evaluation:
                                        @itemlist[@item{The player is at (100, 225) and the danger is at (174, 300)}
                                                  @item{The player is at (48, 20) and the danger is at (210, 160)}
                                                  @item{The player is at (300, 60) and the danger is at (130, 240)}
                                                 ]}
                              }
                       @teacher{}
                       }
                @point{@student{Now that you know how to compute the distance between two objects, you need to decide when two objects have collided.  We discussed this earlier in the unit using circles: two circles collide when the distance between them is less than the sum of their radii.  If your objects have more interesting outlines than circles, this computation can be hard to do precisely.  Fortunately, most games don't have to be precise (they move too fast for people to see the exact moment of impact).  We just need to figure out when items are close enough, and use that to detect collision.}
                       @teacher{You can spend additional time on this point by having students think about collision distances between different shapes.  The rest of Bootstrap doesn't require this, but this may be a good point to integrate additional geometry if you are teaching math.}}
                @point{@student{Unless the images you chose for your game are very small, 50 pixels is usually a sufficient distance for detecting collisions between your player and danger.  If you are using very small images, you might want to detect a collision when the distance between characters is below 20.
                              @activity[#:forevidence (list "8.G.6-8&1&3")]{How would you check whether the distance between (320, 240) and (400, 159) is @italic{less than 50?}  How would you check whether the distance between those coordinates is less than 20?}}
                       @teacher{}
                       }
                @point{@student{@activity[#:forevidence (list "8.F.1-3&1&1" "8.F.1-3&1&3")]{Turn to @worksheet-link[#:name "collide"] in your workbook, and use the Design Recipe to write a function that produces @code{true} if the distance between two coordinates is less than 50. HINT: You should use your @code{distance} function!}
                                @activity{Enter your @code{collide?} function definition into your game file.  Play your game, and make your player collide with the danger.  Does your game now do something different than it did before you wrote @code{collide?}?}
                      }
                        @teacher{}
                        }
                ]}
      
@lesson/studteach[
     #:title "Closing"
     #:duration "5 min"
     #:overview ""
     #:learning-objectives @itemlist[]
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
        @points[@point{@student{Congratulations - your game is complete! Take a minute to scroll through all the code you've written, and think
                                back on how much you've learned: The Circles of Evaluation, datatypes like @code{Number}, @code{String}, @code{Image}
                                and @code{Boolean}, the importance of Contracts and Purpose Statements, and Piecewise functions. You've learned a whole 
                                new programming language, and even more importantly you've learned the Design Recipe, which lets you solve word problems
                                and programming challenges by focusing on just one step at a time, making sure that each step is checked against the
                                one that came before it.
                                @activity{Once programmers get something working, they always go back over their code and make sure that it's readable, 
                                          clear, and easy for other people to understand. A car that runs well might be nice, but if it's not worth much
                                          if it's impossible for a mechanic to repair or upgrade! Make sure your code is beautiful, inside and out.
                                          @itemlist[@item{Does every function have its contract written out correctly?}
                                                     @item{Does every function have a purpose statement that accurately describes what it does?}
                                                     @item{Does every single function have at least two EXAMPLEs?}
                                                     @item{When you click "Run", do all of your EXAMPLEs pass?}
                                                     ]}
                                }
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }
                        ]}
}