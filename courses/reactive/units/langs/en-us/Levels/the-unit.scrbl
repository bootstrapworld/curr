#lang curr/lib

@title{Feature: Adding Levels}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       )]{

@unit-descr{Students parameterize other parts of their game, so that the experience changes as the score increases.
            This track delves deeper into conditionals and abstraction, offering students a chance to customize their
            games further while applying those concepts.}
}
@unit-lessons{
@lesson/studteach[#:title "Leveling up: Adding Levels"
        #:duration "45 minutes"
        #:overview "Students learn how to add levels to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students add a second level (with a different background image) to NinjaCat}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{Make sure students have completed the "Scoring" feature before starting this lesson.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{You can add depth to your game by adding @italic{levels}. In this lesson, we'll cover making new levels based 
                                on the game's score. To start, we want @editor-link[#:public-id "0B9rKDmABYlJVVkpkTmEyd1ZTaE0" "our Ninja Cat game"] to have a 
                                different background image when the player progresses to the next level. We'll say that @bold{the player reaches level two 
                                when his or her score is greater than 250}.
                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1")]{
                                       Where do you define the @code{BACKGROUND-IMG} image in your game? Keep your original background for the first level, 
                                       but define a new variable, @code{BACKGROUND2-IMG}, that will be used for level 2. For the best results, use an image 
                                       that is the same size as your original background.} 
                               Once you have your second background image, it should be drawn into the game - but @italic{only} when a certain condition is met. 
                               Think back to the @vocab{helper function} we wrote to 
                               @(new-tab "../unit4/index.html#lesson_ColorfulSun6536" 
                                           "change the color of the sunset animation in Unit 4"), and we need to do the same thing here!
                                 @activity[#:forevidence (list "BS-M&1&1" "BS-R&1&4")]{
                                        @itemlist[@item{What must be true for the player to progress to level 2?}
                                                   @item{Write a function @code{draw-bg}, which consumes the score and produces the appropriate background image.}]}}
                         @teacher{}}
                 @point{@student{Now that we have our helper function, we can use it to draw of that one part of the animation. Instead
                                 of blindly putting @code{BACKGROUND-IMG} into our function, now we'll use @code{draw-bg(g.score)}:
@code[#:multi-line #t]{fun draw-state(g):
  put-image(text(
  string-append("NinjaCat! Score: ", num-to-string(g.score)), 
            20, "white"),
      310, 470,
      put-image(
      text("Use arrow keys to move. Jump on the dog & catch the ruby!", 
            12, "white"), 
        320, 450,
        put-image(PLAYER-IMG, g.playerx, g.playery,
          put-image(CLOUD-IMG, 150, 350,
            put-image(RUBY-IMG, g.targetx, g.targety, 
              put-image(DOG-IMG, g.dangerx, g.dangery, 
                draw-bg(g.score)))))))
  ...}}
                         @teacher{}}

                 @point{@student{Now our Ninja Cat game has a level 2! You can add more conditions to @code{draw-bg} to have multiple levels. You can use this
                                 same technique in lots of ways:
                                 @activity{
                                   @itemlist[@item{Write @code{draw-player} and change @code{draw-state} so that have the Player transform if the score is above 250.}
                                              @item{Change your animation functions so that your characters move faster if the score is above 250.}
                                               @item{Add a special key (jumping? firing? warping?) that is only "unlocked: if the score is above 250.}
                                             ]
                                           }}
                         
                         @teacher{}}
                 ]
         }
       }