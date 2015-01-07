#lang curr/lib

@title{Unit 5: Building your World}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{After thinking about their World, students practice building, drawing and animating it.}
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
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{Clear plastic sheet protectors: put pages 20 & 21 at the front of the workbook for ease of reference}
                             @item{The Ninja World 3 file [NW3.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "t77yPXKDWs" "WeScheme"] preloaded on students' machines}
                             @item{BS:2 Blank Game Template [GameTemplate.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "ZcK2dqANbT" "WeScheme"] preloaded on students' machines with student images included.}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Open the @editor-link[#:public-id "t77yPXKDWs" "Ninja World"] file, and look 
                                          at the @code{world} defined at the top.
            @itemlist[@item{How many things are in this world? What are they?}
                      @item{What does @code{dogX} represent? @code{rubyX}? @bitmap{images/gameimage.png}}
                      @item{What function makes a world?}
                      @item{Scroll down a bit in the code. What function updates the world?}
                      @item{What function draws the world?}
                      @item{How fast is the dog moving from left to right? How fast is the ruby moving right to left across the screen?}
                      @item{Now turn to @worksheet-link[#:page 21 #:name "Game Design"] in your workbook. What are the things in your world? What datatypes are they?}]}}
                        @teacher{Make sure that all students can list the names and types of everything in the @code{world} struct. In addition,
                                 make sure they can answer some questions about accessor functions, such as "how do you get the alien's speed out of
                                 the world?"}}
                 
                 @point{@student{Now it's time to start programming YOUR videogame. 
                                 @activity{Open the @editor-link[#:public-id "ZcK2dqANbT" "BS:2 blank game file"].} In Bootstrap 1,
                                 you started with the shell of a game, with some sample images and functions defined. In this class the game template is just
                                 a collection of comments, telling you how to organize your functions and variables. You'll be writing @italic{every line} of 
                                 code yourself. Let's begin: 
                                 @activity{At the top of the file, where it says @code{# The World is a:}, define the world struct for your game. 
                                          (Check @worksheet-link[#:page 21 #:name "Game Design"] to jog your memory.) Once you have the world struct, scroll 
                                          down to where it says @code{# STARTING WORLD} and define your first example world: name it @code{START}.}}
                         @teacher{}}
                 
                 @point{@student{So now you have your world, and you know what's in it: but what do those things look like? You'll have to add some images.
                                 We'll use the @code{image-url} function. It takes in the URL of any image online(given as a string), and returns that
                                 image. @code{fun image-url(url :: String) -> Image}
                                 @activity{@itemlist[@item{Look back at @worksheet-link[#:page 20 #:name "Game Design"] in your workbook. How many things 
                                                           in your game will need their own image?}
                                                      @item{Using Google Image Search or a similar tool, find images for the background and for each of 
                                                            the characters in your game.}
                                                      @item{Define a new variables for your images, (i.e. @code{PLAYER}, @code{DANGER}, etc.) and use
                                                            the @code{image-url} function to put them into your game file.}]}
                                 Some hints for finding images: Your images should be in PNG or GIF format, and the url should contain the file type
                                 (i.e. .png or .gif) at the end. Background images should be 640x480, and character images should generally be no 
                                 larger than 200px in either dimension. Make sure that the character images have transparent backgrounds! TIP: use 
                                 animated GIFs for the characters - not only does the animation make the game look a lot better, but these images 
                                 usually have transparent backgrounds to begin with.} 
                        @teacher{Find students' images ahead of before class to save time, and use the @code{image-url} function to put them into a 
                                  blank game file for each pair of students.}}
                 ]
         }

@lesson/studteach[#:title "Drawing the World"
        #:duration "40 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will define draw-world, and hook it up to an event handler}]
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
        @points[@point{@student{Now that we have our world structure, we need to know how to draw it. 
                                @activity{Turn to  @worksheet-link[#:page 23 #:name "Drawing START"], and fill in your @code{START} world at the bottom.
                                                   @itemlist[@item{According to your world struct, where should everything be when the game starts?}
                                                              @item{Draw a simple sketch of your @code{START} world in the space provided.}]}
                                Next put your images in order. We know we have to stack images, so you're going to have to use @code{put-image}. 
                                @activity{Using the chart on @worksheet-link[#:page 23 #:name "Drawing START"], figure out which image goes on top,
                                                          which goes second, and so on. Make a list from top to bottom in the column on the left. 
                                                          Then write each image's coordinates in the right column.}}
                        @teacher{}}
                 @point{@student{Let's set up one more example. This will help when you begin writing your function that draws the world, you're ready to 
                                go. On @worksheet-link[#:page 24 #:name "Drawing NEXT"] there's a page nearly identical to page 23. You've already written a 
                                @code{START} world, which has everything where it will be when the game starts. Now do the same for a world called
                                @code{NEXT}. This world represents the game in the NEXT FRAME after START.
                                @activity{@itemlist[@item{Fill in the world struct, and sketch the @code{NEXT} world.}
                                                     @item{Now put the images in the same order as in the @code{START} world. (We don't want them to 
                                                           be switching around in the middle of the game!) Then write the NEW coordinates beside them.}]}}
                        @teacher{These workbook pages help students organize their thinking before writing their own @code{draw-world} function. The order of
                                 images determines which game images appear above the others. (Does it make more sense to have the ruby appear to be flying 
                                 @italic{behind} the cloud, or in front of it?)}}
                 
                        @point{@student{@activity{Which function is used to draw the world?} Just like @code{draw-auto}, and the @code{draw-world} 
                                         function in Ninja World, @code{draw-world} takes in a struct and produces an Image. 
                                         @activity{@itemlist[@item{What is the Domain of this function? The Range?}
                                                              @item{At the top of @worksheet-link[#:page 25 #:name "draw-world"], write the
                                                                    contract for @code{draw-world}.}
                                                              @item{Fill in the function header for @code{draw-world}.}]}}
                                @teacher{}}
                        @point{@student{Below the function header, there is a sort of 'staircase' pattern using @code{put-image}, just like in 
                                         Ninja World. Do you remember the contract for @code{put-image}? It takes in an image, the coordinates for 
                                         where to put the image, and another image, on top of which the first image is placed.
@code[#:multi-line #t]{fun put-image(img1 :: Image, x :: Number, y :: Number, img2 :: Image) -> Image:
                           doc: "Places the first image at the given x and y-coordinates on top of the second image."}
                                        @activity{@itemlist[@item{Start out on the bottom of this 'staircase' by putting one of your
                                                                  images onto the background.}
                                                             @item{If you wanted the image to be centered on the scene, what are the x- and 
                                                                   y-coordinates you'll need?}
                                                             @item{But you probably don't want your image to be at the center of the background.
                                                                   Look back at your @code{START} world picture. You made a note of which
                                                                   coordinates where you wanted that image to be, laid on top of the background.}]}
                                        Start with something that looks like this, substituting YOUR image and coordinates:
@code[#:multi-line #t]{put-image(IMAGE, 320, 240, BACKGROUND)}
                                         @activity{@itemlist[@item{Place another one of your images on top of the one that this 
                                                                   staircase-shaped expression has created.}
                                                              @item{Keep adding to it, until you have a stack of all of the images in your game.}]}
}
                                @teacher{Work with small groups to complete this section. When students finish writing draw-world, have them type their 
                                         NEXT world and draw-world into their games, in the @code{# GRAPHICS} section. If they type @code{draw-world(START)}
                                         into the interactions window, they can see a screenshot of their games.}}
                        ]
         }

@lesson/studteach[#:title "Updating the World"
        #:duration "40 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will define a simple update-world function, and hook it up to on-tick}]
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
        @points[@point{@student{Scroll down until you see @code{# UPDATING FUNCTIONS}. This code is responsible for changing the World. 
                                @activity{What function do you see here? What's in its Domain? Its Range?}
                                @code{update-world} takes a world, and then returns a new one that's been updated. Think of this function 
                                as the one that generates the next page of a flipbook.
            @activity{@itemlist[@item{Look back at the difference between your @code{START} and @code{NEXT} worlds. What has changed?}
                                @item{On @worksheet-link[#:page 26 #:name "update-world"], make a list of what changed and how it changed
                                         as a problem statement for writing @code{update-world}, using the design recipe. Be sure to fill
                                         out the @vocab{Contract} and two test cases before defining the function.}]}}
                        @teacher{@code{update-world} is the function that will handle the logic of the student' games. It determines what changes
                                 from one second to the next, and updates the world accordingly. Make sure students are making a new world with
                                 @code{world}, and using their accessor functions to change the values of each world fields according to 
                                 their game's behavior. @management{Work with small groups to complete this section as needed. When they are
                                 finished, have the students type @code{update-world} into their games.}}}
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
        @points[@point{@student{Now you have the basic shell of your videogame, with your character-images placed onto the background 
                                and moving. However, we still haven't written any functions to take input from the user. If you want the 
                                PLAYER to move, you'll need to learn about how to make the game respond to keypresses, 
                                which is what you'll learn in the next unit.}         
                       @teacher{Have students show each other their their animated games! @management{At this point in the course 
                                students will have very different games and world structures. The Ninja World examples serve as templates
                                and guides for what students should be adding to their games at each step, but most will require a 
                                lot of individual attention to make their unique games behave the way they want.}}
                       }
                 ]
         }
       }