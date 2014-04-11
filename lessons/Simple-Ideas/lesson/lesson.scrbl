#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Going further" 
     #:duration ": flexible"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list )
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "collide?")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{Now that you've finished your game, here are some other things you can add to make it more exciting:
                     @itemlist[@item{Some people prefer to use the "WASD" keys for movement, instead of the arrow keys. 
                                     Add these to @code{update-player}, so that either set will work.}
                                @item{After you have implemented @code{Posn}s, add keys for diagonal movement.}
                                @item{Use @code{and} inside @code{update-player}, so that the player will only move up if its y-coordinate is less than 480.
                                      Do the same for downward motion.}
                                @item{Add a "Safe Zone": put a green box or green shading somewhere on the background, then change @code{collide?}
 so that a player only collides if the player touches a danger AND they are not inside the zone.}
                                @item{If you've already added 2-dimensional movement using Posns, try making the y-coordinate of your danger change
                                      @italic{as a function of x}. You can move in a wave pattern by using @code{sin} and @code{cos}!}]
                     }
             @teacher{The last item on this list has connections to trigonometry: if the y-coordinate is detemined by @math{sin(x)}, for example, 
                      the character will bob up and down, following the sine wave. Students can practice drawing "flight paths" using a graphing
                      calculator, then enter those functions into their game!}
             }]
   }