#lang curr/lib

@title{Unit 1: An Example Unit}


@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Introduction"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1USFPXkeO5AbGOzm_U0tMv4NV3RrxTMTyg-bqIKUf4q4/edit?usp=sharing" "Warmup activity sheet").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                
             @point{@student[ #:title "Title only visible in slide mode"]{Student-visible curriculum notes, on the website. @slideText{this is used to clarify points, in slide mode}}
                     @teacher{Notes for the Teacher}
                     }

                   @point{@student[#:skipSlide? #t]{this is tagged to skip when in slide mode}
                     @teacher{more Notes for the Teacher}
                     }
              ]
         }

@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
        @points[@point{@student{You've done a lot in this first unit! @slidebreak A whole lot! 
                                @itemlist[@item{This is used to give a recap. all units have a closing section as well as an Introduction}]
                        In the next unit, we'll begin writing programs for more interesting things than just arithmetic.}
                        @teacher{even more teacher notes}}
               ]
         }
}

