#lang curr/lib

@title{Unit 5: Key Events}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Cake" @code{cake .flavor .color .message .layers .is-iceCream})
                                       (list "Party" @code{party .theme .location .guests}))]{
@unit-descr{Students return to the subject of piecewise functions, this time defining a key-event handler that modifies a world when certain keys are pressed.}
}
@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students codewalk through a piecewise function they used in Bootstrap:1, identifying the differences in Pyret syntax.}]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{Clear plastic sheet protectors: put pages 17 & 18 at the front of the workbook for ease of reference}
                             @item{The @editor-link[#:public-id "0B9rKDmABYlJVY3lNVU8tVVdvbXc" "Luigi's Pizza"] file preloaded on students' machines}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVY3lNVU8tVVdvbXc" "Luigi's Pizza"] file. Does it look familiar?
                                 
            @itemlist[@item{What is the name of this function?}
                      @item{What is the contract for the @code{cost} function?}
                      @item{What does this function do?}
                      @item{What should @code{cost("cheese")} evaluate to? @code{cost("chicken")}?}
                      @item{What do you think would happen if someone asked for a pizza not on the menu, like "sausage"?}]}
                      This function is the same as the @code{cost} function you worked with in Bootstrap:1, except this one is written in Pyret! @code{cost} will still take in a String, representing a pizza topping, in its domain, and give back a number for its range, representing the price of that pizza. In Pyret, instead of using @code{cond} branches, we use a keyword called @code{ask}, which lets the computer know whe're going to have different situations and behavior in our code. Just like you learned in Bootstrap:1, this is known as a @vocab{Piecewise function}. Each ask statement starts with the '|' key, (known as 'pipe') followed by a test, or an expression that produces a @vocab{Boolean} (either true or false). The other keyword to know here is @code{then:}. This tells the computer that whatever follows is what will be returned if the preceding expression is @bold{true}. In the case of this function, if the string representing the topping (@code{topping}) is equal to the string "pepperoni" (@code{string-equal(topping, "pepperoni")}), @italic{then} the function will return 10.50.
                       @activity{Practice adding their own pizza toppings to the menu, and asking the @code{cost} function for the price of those toppings.}}
                      @teacher{@code{string-equal} is exactly the same as @code{string=?} in Racket. It takes two Strings in its domain and returns a Boolean, telling you whether or not the given strings are equal. Have students copy the contract for this function
                                  into their contracts page.}}
                 @point{@student{In Racket we had an @code{else} clause, that would return true when all other tests had failed. In Pyret, we have the @code{otherwise:} keyword, which behaves the same way. If we didn't have this line of code our program would crash if someone tried to order a pizza that was not on the menu, like "anchovies", or "mushroom". This way, if you order off the menu, the function returns 0. A free pizza!}
                         @teacher{@code{otherwise} clauses are best used as a catch-all for cases that you can’t otherwise enumerate. If you can state a precise 
                                   question for a clause, write the precise question instead of otherwise. For example, if you have a function that does
                                   different things depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to
                                   write the two questions @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{otherwise}. 
                                   Explicit questions make it easier to read and maintain programs. When you use @code{otherwise}, someone has to read
                                   all the previous questions to know what condition else corresponds to: they can’t just skim all the questions 
                                   to find the one that matches their situation. This makes code more readable and understandable.}
                 @point{@student{One final syntax note: notice that there are two @code{end} statements at the bottom of this function. One to close the @code{ask:} branches, and one to close the function itself. Whenever you write a @vocab{piecewise function} in Pyret, you will need to remember to add two @code{end} statements in order to finish the function.}
                         @teacher{}}
                                 }
                 ]
         }
                      
