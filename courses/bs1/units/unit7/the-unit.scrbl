#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap management]
@title{Unit 7: Conditional Branching}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < string=? and or}))]{
  @unit-descr{Students use geometry and knowledge of basic image functions to design characters for their games, this time using conditional branching to accommodate different key-events.}
   }

@lesson/studteach[
     #:title "Introduction" 
     #:duration "20 min"
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
  @points[
     @point{@student{Let's begin by experimenting with a program used in a pizzeria.  
                     Open @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" 
                                      "Luigi's Pizza Worksheet") and work on the problems.}
            @teacher{Review students' answers to the exercise.}
           }
     @point{@student{Here's the function from the worksheet:
                     @code[#:multi-line #t]{; cost : String -> Number
                                            ; given a Topping, produce the cost of a pizza with that topping
                                            (define (cost topping)
                                              (cond
                                                [(string=? topping "cheese")     9.00]
                                                [(string=? topping "pepperoni") 10.50]
                                                [(string=? topping "chicken")   11.25]
                                                [(string=? topping "broccoli")  10.25]
                                                [else "That's not on the menu!"]))}
                     There is something different about this function compared to the others you've written.  Do you see what it is?
                     Up to now, every function you've defined has done the @italic{same thing} to all of its inputs. 
                     @code{green-triangle} always made green triangles, no matter what the size was. 
                     @code{safe-left?} always compared the input coordinate to -50, @code{update-danger} 
                     always added or subtracted the same amount, and so on.}
            @teacher{}
           }
     @point{@student{The @code{cost} function is special, because different toppings can result in totally different 
                      values being returned. 
                      That's because @code{cost} makes use of a special language feature called @vocab{conditionals}, 
                      which is abbreviated in the code as @code{cond}.}
            @teacher{}
           }
     @point{@student{Each conditional has at least one @vocab{clause}. In Luigi's function, there is a clause for cheese, 
                     another for pepperoni, and so on. Each clause has a Boolean question and a result. If the question 
                     evaluates to @code{true}, the expression gets evaluated and returned. If the question is @code{false}, 
                     the computer will skip to the next clause. 
                     @activity{Look at the @code{cost} function: 
                               @itemlist[@item{Identify the question in the first clause.}
                                         @item{Identify the question in the second clause.}]}}
            @teacher{Square brackets enclose the question and answer for each clause.  When students identify
                     the questions, they should find the first expression within the square brackets.  }
           }
     @point{@student{The last clause in a conditional can be an @code{else} clause, which gets 
                         evaluated if all the questions are @code{false}. 
                         @activity{In the @code{cost} function, what gets returned if all the questions are false?}}
            @teacher{}
           }
     @point{@student{Functions that use conditions are called @vocab{piecewise functions}, because each condition defines a 
                     separate piece of the function.}
            @teacher{}
           }
     @point{@student{Why do people want piecewise functions?  Think about the player in your game: you'd like the player 
                     to move one way if you hit the "up" key, and another way if you hit the "down" key. 
                     Moving up and moving down need two different expressions!  Without @code{cond}, you could only write a function 
                     that always moves the player up, or always moves it down - but not both.}
            @teacher{}
           }
   ]}


@;@(include-lesson (lib "curr/lessons/Cond-Example-With-Pizza-Toppings/lesson/lesson.scrbl"))
      
