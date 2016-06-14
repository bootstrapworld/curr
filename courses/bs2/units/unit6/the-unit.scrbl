#lang curr/lib

@title{Unit 6: Asking the World}
@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{Students continue to combine their use of Ask and Data Structures, this time identifying ways in which the World structure might change without any user input.}
}
@unit-lessons{
@lesson/studteach[#:title "Review"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "8.F.1-3" "F-IF.1-3" "BS-M" "BS-PL.3" "BS-PL.4" "BS-DR.1" "BS-DR.2" "BS-DR.3")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In the last lesson you saw how @vocab{piecewise functions} work in Bootstrap:2, and learned about @code{ask} blocks, the Pyret syntax for writing them. To review, let's go through the Design Recipe for a piecewise function. 
@activity[#:forevidence (list "N-Q&1&1" "N-Q&1&2" "8.F.1-3&1&1" "F-IF.1-3&1&1" "BS-M&1&1" "BS-PL.3&1&2" "BS-PL.3&1&3" "BS-PL.4&1&1" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{@itemlist[@item{Turn to @worksheet-link[#:page 22 #:name "Red-shape"] in your workbooks.}
                    @item{With your partner, fill out the Design Recipe for the function @code{red-shape}.}]}
@bold{Optional:} If you finish early, turn the page to @worksheet-link[#:page 23 #:name "Strong-Password"] and fill out the Design Recipe for the @code{strong-password} function.}
                        @teacher{Remind students that each @code{ask} statement must have a test and a result, and each function must contain an @code{otherwise:} statement, which will execute if every other test returns false.}}
                 ]
         }                               
      
       
@lesson/studteach[#:title "Protecting the Boundaries"
        #:duration "40 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Add detail to their understanding of the next-world function}
                                         @item{Identify possible sub-domains which require different behavior of the function}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "N-Q" "5.OA.1-2" "7.EE.3-4" "8.F.1-3" "F-IF.1-3" "F-LE.5" "A-SSE.1-2" "A-CED.1-4" "BS-PL.2" "BS-PL.3" "BS-PL.4" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-W")
        #:materials @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVM2tUSFNTc21xOFU" "Ninja World"] file from the previous unit preloaded on students' machines}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "F-LE.5&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&3" "BS-W&1&1")]{@itemlist[@item{Open your @editor-link[#:public-id "0B9rKDmABYlJVM2tUSFNTc21xOFU" "Ninja World "] file from the last lesson.}
                                          @item{What is in the world structure?}
                                          @item{What does the @code{next-world} function do?}
                                          @item{What is @code{dogX} when the dog is in the center of the screen? According to the code, what will the next @code{dogX} be?}
                                          @item{What is @code{dogX} when the dog is on the right-hand edge? What will the next @code{dogX} be? And the next? And the next?}
                                          @item{What happens when the dog reaches the edge of the screen? What SHOULD happen?}]}
                                 Right now the dog disappears off the side of the screen and never comes back. It's time to fix that.}
                        @teacher{Be sure to give students lots of positive reinforcement at this point - the game is really taking shape!}
                        }
                 @point{@student{Just as in Bootstrap:1, we need to write a function that checks whether the danger, the dog, has gone off the right side of the screen. First, let's review a few things: @activity[#:forevidence (list "8.F.1-3&1&1" "BS-PL.2&1&1")]{@itemlist[@item{@code{true} and @code{false} are examples of what @vocab{Data Type}?}
                            @item{What function takes two numbers and checks if the first number is @italic{greater than} the second?}
                            @item{What function checks if a number is @italic{less than} another?}
                            @item{What function checks if two numbers are @italic{equal}?}]}
