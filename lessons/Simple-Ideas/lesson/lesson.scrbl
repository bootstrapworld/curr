#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Simple Ideas, Easter Eggs, and Advanced Challenges" 
     #:duration "variable"
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
                     @itemlist[@item{Some people prefer to use the "WASD" keys for movement, instead of the arrow keys. Add these to @code{update-player}, so that either set will work.}
                                @item{Add keys for diagonal movement.}
                                @item{Use @code{cond} to have the target or danger change speed, based on the current coordinates. (For example, your danger can move quickly when x>320, and then slow down on the left side of the screen.)}
                                @item{Add a "Safe Zone": put a green box or green shading somewhere on the background, then change @code{collide?}
 so that a player only collides if the player touches a danger AND they are not inside the zone.}
                                @item{If you've already added 2-dimensional movement using Posns, try making the y-coordinate of your danger change @italic{as a function of x}. You can move in a wave pattern by using @code{sin} and @code{cos}!}]
                     }
             @teacher{}
             }]
   }