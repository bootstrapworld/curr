#lang curr/lib

@title{Unit 9: User Interaction and Complex next-world in Your Game}
@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < string-equal and or}))]{  
@unit-descr{Using the same techniques as their Ninja Cat games, students will return to piecewise functions to write a function to make their own games respond to keypresses, and identify ways in which their own world structure will change without user input.}
 }

@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "8.F.5" "A-SSE.1-2" "BS-M" "BS-DS.1")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}
                            ]
        #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Your games are really coming together! At this point you have the basic shell of your video game, along with basic animation. The next steps are things you've already programmed in your Ninja Cat game: keypresses, and a more complex version of @code{next-world}, like identifying the boundaries of your game screen, or adding randomization.
@activity[#:forevidence (list "N-Q&1&1" "8.F.5&1&1" "A-SSE.1-2&1&1" "BS-M&1&1" "BS-DS.1&1&5")]{Turn to @worksheet-link[#:page 37 #:name "Unit 9"] in your workbook. Choose which keys will control your game, and list them on the left-hand column of the table. Fill in the rest of the table by stating which part of the world will change in response to that key (be sure to use the dot-accessor!), and @italic{how} that part of th world will change. Will the player move by 10, or 20 pixels? Will the direction of the dange change?}} 
                       @teacher{Make sure students are specific in this activity: Have them identify the dot-accessor they'll need to use to change the world structure, and exactly how their world will change. This will make the next step much easier.}}
           ]
         }
       
       
@lesson/studteach[#:title "Keypresses in Your Game"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Using conditionals, students will write a function to handle different keypresses in their game.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "8.F.1-3" "F-IF.1-3" "F-LE.5" "A-SSE.1-2" "BS-M" "BS-IDE" "BS-PL.2" "BS-PL.3" "BS-PL.4" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-DS.1" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now it's time to program YOUR game to respond to keypresses. 
                                @activity[#:forevidence (list "N-Q&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1" "F-LE.5&1&1" "A-SSE.1-2&1&1" "BS-M&1&1" "BS-IDE&1&1" "BS-PL.2&1&1" "BS-PL.3&1&2" "BS-PL.3&1&3" "BS-PL.4&1&1" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "BS-DR.4&1&1" "BS-DR.4&1&2" "BS-DR.4&1&3" "BS-DS.1&1&5" "BS-W&1&5")]{Turn to @worksheet-link[#:page 38 #:name "Keypress-in-Game"] in your workbook. Choose 3 keys will control your game, and go through the Design Recipe: Write test cases for what should happen to @code{worldA} depending on which key was pressed. Then define your function. Once you've completed the Design Recipe, type everything into your games.}

Of course, keypresses can do a lot more in a videogame than just move a character up and down. By using what your learned about Boolean functions, you can add more advanced movement. Here are some ideas:
@itemlist[
          @item{@bold{Warping:} instead of having the player’s y-coordinate change by adding or subtracting, replace it with a Number to have the player suddenly appear at that location. (For example, hitting the @code{"c"} key causes your player to warp back to the center of the screen, at 240.)}
          @item{@bold{Boundary-detection:} Change the condition for moving up so that the player only moves up if @code{key} = @code{"up"} AND the player's y-coordinate is less than the top of the screen. Likewise, change the condition for @code{"down"} to also check that the player's y-coordinate is greater than 0. @bold{Hint:} In Bootstrap:1, everyone's game screen was 640x480.
                 In Bootstrap:2, the size of your game screen is determined by the size of your background image. To find out exactly how large your image is, you can use the following functions to get the dimensions of your background: 
                 @code[#:multi-line #t]{# image-height : Image -> Number
                                        # image-width : Image -> Number}
                 }
          @item{@bold{Wrapping:} Add a condition (before any of the keys) that checks to see if the player’s y-coordinate is above the screen. If it is, have the player warp to the bottom. Add another condition so that the player warps back up to the top of the screen if it moves below the bottom.}
          @item{@bold{Challenge:} Have a character hide when the @code{"h"} key is pressed, only to re-appear @italic{at the same location} when it is pressed again.}]
}
                         @teacher{Hint for the challenge: What operation reverses itself when done twice?}}
                 ]
         }   


