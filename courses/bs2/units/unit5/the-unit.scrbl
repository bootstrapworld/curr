#lang curr/lib

@title{Unit 5: Building your World}

@declare-tags[management]

@overview{
    
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
                            @item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{Clear plastic sheet protectors: put pages 20 & 21 at the front of the workbook for ease of reference}
                             @item{The Ninja World 3 file [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=XfXGclYj1F" "WeScheme")] preloaded on students' machines}
                             @item{BS:2 Blank Game Template [GameTemplate.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=ZcK2dqANbT" "WeScheme")] preloaded on students' machines with student images included.}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Open the @(hyperlink "http://www.wescheme.org/view?publicId=XfXGclYj1F" "Ninja World") file, and look at the @code{world} defined at the top.
            @itemlist[@item{How many things are in this world? What are they?}
                      @item{What does @code{dogX} represent? @code{rubyX}? @bitmap{images/gameimage.png}}
                      @item{What function makes a world?}
                      @item{Scroll down a bit in the code. What function updates the world?}
                      @item{What function draws the world?}
                      @item{How fast is the dog moving from left to right? How fast is the ruby moving right to left across the screen?}
                      @item{Now turn to @worksheet-link[#:page 21 #:name "Game Design"] in your workbook. What are the things in your world? What datatypes are they?}]}}
                        @teacher{Go to each pair of students, making sure that everyone can list the names and types of everything in their world struct, as well as answering some questions about accessor functions (How do you get the alien's speed out of the world?).}}
                 
                 @point{@student{Now it's time to start programming YOUR videogame. @activity{Open the @(hyperlink "http://www.wescheme.org/view?publicId=ZcK2dqANbT" "BS:2 blank game file").} In Bootstrap 1, you started with the shell of a game, with some sample images and functions defined. In this class the game template is just a collection of comments, telling you how to organize your functions and variables. You'll be writing every line of code yourself! Let's begin: @activity{At the top of the file, where it says @code{;; The World is a:}, define the world struct for your game. (Check @worksheet-link[#:page 21 #:name "Game Design"] to jog your memory!) Once you have the world struct, scroll down to where it says @code{;; STARTING WORLD} and define your first example world: name it @code{START}.}}
                         @teacher{}}
                 
                 @point{@student{So now you have your world, and you know what's in it: but what do those things look like? You'll have to add some images. Do you remember the @code{bitmap/url} function from Bootstrap one? It takes in the URL of any image online (given as a string) and returns that image. @code{; bitmap/url : String -> Image}
@activity{@itemlist[@item{Look back at @worksheet-link[#:page 20 #:name "Game Design"] in your workbook. how many things in your game will need their own image?}
                    @item{Using Google Image Search or a similar tool, find images for each of the characters in your game. Don't forget the background!}
                    @item{Define a new variable for each image, (i.e. @code{PLAYER}, @code{DANGER}, etc. and use the @code{bitmap/url} function to put them into your game file.}]}

Some hints for finding images: Your images should be in PNG or GIF format, and the url should contain the file type (i.e. .png or .gif) at the end. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds! TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with.} 
                        @teacher{If timing is an issue, find students' images ahead of time and use the @code{bitmap/url} function to put them into a blank game file for each pair of students.}}
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
        @points[@point{@student{Now that we've got our world structure, we need to know how to draw it. @activity{Turn to  @worksheet-link[#:page 23 #:name "Drawing START"], and fill in your @code{START} world at the bottom. @itemlist[@item{According to your world struct, where should everything be when the game starts?}
                                            @item{Draw a simple sketch of your @code{START} world in the space provided.}]}
The next thing to decide is what order the images need to go in. We know we have to stack images, so you're going to have to use @code{put-image}. @activity{What is the contract for @code{put-image}? What does the first image represent? The numbers? The last image?}
In the chart on @worksheet-link[#:page 23 #:name "Drawing START"], figure out which image goes on top, which goes second, and so on. @activity{Make a list from top to bottom in the left column, and then write each image's coordinates in the right column.}
Let's set up one more example, so that when you get into writing your function that draws the world, you're ready to go. On @worksheet-link[#:page 24 #:name "Drawing NEXT"] there's a nearly identical page. You've already written a @code{START} world, which has everything where it will be when the game starts. Now do the same for a world called @code{NEXT}. This world is where everything is ONE SECOND after the game starts. @activity{@itemlist[@item{Fill in the world struct, and sketch the NEXT world.}
                                           @item{Now put the images in the same order as the @code{START} world (we don't want them to be switching around in the middle of the game!) and write the NEW coordinates beside them.}]}}
                        @teacher{}}
                        @point{@student{@activity{Which function is used to draw the world?} Just like @code{draw-auto}, and the @code{draw-world} function in Ninja World, @code{draw-world} takes in a struct and produces an Image. @activity{@itemlist[@item{What is the Domain of this function? The Range?}
                                                  @item{At the top of @worksheet-link[#:page 25 #:name "draw-world"], write the contract for @code{draw-world}.}
                     @item{What is the name of this function? What's in its domain? What would be a good variable name?}
                     @item{Fill in the first line of @code{draw-world}.}]}
Below the first line, there is a sort of 'staircase' pattern using @code{put-image}, just like in Ninja World. Do you remember the contract for @code{put-image}? It takes in an image, the coordinates of where to put the image, and another image, on top of which the first image is placed.
@activity{@itemlist[@item{Start out on the bottom of this 'staircase' by putting one of your images onto the background.}
                    @item{If you wanted the image to be centered on the scene, what are the x- and y-coordinates you'll need?}
                    @item{But you probably don't want your image to be at the center of the background. Look back at your @code{START} world picture a couple of pages back. You made a note of which coordinates you want that image to be on, above the background!}]}
Start with something that looks like this, substituting YOUR image and coordinates:
@code[#:multi-line #t]{(put-image IMAGE
                                  320 240
                                  BACKGROUND)}
@activity{Now add another one of the images from your world.}
Remember, you're placing another image on top of the one that this staircase has already created! @activity{Keep adding to it, until you have a stack of all of the images in your game.}}
                                @teacher{Work with small groups to complete this section. When students finish writing draw-world, have them type their NEXT world and draw-world into their games, in the @code{;; GRAPHICS} section. If they type @code{(draw-world START)} into the interactions window, they can see a screenshot of their game.}}
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
        @points[@point{@student{Scroll down to where it says @code{;; UPDATING FUNCTIONS}. This code is responsible for changing the World. @activity{What function do you see here? What's in its Domain? Its Range?}
@code{update-world} takes a world, and then returns a new one that's been updated. Think of this function as the one that generates the next page of a flipbook.
            @activity{@itemlist[@item{Look back at the difference between your @code{START} and @code{NEXT} worlds - what has changed?}
                                @item{On @worksheet-link[#:page 26 #:name "update-world"], make a list of what changed and how it changed as a problem statement for writing @code{update-world}, using the design recipe. Be sure to fill out the @vocab{Contract} and two EXAMPLEs before defining the function!}]}}
                        @teacher{Work with small groups to complete this section as needed. Upon completion, have students type update-world into their games.}}
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
        @points[@point{@student{Now you have the basic shell of your videogame, with your character images placed onto the background and moving. However, we still haven't written any functions to take in player input! If you want the player's character to move, you'll need to learn about how to make the game respond to keypresses, which is what we'll learn in the next unit.}         
                       @teacher{Have students show each other their their animated games! @management{At this point in the course students will have very different games and world structures. The Ninja World examples serve as templates and guides for what students should be adding to their games at each step, but most will require a lot of individual attention to make their unique games behave the way they want.}}
                       }
                 ]
         }
       }