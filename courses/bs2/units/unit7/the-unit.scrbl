#lang curr/lib

@title{Unit 7: Asking the World}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))]{
@unit-descr{Students continue to combine their use of Ask and Data Structures, this time identifying ways in which the World structure might change without any user input.}
}     
@unit-lessons{
@lesson/studteach[#:title "Review"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
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
        @points[@point{@student{In the last lesson you reviewed the concept of @vocab{piecewise functions} from Bootstrap:1, and learned about ask blocks, the Pyret syntax for writing piecewise functions. To review, let's go through the Design Recipe for a pieewise function. 
@activity{@itemlist[@item{Turn to @worksheet-link[#:page 33 #:name "Boundary Checks"] in your workbooks.}
                    @item{With your partner, fill out the Design Recipe for the ______ function.}]}}
                        @teacher{Remind students that each @code{ask} statement must have a test and a result, and each function must contain an @code{otherwise:} statement, which will execute if every other test returns false.}}
                 ]
         }                               
@lesson/studteach[#:title "Protecting the Boundaries"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Add detail to their understanding of the update-world function}
                                         @item{Identify possible sub-domains which require different behavior of the function}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{The NINJA WORLD 4 file [NW4.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "gbz2w2pCTu" "WeScheme"] preloaded on students' machines}]
        #:preparation @itemlist[@item{Write the Ninja World version of update-world towards the bottom of the board, with room to transform it into an ask branch under the function header.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{@itemlist[@item{Open the @editor-link[#:public-id "gbz2w2pCTu" "NINJA WORLD 4"] file.}
                                          @item{What is in the world structure?}
                                          @item{What does the @code{update-world} function do?}
                                          @item{What is @code{dogX} when the dog is in the center of the screen? According to the code, what will the 
                                                next @code{dogX} be?}
                                          @item{What is @code{dogX} when the dog is on the right-hand edge? What will the next @code{dogX} be? And 
                                                 the next? And the next?}
                                          @item{What happens when the dog reaches the edge of the screen? What SHOULD happen?}]}
                                 Right now the dog disappears off the side of the screen and never comes back. It's time to fix that. }
                        @teacher{@management{Be sure to give students lots of positive reinforcement at this point - the game is
                                             really taking shape!}}
                        }
                 @point{@student{Just as in Bootstrap:1, we need to write a function that checks whether the danger has gone off the right side 
                                of the screen. First, let's review a few things:
                                @activity{@itemlist[@item{@code{true} and @code{false} are examples of what datatype?}
                                                     @item{What function takes two numbers and checks if the first number is 
                                                           @italic{greater than} the second?}
                                                     @item{What function checks if a number is @italic{less than} another?}
                                                     @item{What function checks if two numbers are @italic{equal}?}]}
                                Here is the contract for the greater than function:
@code[#:multi-line #t]{# > : Number Number -> Boolean
                     # Checks whether the first number is greater than the second}
                               @activity{Copy this into your Contracts page and write down the contracts for the other two Boolean functions.}}
                        @teacher{@management{Review Booleans and Boolean functions, including @code{>}, @code{<}, @code{=}, @code{and}, and 
                                             @code{or}. Make sure students copy the contracts into their workbook.}}}
                 
                 @point{@student{To make testing and writing code much easier, programmers will often write seperate functions to test various game possibilities. In our Ninja World game, we're going to write a function @code{is-off-right} to test whether the dog has gone off the right side of the screen.
@activity{@itemlist[@item{Turn to @worksheet-link[#:page 33 #:name "Boundary Checks"] in your workbook.}
                                                      @item{What is the name of the first function on this page?}
                                                      @item{@code{is-off-right} will return @code{true} if our danger goes off the right side 
                                                             of the screen. How large can the x-coordinate be before a character goes off 
                                                             the screen?}
                                                      @item{Write the @vocab{Contract} for this function.}]}
@code[#:multi-line #true]{# is-off-right : Number -> Boolean
                          # Returns true if the given number is greater than 640}
                                 Now let's pick a few examples of coordinates to write our test cases: 
                                 @activity{@itemlist[@item{What x-coordinate would put a character at the center of the screen?}
                                                      @item{How do you check whether it's off the right hand side?}
                                                      @item{Any x-coordinate greater than 640 is off the right side of the screen, so how 
                                                            would you determine whether or not the example number is @italic{greater than} 640?}]}
                                 @code[#:multi-line #true]{example:
                                           is-off-right(320) is 320 > 640
                                       end}
                                 @activity{Write another example for a coordinate that is off the screen on the right side, circle what 
                                           changes, and write your function definition.}}
                         @teacher{Remind students about Sam the butterfly from Bootstrap:1. This function does the same thing as @code{safe-right?},
                                  to determine whether the character has gone off the screen based on its x-coordinate.@management{Ensure that students
                                  are using the full name of @code{is-off-right}.}}}
                 
                 @point{@student{You now have a function to check whether an object has run off the right side of the screen. But think
                                 about Ninja World: if the Ruby is moving to the left, do you care whether the ruby goes off the right side? 
                                 @activity{@itemlist[@item{Complete the design recipe for @code{is-off-left} on
                                                           @worksheet-link[#:page 33 #:name "Boundary Checks"]. Instead of checking if 
                                                           a number is greater than 640, what will you need to check?}
                                                      @item{When finished, copy your functions into your 
                                                            @editor-link[#:public-id "gbz2w2pCTu" "Ninja World 4"] 
                                                            file, where it says @code{# TESTS FOR ASK}.}]}}
                         @teacher{}}
                 @point{@student{Now we have a way to check whether something has gone off the right OR the left of the screen, but we still
                                 haven't told the game what to do when it does. In Ninja World, after the dog goes off the right side of the
                                 screen, he should reappear on the left-hand side. 
                                 @activity{In this situation, what would the next @code{dogX} be after 640?}
                                 We want to change @code{update-world} so that it behaves the old way most of the time, but it sets
                                 @code{dogX} to zero when @code{dogX} is greater than 640. 
                                 @activity{What can we use that makes a function behave one way for some inputs but another way for 
                                           different inputs?}
                                 For now there are two different conditions: when @code{dogX} is greater than 640 and then 
                                 the rest of the time. Let's work on the code for this:                     
 @code[#:multi-line #t]{fun update-world(w):
	ask:
	  |...test... then: ...result...
	  | otherwise:  world(w.dogX + 10, w.rubyX - 5, w.catX, w.catY)
        end
    end}}
                         @teacher{Remind students that each @code{ask} branch will contain a test and a result, which is evaluated if its test returns @code{true}.}}
                 @point{@student{We still want our original code to be there. It's now going to be used in the @code{otherwise} clause, 
                                  because when @code{dogX} is not off the right side of the screen, we want the world to update normally.
                                  @activity{Think about the first condition. What is the test that tells you if a number is greater than 640?}
                                  You could use the greater than function(@code{>}) and compare two numbers, but you've already written a
                                  function that takes in only one number and tells you whether or not it is greater than 640. 
                                  @code{is-off-right} @italic{does the work for you}. But how would you determine whether or not the dog is off 
                                  the right? You'll need to pull the dog's x-coordinate out of the world... 
                                  @activity{@itemlist[@item{What accessor do we use for that?}
                                                       @item{So what will the input to @code{is-off-right} be?}
                                                       @item{Add this to your @code{update-world} function:}]}
 @code[#:multi-line #t]{fun update-world(w):
	ask:
	  | is-off-right(w.dogX) then: ...result...
	  | otherwise:  world(w.dogX + 10, w.rubyX - 5, w.catY)
        end
    end}}
                         @teacher{}}
                 @point{@student{The first clause tests whether the dog's x-coordinate is off the right side of the screen. If the test 
                                   returns @code{true}, what should the result be? We know that we need to return a World, since the Range
                                   of @code{update-world} is a World. That means we can immediately write @code{world(...)}: 
 @code[#:multi-line #t]{fun update-world(w):
	ask:
	  | is-off-right(w.dogX) then: world(...dogX..., ...rubyX..., ...w.catX..., ...catY...)
	  | otherwise:  world(w.dogX + 10, w.rubyX - 5, w.catX, w.catY)
        end
    end}
                                  How should @code{dogX} change in this condition? We said we want to move the dog back to the left side 
                                  of the screen.
                                  @activity{@itemlist[@item{What will the new value of @code{dogX} be, if it, moves back to the 
                                                            left side of the screen?}
                                                       @item{Does @code{rubyX} change if the dog goes off the screen? How about @code{catX}? @code{catY?}}]}
 @code[#:multi-line #t]{fun update-world(w):
	ask:
	  | is-off-right(w.dogX) then: world(0, w.rubyX, w.catX, w.catY)
	  | otherwise:  world(w.dogX + 10, w.rubyX - 5, w.catX, w.catY)
        end
    end}}
                         @teacher{}}
                 @point{@student{Now it's time to think about the ruby...
                                  @activity{@itemlist[@item{Instead of checking if @code{rubyX} was off the @bold{right} side of the screen,
                                                            what do we need to check?}
                                                       @item{What function have you already written that checks if a number is less than 0?}
                                                       @item{How does @code{update-world} need to change? What will the second @code{ask} 
                                                             branch look like?}
                                                       @item{Finish the code for @code{update-world} so that it also checks whether the 
                                                             ruby has gone off the left-hand side of the screen.}]}
@code[#:multi-line #t]{fun update-world(w):
	ask:
	  | is-off-right(w.dogX) then: world(0, w.rubyX, w.catX, w.catY)
     | is-off-left(w.rubyX) then: world(w.dogX, 640, w.catX, w.catY)
	  | otherwise:  world(w.dogX + 10, w.rubyX - 5, w.catX, w.catY)
        end
    end}}
                         @teacher{This can be an opportunity to discuss abstraction and the usefullness of reusing code with your
                                  students. The @code{ask} tests in @code{update-world} could be written as: 
                                  @code{w.dogX > 640}, or @code{w.rubyX < 0}, but this is more work than 
                                  neccessary if the @code{is-off-right} and @code{is-off-left} functions have been written, and could 
                                  be confusing for someone else looking at the code, who doesn't know why @code{dogX} is being 
                                  compared to 640. Additionally, from a programming point of view, it makes sense to use the 
                                  specific screen boundaries in as few functions as possible: If a programmer wants his or her
                                  game to be playable on a larger screen (such as a tablet), they will have to go through their
                                  code and change every function that tests boundaries based on the old screen size, 640x480. If 
                                  only the @code{is-off-right} and @code{is-off-left} functions use the screen size, the programmer can 
                                  make a few quick changes to the numbers, instead of searching through @code{ask} branches such 
                                  as in the second example.}}
                 ]
         }
       
@lesson/studteach[#:title "Tests and Results"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use Ask in their update-world functions}
                                     @item{Students will identify circumstances in which the functions in their game should behave differently}
          @item{Students will define these circumstances - and the desired behavior - in code, as different Ask branches}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now to use what you know about boundary detection and apply it to your own game! 
                                @activity{@itemlist[@item{Open your workbook to @worksheet-link[#:page 34 #:name "Test and Result"].}
                                                    @item{Think about the things in your game that make the world change. Do characters 
                                                           fly off the left side of the screen? The right? The top or bottom? Do you need to 
                                                           write an @code{off-top} function or @code{off-bottom}? Maybe something happens when the player achieves a high score, or the player's health reaches 0.}
                                                     @item{In the lefthand column of @worksheet-link[#:page 34 #:name "Test and Result"],
                                                           make a list of the questions (in Pyret!) you will need to @code{ask} the world. For example, with the dog we said
                                                           @code{is-off-right(w.dogX)} to ask if the dog was off the right side of the screen. On the right, figure out 
                                                           which world you need to make, if your question returns @code{true}.}]}}
                        @teacher{Some examples of game states students may want to test for: @itemlist[@item{Gravity: the payer constantly moves down, until her y-coordinate is 50, placing her at the bottom of the screen. (This coordinate will probably be adjusted based on the size of the @code{PLAYER} image.)}
          @item{The player shoots a projectile and destroys the alien/shark/bad guy: An element of the world cannot be taken @italic{out} of the world struct, but its locaton can be changed so that it no longer appears on the screen. If the @code{DANGER} has been set to a certain coordinate and has been "destroyed", should it continue to move normally?}
          @item{After reaching a certain score, the background image changes, and the player reaches "Level 2". (Note: changing the background image is handled by the @code{draw-world} function. This can be a piecewise function just like @code{update-world}!}
                                                                                                        ]
                                                                                                        }}
                 ]
         }

@lesson/studteach[#:title "Branches in update-world"
        #:duration "30 minutes"
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
        @points[@point{@student{Look at the @code{ask} branches for Ninja World's @code{update-world} function. Notice that for each branch, we need a test and a result. This is exactly what you've written in your workbook for your game. All you need to do now is reformat @italic{your} @code{update-world} function so that it uses @code{ask}, with your current code inside the @code{otherwise} clause.
                                            @activity{Adapt @code{update-world} so it becomes a @vocab{piecewise function}, and complete at least one thing on your list.}}
                        @teacher{Work in pairs or small groups to assist students with their own @code{update-world} 
                                 functions.}}
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
        @points[@point{@student{Take a minute and admire your handiwork: You've put a lot of time and effort into your 
                                game during this course, and it's coming together nicely with complex data structures
                                and advanced movement. It's already much more sophisticated than your Bootstrap:1 game! 
                                But something is still missing: in the Ninja Cat game, nothing happens when the cat 
                                collides with the dog, or ruby. In the next unit we'll change that: you'll be able
                                to handle collisions with the characters in your game! Start thinking about what should 
                                happen when your player reaches some treasure, shoots a zombie, or some other condition 
                                in your game.}
                        @teacher{@management{Remind students how far they have come since Bootstrap:1 and the beginning
                                             of Bootstrap:2. They've expanded their knowledge of Pyret and programming, 
                                             learned about a brand new data type and created their own advanced videogame!}
                                  Have the students show off their games to one another.}}
                 ]
         }
       }