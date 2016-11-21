#lang curr/lib

@declare-tags[management]

@lesson/studteach[#:title "Scoring and Levels"
        #:duration "35 minutes"
        #:overview "Students learn how to add a scoring system and levels to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "A-SSE.1-2" "A-CED.1-4" "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.2" "BS-PL.3" "BS-PL.4" "BS-DR.4" "BS-DS.1" "BS-DS.2" "BS-W")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In Bootstrap:1, the scoring system for your video game was included in the teachpack, code which ran "under the hood" in your game file. In Bootstrap:2, however, you no longer need this hidden code, since you've learned enough to program your entire Bootstrap:1 game (and more) yourself! In this lesson, we'll cover how to add a scoring system and different levels to your Bootstrap:2 game.}
                        
                        @teacher{This lesson is part of a series of "tracks" meant to come at the end of the Bootstrap:2 units. Once students have made a number of simple animations and games, they will have @italic{lots} of ideas for what they want to make next and add to their existing games. We've included a number of the most requested features in these lessons. Because each students' game will be different, we've used a Pyret version of the original Ninja Cat game as an example program, but the lesson can be adapted to add scoring to any game.}}

                 @point{@student{The score is something that will be changing in the game, so you can be sure that it has to be added to the @code{____State} data structure. In our example Ninja Cat program, we've called our structure @code{GameState}, which currently contains the x and y-coordinates for our player, danger, and target, plus the speed of the danger, and speed of the target. Your game(s) will likely have different structures.
                               @activity[#:forevidence (list "N-Q&1&1" "BS-M&1&2" "BS-DS.2&1&3")]{@itemlist[@item{What data type is a score? Number, String, Image, or Boolean?}
                                                      @item{What would be the score in your starting game state? (we called this @code{START} in our game.)}
                                                      @item{Change the data structure in your game so it includes a @code{score}.}]}
                               Remember: Since your structure is changing, you now have to go through your game code- @italic{every time} you call the constructor function for your structure (ours is @code{game()}), the score must be included. It may be helpful to add the score as the very first or last field of the structure, to make this easier. @activity[#:forevidence (list "BS-DS.1&1&5")]{How would you get the @code{score} out of one of your instances?}
   The @code{GameState} structure for our Ninja Cat game now looks like this:
      @code[#:multi-line #t]{data GameState:
    game(
      playerx :: Number, 
      playery :: Number,
      dangerx :: Number, 
      dangery :: Number, 
      dangerspeed :: Number, 
      targetx :: Number, 
      targety :: Number, 
      targetspeed :: Number,
      score :: Number)
end
}}
                         @teacher{@bold{Reminder:} Your students will likely have radically different games at this point in the course. This lesson is not meant to be followed exactly, but rather used to give students an idea of what steps they should take to add a scoring system to their own games. For extra practice, students can work through adding a scoring system to the Ninja Cat program as well as their own games.}}

                 @point{@student{Now that the game has a score, that score needs to actually increase or decrease. For our Ninja Cat game, we'll say that the score should go up by 30 points when Ninja Cat collides with the ruby (target), and down by 20 points when she collides with the dog (danger).
                                 @activity[#:forevidence (list "A-SSE.1-2&1&1" "BS-M&1&1" "BS-PL.3&1&1" "BS-PL.4&1&1" "BS-DR.4&1&1" "BS-DS.1&1&5" "BS-W&1&1")]{@itemlist[@item{Which of the @code{if} branches in your @code{next-state-tick} function checks whether your player has collided with another character?}
                                                                 @item{How would you decrease the game's @code{score} by 20 points if the player collides with the danger?}
                                                                 @item{@bold{Hint:} How many dangers does your game have? If there are multiple things your player could hit to lose points, remember to check for each possible collision condition!}]}
                                 After checking whether our game over condition is met (more on this shortly), the next three conditions in our @code{next-state-tick} function check whether the player has collided with the danger and target, as well as whether the player is jumping on the danger:

@code[#:multi-line #t]{# next-state-tick : GameState -> GameState
fun next-state-tick(g):
  if game-over(g): g
    # if player and danger collide while player is on the ground, reset player and danger and decrease score
  else if is-collision(g.playerx, g.playery, g.dangerx, g.dangery) and (g.playery < 110): 
    game(START.playerx, START.playery, 750, g.dangery, g.dangerspeed, g.targetx, g.targety, g.targetspeed, g.score - 20)
    # if player and danger collide while player is jumping, reset danger and increase score
  else if is-collision(g.playerx, g.playery, g.dangerx, g.dangery) and (g.playery > 110) and (g.playery < 300):
      game(g.playerx, 200, -100, 0, 0, g.targetx, g.targety, g.targetspeed, g.score + 30)  
    # if player and target collide, reset target and increase score
  else if is-collision(g.playerx, g.playery, g.targetx, g.targety):
      game(g.playerx, g.playery, g.dangerx, g.dangery, g.dangerspeed, -400, 0, 0, g.score + 30)}

                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-DR.4&1&3" "BS-DS.1&1&5" "BS-W&1&5")]{Change your own game code so that your score increases and decreases depending on various game conditions: Maybe your score increases when the player collides with a target, reaches a specific area of the screen, or reaches a specific area @italic{only after} picking up an item. Maybe your game's scoring system isn't a seprate score at all, but a timer that increases every tick, and represents how long someone has been playing your game. There are lots of ways to implement a scoring system, and which one you choose will depend on the specific mechanics of your individual game.}}
                         @teacher{}}

                 @point{@student{Now your scoring system is in place, but how will the person playing your game know what their score is? You'll want to display the score on the screen. 
                                 @activity[#:forevidence (list "BS-W&1&2" "BS-W&1&4")]{Which function handles how the game state is drawn?}
In the @code{draw-state} function, images are placed onto the background using @code{put-image} to draw the game. But the score is represented by a Number: we need a way to represent it as an Image. Thankfully, Pyret has some built-in functions that can help with this: the function @code{num-to-string} takes in a Number for its domain and returns a String representation of that number. This string can then be passed to the @code{text} function to return an Image that can be used in @code{draw-state}. 

@activity[#:forevidence (list "BS-M&1&1" "BS-PL.2&1&1" "BS-DS.1&1&5" "BS-W&1&2" "BS-W&1&5")]{Copy the following contracts into your workbook:
                                           @itemlist[@item{@code{num-to-string : Number -> String}}
                                                     @item{@code{text : String, Number, String -> Image}}
                                                     @item{How would you use the @code{num-to-string} and @code{text} functions together to draw the score into the game?}
                                                     @item{How do you get the @code{score} out of the game state?}
                                                     @item{How large should the text of the score be? Where should it be placed on your game scene?}]}
                                 The expression:
                                 @code[#:multi-line #t]{put-image(text(num-to-string(g.score), 20, "white"), 320, 240, BACKGROUND-IMG)}
                                  will place the score (drawn in size 20 white text) onto the center of the BACKGROUND-IMG.
                                  @activity{Use these functions to draw the score onto your game screen. You could also use the @code{string-append} function to make it clear to players that the number they see is their score, like so:
         @code{text(string-append("Score: ", num-to-string(g.score)), 20, "white")}}}
                         @teacher{}}
   
                 @point{@student{Our Ninja Cat game has a visible scoring system: Now it's time to add some levels. For this example, we want the game to have a different background image when the player progresses to the next level. We'll say that the player reaches level two when his or her score is greater than 250.
                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1")]{Where do you define the @code{BACKGROUND-IMG} image in your game? Keep your original background for the first level, but define a new variable, @code{BACKGROUND2-IMG}, that will be used for level 2. For the best results, use an image that is the same size as your original background.} Once you have your second background image, it should be drawn into the game- but @bold{only} when a certain condition is met. 
                                 @activity[#:forevidence (list "BS-M&1&1" "BS-W&1&4")]{@itemlist[@item{What must be true for the player to progress to level 2?}
                                                      @item{Which function handles the way the game looks?}
                                                      @item{What is the only thing we want to change in level 2 of Ninja Cat?}]}}
                         @teacher{}}
                 @point{@student{The only thing we want to change in level 2 is the way the game @italic{looks}: specifically, the background image. In Ninja Cat, @code{draw-state} is already a piecewise function because we want to draw the screen differently depending on whether or not the game is over. You may need to change @italic{your} @code{draw-state} function so that it uses @code{if}, if it's not already a piecewise function.
                         @activity[#:forevidence (list "A-CED.1-4&1&1" "BS-PL.4&1&1" "BS-W&1&5")]{@itemlist[@item{After checking whether or not the game is over, what is the next condition to check? (Hint: is the score large enough to progress to level 2?)}]}
@code[#:multi-line #t]{fun draw-state(g):
                           if g.score > 250: ......
                           ...
                           end
                       end}

                                 If this test evaluates to @code{true}, the result will look very similar to the code you already have for @code{draw-state}, starting with @code{put-image(...)}. 
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

                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-DR.4&1&3" "BS-W&1&2" "BS-W&1&5")]{Don't forget to add an @code{else} clause before your original code, right underneath what you just wrote. If the score is @bold{not} greater than 250, the scene will be drawn with the images on the original background.}
              Now our Ninja Cat game has a level 2! You can use the same process to add more levels when the score gets even higher. In your own games, you may want to display levels differently: Maybe instead of the background changing, once the player reaches a certain score, or has played the game for a certain amount of time, your player image will transform, or the game becomes more difficult by making the danger move faster.}
                         
                         @teacher{Some options for students who finish early: 
                                   @itemlist/splicing[@item{Change the next-state-tick function so that the dog and ruby move faster if the score is greater than 500.}
                                                      @item{Change the images of all the game characters when the player progresses to the next level.}
                                                        @item{@bold{Challenge:} Instead of writing similar code in @code{draw-state} over and over for each level, use abstraction: write a function that takes in the background image, and returns the game images placed on top of the given background. This function can then be called within @code{draw-state} with the appropriate background image when the player reaches each level.}]}}
                 ]
         }