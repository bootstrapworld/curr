#lang curr/lib

@title{Unit 7: Conditional Branching}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       (list "Boolean" @code{= > < string=? and or} "true false"))]{
  @unit-descr{Students use piecewise functions to move their players in response to key-presses.}
   }

@unit-lessons{
@lesson/studteach[
     #:title "Luigi's Pizza" 
     #:duration "20 min"
     #:overview "Students analyze the behavior of a piecewise function"
     #:learning-objectives @itemlist[@item{Students learn the concept of piecewise functions}
                                     @item{Students learn about conditionals (how to write piecewise functions in code)}
                                    ]
     #:evidence-statements @itemlist[@item{Students will understand that functions can perform different computations based on characteristics of their inputs}
                                     @item{Students will begin to see how Examples indicate the need for piecewise functions}
                                     @item{Students will understand that @code{cond} statements capture pairs of questions and answers when coding a piecewise function}
                                    ]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator/file "Luigis-Pizza" "scale-shape-design-recipe-assess" "Check this Design Recipe: Scaling Shapes")
                       (make-exercise-locator/file "Luigis-Pizza" "state-tax-design-recipe-assess" "Check this Design Recipe: Compute Tax")
                       (make-exercise-locator/file "Luigis-Pizza" "flower-name-design-recipe-assess" "Check this Design Recipe: Name That Flower")
                       (make-exercise-locator/file "Luigis-Pizza" "turkey-price-design-recipe-assess" "Check this Design Recipe: How Much is That Turkey?")
		       )
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-PL.4")
     #:materials @itemlist[ @item{Computer for each student (or pair), running WeScheme or DrRacket with the  bootstrap-teachpack installed}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbooks"], and something to write with}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Overhead projector}
                          ]
     #:preparation @itemlist[@item{Students are logged into WeScheme.org, OR have opened DrRacket}
                             @item{"Luigi's Pizza" [LuigisPizza.rkt from @(resource-link #:path "source-files.zip" 
                                                                                       #:label "source-files.zip") 
@(hyperlink "http://www.wescheme.org/openEditor?publicId=JUXrqT0UT5" "WeScheme")] preloaded on students' machines, and on the projector}
                              @item{REQUIRED: Hand out @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit?usp=sharing" "Luigi's Pizza Worksheet")}
                              @item{OPTIONAL: @(hyperlink "https://teacher.desmos.com/activitybuilder/custom/5a2ddf70edfc8975f63b14b7" "Desmos Activity: Unit 7 & 8 Review")}]
     #:prerequisites (list "The Design Recipe" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                           To get started with this lesson, complete @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" 
                                      "Luigi's Pizza Worksheet").}}
            @teacher{Review students' answers to the exercise. You can see a video demonstration of this intro at these links: @(new-tab "http://www.youtube.com/watch?v=2ckWSjWum-8" "1"),
                     @(new-tab "http://www.youtube.com/watch?v=iTrY-N3MLRY#t=3m8s" "2")}
           }
     @point{@student{The code for the @code{cost} function is written below:
                     @code[#:multi-line #t]{; cost : String -> Number
                                            ; given a Topping, produce the cost of a pizza with that topping
                                            (EXAMPLE (cost "cheese")     9.00)
                                            (EXAMPLE (cost "pepperoni") 10.50)
                                            (EXAMPLE (cost "chicken")   11.25)
                                            (EXAMPLE (cost "broccoli")  10.25)
                                            
                                            (define (cost topping)
                                              (cond
                                                [(string=? topping "cheese")     9.00]
                                                [(string=? topping "pepperoni") 10.50]
                                                [(string=? topping "chicken")   11.25]
                                                [(string=? topping "broccoli")  10.25]
                                                [else "That's not on the menu!"]))}}
             @teacher{[@(hyperlink "https://www.youtube.com/watch?v=joF6lOgCN14" "Video")]}
             }
     @point{@student{Up to now, all of the functions you've seen have done the @italic{same thing} to their inputs:
                     @itemlist[@item{@code{green-triangle} always made green triangles, no matter what the size was.} 
                                @item{@code{safe-left?} always compared the input coordinate to -50, no matter what that input was.}
                                @item{@code{update-danger} always added or subtracted the same amount}
                                @item{and so on...}]
                     This was evident when going from EXAMPLEs to the function definition: circling what changes essentially gives away
                     the definition, and the number of variables would always match the number of things in the Domain. 
                     @activity{Turn to @worksheet-link[#:name "cost"], fill in the Contract and EXAMPLEs for this function,
                               then circle and label what changes.}}
            @teacher{It may be worthwhile to have some EXAMPLEs and definitions written on the board, so students can follow along.}
           }
     @point{@student{The @code{cost} function is special, because different toppings can result in totally different expressions being evaluated. 
                     If you were to circle everything that changes in the example, you would have the toppings circles @italic{and the price}. 
                     That's two changeable things, but the Domain of the function only has one thing in it - therefore, we can't have two variables.}
            @teacher{Have students refer back to prior Design Recipe pages - it is @bold{essential} that they realize
                     that this is a fundamentally new situation, which will require a new technique in the Design Recipe!}
           }
     @point{@student{Of course, @code{price} isn't really an independent variable, since the price depends entirely on the @code{topping}. 
                     For example: if the topping is @code{"cheese"} the function will simply produce @code{9.00}, if the topping is 
                     @code{"pepperoni"} the function will simply produce @code{10.50}, and so on. The price is still defined in terms 
                     of the topping, and there are four possible toppings - four possible conditions - that the function needs to care 
                     about. The @code{cost} function makes use of a special language feature called @vocab{conditionals}, which is 
                     abbreviated in the code as @code{cond}.}
             @teacher{}
             }
     @point{@student{Each conditional has at least one @vocab{clause}. Each clause has a Boolean question and a result.
                          In Luigi's function, there is a clause for cheese, another for pepperoni, and so on.
                          If the question evaluates to @code{true}, the expression gets evaluated and returned.
                          If the question is @code{false}, the computer will skip to the next clause. 
                     @activity[#:forevidence (list "BS-PL.4&1&1")]{
                               Look at the @code{cost} function: 
                               @itemlist[@item{How many clauses are there for the @code{cost} function?}
                                         @item{Identify the question in the first clause.}
                                         @item{Identify the question in the second clause.}]}}
            @teacher{Square brackets enclose the question and answer for each clause.
                            When students identify the questions, they should find the first expression within the square brackets.
                            There can only be one expression in each answer.}
           }
     @point{@student{The last clause in a conditional can be an @code{else} clause, which gets evaluated if all the questions are @code{false}. 
                      @activity[#:forevidence (list "BS-PL.4&1&1")]{
                              In the @code{cost} function, what gets returned if all the questions are false? What would happen 
                              if there was no @code{else} clause? Try removing that clause from the code and evaluating an unknown 
                              topping, and see what happens.
                              }
                    }
             @teacher{@code{else} clauses are best used as a catch-all for cases that you can't otherwise enumerate.  If you can state a precise question
                       for a clause, write the precise question instead of @code{else}.  For example, if you have a function that does different things 
                       depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to write the two questions 
                       @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{else}.  Explicit questions make it easier to 
                       read and maintain programs.}
           }
     @point{@student{Functions that use conditions are called @vocab{piecewise functions}, because each condition defines a 
                     separate @italic{piece} of the function. Why are piecewise functions useful?  Think about the player in your game: you'd like the
                     player to move one way if you hit the "up" key, and another way if you hit the "down" key.  Moving up and moving down need two
                     different expressions!  Without @code{cond}, you could only write a function that always moves the player up, or always moves it
                     down, but not both.}
            @teacher{}
           }
     @point{@student{Right now the @code{else} clause produces a String, even though the Range of the function is Number.  Do you think this is a problem? 
                     Why or why not? As human beings, having output that breaks that contract might not be a problem: we know that the functions will
                     produce the cost of a pizza or an error message. But what if the output of this code didn't go to humans at all? What if we want to use
                     this function from within some other code? Is it possible that @italic{that} code might get confused? To find out, uncomment the last 
                     line of the program @code{(start cost} by removing the semicolon.  When you click "Run", the simulator will use @code{cost} function
                     to run the cash register. See what happens if you order off the menu!
                     @activity{To fix this, let's change the @code{else} clause to return a really high price. After all, if the customer is willing to pay
                      a million bucks, Luigi will make whatever pizza they want!}}
            @teacher{}
           }
   ]}
 