Here is the contract for the greater than function:
@code[#:multi-line #t]{# > : Number Number -> Boolean
                       # Checks whether the first number is greater than the second}
                               @activity{Copy this into your Contracts page and write down the contracts for @code{<} and @code{=}}}
                        @teacher{Review Booleans and Boolean functions, including @code{>}, @code{<}, @code{=}, @code{and}, and @code{or}. Make sure students copy the contracts into their workbook.}}
                 
                 @point{@student{To make testing and writing code much easier, programmers will often write seperate functions to test various game possibilities. In our Ninja World game, we're going to write a function @code{is-off-right} to test whether the dog has gone off the right side of the screen.
@activity[#:forevidence (list "N-Q&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1" "BS-DR.1&1&1" "BS-DR.1&1&2")]{@itemlist[@item{Turn to @worksheet-link[#:page 24 #:name "Boundary Checks"] in your workbook.}
                    @item{What is the name of the first function on this page?}
                    @item{@code{is-off-right} will return @code{true} if our dog goes off the right side of the screen. How large can the x-coordinate be before a character goes off the screen? (Remember that a character's coordinates are measured from the center of the image, so it's best to give a buffer so that the character dissappears completely before it is considered "off the screen".)}
                    @item{Write the @vocab{Contract} for this function.}]}
@code[#:multi-line #true]{# is-off-right : Number -> Boolean
                          # Returns true if the given number is greater than 690}
                                 Now let's pick a few examples of coordinates to write our test cases: 
                                 @activity{@itemlist[@item{What x-coordinate would put a character at the center of the screen?}
                                                      @item{How do you check whether it's off the right hand side?}
                                                      @item{Any x-coordinate greater than 640 is off the right side of the screen, but we want to consider a slightly higher x-coordinate "off the screen," to account for the width of the character image. So how would you determine whether or not the example number is @italic{greater than} 690?}]}
                                 @code[#:multi-line #true]{examples:
                                           is-off-right(320) is 320 > 690
                                       end}
                                 @activity[#:forevidence (list "5.OA.1-2&1&1" "7.EE.3-4&1&1" "A-CED.1-4&1&1" "BS-PL.3&1&2" "BS-PL.3&1&3" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{Write another example for a coordinate that is off the screen on the right side, circle what changes, and write your function definition.}}
                         @teacher{Remind students about Sam the butterfly from Bootstrap:1. This function does the same thing as @code{safe-right?}, to determine whether the character has gone off the screen based on its x-coordinate. Ensure that students are using the full name of @code{is-off-right}.}}
                 
                 @point{@student{You now have a function to check whether an object has run off the right side of the screen. But think about Ninja World: if the coin is moving to the left, do you care whether the coin goes off the right side? 
                                 @activity[#:forevidence (list "N-Q&1&1" "5.OA.1-2&1&1" "7.EE.3-4&1&1" "A-CED.1-4&1&1" "BS-PL.3&1&2" "BS-PL.3&1&3" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{@itemlist[@item{Complete the design recipe for @code{is-off-left} on @worksheet-link[#:page 24 #:name "Boundary Checks"]. Instead of checking if a number is greater than 640, what will you need to check?}
                                                     @item{When finished, copy your functions into your @editor-link[#:public-id "0B9rKDmABYlJVeFBBU2tHc0hDTlk" "Ninja World"] file, underneath your @code{keypress} function.}]}}
                         @teacher{}}
                 @point{@student{Now we have a way to check whether something has gone off the right OR the left of the screen, but we still haven't told the game what to do when it does. In Ninja World, after the dog goes off the right side of the screen, he should reappear on the left-hand side. 
                                 @activity{In this situation, what would the next @code{dogX} be after 690?}
                                 We want to change @code{next-world} so that it sets @code{dogX} to zero when @code{dogX} is greater than 690. Thankfully, @code{next-world} is already a piecewise function, so we just need to add some more conditions!}
                         @teacher{Remind students that each @code{ask} branch will contain a test and a result, which is evaluated if its test returns @code{true}.}}
                 
                 @point{@student{@activity{Think about the first condition. What is the test that tells you if a number is greater than 690?}
                                  You could use the greater than function(@code{>}) and compare two numbers like you did to figure out if the cat was standing on the ground, but you've already written a function that takes in only one number and tells you whether or not it is greater than 690! @code{is-off-right} @italic{does the work for you}. But how would you determine whether or not the dog is off the right? You'll need to pull the dog's x-coordinate out of the world... 
                                  @activity[#:forevidence (list "F-LE.5&1&1" "A-SSE.1-2&1&1" "BS-PL.4&1&1" "BS-DS.1&1&5")]{@itemlist[@item{What accessor do we use for that?}
                                                       @item{So what will the input to @code{is-off-right} be?}
                                                       @item{Add this to your @code{next-world} function:}]}
@code[#:multi-line #t]{fun next-world(current-world):
  ask:
    | is-off-right(current-world.dogX) then:
        ...result...
    | current-world.catY > 75 then:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY - 5)
    | otherwise:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY)
  end
end}}
                         @teacher{}}
                 @point{@student{The first clause tests whether the dog's x-coordinate is off the right side of the screen. If the test returns @code{true}, what should the result be? We know that we need to return a World, since the Range of @code{next-world} is a World. That means we can immediately write @code{world(...)}: 
 @code[#:multi-line #t]{fun next-world(current-world):
  ask:
    | is-off-right(current-world.dogX) then:
      world(...dogX..., ...coinX..., ...current-world.catX..., ...catY...)
    | current-world.catY > 75 then:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY - 5)
    | otherwise:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY)
  end
end}
How should @code{dogX} change in this condition? We said we want to move the dog back to the left side of the screen. @activity[#:forevidence (list "F-LE.5&1&1" "A-SSE.1-2&1&1" "BS-PL.4&1&1" "BS-DS.1&1&5")]{@itemlist[@item{What will the new value of @code{dogX} be, if it, moves back to the left side of the screen?}
                                        @item{Does @code{coinX} change if the dog goes off the screen? How about @code{catX}? @code{catY?}}]}
 @code[#:multi-line #t]{fun next-world(current-world):
  ask:
    | is-off-right(current-world.dogX) then:
      world(0, current-world.coinX, current-world.catX, current-world.catY)
    | current-world.catY > 75 then:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY - 5)
    | otherwise:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY)
  end
end}}
                         @teacher{}}
                 @point{@student{Now it's time to think about the coin...
                                  @activity[#:forevidence (list "F-LE.5&1&1" "A-SSE.1-2&1&1" "BS-PL.4&1&1" "BS-DS.1&1&5")]{@itemlist[@item{Instead of checking if @code{coinX} was off the @bold{right} side of the screen, what do we need to check?}
                                                      @item{What function have you already written that checks if a number is less than 0?}
                                                      @item{How does @code{next-world} need to change? What will the second @code{ask} branch look like?}
                                                      @item{Finish the code for @code{next-world} so that it also checks whether the coin has gone off the left-hand side of the screen.}]}
@code[#:multi-line #t]{fun next-world(current-world):
  ask:
    | is-off-right(current-world.dogX) then:
      world(0, current-world.coinX, current-world.catX, current-world.catY)
    | is-off-left(current-world.coinX) then: 
      world(current-world.dogX, 640, current-world.catX, current-world.catY)
    | current-world.catY > 75 then:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY - 5)
    | otherwise:
      world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY)
  end
