#lang curr/lib
@declare-tags[management]

@title{Unit 3: Introduction to Definitions}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
  @unit-descr{Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.}

}
@lesson/studteach[
     #:title "Review"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
                        @teacher{@management{Review Circles of Evaluation, paying special attention to @vocab{types} and @vocab{contracts}. Make sure that students are comfortable hearing - and using - the proper terminology to describe code.}}
                        }
                 ]}

       
@lesson/studteach[
     #:title "Defining Values"
     #:duration "10 minutes"
     #:overview "Students define names for simple values (Numbers, Strings and Images) and use them in expressions."
     #:learning-objectives @itemlist[]
     #:evidence-statements  @itemlist[@item{Students will be able to define names for Number, String and Image values.}
                                      @item{Given a definition, students will be able to identify the Name, Type and Value that is defined.}
                                      @item{Students will be able to explain what happens when the "Run" button is pressed.}]
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
        @points[@point{@student{Suppose you were making an image that had fifty identical, solid red triangles. You would have to write @code{(triangle 50 "solid" "red")} fifty times! To make matters worse, any change to those triangles would have to be repeated for all fifty expressions! Good programmers know that their effort is better spent elsewhere, so they made sure that programming languages have a way to avoid all that repetition.  They write something once, define it as a shortcut in the language, and then use the shortcut wherever they want.}
                       @teacher{}}
                @point{@student{We name values in our language using @vocab{define} statements.  The following code gives the name @code{shape1} to an expression that draws a solid red triangle..  
                                  @embedded-wescheme[#:id "definitions"     
                                                          #:height 300
                                                          #:width "100%"
                                                          #:hide-toolbar? #f
                                                          #:hide-project-name? #t
                                                          #:hide-footer? #t
                                                          #:hide-definitions? #f
                                                          #:definitions-text "(define shape1 (triangle 50 \"solid\" \"red\"))\n"]
                                 Definitions go in the upper window in your editor (the one above the 
                                 Interactions Window); this upper window is called the @vocab{Definitions Window}.        
                                  @activity{@itemlist[@item{Enter the @code{shape1} definition into the @vocab{Definitions Window}.}
                                            @item{Click "Run" to have the computer read that definition.}
                                            @item{What do you think will happen when you evaluate @code{shape1} in the Interactions window?}
                                            @item{Add a new line to the definitions window, just below the definition of @code{shape1}. Add a new definition called @code{shape2}, and define it to be a solid, blue circle of radius 20.}
                                            @item{Click "Run", and try evaluating @code{shape2.}}
                                            @item{On the next line, define a new value called @code{age} to be the number of years old that you are.}
                                            @item{On the next line, define a new value called @code{name} to be the String that represents your name.}]}
                        
                          @bannerline{Each time "Run" is clicked, the computer reads all of the definitions and adds them to the language. If a definition is changed, the computer will keep using the previous definition until the next time "Run" is clicked.}
                          @activity{One a new line in the Definitions Window, define a value called @code{eyes} to be the color of your eyes.  Don't hit "Run" yet!  
                                    @itemlist[@item{Go into the Interactions Window and try evaluating @code{eyes}.  You should get an error message that the computer doesn't know about @code{eyes}, because you didn't click "Run" after adding the definition.}
                                              @item{Click "Run".}
                                              @item{Try asking for @code{eyes} in the Interactions Window again.  This time, you should not get the error.}]}
                          Definitions are useful because we can reuse them in other expressions.  For example, we could use @code{eyes} inside another expression, such as @code{(circle 10 "solid" eyes)}.  Let's practice using definitions inside other expressions.
                          @activity{Create the following definitions in the Definitions Window, and check them out in the Interactions Window:
                                    @itemlist[@item{Define a value called @code{prize} to be a solid yellow star (you pick the size).}
                                              @item{Define a value called @code{big} that uses @code{scale} to make your @code{prize} three times larger.}
                                              @item{Define a value called @code{tilt} that uses @code{rotate} to turn your big yellow star by @code{45} degrees.}
                                              @item{Type @code{tilt} in the Interactions Window, and make sure you get a large, tilted, yellow star.}
                                              @item{It turns out that green stars are more popular as prizes than yellow stars.  Change the expression in your @code{prize} definition to make the star green instead of yellow.  Click "Run" so the computer will read your new definition.}
                                              @item{Now type @code{tilt} in the Interactions Window again.  What color star did you get?  If you defined each of @code{big} and @code{tilt} to use your definitions, you should get a tilted green star!  If you didn't get a green star, try to fix your definitions to make that happen.}
                                             ]
                                   }
                          }
                        @teacher{It is important to give students ample time to experiment with @code{define}.  Students need to understand that they can use the defined name in place of the value.  Have them define several values (each of different types), and then practice using them inside other expressions.}
                        }
                 ]
}
     
@lesson/studteach[
     #:title "Game Images"
     #:duration "30 minutes"
     #:overview "Students define values in their videogames"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students will name their videogame project}
                                  @item{Students will modify the definitions for @code{TITLE, TITLE-COLOR, BACKGROUND, PLAYER, TARGET} and @code{DANGER}}]
     #:standards (list)
     #:materials @itemlist[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers.}]
     #:preparation @itemlist[@item{Create student game files. [See the (teachers-only) @resource-link[#:path "teachers/teachers-guide/teachers-guide.html" #:label "Teachers Guide"]]}
                              @item{On student machines: Student Game Files (generated from "Game" template [Game.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=Q1X9Y8ZayX" "WeScheme")])}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Open the videogame file so that you can see the code, and click "Run". (You may need to wait a few seconds for the images to load!) The window that appears is a running videogame, but you probably notice that nothing is moving - even if you hit the "up" or down" arrows! For now, click the "close" button to return to the code.}
                                In the Definitions window, you will see that this program defines several values: @code{TITLE}, for example, is defined to the be the String @code{"My Game"}.
                                @activity{@itemlist[@item{If you type @code{TITLE} into the Interactions window, what do you think it would evaluate to?}
                                           @item{What other definitions do you see?}
                                           @item{What are their values?}
                                           @item{What are their types?}
                                           @item{Try evaluating each of these values in the Interactions window, starting with @code{BACKGROUND}}]}
                                }
                        @teacher{@management{By now, you should have students' graphics already created, and @(hyperlink "http://www.bootstrapworld.org/materials/resources/teachers/teachers-guide/teachers-guide.html#addingimages" "added to the file)").}
                                  The purpose of this activity is to increase students' confidence in @italic{reading} and @italic{talking about} code. Make sure students get a lot of practice speaking aloud, both to each other and to the instructor.}
                        }
                 @point{@student{If you don't like the definitions provided here, you can change them! You can modify the @code{TITLE} and @code{TITLE-COLOR} to change what is displayed at the top of your screen, and you can change the definitions for your game images as well: @(video-link (hyperlink "http://www.youtube.com/watch?v=99plAjsjx78" "Video: A screencast of this section - follow along to see how to change images in your game")).}
                         @teacher{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds! TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with. For more instructions on setting up the game files, read the @(hyperlink "../../resources/teachers-guide/teachers-guide.html#addingimages" "Coding Instructions") document.}
                         }
                 @point{@student{If you want to change one of your definitions so that the image is smaller or larger, you can use the @code{scale} function:
                                  @code[#:multi-line #t]{; scale : Number Image -> Image}
                                  This function resizes the @code{Image} based on the @code{Number}. For example, @code{(scale 10 (triangle 5 "solid" "green")} will make the that tiny triangle ten times as large, while @code{(scale 0.5 (rectangle 200 100 "outline" "purple"))} will shrink the rectangle by half.
                                  @activity{Practice using @code{scale} to grow and shrink different images. If you would like to experiment with more functions, try using the contracts below:
                                                           @code[#:multi-line #t]{; flip-vertical : Image -> Image
                                                                                  ; flip-horizontal : Image -> Image
                                                                                  ; rotate : Number Image -> Image}
                                                            @embedded-wescheme[#:id "ScalePlayground"                                             
                                                                   #:height 200
                                                                   #:hide-toolbar? #t
                                                                   #:hide-project-name? #t
                                                                   #:hide-footer? #t
                                                                   #:hide-definitions? #t
                                                                   #:interactions-text "(scale 3 (star 50 \"solid\" \"red\"))"]}
                                  }
                         @teacher{If a student struggles here, you should fall back to the Circles of Evaluation and Contracts. For example: have the student first draw a circle for @code{rotate}, and have them use the Contract to figure out what the inputs are. When they get to the second input (the @code{image}), ask them what kind of shape they want to rotate. Whatever their answer is, have them look it up in their contracts page, and draw a Circle of Evaluation @italic{inside} the one they drew for @code{rotate}. Once the Circle of Evaluation is correct, have them convert it to code. Once they are confident, you can challenge them to apply another operation to the whole expression, perhaps flipping the rotated shape vertically.}
                         }
                 @point{@student{Another definition in this program is @code{SCREENSHOT}. This expression uses the @code{put-image} function to layer one image on top of another, using coordinates to decide where to place each image. 
                         @activity{Advertisements for videogames often have static pictures (called @italic{screenshots}) of the game in action, so people will know what it looks like to play. Change the coordinates used in the definition of @code{SCREENSHOT} so that you have a picture of your game. (Remember: the screen is 640 pixels wide, by 480 pixels tall!)}}
                         @teacher{This can be a useful opportunity to review coordinates, especially for students who need the practice.}
                        }
                 @point{@student{Being able to define values in a programming language is a powerful tool, which allows programmers to simplify their code and make it both more readable and maintainable. }
                         @teacher{}
                         }
             ]
         }
       
@lesson/studteach[
     #:title "Fast Functions"
     #:duration "15 minutes"
     #:overview "Students are get a taste of the Design Recipe, but primarily they're introduced to the syntax for function definition."
     #:learning-objectives @itemlist[@item{Students will be able to define very simple functions, given a simple word problem.}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students will define at least two functions, using the Design Recipe}]
     #:standards (list "F-IF.1-3" "F.IF.7-9" "F-BF.1-2")
     #:materials @itemlist[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers.}]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
                 ]{
                   @points[@point{@student{Defining a @vocab{value} is helpful when a program has lots of identical expressions. Sometimes, however, a program has expressions that aren't identical, but are just @italic{very similar}. A program that has fifty solid, green triangles can be simplified by defining a single value, @italic{as long as they are all the same size}. But what if a program has fifty green triangles of different sizes?}
                                   @teacher{}
                                   }
                            @point{@student{Think about the Image functions you have already used, 
				           like @code{star} and @code{circle}.  They take inputs and produce 
					   images.  Similarly, we might want a green-triangle function that 
					   takes the size as an input and produces a green triangle.  
					   The programming language doesn't provide this function, 
					   but it does let you define your own functions.  We want to define
					   our own function (let's call it @code{gt}, for green triangle) that
					   takes in a Number and produces a solid green triangle of whatever size we want.
                                           @itemlist[@item{@code{(gt 10)} would be a shortcut for @code{(triangle 10 "solid" "green")}}
                                                     @item{@code{(gt 20)} would be a shortcut for @code{(triangle 20 "solid" "green")}}
                                                     @item{@code{(gt 1980)} would be a shortcut for @code{(triangle 1980 "solid" "green")}}
                                                     @item{@code{(gt 98)} would be a shortcut for @code{(triangle 98 "solid" "green")}}
                                                     @item{and so on...}]
                                            Problems that require a function definition can be phrased as a word problem:
                                            @bannerline{Write a function @code{gt}, which takes in a Number and produces a solid, green triangle of the given size.}
                                            Luckily, we can follow specific steps to define functions from word problems.  Let's work through the steps to define @code{gt}.
                                            }
                                    @teacher{To make this more concrete, have a student "act" as gt. To call the function, another student says "gt ten!" (calling out both the name of the function and the input). The actor responds "triangle ten solid green", to signify the work that the function does when it recieves an input.}
                                    }
                            @point{@student{@bannerline{Step 1: Write the Contract}
                                             The first step in defining a function is to write its @vocab{Contract}. The word problem provides several clues:
                                              @itemlist[@item{The @vocab{Name} of the function is given, as @code{gt}}
                                                         @item{The @vocab{Domain} of a function is the types of data that the function expects: in this case, just a single Number.}
                                                         @item{The @vocab{Range} of this function is the type of data that the function produces: in this case an Image since it produces solid, green triangles}]
                                              @code[#:multi-line ""]{; gt : Number -> Image}
                                              Be sure to read the problem carefully! Some word problems will describe functions that take multiple inputs in their Domain, or inputs of different types.
                                              @activity{Open your workbook to @worksheet-link[#:page 8 #:name "Fast-Functions"], where it says "fast functions", and write the Contract for the @code{gt} function.}}
                                    @teacher{It is often a good idea to give students examples of different word problems, and have them pick out the contract for each one.}
                                    }
                            @point{@student{@bannerline{Step 2: Give Examples}
                                             It's always a good idea to think through a few examples before defining the function. Examples show the shortcut that a function is trying to provide.  This programming language provides a special construct, called @code{EXAMPLE}, which helps you write down how the function is used and what it should compute. You can see two such examples here, written under the contract:
                                             @code[#:multi-line ""]{; gt : Number -> Image
                                                                    (EXAMPLE (gt   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (gt  100) (triangle  100 "solid" "green"))}
                                             These examples tell the computer that writing @code{(gt 50)} should produce the same result as @code{(triangle 50 "solid" "green")}, and that @code{(gt 100)} is equivalent to @code{(triangle 100 "solid" "green")}. The word problem specifies that the examples @italic{must} use the name 'gt', and must all produce solid, green triangles.
                                             @activity{In your workbook, write two examples of your own for this function.}}
                                    @teacher{Be sure to point out that EXAMPLE is capitalized! Many students will follow along here without really understanding, simply by pattern-matching. Be sure to ask them lots of questions, to have them justify each step:
                                             @itemlist[@item{Why does the example have to start with gt? (Because it's the Name of the function, specified in the contract)}
                                                        @item{How do we know @code{gt} requires only one number? (Because it's the Domain of the function, specified in the contract)}
                                                        @item{How do we know to use @code{triangle}? (Because the word problem tells us what shape it has to produce)}
                                                        @item{How do we know the triangle has to be solid and green? (Because the word problem tells us what shape it has to produce)}
                                                        @item{How do we know the correct order for the inputs to @code{triangle}? (The contract for @code{triangle} tells us)}] One of the big ideas here is that each step informs the subsequent step. Make sure to explicitly connect them for students, pointing out that the Contract gives strong hints about how to write each part of the examples. }
                                    }
                            @point{@student{Programmers often write several examples for each function. Examples like these are a way for a programmer to think through their work.  Examples also make it easy to look at what parts of the expression can change, or @italic{vary}, depending on the inputs.
                                    @activity{Write the following examples on paper and circle the parts of the examples that are different:
                                             @code[#:multi-line ""]{(EXAMPLE (gt   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (gt  100) (triangle  100 "solid" "green"))}}

                                    Once you know which parts of the expression change, label the circles with a names that describe their contents.  For example, in our two @code{gt} examples, we have circled the @italic{size} of the triangle.  Your circled and labeled expressions should look like the following diagram: 
                                    @item{@bitmap{images/circled-examples.png}}}
                            @teacher{Pay close attention to what students circle: they should circle something in each part of the Example (the function use on the left and the expression on the right); they should also use the same name for the same concept across the expressions.  Their circles will correspond to the variables in their functions, so the variables should appear in both the left and the right sides of the Example.}
                                    }
                            @point{@student{@bannerline{Step 3: Define the function}
                                             After writing the Contract, two Examples, and the labeled circles, defining the function itself is relatively simple.
                                             @itemlist[@item{Copy everything that stays the same (everything that wasn't boxed) in one of your EXAMPLE lines (onto paper or into your editor)}
                                                       @item{In place of each circle, write the label you gave to that circle}
                                                       @item{Change @code{EXAMPLE} to @code{define}}]
                                             @code[#:multi-line ""]{; gt : Number -> Image
(EXAMPLE (gt   50) (triangle   50 "solid" "green"))
(EXAMPLE (gt  100) (triangle  100 "solid" "green"))
(define  (gt size) (triangle size "solid" "green"))}}
                                    @teacher{This can be a good opportunity to point out that the parts of the examples that were changeable (or @italic{vary-able}) are what determines when we need to use the @italic{variable}.}
                                    }
                            @point{@student{@activity{@itemlist[@item{On your paper, define the @code{gt} function, then type the @vocab{Contract}, @vocab{Examples} and @code{Definition} into the Definitions window.}
                                                         @item{Click "Run", to have the computer read this definition.}
                                                         @item{Use the function you've defined, by typing @code{(gt 100)} in the Interactions window.}
                                                         @item{Try using the function with different Numbers}]}
                                    @embedded-wescheme[#:id "Fast Functions"
                                                            #:height 300
                                                            #:hide-project-name? #t
                                                            #:hide-footer? #t
                                                            #:definitions-text "; gt : Number -> Image
(EXAMPLE (gt 50) (triangle 50 \"solid\" \"green\"))
(EXAMPLE (gt 95) (triangle 95 \"solid\" \"green\"))
(define (gt size) (triangle size \"solid\" \"green\"))"]}
                                    @teacher{}
                                    }
                            @point{@student{These steps are knows as the @vocab{Design Recipe}, which is a powerful tool for defining functions based on word problems.
                                            @bannerline{Practice: Write a function @code{bc}, which takes in a Number and produces a solid, blue circle of the given size.}
                                            @activity{In your workbook (still on @worksheet-link[#:page 8 #:name "Fast-Functions"]), fill out the @vocab{Contract} for this function.
                                                      @itemlist[@item{What is the function's Name?}
                                                                 @item{What is the function's Domain?}
                                                                 @item{What is the function's Range?}]
                                                      Using the Contract you've written, write two @vocab{Examples} for the function.
                                                      @itemlist[@item{What part of the Contract helps you fill in the left side of an Example?}
                                                                 @item{What part of the Contract tells you what the function needs as input?}
                                                                 @item{How can the Range of a function help you write the Example?}]
                                                      Looking at those two examples, circle the parts that are @italic{change-able}, then label them with a good @vocab{variable name}.
                                                      @itemlist[@item{Is the variable name you chose the same as the one you chose for @code{gt}? Why or why not?}
                                                                 @item{Why is it helpful to choose a variable name before defining the function?}]
                                                      Now write the @vocab{function definition}, using the Examples you've written.}
                                            Thinking through the word problem step-by-step, we arrive at:
                                             @code[#:multi-line ""]{; bc : Number -> Image
(EXAMPLE (bc     16) (circle     16 "solid" "blue"))
(EXAMPLE (bc    421) (circle    421 "solid" "blue"))
(define  (bc radius) (circle radius "solid" "blue"))}
                                            }
                                    @teacher{You will want to explicitly connect each step in the Design Recipe to every other step. Ask students to justify each part of their Contract by referring back to the Word Problem, to justify each step of their Examples by referring back to the Word Problem @italic{and} Contract, and finally to justify each step of the definition by referring to the Word Problem, Contract and Examples. The same variable name can be used in multiple functions, just as in math (where many functions use @code{x} as the variable name, for example)}
                                             }
                             @point{@student{@bannerline{Practice: Write a function @code{dot}, which takes in a Color and produces a solid circle of the given color, with a radius of 20.}
                                            @activity{In your workbook (still on @worksheet-link[#:page 8 #:name "Fast-Functions"]), fill out the @vocab{Contract} for this function.
                                                      @itemlist[@item{What is the function's Name?}
                                                                 @item{What is the function's Domain?}
                                                                 @item{What is the function's Range?}]
                                                      Using the Contract you've written, write two @vocab{Examples} for the function, then circle and label the variables.
                                                      @itemlist[@item{What part of the Contract helps you fill in the left side of an Example?}
                                                                 @item{What part of the Contract tells you what the function needs as input?}
                                                                 @item{How can the Range of a function help you write the Example?}
                                                                 @item{What is a good variable name for what changes between these Examples.}]
                                                      Now write the @vocab{function definition}, using the Examples you've written.}
                                            Thinking through the word problem step-by-step, we arrive at:
                                             @code[#:multi-line ""]{; dot : String -> Image
(EXAMPLE (dot  "red") (circle 15 "solid"  "red"))
(EXAMPLE (dot "blue") (circle 15 "solid" "blue"))
(define  (dot  color) (circle 15 "solid"  color))}
                                            }
                                    @teacher{}
                                    }  
                                     ]
                    }
       
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
        @points[@point{@student{In this unit, you learned how to name values and define functions.  You will use named values to provide images for your game elements.  You will use functions to make your game elements move.  As you will see soon, functions are critical to making games.  You'll do a bit more practice with them in the next unit, including writing your first function that makes something move across the screen.}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}

       

@copyright[]
