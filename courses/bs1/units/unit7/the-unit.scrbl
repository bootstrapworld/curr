#lang curr/lib

@declare-tags[group selftaught bootstrap management]
@title{Unit 7: Conditional Branching}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < string=? and or}))]{
  @unit-descr{Students use geometry and conditional branching to move their player characters in response to key-presses.}
   }

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
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "F-IF.7-9" "F-LE.5")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[@item{"Luigi's Pizza" [LuigisPizza.rkt from @(resource-link #:path "source-files.zip" 
                                                                                       #:label "source-files.zip") \|
@(hyperlink "http://www.wescheme.org/openEditor?publicId=Qzjz5xbQ8h" "WeScheme")] preloaded on students' machines, and on the projector}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{@activity{Complete @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" 
                                      "Luigi's Pizza Worksheet").}}
            @teacher{Review students' answers to the exercise.}
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
                                                [else 1000.00]))}}
             @teacher{}
             }
     @point{@student{Up to now, all of the functions you've seen have done the @italic{same thing} to their inputs:
                     @itemlist[@item{@code{green-triangle} always made green triangles, no matter what the size was.} 
                                @item{@code{safe-left?} always compared the input coordinate to -50, no matter what that input was.}
                                @item{@code{update-danger} always added or subtracted the same amount}
                                @item{and so on...}]
                     This was evident when going from EXAMPLEs to the function definition: circling what changes essentially gives away the definition, and the number of variables would always match the number of things in the Domain.}
            @teacher{It may be worthwhile to have some EXAMPLEs and definitions written on the board, so students can see this point illustrated.}
           }
     @point{@student{The @code{cost} function is special, because different toppings can result in totally different expressions being evaluated. If you were to circle everything that changes in the example, you would have the toppings circles @italic{and the price}. That's two changeable things, but the Domain of the function only has one thing in it!}
            @teacher{}
           }
     @point{@student{Of course, @code{price} isn't really an independent variable, since the price depends entirely on the @code{topping}. For example: if the topping is @code{"cheese"} the function will simply produce @code{9.00}, if the topping is @code{"pepperoni"} the function will simply produce @code{10.50}, and so on. The price is still defined in terms of the topping, and there are four possible toppings - four possible conditions - that the function needs to care about. The @code{cost} function makes use of a special language feature called @vocab{conditionals}, which is abbreviated in the code as @code{cond}.}
             @teacher{}
             }
     @point{@student{Each conditional has at least one @vocab{clause}. Each clause has a Boolean question and a result. In Luigi's function, there is a clause for cheese, another for pepperoni, and so on. If the question evaluates to @code{true}, the expression gets evaluated and returned. If the question is @code{false}, the computer will skip to the next clause. 
                     @activity{Look at the @code{cost} function: 
                               @itemlist[@item{How many clauses are there for the @code{cost} function?}
                                         @item{Identify the question in the first clause.}
                                         @item{Identify the question in the second clause.}]}}
            @teacher{Square brackets enclose the question and answer for each clause.  When students identify the questions, they should find the first expression within the square brackets.  There can only be one expression in each answer.}
           }
     @point{@student{The last clause in a conditional can be an @code{else} clause, which gets evaluated if all the questions are @code{false}. 
                                                                @activity{In the @code{cost} function, what gets returned if all the questions are false? Why is it a good idea to have an @code{else} clause?}}
             @teacher{@code{Else} clauses are best used as a catch-all for cases that you can't otherwise enumerate.  If you can state a precise question for a clause, write the precise question instead of @code{else}.  For example, if you have a function that does different things depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to write the two questions @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{else}.  Explicit questions make it easier to read and maintain programs.  When you use @code{else}, someone has to read all the previous questions to know what condition @code{else} corresponds to: they can't just skim all the questions to find the one that matches their situation.  This might be counterintuitive to those with prior programming experience, but it does help make code more readable and understandable.}
           }
     @point{@student{Functions that use conditions are called @vocab{piecewise functions}, because each condition defines a 
                     separate @italic{piece} of the function.}
            @teacher{}
           }
     @point{@student{Why are piecewise functions useful?  Think about the player in your game: you'd like the player to move one way if you hit the "up" key, and another way if you hit the "down" key. Moving up and moving down need two different expressions!  Without @code{cond}, you could only write a function that always moves the player up, or always moves it down, but not both.}
            @teacher{}
           }
   ]}
 
@lesson/studteach[
     #:title "Player Movement" 
     #:duration "25 min" 
     #:prerequisites "Luigi's Pizza"
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
     #:standards (list "A-CED.1-4" "A-SSE.1-2" "F-BF.1-2" "F-IF.1-3" "F-IF.4-6" "F-IF.7-9" "F-LE.5")
     #:materials @itemlist[@item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{All student computers should have their game templates pre-loaded, with their image files linked in}]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
    ]{
      @points{
       @point{@student{Now that we know @code{cond}, we can write @code{update-player}.
                       @activity{@bitmap{images/update-player.png} Look at the following picture, which describes what happens when the "up" arrow key is pressed. 
                                 @itemlist[@item{What is the player's starting x-coordinate?}
                                           @item{What is the player's starting y-coordinate?}
                                           @item{What about after the player moves? 
                                                 @itemlist[@item{What are the new x and y coordinates?}
                                                           @item{What has changed and by how much?}
                                                           @item{What happens when we press the "down" arrow key?}
                                                           @item{What should the new coordinates be then?}
                                                           @item{What should happen if a user presses a key @italic{other} than the up or down arrows? }]}]}
                      }
              @teacher{Draw a screen on the board, and label the coordinates for a player, target and danger. Circle all the data associated with the Player.}}
       @point{@student{The following table summarizes what should happen to the player for each key:
                           @build-table/cols['("When..." "Do...")
                                             '(("key is \"up\"" "key is \"down\"" "key is anything else")
                                               ("add 20 to player-y" "subtract 20 from player-y" "return y unchanged"))
                                             (lambda (r c) (para ""))
                                             2 3]
                           }
              @teacher{}}
       @point{@student{
                       @activity{On @worksheet-link[#:page 24 #:name "Design-Recipe-Update-Player"] in your workbook, 
                                    you'll find the word problem for @code{update-player}.}
                       }
              @teacher{Be sure to check students' Contracts and EXAMPLEs during this exercise, especially when it's time for them to circle and label what changes between examples. This is the crucial step in the Design Recipe where they should discover the need for @code{cond}.}
              }
       @point{@student{If you don't like using the arrow keys to make the player move up and down, 
                          you can just as easily change them to work with "w" and "x".}
              @teacher{}}
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
       }}
     
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
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                       @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                       @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}

@copyright[]