@lesson/studteach[#:title "Keypress in Ninja World"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will extend their understanding of events to cover key-events}
            @item{Students will deepen their knowledge of conditionals, by combining them with dot-accessor and constructor functions.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{The @editor-link[#:public-id "__________" "Ninja World"] file preloaded on students' machines}]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In the last unit, your Ninja Cat game was starting to take shape: You extended the world to include the dog's x-coordinate, the coin's x-coordinate, and the cat's x and y-coordinates. You also learned about event-handlers, and used the @code{draw-world} and @code{update-world} functions to create a simple animation. 
                     @activity{Open the @editor-link[#:public-id "__________" "Ninja World"] file. It should look similar to the simple game you had last time.
                               @itemlist[@item{Scroll down to where it says @code{# KEY EVENTS} in the code.}
                                         @item{What is the name of the function defined here? What is its Domain? Its Range?}
                                         @item{How does @code{keypress} change the world it takes in? What happens on screen as a result of pressing certain keys?}
                                         @item{Right now this function only checks whether the key pressed by the player is the 'up' arrow key. But how can we get it to check if the 'down' arrow key was pressed, and move the cat accordingly? Take a few minutes with your partner to write one more line of code inside the @code{keypress} function to make the player move down.}]}}
                         @teacher{Remind students that this is similar to the @code{update-player} function they wrote in Bootstrap:1, give them a few minutes to work on it, and move on to debrief.}}
                 @point{@student{After adding a line to make Ninja Cat move down, your @code{keypress} function should look something like this:
@code[#:multi-line #t]{# keypress : World, String -> World
# Make cat respond to key events
fun keypress(current-world, key):
  ask:
    | string-equal(key, "up") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY + 10)
    | string-equal(key, "down") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY - 10)
    | otherwise: current-world
  end
end}}
                         @teacher{}}
                      @point{@student{At the end of the file, there's one more bit of code that makes the game respond to key presses. Inside of @code{big-bang}, 
                                 the very last line reads @code{on-key(keypress)}. @code{on-key} is a special function that detects when the user has pressed any key, and its argument tells it which function will handle the user input (in this case, @code{keypress}!). Now @code{big-bang} has all the information it needs to manage the state of this game: @code{on-tick}, which tells the computer which function updates the game on every "tick" of a timer, @code{to-draw}, which tells it what function to use to draw the world, and finally, @code{on-key}, which handles user input.}
                         @teacher{}
                         }
                      ]
         }

@lesson/studteach[#:title "Extending Keypress"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
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
        @points[@point{@student{We've made Ninja Cat move up and down, but in the original version of the game she moved left and right as well. Now that you're familiar with data structures, this is easy! 
                                @activity{@itemlist[@item{What changes about the cat if she moves to the left? To the right? What part of the world is that?}
                                                     @item{How would you change the @code{keypress} function so it also asks whether the player has pressed the "left" or "right" arrow keys?}
                                                     @item{What would you change about the world if the player presses the left arrow key? The right?}
                                                     @item{Change the @code{keypress} function so that the cat moves left and right based on the arrow keys.}]}
When finished, your code should look like: 
@code[#:multi-line #t]{# keypress : World, String -> World
# Make cat respond to key events
fun keypress(current-world, key):
  ask:
    | string-equal(key, "up") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY + 10)
    | string-equal(key, "down") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY - 10)
    | string-equal(key, "left") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX - 10, current-world.catY)
    | string-equal(key, "right") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX + 10, current-world.catY)
    | otherwise: current-world
  end
end}
For reference and to check your work, you can see the completed Design Recipe for @code{keypress} in Ninja World on @worksheet-link[#:page 26 #:name "Keypress-in-Ninja-World"].
}
                        @teacher{}}]}      
                                                                       