@lesson/studteach[#:title "Tests and Results"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use @code{ask} in their next-world functions}
                                     @item{Students will identify circumstances in which the functions in their game should behave differently}
          @item{Students will define these circumstances - and the desired behavior - in code, as different @code{ask} branches}]
        #:standards (list "N-Q" "7.EE.3-4" "F-IF.1-3" "F-LE.5" "A-SSE.1-2" "A-CED.1-4" "BS-M" "BS-PL.3" "BS-PL.4" "BS-DS.1")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now to use what you know about boundary detection and apply it to your own game! 
                                @activity[#:forevidence (list "N-Q&1&1" "7.EE.3-4&1&1" "F-IF.1-3&1&1" "F-LE.5&1&1" "A-SSE.1-2&1&1" "A-CED.1-4&1&1" "BS-M&1&1" "BS-PL.3&1&1" "BS-PL.3&1&3" "BS-PL.4&1&1" "BS-DS.1&1&5")]{@itemlist[@item{Open your workbook to @worksheet-link[#:page 42 #:name "Test and Result"].}
                                                    @item{Think about the things in your game that make the world change. Do characters fly off the left side of the screen? The right? The top or bottom? Do you need to  write an @code{off-top} function or @code{off-bottom}? Maybe something happens when the player achieves a high score, or the player's health reaches 0.}
                                                     @item{In the lefthand column of @worksheet-link[#:page 42 #:name "Test and Result"], make a list of the questions (in Pyret!) you will need to @code{ask} the world. For example, with the dog we said @code{is-off-right(current-world.dogX)} to ask if the dog was off the right side of the screen. On the right, figure out which world you need to make, if your question returns @code{true}.}]}}
                        @teacher{Some examples of game states students may want to test for: 
                                 @itemlist[@item{Gravity: the player constantly moves down, until her y-coordinate is 50, placing her at the bottom of the screen. (This coordinate will probably be adjusted based on the size of the @code{PLAYER-IMG} image.)}
          @item{The player destroys the alien/shark/bad guy by firing an arrow/laser/other projectile: An element of the world cannot be taken @italic{out} of the world struct, but its locaton can be changed so that it no longer appears on the screen. If the @code{DOG-IMG} has been set to a certain coordinate and has been "destroyed", should it continue to move normally?}
          @item{After reaching a certain score, the background image changes, and the player reaches "Level 2". (Note: changing the background image is handled by the @code{draw-world} function. This can be a piecewise function just like @code{next-world}! Students who want to change the apprearance of their game should turn to @worksheet-link[#:page 44 #:name "Test and Result in draw-world"] and make a list of the questions to ask inside @code{draw-world} to change the image(s) in their game.} ]
         }
                        }
                 ]
         }
                                 
@lesson/studteach[#:title "Branches in next-world"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "7.EE.3-4" "8.F.1-3" "F-IF.1-3" "F-LE.5" "A-SSE.1-2" "A-CED.1-4" "BS-M" "BS-PL.4" "BS-DR.2" "BS-DR.4" "BS-DS.1" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Think about the @code{ask} branches in Ninja World's @code{next-world} function. Remember that for each @code{ask}, we needed a test and a result. This is exactly what you've written in your workbook for your game. All you need to do now is reformat @italic{your} @code{next-world} function so that it uses @code{ask}, with your current code inside the @code{otherwise} clause.
@activity[#:forevidence (list "N-Q&1&1" "7.EE.3-4&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1" "F-LE.5&1&1" "A-SSE.1-2&1&1" "A-CED.1-4&1&1" "BS-M&1&1" "BS-PL.4&1&1" "BS-DR.2&1&1" "BS-DR.4&1&1" "BS-DR.4&1&2" "BS-DR.4&1&3" "BS-DS.1&1&5" "BS-W&1&1" "BS-W&1&5")]{Adapt @code{next-world} so it becomes a @vocab{piecewise function}, and use at least one helper function on your list from @worksheet-link[#:page 42 #:name "Test and Result"].}}
                        @teacher{Work in pairs or small groups to assist students with their own @code{next-world} functions.}}
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
        @points[@point{@student{You started from scratch, and now have a working videogame! You probably have at least a few more things to add, which we'll work on in the next unit!}
                        @teacher{Have students show each other their nearly completed games!}}
                 ]
         }
       }
                                 
                        
       
   
          