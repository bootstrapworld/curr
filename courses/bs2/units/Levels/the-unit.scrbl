#lang curr/lib


@declare-tags[management]

@lesson/studteach[#:title "Leveling up: Adding Levels"
        #:duration "30 minutes"
        #:overview "Students learn how to add levels to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "A-CED.1-4" "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-W")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The "Scoring System" feature}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{You can add depth and more challenge to your game by adding levels. In this lesson, we'll cover making new levels based 
                                on the game's score. We want @editor-link[#:public-id "0B9rKDmABYlJVVkpkTmEyd1ZTaE0" "our Ninja Cat game"] to have a 
                                different background image when the player progresses to the next level. We'll say that the player reaches level two 
                                when his or her score is greater than 250.
                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1")]{
                                       Where do you define the @code{BACKGROUND-IMG} image in your game? Keep your original background for the first level, 
                                       but define a new variable, @code{BACKGROUND2-IMG}, that will be used for level 2. For the best results, use an image 
                                       that is the same size as your original background.} Once you have your second background image, it should be drawn 
                                                                                          into the game- but @bold{only} when a certain condition is met. 
                                 @activity[#:forevidence (list "BS-M&1&1" "BS-W&1&4")]{
                                        @itemlist[@item{What must be true for the player to progress to level 2?}
                                                   @item{Which function handles the way the game looks?}
                                                   @item{What is the only thing we want to change in level 2 of Ninja Cat?}]}}
                         @teacher{}}
                 @point{@student{The only thing we want to change in level 2 is the way the game @italic{looks}: specifically, the background image. 
                                 In Ninja Cat, @code{draw-state} is already a piecewise function because we want to draw the screen differently depending 
                                 on whether or not the game is over. You may need to change @italic{your} @code{draw-state} function so that it uses 
                                 @code{if}, if it's not already a piecewise function.
                         @activity[#:forevidence (list "A-CED.1-4&1&1" "BS-PL.4&1&1" "BS-W&1&5")]{
                              After checking whether or not the game is over, what is the next condition to check? (Hint: is the score large enough to progress to level 2?)}
@code[#:multi-line #t]{fun draw-state(g):
                           if g.score > 250: ......
                           ...
                           end
                       end}

                                 If this test evaluates to @code{true}, the result will look very similar to the code you already have for @code{draw-state}, 
                                 starting with @code{put-image(...)}. 
                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-DR.4&1&3" "BS-W&1&2" "BS-W&1&5")]{What is the one thing that needs to change?}
                                 Instead of putting all your images on top of @code{BACKGROUND-IMG}, you'll put them over @code{BACKGROUND2-IMG}, your new background image:
@code[#:multi-line #t]{fun draw-state(g):
                           if g.score > 250: 
    put-image(text(string-append("NinjaCat! Score: ", num-to-string(g.score)), 20, "white"),
      310, 470,
      put-image(text("Use arrow keys to move. Jump on the dog and catch the ruby!", 12, "white"), 
        320, 450,
        put-image(PLAYER-IMG, g.playerx, g.playery,
          put-image(CLOUD-IMG, 150, 350,
            put-image(RUBY-IMG, g.targetx, g.targety, 
              put-image(DOG-IMG, g.dangerx, g.dangery, 
                BACKGROUND2-IMG))))))
                           ...}}
                         @teacher{}}

                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-DR.4&1&3" "BS-W&1&2" "BS-W&1&5")]{
                                     Don't forget to add an @code{else} clause before your original code, right underneath what you just wrote. 
                                     If the score is @bold{not} greater than 250, the scene will be drawn with the images on the original background.}
              Now our Ninja Cat game has a level 2! You can use the same process to add more levels when the score gets even higher. In your own games, 
              you may want to display levels differently: Maybe instead of the background changing, once the player reaches a certain score, or has 
              played the game for a certain amount of time, your player image will transform, or the game becomes more difficult by making the danger 
              move faster.}
                         
                         @teacher{Some options for students who finish early: 
                                   @itemlist/splicing[@item{Change the next-state-tick function so that the dog and ruby move faster if the score 
                                                            is greater than 500.}
                                                      @item{Change the images of all the game characters when the player progresses to the next 
                                                            level.}
                                                        @item{@bold{Challenge:} Instead of writing similar code in @code{draw-state} over and over 
                                                               for each level, use abstraction: write a function that takes in the background image, 
                                                               and returns the game images placed on top of the given background. This function can 
                                                               then be called within @code{draw-state} with the appropriate background image when the
                                                               player reaches each level.}]}}
                 ]
         }