@lesson/studteach[#:title "Asking the World"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will turn update-world into a piecewise function in order to add jumping, falling, and gravity to their Ninja World game.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use @code{ask} in their next-world function}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points{@point{@student{Now Ninja Cat can move up and down, but we can add some more interesting elements to this game as well- what about gravity?
                                If we want to make it seem like gravity is acting on Ninja Cat, she'll need to appear to "fall" at any point when she is not on the ground. @activity{@itemlist[@item{What part of the world structure will change if the cat is moving down?}
                    @item{Since this "falling" will happen automatically, not as a result of user input, which function should control the gravity? @code{draw-world, next-world}, or @code{keypress}?}]}
                   Right now, @code{next-world} takes in a world, and returns the next world by changing the dog's x-coordinate and the coin's x-coordinate. We want the cat's y-coordinate to change as well, every time @code{next-world} runs. But we don't want the cat to fall all the way below the screen and keep falling. Gravity should cause her to fall, but @italic{only} when she is above the ground (if her y-coordinate is above 75 pixels). Sometimes we want our function to move the dog, coin @italic{and} the cat, but if Ninja Cat is already on the ground only the dog and coin should move. We need @code{next-world} to become a @vocab{piecewise function}!}
                       @teacher{ }}
                 @point{@student{@activity{@itemlist[@item{turn to @worksheet-link[#:page 17 #:name "Complex next-world"] in your workbook.}
                                                     @item{Write the Contract and Purpose statement for this updated version of @code{next-world}.}]}
                                  Now it's time to think about examples. @activity{Write one example using a World where Ninja Cat is above the ground, and one where she is on the ground. What should change about the world in each example? Does the dog's c-coordinate change in both instances, or just one? Why?}}
                         @teacher{Remind students that at this point, @code{next-world} will always change the x-coordinates of the dog and coin, because they move independantly. The @italic{only} time the cat's y-coordinate should change without user input is when it gets above 75 pixels.}}
                 
                 @point{@student{Your exampes should look similar to:
@code[#:multi-line #t]{examples:
                           next-world(worldA) is
                           world(worldA.dogX + 10, worldA.coinX - 5, worldA.catX, worldA.catY - 5)
                           next-world(worldB) is 
                           world(worldB.dogX + 10, worldB.coinX - 5, worldB.catX, worldB.catY)
                        end}
Circle and label what changes. Did more things change than you entered in the Domain? Sometimes we subtract 5 from the cat's y-coordinate, but sometimes her position stays the same. @activity{@itemlist[@item{What question should we ask to tell us if the cat is above 75 pixels? What dot-accessor will we need to use?}
                     @item{Our first condition must ask if the cat's x-coordinate is greater than 75. What changes about the world if this is true?}
                     @item{Complete the design recipe for @code{next-world} and put the code into the @editor-link["________" "Ninja World"] file.}]}}
                         @teacher{}}
                                  
@point{@student{The complete code for @code{next-world} should look like: 
@code[#:multi-line #t]{# next-world: World -> World
                       fun next-world(current-world):
                          ask:
                            |current-world.catY > 75 then: world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY - 5)
                            |otherwise: world(current-world.dogX + 10, current-world.coinX - 5, current-world.catX, current-world.catY)
                          end
                        end }
Ninja Cat is falling slowly in response to gravity, but it's now pretty tough for her to move up quickly. She needs some way to jump! @activity{Think about how you could implement jumping in this game. @itemlist[@item{How would the player make a character jump?}
                @item{What part of the world needs to change if Ninja Cat jumps up?}
                @item{How many pixels should Ninja Cat move up if she's jumping?}
                @item{What function controls the world in responce to key presses?}
                @item{Scroll back down to the @code{keypress} function. Add one more condition that makes Ninja Cat's y-coordinate increase if the player presses a key of your choice. @bold{Hint:} The spacebar can be written as an empty string, like so: @code{" "}}]}}
        @teacher{}
        }
}}
                                                                       
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
        @points[@point{@student{With @vocab{piecewise functions}, you can make a lot of things happen in a game with just a few lines of code, like controlling the movement of characters. Speaking of controlling characters, what happens in Ninja World when the dog and coin go off the screen? They keep going, but don't come back - the same problem we had in Bootstrap:1! If you need a refresher on how to fix it, that's what we'll be covering in the next unit.}}         
                       @teacher{}
                       }
                 ]
         }
       }