@lesson/studteach[
     #:title "Pizza Toppings" 
     #:duration "20 min"
     #:prerequisites "Intro-to-Booleans"
     #:overview ""
     #:learning-objectives @itemlist[@item{Discover Partial Functions, and how to implement them using @code{cond}}
                                     @item{Use Booleans with @code{cond} to change control flow}
                                     @item{Adapt Design Recipe to add @code{cond}}]
     #:product-outcomes @itemlist[@item{Students will write functions that use conditionals and Booleans}]
     #:standards (list)
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{"Luigi's Pizza" [LuigisPizza.rkt from @(resource-link #:path "source-files.zip" 
                                                                                       #:label "source-files.zip") \|
@(hyperlink "http://www.wescheme.org/openEditor?publicId=Qzjz5xbQ8h" "WeScheme")] preloaded on students' machines, in front}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[@item{Write agenda on board}
                             @item{All student computers should have their game templates pre-loaded, with their image files linked in}
                             @item{Seating arrangements: ideally clusters of desks/tables}
                             ]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @;@item{@(video-link (hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "Intro to Cond Part 1"))}
       @;@item{@(video-link (hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY" "Intro to Cond Part 2"))}
       @points[
          @point{@student{Let's take a look at how you might use the Design Recipe to define a piecewise function using conditionals.
                          Once you know how to use it, you'll be able to write other piecewise functions in your game.}
                 @teacher{}}
          @point{@student{Turn to the Design Recipe on @worksheet-link[#:page 23 #:name "Design-Recipe-Cost"] and 
                          grab a Design Recipe Worksheet.}
                 @teacher{}}
          @point{@student{Suppose we've been hired by Luigi's Pizza to write a function that tells us the 
                          cost of different pizzas. Let's use the design recipe to write this function.
                          @activity{@itemlist[@item{What is the name of this function?}
                                              @item{What is the domain?}
                                              @item{What is the range?}]}
                          }
                 @teacher{@itemlist[@item{Have a student read the problem statement.}
                                    @item{Ask for a volunteer to be our function. Pick someone, and copy the 
                                          contract as they answer. What is your name? cost Your Domain? String 
                                          Your Range? Number. 
                                          @code{; cost: String -> Number}}]}}
          @point{@student{Let's agree to name the function @code{cost}.  The contract for @code{cost} 
                          is @code{; cost: String -> Number}.
                          Now, we should write down some examples of @code{cost}.
                          @activity{@itemlist[@item{Write an example of computing the cost of a cheese pizza.}
                                              @item{Write an example of computing the cost of a pepperoni pizza.}
                                              @item{Circle the changes between your examples.  Be sure to label the changes.}]}}
                 @teacher{}}
          @point{@student{Do you notice something odd here?  This is the first time that we've circled 
                          something in the second part of the examples which wasn't also circled in the first part. 
                          The price that's being produced changes, but the function never takes in the price!}
                 @teacher{}}
          @point{@student{That's a hint that something special is going on, but let's see how much father the 
                          Design Recipe can take us.  We should write the function header.
                          @activity{Fill in the Function Header in your design recipe worksheet.}
                          }
                 @teacher{Students should write @code{(define (cost topping))}}}
          @point{@student{The Function Body is next. But now we don't know what to write! We know that our examples 
                          behave differently from one another. Sometimes we want to return 9.00.  Other times we want to return 10.50, 
                          etc. So what do we do?  Let's make a table with the different results we want to produce:
                          @tt{(}@code{define (cost topping)}
                          @build-table/cols['() 
                                            '(()
                                              ("10.50" "9.00" "11.25" "10.25"))
                                            (lambda (r c) (para (fill-in-the-blank #:id (format "~a" r)))) 2 4]
                          @tt{)}
                          }
                 @teacher{Draw the table under the Function Header.}}
          @point{@student{Now, we need to fill in the condition for returning each answer.  When should the function
                          produce 10.50?  Answer: When the topping is pepperoni.  In the box to the left of 10.50,
                          we need to write an expression that checks whether topping is pepperoni.
                          @activity{@itemlist[@item{What is the type of "pepperoni"?}
                                              @item{Where can you look up the type of the topping variable?}
                                              @item{What is the type of topping?}
                                              @item{What function compares two strings and produces a Boolean?}
                                              @item{What Racket expression compares topping and "pepperoni"?}]}
                          }
                 @teacher{The "where can you look up" question reinforces how students can use the contract to figure out
                          how to write a function.  Being careful about this helps students understand why we write contracts
                          for functions.}}
          @point{@student{We put the expression you wrote in the box next to 10.50:
                          @build-table/cols['() 
                                            '(("(string=? topping \"pepperoni\")" "" "" "")
                                              ("10.50" "9.00" "11.25" "10.25"))
                                            (lambda (r c) (para (fill-in-the-blank #:id (format "~a" r)))) 2 4]
                          @activity{Fill in the rest of the empty boxes in the table.}
                          }
                 @teacher{The finished table looks like
                          @build-table/cols['()
                                            '(("(string=? topping \"pepperoni\")" 
                                               "(string=? topping \"cheese\")" 
                                               "(string=? topping \"chicken\")" 
                                               "(string=? topping \"broccoli\")") 
                                              ("10.50" "9.00" "11.25" "10.25")) 
                                            (lambda (r c) ("")) 2 4]}}

          @point{@student{Each of these rows is called a @vocab{condition}. A condition has a test and a result. 
                          We want to turn this table into a program.  The Racket @code{cond} expression does
                          this: we simply write a pair of square brackets around each of the branches, as
                          shown.
                          @embedded-wescheme[#:id "PizzaCond"
                                             #:definitions-text "(define (cost topping)
 (cond
   [(string=? topping \"pepperoni\") 10.50]
   [(string=? topping \"cheese\")     9.00]
   [(string=? topping \"chicken\")   11.25]
   [(string=? topping \"broccoli\")  10.25]))"]
                          When Racket evaluates a @code{cond}, it goes down the rows in order, producing the first 
                          result for which the condition is true.}
                 @teacher{Students can try out the program in the interactions window.  They can also add new 
                                   items of their own.}}
          @point{@student{What happens if the topping is not on our list?  Programs that use @code{cond} often include
                          a final @vocab{else clause} that says what to produce if no other clauses match.  Assume we 
                          want to charge a ridiculous ten million dollars for items not on the menu.  In that case, the 
                          else clause looks like @code{[else 10000000]}.
                          @activity{Edit the code above with your own toppings and the @code{else} clause.}
                          }
                 @teacher{Remind students that computers are very specific and can't make up new answers; 
                          we need to tell it what to do in case the user inputs an item that is not in our list. 
                          }}
          @point{@student{If you have additional time, and would like to try another @code{cond} challenge, 
                          check out the @(lesson-link #:name "Function-Example-Red-Shape" #:label "supplemental activity.")}
                 @teacher{}}      
      ]}
          
@;@(include-lesson (lib "curr/lessons/Player-Movement/lesson/lesson.scrbl"))
@lesson/studteach[
     #:title "Player Movement" 
     #:duration "25 min" 
     #:prerequisites "Cond-Example-With-Pizza-Toppings"
     #:overview ""
     #:learning-objectives @itemlist[@item{Reason about the relative positioning of objects using mathematics}]
     #:product-outcomes @itemlist[@item{Students will write @code{update-player}}]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
    ]{
      @points{
       @point{@student{Now that we know @code{cond}, we can write @code{update-player}.
                       @activity{Look at the following picture: [FIND FILE AND INSERT] @;@bitmap{images/6.1.png}
                                 @itemlist[@item{What is the player's starting x-coordinate?}
                                           @item{What is the player's starting y-coordinate?}
                                           @item{What about after the player moves? 
                                                 @itemlist[@item{What are the new x and y?}
                                                           @item{What has changed and by how much?}
                                                           @item{What happens when we press the down key?}
                                                           @item{What should the new coordinates be then?}]}]}
                      }
              @teacher{Draw a screen on the board, and label the coordinates for a player, 
                       target and danger. Circle all the data associated with the Player.}}
       @point{@student{Based on your answers, what should update-player do?}
              @teacher{Students should realize that the player's position should change by 20 pixels}}
       @point{@student{The update-player function needs to move the player up 20 pixels when the user
                           presses the up arrow and down 20 pixels when the user presses the down arrow.  
                           The following table summarizes the impact of the keys:
                           @build-table/cols['("Keypress" "Result")
                                             '(("\"up\"" "\"down\"")
                                               ("player-y increases by 20" "player-y decreases by 20"))
                                             (lambda (r c) (para ""))
                                             2 2]
                           }
              @teacher{}}
       @point{@student{What should happen if a user presses a key other than the up or down arrows? 
                       @activity{On @worksheet-link[#:page 24 #:name "Design-Recipe-Update-Player"], 
                                    you'll find the word problem for @code{update-player}. Grab a 
                                    Design Recipe Worksheet, fill it out, and then write this 
                                    function.}
                       }
              @teacher{@;Here students should open their files, review, and possibly add cheats.}
                       }}
       @point{@student{If you don't like using the arrow keys to make the player move up and down, 
                          you can just as easily change them to work with "w" and "x".}
              @teacher{}}
       @point{@student{You can also add more advanced movement, by using what you learned about 
                       boolean functions. Here's are some ideas:
                       @itemlist[@item{Warping: instead of having the player's y-coordinate 
                                       change by adding or subtracting, replace it with a Number 
                                       to have the player suddenly appear at that location. 
                                       (For example, hitting the "c" key causes the player to 
                                            warp back to the center of the screen, at y=240.)}
                                      @item{Wrapping: Add a condition (before any of the keys) 
                                            that checks to see if the player's y-coordinate is 
                                            above the screen (y > 480). If it is, have the player 
                                            warp to the bottom (y=0). Add another condition so that 
                                            the player warps back up to the top of the screen if it 
                                            moves below the bottom.}
                                      @item{Challenge: Have the player hide when the "h" key is pressed, 
                                                       only to re-appear when it is pressed again!}]}
              @teacher{}}
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