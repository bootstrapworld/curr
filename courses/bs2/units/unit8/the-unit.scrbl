#lang curr/lib

@title{Unit 8: Building Your World}
@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < string-equal and or}))]{   
@unit-descr{After thinking about their own game World, students practice building, drawing, and animating it.}
}
@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.3" "BS-DS.1" "BS-DS.2")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
        #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                                @item{The @editor-link[#:public-id "0B9rKDmABYlJVcDUyZkJmd3VlS00" "BS:2 blank game template"] preloaded on students' machines.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{It's time to look at the World for @italic{your} game!
                                 @activity{@itemlist[@item{Turn to @worksheet-link[#:page 31 #:name "Game Design"] in your workbook. What are the things in your world? What datatypes are they?}
                                                     @item{Open the @editor-link[#:public-id "0B9rKDmABYlJVcDUyZkJmd3VlS00" "BS:2 blank game template"].}]}
                                 In Bootstrap:1, you started with the shell of a game, with some sample images and functions defined. In this class the game template is just a collection of comments, telling you how to organize your functions and variables. You'll be writing @italic{every line} of code yourself. Let's begin: 
                                 @activity[#:forevidence (list "N-Q&1&1" "BS-M&1&1" "BS-M&1&2" "BS-M&1&3" "BS-DS.1&1&4" "BS-DS.1&1&5"  "BS-DS.2&1&2")]{At the top of the file, where it says @code{# The World is a}, define the world structure for your game. (Check @worksheet-link[#:page 32 #:name "Game Design"] to jog your memory.) Once you have the world struct, scroll down to where it says @code{# STARTING WORLD} and define your first example world: name it @code{worldA}. On the next line, add @code{worldB}.}}
                         @teacher{}}

                 @point{@student{So now you have your world, and you know what's in it: but what do those things look like? You'll have to add some images. We'll use the @code{image-url} function. It takes in the URL of any image online (given as a string), and returns that image. 
                                 @code[#:multi-line #t]{# image-url : String -> Image}
                                 @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&3" "BS-IDE&1&1" "BS-PL.1&1&1" "BS-PL.3&1&3")]{@itemlist[@item{Look back at @worksheet-link[#:page 31 #:name "Game Design"] in your workbook. How many things in your game will need their own image?}
                                                     @item{Using Google Image Search or a similar tool, find images for the background and for each of the characters in your game.}
                                                     @item{Define new variables for your images, (i.e. @code{PLAYER-IMG}, @code{DANGER-IMG}, etc.) and use the @code{image-url} function to put them into your game file.}]}
                                 Some hints for finding images: Your images should be in PNG or GIF format, and the url should contain the file type (i.e. .png or .gif) at the end. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds! TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with.} 
                        @teacher{You can find students' images ahead of before class to save time, and use the @code{image-url} function to put them into a blank game file for each pair of students.}}
                 ]
         }

@lesson/studteach[#:title "Drawing the World"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will define draw-world, and hook it up to an event handler}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students write the @code{draw-world} function for their games}]
        #:standards (list "N-Q" "8.F.1-3" "F-IF.1-3" "BS-M" "BS-IDE" "BS-PL.3" "BS-DR.1" "BS-DS.1" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that we have our world structure, we need to know how to draw it. @activity[#:forevidence (list "BS-W&1&2")]{Which function is used to draw the world?} Just like the @code{draw-world} function in Ninja World, @code{draw-world} takes in a structure and produces an Image. 
    @activity[#:forevidence (list "N-Q&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1" "BS-M&1&1" "BS-DR.1&1&1" "BS-DR.1&1&2")]{@itemlist[@item{Turn to @worksheet-link[#:page 34 #:name "draw-world"] in your workbooks.}
                        @item{What is the Domain of this function? The Range?}
                        @item{At the top of @worksheet-link[#:page 34 #:name "draw-world"], write the contract, and fill in the function header for @code{draw-world}.}]}}
                        @teacher{}}

<<<<<<< HEAD
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
                                In this example, (line-length A) is 4 and (line-length B) is 3, but we still don't know C.}
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
                                 get to test it out on their own triangles. @management{draw the diagram on the board.}}
                        }
                @point{@student{@bitmap{images/csquared.png}For any right triangle, it is possible to draw a picture 
                                 where the hypotenuse is used for all four sides of a square. In the diagram shown 
                                 here, the white square is surrounded by four gray, identical right-triangles, each 
                                 with sides A and B. The square itself has four identical sides of length C, which 
                                 are the hypotenuses for the triangles. If the area of a square is expressed by 
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
                                                           into racket code at the bottom of the page, starting 
                                                           with @code{(EXAMPLE (distance 4 2 0 5) ...)}}]}
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
                                 lengths on the same axis (@code{(line-length px cx)} and @code{(line-length cx cy)}).
                                 Just like with making data structures, order matters, and the distance function will 
                                 not work otherwise. Also be sure to check that students are using @code{sq} and 
                                 @code{sqrt} in the correct places. }
                        }
                ]
=======
                @point{@student{Below the function header, we've gotten you started by using @code{put-image}, just like in Ninja World. Do you remember the contract for @code{put-image}? It takes in an image, the coordinates for where to put the image, and another image, on top of which the first image is placed.
@code[#:multi-line #t]{# put-image(Image, Number, Number, Image) -> Image
                       # Places the first image at the given x and y-coordinates on top of the second image}
                                        @activity[#:forevidence (list "BS-M&1&1" "BS-PL.3&1&1" "BS-DS.1&1&5" "BS-W&1&2")]{@itemlist[@item{Start out on the bottom of the page by putting one of your images onto the @code{BACKGROUND}.}
                                                            @item{If you wanted the image to be centered on the scene, what are the x- and y-coordinates you'll need? (Hint: how big is your background image?)}
                                                             @item{But you probably don't want your image to be at the center of the background. Look back at the sketches you made on @worksheet-link[#:page 31 #:name "Game Design"]. You made a note of which coordinates you wanted that image to be, placed on top of the background.}]}
                                        Start with something that looks like this, substituting YOUR image and coordinates (or dot-accessors):
@code[#:multi-line #t]{fun draw-world(current-world):
                          ...
                          ...
                          ...
                          put-image(IMAGE, 320, 240, BACKGROUND)
                       end}
Remember, if the position of these images will be changing (like the dog and coin moving across the screen in Ninja World), they won't always be placed at the same coordinates. Instead of using specific numbers in @code{put-image}, you can (and should!) use @vocab{dot-accessors} to access the coordinates of the characters in the world. Your own world struct will determine which dot-accessors you have available.

Here is an example of using @code{draw-world} in our Ninja World game, using @code{worldA}:
@code[#:multi-line #t]{draw-world(worldA) is put-image(NINJA-IMG, worldA.catX, worldA.catY,
                                                put-image(COIN-IMG, worldA.coinX, 300,
                                                    put-image(DOG-IMG, worldA.dogX, worldA.dogY,
                                                        put-image(CLOUD-IMG, 500, 400, BACKGROUND-IMG))))}
                                         @activity[#:forevidence (list "BS-M&1&1" "BS-IDE&1&1" "BS-IDE&1&2" "BS-PL.3&1&1" "BS-DS.1&1&5" "BS-W&1&2")]{@itemlist[@item{Place another one of your images on top of the one that your first @code{put-image} expression has created. (Remember: the range of @code{put-image} is an image, so you can use this expression as the image onto which you place your next character image.}
                                                              @item{Keep adding to it, until you have a stack of all of the images in your game.}
                                                              @item{When you finish, test out your function by typing @code{draw-world(worldA)} into the interactions area to see a screenshot of your game at the very beginning!}]}}

                                @teacher{Work with small groups to complete this section. Remind students that the order of images determines which game images appear above the others. (e.g. - "Does it make more sense to have the coin appear to be flying @italic{behind} the cloud, or in front of it?") When students finish writing @code{draw-world}, have them type it into their games, in the @code{# GRAPHICS} section.}}
                        ]
>>>>>>> pyret-bs2
         }

@lesson/studteach[#:title "Updating the World"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will define a simple next-world function, and hook it up to on-tick}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students write the @code{next-world} function for their games}]
        #:standards (list "N-Q" "7.EE.3-4" "F-LE.5" "8.F.1-3" "A-SSE.1-2" "BS-M" "BS-PL.3" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-DS.1" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Scroll down until you see @code{# UPDATING FUNCTIONS}. This code is responsible for changing the World automatically. 
                                @activity[#:forevidence (list "N-Q&1&1" "8.F.1-3&1&1" "BS-DR.1&1&1" "BS-W&1&1")]{What function should go here? What's in its Domain? Its Range?}
                                As you know, @code{next-world} takes a world, and then returns a new one that's been updated:
                                @code[#:multi-line #t]{next-world : World -> World}

            @activity[#:forevidence (list "7.EE.3-4&1&1" "F-LE.5&1&1" "A-SSE.1-2&1&1" "BS-M&1&1" "BS-PL.3&1&2" "BS-DR.2&1&1" "BS-DR.4&1&1" "BS-DS.1&1&5" "BS-W&1&1")]{@itemlist[@item{Look back at your world structure. What changes? Which of those fields change @italic{on their own}, and not in response to any user actions (like keypresses)?}
                                @item{On @worksheet-link[#:page 35 #:name "next-world"], make a list of what changed and how it changed as a purpose statement for writing @code{next-world}.}
                                @item{Write an example for @code{next-world} using the @code{worldA} you defined. Since the Range of @code{next-world} is a World, we know that we'll need to create a world using the @code{world} function. Use dot-accessors to show how the world changes.}
                                @item{Next, write one more example for @code{next-world} where you create a new world structure. What will your updated world look like?}]}
            Here are some examples for @code{next-world}, from the simple version of Ninja World:
            @code[#:multi-line #t]{examples:
                                         next-world(worldA) is world(worldA.dogX + 10, worldA.coinX - 5)
                                         next-world(worldB) is world(worldB.dogX + 10, worldB.coinX - 5)
                                   end}
            In the first example, we create a new World (using the @code{world} constructor function) by adding 10 to the @code{dogX} of @code{worldA}, and subtracting 5 from its @code{coinX}. 
            In the second example, we do the same thing, only with @code{worldB}. 

            @activity[#:forevidence (list "BS-DR.2&1&3" "BS-DR.3&1&1" "BS-DS.1&1&5" "BS-W&1&5")]{What changes between the two examples that @italic{you} wrote? Circle and label, then write the definition for your @code{next-world} function. Look back at its contract: what does the range tell you this function must return? A World!}
            }

                        @teacher{@code{next-world} is the function that will handle the logic of the student' games. It determines what changes from one second to the next, and updates the world accordingly. Make sure students are making a new world with @code{world}, and using their dot- accessors to change the value of each world field according to their game's behavior. This function will likely change drastically in the next few units (just like in Ninja World), and students start adding new functionality to their games. Work with small groups to complete this section as needed. When they are finished, have the students type @code{next-world} into their game files.}}
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
        @points[@point{@student{Now you have the basic shell of your videogame, with your character images placed onto the background and moving! However, we still haven't written any functions to take input from the user. If you want the  player to move, you'll need to write a @code{keypress} function, and if you want something to happen when the players collide, you'll need to write @code{distance} and @code{is-collision} functions. The next few units are all about working on your own games, using everything you learned from writing Ninja Cat!}
                               
                       @teacher{Have students show each other their their animated games! At this point in the course students will have very different games and world structures. The Ninja World games serve as templates and guides for what students should be adding to their games at each step, but most will require more individual attention to make their unique games behave the way they want.}
                       }
                 ]
         }
       }