end}
}
                         @teacher{This can be an opportunity to discuss abstraction and the usefulness of reusing code with your students. The @code{ask} tests in @code{next-world} could be written as: @code{current-world.dogX > 690}, or @code{current-world.coinX < 0}, but this is more work than neccessary if the @code{is-off-right} and @code{is-off-left} functions have been written, and could be confusing for someone else looking at the code, who doesn't know why @code{dogX} is being compared to 690. Additionally, from a programming point of view, it makes sense to use the specific screen boundaries in as few functions as possible: If a programmer wants his or her game to be playable on a larger screen (such as a tablet), they will have to go through their code and change every function that tests boundaries based on the old screen size, 640x480. If only the @code{is-off-right} and @code{is-off-left} functions use the screen size, the programmer can make a few quick changes to the numbers, instead of searching through @code{ask} branches such as in the second example.}}
                                                                                    @point{@student{@bold{Optional:} Armed with the knowledge of abstraction, write a new function @code{is-in-air} to determine whether a given number is greater than 75. Then, re-write your third condition in @code{next-world} to use this function to determine if the cat is off the ground. This will make your code more readable, and you can easily edit the boundaries if the image of the cat changes to a smaller or larger image.}
       @teacher{What happens if the dog and coin reach the boundaries @italic{at the same time}? The computer reads @code{ask} branches in order, so it will evaluate the first true condition and change the World accordingly. If the first branch checks the dog’s x-coordinate, and the dog and coin reach the boundaries at the same time, the dog’s position will be updated one (mostly-imperceptible) frame before the coin’s.

@bold{Optional challenge exercise:} write another condition to check if the dog AND the coin are off the screen at the same time.}}
                 ]
         }
       
       @lesson/studteach[#:title "Randomizing Ninja World" 
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use the random function to make game characters appear at different loations on the screen}]
        #:standards (list "F-IF.1-3" "7.EE.3-4" "A-CED.1-4" "BS-M" "BS-IDE" "BS-PL.2" "BS-PL.4" "BS-DR.4" "BS-DS.1" "BS-DS.2" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Right now the coin and dog appear at the same part of the screen every time, making this a really easy game. @activity{What will the y-coordinate of the dog always be? What about the coin?} Instead of appearing at the top of the screen every time, what if you could make the dog show up at a random y-coordinate whenever it goes off the screen? Pyret already has a function to give you a random number, which could represent a character's y-coordinate: @code{num-random}. @code{num-random} takes in one number as its domain, and returns a random number between 0 and that number. So if a game contains @code{num-random(480)} in the code, it will return any number between 1 and 480. @activity[#:forevidence (list "F-IF.1-3&1&1" "BS-PL.2&1&1")]{Copy the contract for @code{num-random} onto your contracts page. @code{num-random: Number -> Number}}}
                        @teacher{}}
                 @point{@student{If you want the y-coordinate of the dog to change, you'll have to add it to the World structure. @activity[#:forevidence (list "BS-DS.2&1&3")]{Go back to the top of the page where the World is defined and add in a @code{dogY}. Don't forget to redefine your @code{worldA} and @code{worldB} worlds, to account for the extra item in the World struct.}
           @code[#:multi-line #t]{data World:
                                    # The World is the x and y positions of the dog, x position of the coin, and the x and y position of the cat
                                    | world(dogX :: Number, dogY :: Number, coinX :: Number, catX :: Number, catY :: Number)
                                  end}
                                 Right now the @code{draw-world} function draws the dog at its current x-coordinate, and a pre-set y-coordinate. @activity[#:forevidence (list "BS-M&1&1" "BS-IDE&1&1" "BS-DS.1&1&5" "BS-W&1&2")]{@itemlist[@item{At what y-coordinate is the dog drawn right now?}
                                                      @item{Now that @code{dogY} has been added to the world structure, how do you get the @code{dogY} out of the world?}
                                                      @item{Change the @code{draw-world} function so that it draws the dog at the current y-coordinate instead of 400.}]}}
                         @teacher{}}
                 @point{@student{The dog's y-coordinate should change when it leaves the screen. 
                                 @activity[#:forevidence (list "7.EE.3-4&1&1" "A-CED.1-4&1&1" "BS-M&1&1" "BS-PL.4&1&1" "BS-DR.4&1&1" "BS-W&1&1")]{@itemlist[@item{What function changes the game state depending on the game's conditions?}
                                                      @item{What does the first @code{ask} branch in @code{next-world} test?}
                                                      @item{If this test returns @code{true}, what happens?}
                                                      @item{Change the first @code{ask} branch in @code{next-world} so that if the dog goes off the right side of the screen, his y-coordinate is resent to a random number between 0 and 480.}]}
          @code[#:multi-line #t]{| is-off-right(current-world.dogX) then: 
                                    world(0, num-random(480), current-world.coinX, current-world.catX, current-world.catY)}}
                         @teacher{}}
                 @point{@student{Be sure to go through your code carefully- since you changed the World structure to include a @code{dogY}, you'll need to make sure it's included every time you call @code{world}, @bold{and} every time a function takes in the y-coordinate of the dog. Once the dog is reappearing randomly when it leaves the screen, you can make the same changes to the coin's y-coordinate to make it appear randomly as well.}
                         @teacher{}}
                         
                          ]
         }
   
@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Take a minute and admire your handiwork: You've put a lot of time and effort into this game during this course, and it's coming together nicely with complex data structures and advanced movement. It's already much more sophisticated than your Bootstrap:1 game! By creating a Ninja Cat game from scratch, you'll have a lot of experience to build on when you start brainstorming your own game... in the very next unit! But something is still missing: in this Ninja Cat game, nothing happens when the cat collides with the dog, or coin. In the next unit we'll change that: you'll be able to handle collisions, similar to what you learned in Bootstrap:1.}
                        @teacher{Remind students how far they have come since Bootstrap:1 and the beginning of Bootstrap:2. They've expanded their knowledge of Pyret and programming, learned about a brand new data type and created their own version of Ninja Cat!}}
                 ]
         }
       }

       