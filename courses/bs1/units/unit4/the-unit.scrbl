#lang curr/lib
@declare-tags[management]

@title{Unit 4: The Design Recipe}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Students are introduced to the Design Recipe and apply it to simple problems.}
 }

@lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{}
                        @teacher{@management{Review the importance of definitions for students (defining values helps cut down on redundancy and makes future changes easier, defining functions allows for simplicity and testability. Be sure to use vocabulary regularly and carefully, pushing students to use the proper terms throughout.)}}
                        }
                 ]}
       
@lesson/studteach[
     #:title "The Design Recipe"
     #:duration "25 minutes"
     #:overview "Students are formally introduced to the steps of the Design Recipe."
     #:learning-objectives @itemlist[@item{Students practice using Contracts to create examples of functions}
                                     @item{Students learn to abstract over examples to create functions}]
     #:evidence-statements @itemlist[@item{Given a contract and purpose statement for a simple, one-variable function, students will be able to write two Examples}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Students will use the Design Recipe to define a function, which is used to make a rocket fly.}]
     #:standards (list "A-CED.1-4" "F-IF.1-3" "F.IF.7-9" "F-BF.1-2")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
     #:preparation @itemlist[@item{Write agenda on board}
                              @item{Display Class posters, Language Table, Design Recipe}
                              @item{"Rocket" [Rocket.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=KY4s7msuh6" "WeScheme")] preloaded on students' machines}
                              @item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Watch out for students confusing the rocket's height and time - many students will assume that the @code{rocket-height} function produces the time the rocket has been flying, rather than how high it is.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Can students make the rocket fly faster?}
                                                       @item{Can students make the rocket sink, instead of fly?}
                                                       @item{Can students make the rocket fly faster over time?}]}
                )
      ]{
        @points[@point{@student{Functions are a key part of animation in computer programs. A function that draws a static picture of a cat, for example, can place the cat at a different location based on the input. When that input changes slightly based on time or user-interaction, the cat will appear to move. This is similar to the way that flip-book animations work, in which each page draws a static image that has changed by a small amount. When the pages are displayed quickly, the images appear to change smoothly. @(video-link (hyperlink "http://www.youtube.com/embed/txj6nIixIq4?t=22s" "(Click here for an example of a flip-book animation.)")).}
                        @teacher{@management{Review the importance of definitions for students (defining values helps cut down on redundancy and makes future changes easier, defining functions allows for simplicity and testability. Be sure to use vocabulary regularly and carefully, pushing students to use the proper terms throughout.)}}
                        }
                 @point{@student{Let's see an example of this kind of animation, using a function to make a rocket-blast off! Turn to @worksheet-link[#:page 11 #:name "Design-Recipe-Rocket-Height"] in your workbook, and read the word problem carefully. 
                         @bannerline{A rocket blasts off, traveling at 7 meters per second. Write a function called @code{rocket-height} that takes in the number of seconds that have passed since the rocket took off, and which produces the height of the rocket at that time.}
                         @activity{@itemlist[@item{What is the @code{rocket-height} function taking in as input? What type of data is that?}
                                              @item{What is the function producing as outnput? What type of data is that?}
                                              @item{What are the three parts of a @vocab{Contract}?}
                                              @item{What is the @vocab{Name} of the function you are being asked to define?}
                                              @item{What is the @vocab{Domain} of the function?}
                                              @item{What is the @vocab{Range} of the function?}]}}
                         @teacher{Check student understanding carefully, to make sure students read the problem carefully. It may be helpful to draw a diagram or table showing the change of rocket position on the board, and to have students verbally walk through a few examples.}
                         }
                 @point{@student{The Contract is a way of thinking about the function in a general way, without having to worry about exactly how it will work or how it will be used. Starting with simple questions like these will make later steps much easier to think about. However, the Contract doesn't always enough information! The Domain for @code{star}, for example, specifies that the function needs a Number and two Strings, but doesn't mention the fact that the first String must be @code{"solid"} or @code{"outline"}. To add this information, programmers write @vocab{Purpose Statements}, which are simple sentences that explain what a function does.
                                 @activity{Underneath the Contract, copy the following simple Purpose Statement for @code{rocket-height}.}
                                 @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                        ; multiply the number of seconds by 7 to find the height}}
                         @teacher{This is an opportunity to talk about the importance of writing, clarity, and brevity. What information is essential for a purpose statement? What information is irrelevant?  A good purpose statement describes what is computed and how its inputs are used; it should go beyond the information given in the contract and implicit in the name of the function.}
                         }
                 @point{@student{Armed with the Contract and Purpose Statement, it becomes easy to write an @code{EXAMPLE}. Every example begins with the name of the function and a sample input, both of which are written in the Contract. In this case, you know that the function is called @code{rocket-height} and that it expects a single number as input. The Purpose Statement goes further, telling you that the input is multiplied by 7. We can use this two write two examples, with different numbers of seconds as inputs.
                                @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; multiply the number of seconds by 7 to find the height
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))}
                                @bold{Note:} The example shown above is broken into two lines! As functions and examples become more complex, it will become difficult to squeeze them into a single line. In your workbooks, every example and definition from this point onwards will use the two-line format.
                                @activity{In your workbook, write two new examples of @code{rocket-height} using different values for the number of seconds. Both examples will have a lot in common (they all use @code{rocket-height} as the function name, they all multiply their input by 7, etc). Once you are done writing them, circle only the parts of the examples that are @italic{changeable}.}}
                         @teacher{The main idea for students in this activity is to realize that the Contract and Purpose Statement can be relied upon to write examples. Ask students to justify  every part of each example, using only the Contract and Purpose Statement.  Students are often tripped up by the switch from one-line examples to two-line ones. Be @italic{very} careful to point this out to students, and to check their workbooks to see where they are writing their examples. At the end of the activity, make sure that students circle ONLY what has changed.}
                 }
                 @point{@student{By comparing two different examples, it is easy to tell what changes. According to the Purpose Statement, it is the number of seconds that the rocket has been flying.
                                 @activity{On your paper, label the items you circled with "seconds".}}
                         @teacher{Have a discussion with students about why "seconds" is a better name than "time". Talk about specificity, relevance, and readability.}}
                 @point{@student{Labeling what is @italic{changeable} gives programmers a sense for the names of a function's @vocab{variables}. 
                                                  @activity{How many variables does @code{rocket-height} have? What is the name of each variable? Define the function, using all the information from your Examples, Contract and Purpose Statement.}
                                  @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; multiply the number of seconds by 7 to find the height
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))
                                                       (define (rocket-height seconds)
                                                                (* seconds 7))}
                                  }
                         @teacher{As with the Examples, ask students to justify each part of the definition. In this case, the function name can be derived from the Contract, and the variable name and function body from the Examples.}}
                 @point{@student{The Design Recipe allows a programmer to focus on one step of the problem at a time, and to use previous steps to help complete the next one.
                                 @activity{@itemlist[@item{What does the @vocab{Contract} tell a programmer about a function?}
                                                      @item{What does the @vocab{Purpose Statement} tell a programmer about a function?}
                                                      @item{How do the Contract and Purpose Statement help a programmer write @vocab{Examples}?}
                                                      @item{Why is it helpful to circle and label the parts of the Examples that change?}
                                                      @item{How do all of these steps help a programmer define a function?}]}
                                 }
                         @teacher{}
                         }
                 @point{@student{You may have noticed that the Examples for @code{rocket-height} wrote out the multiplication (@code{(* 11 7)}), rather than the actual answer (@code{77}). Why bother to show the way a calculation is performed?  By doing this, Examples can provide hints about what process is taking place. In the provided Rocket code ([Rocket.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=KY4s7msuh6" "WeScheme")]), you will see why it is so important to show your work when writing examples. 
                                 @activity{Click "Run", and wait until a window appears with a rocket at the bottom of the screen and numbers for "time" and "height" at the top. This animation is set to update the rocket every time the spacebar is pressed, to simulate time going by. Hit the spacebar a few times, and notice that the time at the top of the window increases. Does the rocket move? Time is passing, but our rocket's height hasn't changed! Close the rocket window, so that you can see the code.}}
                         @teacher{}
                         }
                 @point{@student{The Contract for this function is correct: the function's Name, Domain and Range are all accurately written here. However, the next step definitely has some problems:
                                  @itemlist[#:style 'ordered
                                                    @item{There is only one Example. This makes it difficult to notice what is changing, which could lead to mistakes when identifying variables}
                                                    @item{The Example doesn't show how the height is calcluated - instead, this programmer just wrote the "answer", without showing their work.}]
                                  }
                         @teacher{}
                         }
                         
                 @point{@student{By skipping these steps in the Examples, it can be easy to make mistakes when defining the function. 
                                 @activity{Can you see the mistake the programmer made?}
                                 Without seeing multiple Examples, this programmer failed to realize that the height of the rocket has to be calculated for @italic{every input}. Instead, they just produce the same number every time (in this case, zero). As a result, the rocket is always at zero, no matter how many seconds have passed. 
                                 @activity{@itemlist[@item{Fix this programmer's Example to show their work.}
                                                      @item{Write a second Example, below the first one.}
                                                      @item{Fix the definition for the function, so that it multiplies the number of seconds by 7.}
                                                      @item{Click "Run", and then use the spacebar to make the rocket fly!}]}
                                 }
                         @teacher{}
                         }
        ]}

       
@lesson/studteach[
     #:title "Design Recipe Practice"
     #:duration "50 minutes"
     #:overview "Students use the Design Recipe to define simple functions (of one and two variables), given various word problems"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[@item{Given a contract and purpose statement for a simple function, students will be able to write two Examples.}
                                      @item{Given two examples for a simple function, students will be able to identify the variable.}
                                      @item{Given two examples for a simple function, students will be able to write the definition.}]
     #:product-outcomes @itemlist[@item{Students will write functions to solve simple problems by using the Design Recipe}]
     #:standards (list)
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
     #:preparation @itemlist[@item{Write agenda on board}
                              @item{Display Class posters, Language Table, Design Recipe}
                              @item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first time they've seen abstraction over image functions, and students are likely to think that @code{red-square} needs to take in other arguments, such as "solid" and "red".}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}
                                                       @item{}
                                                       @item{}]}
                )
      ]{
        @points[@point{@student{Remember that the Design Recipe is a roadmap for defining functions, which programmers use to make sure the code they write does what they want it to do. Each step builds on the last, so any mistakes can be caught early in the process. 
                                @activity{Turn to @worksheet-link[#:page 12 #:name "Design-Recipe-Red-Square"] in your workbook, and read the word problem carefully.
                                          @itemlist[@item{Circle the @vocab{Name} of the function, and underline what it takes in and what it produces.}
                                                       @item{Write the @vocab{Contract} for this function, using what you underlined to help you find the @vocab{Domain} and @vocab{Range}.}
                                                       @item{Underneath the Contract, write the @vocab{Purpose Statement} by summarizing what the function does in a single sentence}]}
                                }
                        @teacher{Challenge students to explain why this function does not need to know the color of the square, or whether or not it is solid. They main idea here is that the function already "knows" these things, so the only thing that is changing is the size of the square.}
                        }
                 @point{@student{Remember that the Contract and Purpose Statement can be used to write the Examples, even if a programmer isn't sure how to begin.
                                 @activity{Using only the Contract and Purpose Statement, see if you can answer the following questions:
                                           @itemlist[@item{Every Example begins with the name of the function. Where could you find the name of the function?}
                                                      @item{Every Example has to include sample inputs. Where could you find out how many inputs this function needs, and what types they are?}
                                                      @item{Every Example has to include an expression for what the function should @italic{do} when given an input. Where could you look to find out what this function does?}
                                                      @item{Write two Examples on your paper, then circle and label what is changing between them.}]}}
                        @teacher{Make sure students realize that every answer can be found in the Contract or Purpose Statement. Suggestion: write these steps on the board, and draw arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions each time they write Examples, and then using their own work from the previous step to find the answers. NOTE: students can solve this using either @code{square} or @code{rectangle}. The latter requires them to use the same variable twice, which is a useful thought-exercise.}
                        }
                 @point{@student{Once the two Examples are written and the variable (or variables) are labeled, it becomes easy to define the function. 
                                 @activity{Using the Contract, Purpose Statement and Examples, see if you can answer the following questions:
                                           @itemlist[@item{Every function definition begins with the name. Where did you write this already?}
                                                      @item{Every definition has to include variable names for the inputs. Where did you write these down?}
                                                      @item{Every definition should work exactly the way the Examples did. Where could you look to figure out what the function should @italic{do?}}
                                                      @item{Write the function definition on your paper.}]}}
                        @teacher{}
                        }
                 @point{@student{When typing in a function definition, be sure to type in all three parts: The Contract and Purpose Statement, the Examples and the Definition. When "Run" is clicked, the computer will read the definition, test your Examples to make sure it works correctly, and then add the definition to your language. Once added, you can use the function as if it were built into the computer. 
                                 @activity{Test out your function by using it with various inputs.
                                 @embedded-wescheme[#:id "redSquare"                                             
                                                                   #:height 200
                                                                   #:hide-project-name? #t
                                                                   #:hide-footer? #t
                                                                   #:definitions-text "; red-square : Number -> Image\n; draw a solid, red square using the given size\n(EXAMPLE (red-square 42) (square 42 \"solid\" \"red\"))\n(EXAMPLE (red-square 73) (square 73 \"solid\" \"red\"))\n(define (red-square size) (square size \"solid\" \"red\"))"
                                                                  ]}}
                        @teacher{}
                        }
                 @point{@student{Some functions take more than one input. The @code{red-square} function always makes solid red squares, with size being the only thing that varies. Suppose, however, we wanted the function to make red squares that could be @italic{either} solid or outline? This would mean that both the size and the style can vary, so a user might type @code{(red-square 50 "solid")} or @code{(red-square 50 "outline")}
                                 @activity{@itemlist[@item{How would that change the Domain of the function?}
                                                      @item{How would the Examples have to change?}
                                                      @item{How would the definition change?}]
                                            Change each part of the code you typed, to allow @code{red-square} to take in "solid" or "outline" as a second argument.}}
                        @teacher{}
                        }
                 @point{@student{The Design Recipe can be used for functions that take any number of inputs. As a simple example, take the following word problem:
                                 @activity{Turn to @worksheet-link[#:page 13 #:name "Design-Recipe-Yard-Area"] in the workbook, and read the word problem carefully.
                                                   @itemlist[@item{Circle the @vocab{Name} of the function, and underline what it takes in and what it produces.}
                                                              @item{How many things does this function take as input? Are they Numbers? Strings? Images?}
                                                              @item{Write the @vocab{Contract} for this function, using what you underlined to help you find the @vocab{Domain} and @vocab{Range}.}
                                                              @item{Underneath the Contract, write the @vocab{Purpose Statement} by summarizing what the function does in a single sentence.}
                                                              @item{Write two Examples for this function, then circle and label what varies between them.}
                                                              @item{Write the Definition for this function.}]}
                                 }
                         @teacher{If time allows, pass out extra Design Recipe worksheets [@resource-link[#:path "DesignRecipeWorksheet.pdf" #:label "PDF"] | @resource-link[#:path "DesignRecipeWorksheet.odt" #:label "Ooo"]], and have students practice with other word problems. Practice variations on red-square, involving two inputs changing while other parameters stay fixed.}
                        }
                 ]}
                                
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
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
        @points[@point{@student{In this unit, you started to see how functions are useful in writing animations: functions help produce information (such as the height of a rocket) that are used to create scenes in a game.  With the extra practice writing functions and using the Design Recipe, you are now ready to start writing functions that will move the elements within your own game.}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
@copyright[]

                                

                   
                                 
                              
               
                           
   