@lesson/studteach[
     #:title "Player Movement" 
     #:duration "25 min" 
     #:overview "Students write a piecewise function that allows their player to move up and down using the arrow keys."
     #:learning-objectives @itemlist[@item{Students learn that handling user input needs piecewise functions}
                                     @item{Students learn which questions to ask to detect key presses}
                                     @item{Students learn how to write their own conditional expressions}
                                     @item{Students reason about relative positioning of objects using mathematics}]
     #:evidence-statements @itemlist[@item{Students will understand how to write different expressions that compute new coordinates in different directions}
                                     @item{Students will be able to write expressions that check which key was pressed}
                                     @item{Students will be able to write a conditional connecting key presses to different directions of movement}
                                     @item{Students will learn to write examples that illustrate each condition in a piecewise function}
                                     @item{Students will be able to experiment with using functions to change the speed or nature of character movement in a game}
                                    ]
     #:product-outcomes @itemlist[@item{Students will write @code{update-player}, which moves their player in response to key-presses}]
     #:standards (list "A-SSE.1-2" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" "Danger and Target Movement")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
    ]{
      @points[
       @point{@student{Now that we know @code{cond}, we can write @code{update-player}.
                       @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&2" "BS-DR.2&1&1" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{
                                 @bitmap{images/update-player.png} Look at the following picture, which describes what happens when the "up" arrow key is pressed. 
                                 @itemlist[@item{What is the player's starting x-coordinate?}
                                           @item{What is the player's starting y-coordinate?}
                                           @item{What about after the player moves? 
                                                 @itemlist[@item{What are the new x and y coordinates?}
                                                           @item{What has changed and by how much?}
                                                           @item{What happens when we press the "down" arrow key?}
                                                           @item{What should the new coordinates be then?}
                                                           @item{What should happen if a user presses a key @italic{other} than the up or down arrows? }]}]}
                       }
              @teacher{Draw a screen on the board, and label the coordinates for a player, target and danger. Circle all the data associated with the Player.}
              }
       @point{@student{The following table summarizes what should happen to the player for each key:
                           @build-table/cols['("When..." "Do...")
                                             '(("key is \"up\"" "key is \"down\"" "key is anything else")
                                               ("add 20 to player-y" "subtract 20 from player-y" "return y unchanged"))
                                             (lambda (r c) (para ""))
                                             2 3]
                           
                           @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&2" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{
                                    On @worksheet-link[#:name "update-player"] in your workbook, 
                                    you'll find the word problem for @code{update-player}.}
                           (If you don't like using the arrow keys to make the player move up and down, 
                           you can just as easily change them to work with "w" and "x"!)}
               @teacher{Be sure to check students' Contracts and EXAMPLEs during this exercise, especially when it's time for them
                        to circle and label what changes between examples. This is the crucial step in the Design Recipe where they 
                        should discover the need for @code{cond}.}
               }
       @point{@student{You can also add more advanced movement, by using what you learned about 
                       boolean functions. Here are some ideas:
                       @itemlist[@item{@bold{Warping:} instead of having the player's y-coordinate 
                                       change by adding or subtracting, replace it with a Number 
                                       to have the player suddenly appear at that location. 
                                       (For example, hitting the "c" key causes the player to 
                                       warp back to the center of the screen, at y=240.)}
                                  @item{@bold{Boundary-detection} Change the condition for moving up
                                         so that the player only moves up if key="up" AND
                                         @code{player-y} is less than 480. Likewise, change the condition
                                         for "down" to also check that @code{player-y} is greater than 0.}
                                  @item{@bold{Wrapping:} Add a condition (before any of the keys) 
                                         that checks to see if the player's y-coordinate is 
                                         above the screen (y > 480). If it is, have the player 
                                         warp to the bottom (y=0). Add another condition so that 
                                         the player warps back up to the top of the screen if it 
                                         moves below the bottom.}
                                  @item{@bold{Challenge:} Have the player hide when the "h" key is pressed, 
                                        only to re-appear when it is pressed again!}]}
               @teacher{Hint on the challenge: multiply by -1.}}
       ]}
     
@lesson/studteach[
     #:title "Closing"
     #:duration "5 min"
     #:overview ""
     #:learning-objectives @itemlist[]
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
        @points[@point{@student{Congratulations - you've got the beginnings of a working game!  
                                What's still missing? Nothing happens when the player collides with the object or target!
                                We're going to fix these over the next few lessons, and also work on the artwork and story 
                                for our games, so stay tuned!}
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }
                        ]}
}
