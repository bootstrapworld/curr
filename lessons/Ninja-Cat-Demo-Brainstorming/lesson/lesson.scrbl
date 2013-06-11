#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Brainstorming"
     #:duration "15 minutes"
     #:overview "Students select the theme and characters for their videogame"
     #:learning-objectives @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{In workbooks, students complete the Videogame Design Worksheet}]
     #:standards @itemlist[@item{}
                            @item{}]
     #:materials @itemlist[@item{}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        
@points[
        @point{@student{On @worksheet-link[#:page 3 #:name "Elements-of-a-Videogame"], you'll find a planning template for you to make your own game. Just like we made a list of everything in the NinjaCat game, we're going to start with a list of everything in your games.}
                @teacher{@management{Put your names at the top of this page.}}
                }
         
        @point{@student{To start, your game will have with four things in it: 
                        @itemlist[
                                  @item{A Background, such as a forest, a city, space, etc.}
                                   @item{A Player, who can move when the user hits a key.}
                                   @item{A Target, which flies from the right to the left, and gives the player points for hitting it.}
                                   @item{A Danger, which flies from the right to the left, which the player must avoid.}]}
                @teacher{Have students walk through some sample themes, to make sure they understand the format of the game. For example: A football game might have a quarterback for the player, a rival player for the danger, and a football as the target. A jungle game might have a monkey as the player, a snake as the danger, and bananas as the target.}
                }
        
        @point{@student{@activity{Now it's time to get creative! Fill out @worksheet-link[#:page 3 #:name "Elements-of-a-Videogame"] in your workbook for @italic{your} game, using your own player, target and danger.}}
                @teacher{@management{Be sure to consult with every team. A lot of students will have trouble fitting their ideas into this format, or they'll struggle with coordinates. Be clear about what can and cannot be done! (e.g. - no 3d games, joysticks, multiplayer games, etc. Hint: students who have a well-worded description of their images will be happier with any images you could find them. Try searching for "Person" versus "Jogger", for example.}}
                }
        ]}
