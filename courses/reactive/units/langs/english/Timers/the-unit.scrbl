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

                 @point{@student{We'll need to change @code{draw-state} so that it becomes a @vocab{piecewise} function. @italic{If} the given @code{CharState}'s timer is less than or equal to 100, (the very beginning of the game) our splash screen should be displayed. Otherwise, the image of Sam the butterfly should be displayed at the correct position on the background, which is what the current code already does. To change @code{draw-state}, we add one new @code{if:} branch, and add the original code to the @code{else:} clause.
                   
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
        #:preparation @itemlist[@item{Make sure students have completed the "Collisions" feature before starting this lesson.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Another way to use timers in a game is to add a short animation when a collision occurs. In this example, we're going to add a timer to a simple animation, but you could extend this to add an animation to your game when two characters collide, when the player reaches a goal, etc.}
                        @teacher{Noe that if students have already used a timer to add a splash screen to their game, they will @bold{not} be able to use the same @code{timer} field to display a collision animation. Instead, they could implement a collision animation in a different game, or add another, seprate field to their data structure: @code{animation-timer} and @code{instruction-timer}, for instance.}}

                @point{@student{Open the @editor-link[#:public-id "____________________________" "Watermelon Smash"] file. }

                        @teacher{}}
                               
                                                                                                                                                                                                                                                                                                                                                                                                                            
                 ]
         }
       




       
       }