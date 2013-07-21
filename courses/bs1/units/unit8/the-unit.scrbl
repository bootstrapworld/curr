#lang curr/lib
@title{Unit 8: Collision Detection}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list "Number" @code{+ - * / sq sqrt expt})
                                 (list "String" @code{string-append string-length})
                                 (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})]{
@unit-descr{Students discuss and then prove the Pythagorean theorem, and use this theorem - in conjunction with Booleans - in their games to detect when a collision has occurred.}
}

@lesson/studteach[
     #:title "1D Distance" 
     #:duration "15 min"
     #:overview "Students act out a collision in their game, and reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students will be able to explain how a Number line is used to calculate distance in 1 dimension.}
                                      @item{Students will be able to explain both conditions used in the line-length function.}]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites "Coordinate-Planes Introducing-the-Design-Recipe Cond-Example-With-Pizza-Toppings"
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Suppose two objects are moving through space, each one having it's own (x,y) coordinates. When do their edges start to overlap? They certainly overlap if their coordinates are identical (x1=x2, y1=y2), but what of their coordinates are separated by a small distance? Just how small does that distance need to be, before their edges touch?}
                       @teacher{Visual aids are key here - be sure to diagram this on the board!}
                       }
                @point{@student{@bitmap{images/numberline.png}In one dimension, it's easy to calculate when two objects overlap. In this example, the red circle has a radius of 1, and the blue circle has a radius of 1.5 The circles will overlap if the distance @italic{between their centers} is @italic{less than the sum of their radii} (1+1.5 = 2.5). How is the distance between their centers calculated? In this example, their centers are 3 units apart, because 4-1=3. @activity{Would the distance between them change if the circles swapped places? Why or why not?}}
                       @teacher{Work through a number of examples, using a number line on the board and asking students how they calculate the distance between the points.}
                       }
                @point{@student{@activity{Scroll to the @code{line-length} and @code{collide?} functions in your game files. By making sure to always subtract the smaller coordinate on the number line from the larger one, we can easily find the distance between them. The @code{line-length} function does exactly that: it subtracts the smaller number from the bigger one. Can you explain why @code{line-length} needs to use Cond? What are the two conditions?}}
                       @teacher{The two conditions are: @itemlist[@item{A is @italic{less than} B} @item{B is @italic{less than or equal} to A}]}
                       }
                @point{@student{@bitmap{images/3004graph.png}Unfortunately, @code{line-length} can only calculate the distance between points in a single dimension (x or y). How would the distance be calculated between objects moving in 2-dimensions? @code{line-length} can calculate the vertical and horizontal lines in the graphic shown here, using the distance between the x-coordinates and the distance between the y-coordinates. Unfortunately, it doesn't tell us how far apart the two centers are.}
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
     #:overview "Students act out a collision in their game, and reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[@item{Students write the distance function in their game files.}]
     #:standards (list)
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{All student computers should have their game templates pre-loaded, with their image files linked in}
                           @item{Cutouts of Pythagorean Theorem packets [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 per cluster}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites "Coordinate-Planes Introducing-the-Design-Recipe 1D Distance"
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Ancient civilizations had the same problem: they also struggled to find the distance between points in two dimensions!}
                       @teacher{Pass out Pythagorean Proof materials to each group, and have them review all of their materials:@itemlist[@item{A large, white square with a smaller one drawn inside}@item{Four gray triangles, all the same size}]}
                       }
                @point{@student{@bitmap{images/csquared.png}For any right triangle, it is possible to draw a picture where the hypoteneuse is used for all four sides of a square. In the diagram shown here, the white square is surrounded by four gray, identical right-triangles, each with sides A and B. The square itself has four identical sides of length C, which are the hypoteneuses for the triangles. If the area of a square is expressed by @math{side x side}, then the area of the white space is @math{C^{2}}}
                       @teacher{Have students place their gray triangles onto the paper, to match the diagram.}
                       }
                @point{@student{@bitmap{images/Pythag_anim.gif}By moving the gray triangles, it is possible to create two rectangles that fit inside the original square. While the space taken up by the triangles has shifted, it hasn't gotten any bigger or smaller. Likewise, the white space has been broken into two smaller squares, but in total it remains the same size. By using the side-lengths A and B, one can calculate the area of the two squares.
                                 @activity{What is area of the smaller square? The larger square?}}
                       @teacher{You may need to explicitly point out that the side-lengths of the triangles can be used as the side-lengths of the squares.}
                       }
                @point{@student{@bitmap{images/absquare.png}The smaller square has an area of @math{A^{2}}, and the larger square has an area of @math{B^{2}}. Since these squares are just the original square broken up into two pieces, we know that the sum of these areas must be equal to the area of the original square:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity{Would this change if the original right triangle had a different A and B?}}
                       @teacher{}
                       }
                @point{@student{To get C by itself, we take the square-root of the sum of the areas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}}
                       @teacher{Remind students that A and B are the horizontal and vertical lengths, which are calculated by @code{line-length}.}
                       }
                @point{@student{@activity{Turn to @worksheet-link[#:page 27 #:name "Distance-Formula-With-Numbers"] of your workbook - you'll see the same formula written out, this time using @code{line-length} to calculate the distance along the x- and y-axis. The Circle of Evaluation has already been partially-completed here, but you'll have to finish it on your own. Once you're done, convert that circle into code on the bottom of the page.}}
                        @teacher{}
                        }
                @point{@student{This code will accurately calculate the distance between two objects whose centers are at (3,0) and (0,4). But what about other points? It would be nice to have a function that calculates the distance for @italic{any} two sets of points.
                                @activity{Turn to @worksheet-link[#:page 28 #:name "Distance"], and use the Design Recipe to write your distance function. Feel free to use the work from the previous page as your first example, and then come up with a new one of your own.}}
                        @teacher{WARNING: make sure students are giving @code{line-length} the proper coordinates! Many students mistakenly pair @code{px} and @code{py} together, rather than pairing the x-coordinates. Check student work carefully!}
                        }
                ]}

@lesson/studteach[
     #:title "collide?" 
     #:duration "20 min"
     #:overview "Students act out a collision in their game, and reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[@item{Students write the collide? function in their game files.}]
     #:standards (list)
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{All student computers should have their game templates pre-loaded, with their image files linked in}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:prerequisites "Distance-Formula Collision-Introduction"
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{By now, you have defined a function called @code{distance}: four Numbers go in (representing playerX, playerY, characterX and characterY) and one Number comes out, representing the distance between those coordinates. If the player is standing at (320, 240) and the danger is at (400, 159), the distance can be calculated by evaluating @code{(distance 320 240 400 159)}.
                              @activity{How would you check to see if the distance between those points is @italic{less than 50?}}}
                       @teacher{}
                       }
                @point{@student{@activity{Turn to @worksheet-link[#:page 29 #:name "collide?"], and use the Design Recipe to write a function that produces @code{true} if the distance between two points is less than 50. HINT: You will need to use your distance function!}}
                        @teacher{}}
                ]}
@copyright[]