#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "More Dissection"
     #:duration "10 minutes"
     #:overview "Students further refine the data model for a sample game"
     #:learning-objectives @itemlist[@item{Model a simple system}]
     #:product-outcomes @itemlist[@item{In workbooks, students create a data model that describes a simple videogame}]
     #:standards @itemlist[@item{MP.1: Make sense of problems and persevere in solving them}
                            @item{MP.7: Look for and make use of structure}]
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        @points[
                @point{@student{Depending on how a character moves, their position might change only along the x-axis, only along the y-axis, or both. Look back to the table you wrote in the workbook (@worksheet-link[#:page 1 #:lesson "Ninja-Cat-Demo" #:name "How-Does-Ninja-Cat-Work"]). Can NinjaCat move up and down in the game? Can she move left and right? So what's changing: her x-coordinate, her y-coordinate, or both? What about the clouds? Do they move up and down? Left and right? Both?}
                       @teacher{@management{}}
                 }
                 
                @point{@student{Fill in the rest of the table, identifying what is changing for each of your characters}
                       @teacher{@management{}}
                 }
                
                @point{@student{Turn to @worksheet-link[#:page 2 #:name "Ninja-Cat-Coordinates"] in your game planning workbook, and look at the project sheet that has a picture of the NinjaCat game. What are the coordinates at the bottom-left corner of the screen? Top-right? Center? }
                       @teacher{@management{}}
                 }
                
                @point{@student{For practice, label the coordinates at the midpoint of @italic{each side} of the screen.}
                       @teacher{@management{}}
                 }
                
                @point{@student{Label the coordinates of each of the characters.)}
                       @teacher{@management{}}
                 }
               
                ]
         }

