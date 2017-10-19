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
        #:duration "30 minutes"
        #:overview "Students learn how to add built-in instructions/a splash screen to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students add a splash screen to their game}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Timers are a key component in many video games: players may need to reach a certain objective before time runs out, or keep from losing a game for longer and longer periods of time to reach a high score. In this feature, we’ll cover two possible uses of a timer in your game: adding a “splash screen” at the beginning to give instructions to the player, and adding a short animation when two characters collide.}
                        @teacher{}}
                 
                 @point{@student{Of course, a timer is a piece of data in our game that will be changing, meaning it should be added to our data structure. We'll be adding a timer to the completed @editor-link[#:public-id "0B9rKDmABYlJVTUtoekI2XzE3Znc" "Moving Character"] file from Unit 5, and you can follow along using the same file, or your own video game project.
                    @activity{Add a field called 'timer' to the data structure, represented by a Number. Then, go through your code and add that field to each @vocab{constructor} call in your code. Once complete, run your program to make sure there are no errors, then move on.}}
                         @teacher{}}

                 @point{@student{The next step is to find (or make!) the image you want displayed as your splash screen when the game begins. We've made a simple image of instructional text overlayed onto the background, and defined it using the name @code{instructions}.
                     @code[#:multi-line #t]{instructions =  
  overlay(text("Press the arrow keys to move!", 50, "purple"),
  rectangle(640, 480, "solid", "white"))}}
                         @teacher{Encourage students to get creative here: In addition to giving instructions to a user, they can also use their splash screen to provide a backstory for their game, include names and images of their characters, and of course, note who created the game!}}

                 @point{@student{As of now, our Moving Character file doeesn't have a @code{next-state-tick} function, but if we want our timer to increase or decrease, we'll have to add one. If you already have a @code{next-state-tick} function with the timer added to the @code{State} it produces, make it so the timer increases by 1 on every tick. Don't forget to add @code{on-tick: next-state-tick} to the reactor once you finish! Our @code{next-state-tick} function looks like this: 
@code[#:multi-line #t]{# next-state-tick :: CharState -> CharState
fun next-state-tick(a-char):
  char(a-char.x, a-char.y, a-char.timer + 1)
end}

(Note that the position of the character doesn't change in @code{next-state-tick}. It only changes in response to keypresses, which is already handled in the @code{next-state-key} function.)}
                         @teacher{}}

                 @point{@student{Now we have a timer added to our @code{CharState} structure, and it increases as the reactor runs. But how do we display our instructions screen @italic{based} on the timer? The @code{draw-state} function handles how the game looks, so we'll have to add some code to this function. In our starting @code{CharState}, which we named @code{middle}, we had the timer start at 0: @code{middle = char(320, 240, 0)}. Since we made the timer increase by 1 every clock tick, we'll display the @code{instructions} image as long as the timer is 100 or below.}
                         @teacher{By default, the computer's clock ticks 28 times each second, so the instructions screen will be up for a bit less than 4 seconds.}}

                 @point{@student{We'll need to change @code{draw-state} so that it becomes a piecewise function. @italic{If} the given @code{CharState}'s timer is less than or equal to 100, (the very beginning of the game) our splash screen should be displayed. Otherwise, the image of Sam the butterfly should be displayed at the correct position on the background, which is what the current code already does. To change @code{draw-state}, we add one new @code{if:} branch, and add the original code to the @code{else:} clause.
                   
@code[#:multi-line #t]{# draw-state :: CharState -> Image
fun draw-state(a-char):
  if a-char.timer <= 100:
    instructions
  else: 
    put-image(sam, a-char.x, a-char.y, rectangle(640, 480, "solid", "white"))
  end
end}}
                         @teacher{Have students explain the logic here: We only want the splash screen to appear at the very start of the game, when the timer is below a certain amount. All other times, we should see the game itself.}}

                 @point{@student{Click 'Run', and test out your new feature! You may want to increase or decrease the amount of time your splash screen is displayed, or make changes to the image itself.}

                       @teacher{Following these steps, students should end up with something similar to this @editor-link[#:public-id "0B9rKDmABYlJVenB2NHBya0F6a2M" "completed Moving Character"] file.}}                        
                 ]                                
         }

@lesson/studteach[#:title "Timer-based animations"
        #:duration "45 minutes"
        #:overview "Students learn how to add a collision animation to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students use a timer to add a collision animation to a simple animation}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVNGRsTTltUjZmRkE" "Watermelon Smash Starter"] file preloaded on students' machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Another way to use timers in a game is to add a short animation when a collision occurs. In this example, we're going to add a timer to a simple animation, but you could extend this to add an animation to your game when two characters collide, when the player reaches a goal, etc.}
                        @teacher{Noe that if students have already used a timer to add a splash screen to their game, they will @bold{not} be able to use the same @code{timer} field to display a collision animation. Instead, they could implement a collision animation in a different game, or add another, seprate field to their data structure: @code{animation-timer} and @code{instruction-timer}, for instance.}}

                @point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVNGRsTTltUjZmRkE" "Watermelon Smash Starter"] file and click 'Run'.}
                                 Our goal is to make a complete animation of a watermelon getting smashed by a mallet. When the mallet reaches the melon, we should see some sort of pink explosion! We've gotten you started by including a data structure called @code{SmashState}, which contains the y-coordinate of a mallet and a timer. When the reactor begins, the initial state (defined here as @code{START}) defines the mallet at 250 and the timer at 0.}
                       @teacher{}}

                   @point{@student{To start, let's look at the @code{draw-state} function.

@code[#:multi-line #t]{# draw-state :: SmashState -> Image
# draws the image of the watermelon and mallet on the screen. 
fun draw-state(a-smash): 
  put-image(MALLET, 275, a-smash.mallety, 
    put-image(WATERMELON, 200, 75, BACKGROUND))
end}

                    Currently, this function uses the images we've defined above (@code{WATERMELON, MALLET}, etc.) and draws the image of the mallet at x-coordinate 275 and the given @code{SmashState}'s current @code{mallety}, on top of the image of the watermelon, placed at the coordinates 200, 75 on the background. This code works for most of the animation, before the mallet hits the watermelon, but we want to see a pulpy explosion once it does.
                    @activity{@itemlist[
@item{When should we see a watermelon pulp explosion in this animation? What must be true about the given @code{SmashState}?} @item{Which image should we replace to show the explosion animation? The mallet, or the watermelon?}]}}
                           @teacher{}}

                     @point{@student{Once the mallet reaches the watermelon (around y-coordinate 140), we should replace the watermelon image with one representing an explosion. Here, we'll use a radial star, whose contract is written below:
                            @code[#:multi-line #t]{# radial-star :: Number, Number, Number, String, String -> Image}
                            @activity{Practice making a few radial stars of different colrs and sizes in the interactions area. See if you can determine what each of the Number arguments represent.}}
                             @teacher{}}

                      @point{@student{Most importantly for our purposes, the second argument to @code{radial-star} represents the outer size of the star. Since we want this star to represent the exploding watermelon, and grow larger as the animation progresses, we can't use a static number for the size. Instead, we want to use one of our changing values from the @code{SmashState}. @activity{Which field should we use to represent the size of the growing explosion? @code{mallety}, or @code{timer}? Why?}}
                              @teacher{@code{mallety} only represents the y-coordinate of the falling mallet, whereas the timer can be set and reset based on certain conditions to represent the changing size of the star image.}}

                      @point{@student{@activity{Change the @code{draw-state} function to make it piecewise: when the mallet's y-coordinate is 140 or less, draw the following image of the radial star (@code{radial-star(20, a-smash.timer, 25, "solid", "deep-pink")}) at the watermelon's current coordinates. In all other cases, produce the current body of @code{draw-state}.}
                                       The updated @code{draw-state} function should look similar to:
@code[#:multi-line #t]{# draw-state :: SmashState -> Image
# draws the image of the watermelon and mallet on the screen. When the 
# mallet's y-coordinate reaches 140, draw the explosion
fun draw-state(a-smash):
  if (a-smash.mallety <= 140):
    put-image(radial-star(20, a-smash.timer, 25, "solid", "deep-pink"), 200, 75,
       BACKGROUND)
  else:
    put-image(MALLET, 275, a-smash.mallety, 
    put-image(WATERMELON, 200, 75, BACKGROUND))
  end}}

                             @teacher{Note to students that we haven't done anything to change the value of a-state.timer yet! If the timer's value is still 0, as it begins in our @code{START} state, we won't see any star at all, even if our code is correct. We'll work on changing the value of the timer in response to different conditions within the @code{next-state-tick} function.}}

                @point{@student{Now take a look at the @code{next-state-tick} function defined below.
@code[#:multi-line #t]{# next-state-tick :: SmashState -> SmashState
# Decreases the y-coordinate of the mallet every tick
fun next-state-tick(a-smash):
  smash(a-smash.mallety - 2, a-smash.timer)
end}
Currently, this function decreases the mallet's y-coordinate to make it fall, and doesn't change the timer. However, if we want the size of our explosion to increase, at some point we'll have to start increasing the timer (since the timer's value also represents the size of our explosion animation). @activity{@italic{When} should we start increasing the timer, thereby increasing the size of the watermelon's explosion animation?}}
                        @teacher{}}

                                   @point{@student{For help, we can look back at our @code{draw-state} function. We only wanted to start drawing the explosion (the pink radial star) when @code{mallety} was less than or equal to 140. So we can check the same condition in @code{next-state-tick} to tell us when to start increasing the @code{SmashState}'s timer. @activity{Turn @code{next-state-tick} into a piecewise function: once @code{a-smash.mallety} reaches 140 or less, continue decreasing it's y-coordinate, but also @italic{increase} the timer by 2. Use the original body of @code{next-state-tick} as your @code{else} clause.}
                                        The final version of @code{next-state-tick} should look similar to:
@code[#:multi-line #t]{fun next-state-tick(a-smash):
  if (a-smash.mallety <= 140):
    smash(a-smash.mallety - 2, a-smash.timer + 2)
  else: smash(a-smash.mallety - 2, a-smash.timer)
  end
end}}
                                           @teacher{}}

                                                      @point{@student{Run your program, and watch that watermelon get smashed! @activity{For a challenge, change the @code{draw-state} function so that once the mallet has passed below a certain threshold, an image of the smashed watermelon (we've defined one called @code{SMASHED}) appears. @bold{Hint:} @italic{Where} within the @code{draw-state} function will this new condition need to be placed in order for it to work properly?}}
                                                              @teacher{When complete, students should produce an animation similar to this @editor-link[#:public-id "0B9rKDmABYlJVVGFZaHVScmZscFk" "completed Watermelon Smash file"].}}

                                                                                                                                 @point{@student{We've shown you a couple ways to use timers in your games and animations, but there are many more possibilities. You could extend the timer animation to add a short animation when two characters have collided, or display an ever-increasing timer on the screen to show players how long they have ben playing your game. What other uses for timers can you come up with?}
                                                                                                                                         @teacher{}}           
                 ]
         }
       




       
       }