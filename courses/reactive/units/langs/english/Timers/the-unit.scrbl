#lang curr/lib

@title{Feature: Timers}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       )]{

@unit-descr{Students parameterize other parts of their game, so that the experience changes as a new data field, a timer, changes.
            This track delves deeper into conditionals and abstraction, offering students two possible uses for a timer feature, and a chance to customize their games further while applying those concepts.}
}
@unit-lessons{
@lesson/studteach[#:title "Adding a Splash Screen"
        #:duration "45 minutes"
        #:overview "Students learn how to add built-in instructions/a splash screen to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students add a second level (with a different background image) to NinjaCat}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Timers are a key component in many video games: players may need to reach a certain objective before time runs out, or keep from losing a game for longer and longer periods of time to reach a high score. In this feature, we’ll cover two possible uses of a timer in your game: adding a “splash screen” at the beginning to give instructions to the player, and adding a short animation when two characters collide.




                                
                                To start, we want @editor-link[#:public-id "0B9rKDmABYlJVVkpkTmEyd1ZTaE0" "our Ninja Cat game"] to have a}
                        @teacher{}
                        }
                 ]



                                
                                
         }

@lesson/studteach[#:title "Timer-based animations"
        #:duration "45 minutes"
        #:overview "Students learn how to add a collision animation to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students add a collision animation to NinjaCat}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{Make sure students have completed the "Collisions" feature before starting this lesson.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{ }
                        @teacher{}
                        }
                 ]
         }
       




       
       }