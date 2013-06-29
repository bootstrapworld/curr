#lang curr/lib
@declare-tags[management pedagogy selftaught group]

@title{Unit 3: The Definitions Window}

@overview{

@unit-descr{Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.}

@objectives[@item{Learn about examples, variables and functions}
       @item{Practice Racket syntax and the Circle of Evaluation}]


@product-outcomes[@item{Students will write functions to solve simple problems in which a number is used to create an image, when given a word problem and a worked example.}
       @item{Students will write examples (unit tests) to check those functions}]

@state-standards

@length-of-lesson[90]

@pedagogy{
@materials[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class poster (List of rules, language table, course calendar)}
           @item{Language Table (see below)}]

@preparation[@item{Create student game files. [See the (teachers-only) @resource-link[#:path "teachers/teachers-guide/teachers-guide.html" #:label "Teachers Guide"]]}
           @item{On student machines: Student Game Files (generated from "Game" template [Game.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=Q1X9Y8ZayX" "WeScheme")])}
           @item{Write agenda on board, and post along with class posters and the Language Table}
           @item{Seating arrangements: ideally clusters of desks/tables}
           @item{Optional: demo machine with projector to show the interations and definitions windows}]}



@(language-table
                 (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{radial-star scale rotate put-image}))
}
@lesson/studteach[
     #:title "Review"
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
        @points[@point{@student{}
                        @teacher{@management{Review Circles of Evaluation, paying special attention to @vocab{types} and @vocab{contracts}. Make sure that students are comfortable hearing - and using - the proper terminology to describe code.}}
                        }
                 ]}

       
@lesson/studteach[
     #:title "Defining Values"
     #:duration "10 minutes"
     #:overview "Students define simple values (Numbers, Strings and Images) and use them in expressions."
     #:learning-objectives @itemlist[@item{Students will be able to define Number, String and Image values.}
                                      @item{Given a definition, students will be able to identify the Name, Type and Value that is defined.}
                                      @item{Students will be able to explain what happens when the "Run" button is pressed.}]
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
        @points[@point{@student{Suppose you were making an image that had fifty identical, solid red triangles. You would have to write @code{(triangle 50 "solid" "red")} fifty times! To make matters worse, any change to those triangles would have to be repeated for all fifty expressions! Good programmers know that their effort is better spent elsewhere, so they made sure that programming languages have a way to avoid all that repetion. What we want is a way to write something once, define it as a shortcut our language, and then use the shortcut wherever we want. To do this, we need to use the @vocab{Definitions window}.
                        @activity{In this language, we can @vocab{define} values of our own, and give them a name. The code below assigns the name @code{shape1} to an expression that draws a solid red triangle. Click "Run" to have the computer read that definition.
                                  @itemlist[@item{What do you think will happen when you evaluate @code{shape1} in the Interactions window?}
                                           @item{Add a new line to the definitions window, just below the definition of @code{shape}. Add a new definition called @code{shape2}, and define it to be a solid, blue circle of radius 20.}
                                           @item{Click "Run", and try evaluating @code{shape2.}}
                                           @item{On the next line, define a new value called @code{age}, to be the number of years old that you are.}
                                           @item{On the next line, define a new value called @code{name}, to be the String that represents your name.}]
                          @embedded-wescheme[#:id "definitions"     
                                  #:height 300
                                  #:width "100%"
                                  #:hide-toolbar? #f
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #f
                                  #:definitions-text "(define shape1 (triangle 50 \"solid\" \"red\"))"]}
                        
                          Now that it is defined, we can use @code{shape} anywhere we want - even inside another expression: @code{(rotate 45 shape1)}.
                          @bannerline{Each time "Run" is clicked, the computer reads all of the definitions and adds them to the language. If a definition is changed, the computer will keep using the previous definition until the next time "Run" is clicked.}
                          }
                        @teacher{It is important to give students ample time to experiment with @code{define}. Have them define several values (each of different types), and then practice using them inside other expressions.}
                        }
                 ]
}
     
@lesson/studteach[
     #:title "Game Images"
     #:duration "30 minutes"
     #:overview "Students define values in their videogames"
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[@item{Students will name their videogame project}
                                   @item{Students will modify the definitions for @code{TITLE, TITLE-COLOR, BACKGROUND, PLAYER, TARGET} and @code{DANGER}/}]
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
                 @point{@student{If you don't like the definitions provided here, you can change them! You can modify the @code{TITLE} and @code{TITLE-COLOR} to change what is displayed at the top of your screen, and you can change the definitions for your game images as well: @(video-link (hyperlink "http://www.youtube.com/watch?v=99plAjsjx78" "Video: A screencast of this section - follow along to see how to change images in your game.")). If you want to change one of your definitions, so that the image is smaller or larger, you can use the @code{scale} function:
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
                         @activity{Advertisements for videogames often have static pictures (called @italic{screenshots}) - of the game in action, so people will know what it looks like to play. Change with the coordinates used in the definition of @code{SCREENSHOT} so that you have a picture of your game. (Remember: the screen is 640 pixels wide, by 480 pixels tall!)}}
                         @teacher{This can be a useful opportunity to review coordinates, especially for students who need the practice.}
                        }
]}

@lesson[#:title "Fast Functions" #:duration "10 minutes"]{

@itemlist/splicing[
          @item{You've learned how to write complex expressions, and define shortcuts so that you can use them later. That's terrific...but we need more!}
          @item{The problem is that all of these expressions always return the @italic{same thing} - your screenshot, for example, will always look the same, every single time you evaluate it. What you want is a shortcut to a @italic{pattern}. That way the computer can just fill in the blanks for the stuff that's changed, and get the whole expression back. Up to now, you've been defining values. Now you're going to learn how to define @bold{functions}.}
          @item{My favorite shape in the whole world is a triangle, and my favorite color is green. I LOVE making solid green triangles! But right now, I have to type out so much code to do that! Suppose I wanted to make a solid, green triangle of size five. What code would I write? What if I wanted it to be of size 100? Size 24? @pedagogy{Ask students to tell you each of these}
           @code[#:multi-line]{(triangle 5 "solid" "green")
                             (triangle 100 "solid" "green")
                             (triangle 24 "solid" "green")}}
          @item{If only there was a function called @code{gt}, that would just take in the size and draw a solid green triangle of whatever size I wanted.}
          @pedagogy{@item{@skit{Who can help me, by acting out @code{gt}? Take a volunteer. Okay, your name is now "gt." All I need to do is call out your name, give you a number, and you will tell me the code to draw that beautiful triangle. Let's do a test: "gt fifty!". "gt one hundred!" The student should tell you the code to draw the appropriate triangle. Try having other students call out examples, making sure they call out both the name of the function and the number.}}}
          @selftaught{@item{Suppose you were going to act out the function @code{gt}. You already know to make a triangle, and you know that it will be solid and green. What's the one thing you @italic{don't} know? (The size!) So when someone calls your name and gives you a number, what code will you write? What code should you write when someone calls @code{(gt 50)}? @code{(gt 100)}?}}
          @item{Open your workbooks to @worksheet-link[#:page 8 #:name "Fast-Functions"], where it says "fast functions."}
          @item{On this page, there is space to write four simple functions. @pedagogy{We're going to do the first one together, and then we'll have a competition for the rest.}}
          @item{Let's start with the contract. What are the three parts of a contract?}
          @pedagogy{@item{Hey volunteer, what did I say your name was? "gt!" And what information did you need from me to do your job? just a number - the size!. And what did you produce, once I'd given you that number? An Image.}}
          @selftaught{@item{@think-about[#:question @list{When you used the @code{gt} command, what information did you need and what did you produce?}
                                                    #:answer "You needed the size of the triangle (a number) and produced the image."]}}
          @item{Fill in the first contract on the page -- it's the one with the shaded, gray bar.}
          @item{Now we have some space to write examples. @pedagogy{Let's think about the examples we saw our volunteer act out...}}
          @item{When I wanted him to make a solid green triangle of size fifty, what did I tell him? "gt fifty!". So in the first part of the EXAMPLE, we can write @code{(gt 50)}. So my example so far is
                                                                                                   
                 @code[#:multi-line ""]{; gt : Number -> Image
                                        (EXAMPLE (gt 50) __________________________)}}
          @item{Then what did he draw for me? A solid green triangle of size fifty! How would we write the code to draw that same shape? 
                
                @code[#:multi-line ""]{; gt : Number -> Image
                                    (EXAMPLE (gt 50) (triangle 50 "solid" "green"))}}
          @pedagogy{@item{Can someone write another example for me, this time using @code{17} as the size?
                 @code[#:multi-line ""]{; gt : Number -> Image
                                        (EXAMPLE (gt 50) (triangle 50 "solid" "green"))
                                        (EXAMPLE (gt 17) (triangle 17 "solid" "green"))}}}
          @item{Now, on your own, fill out two examples for @code{gt} on your Fast Functions worksheet.}
          @item{If only we had a function like @code{gt}! Well, let's build one!}
          @item{Right now, I'm telling the computer how to deal with a shortcut for @code{(gt 17)} - but what if I wanted the shortcut to work for ALL sizes, not just 50 and 17?}
          @item{That's the final step: replace the stuff that changes between examples with a variable. So let's look at these two lines, and circle everything that changes. What did we circle? Just the numbers 10 and 17! What do those numbers mean? Is it the number of circles we're drawing? No! It's the SIZE. So let's make a little note to ourselves, to remind us that those numbers mean the size of the circle. }
          @item{Now we can write the code -- instead of an EXAMPLE we'll use @code{define}. After that, we're just going to copy everything from our examples except the stuff that we circled. What do you think we'll write instead? We'll use the name we wrote down: size. 
          @pedagogy{Go character-by-character with the students, asking them if both examples have an open paren, the name "gt", etc...
                 @code[#:multi-line ""]{; gt : Number -> Image
                                        (EXAMPLE (gt 50) (triangle 50 "solid" "green"))
                                        (EXAMPLE (gt 17) (triangle 17 "solid" "green"))
                                        (define (gt size) (triangle size "solid" "green"))}}
          @selftaught{@embedded-wescheme[#:id "Fast Functions"
                   #:definitions-text "; gt : Number -> Image
(EXAMPLE (gt 50) (triangle 50 \"solid\" \"green\"))
(EXAMPLE (gt 95) (triangle 95 \"solid\" \"green\"))
(define (gt size) (triangle size \"solid\" \"green\"))"]}
                                }
          @item{What we've learned here is a @italic{recipe} for solving programming problems. By starting with a @bold{word problem}, we can act out the function, then write it's contract, imagine a few examples, and then use those examples to write the code! Let's do another for practice - you'll need to get really good at these to build the functions you'll need for your videogame!}
          ]}


                                                      
@lesson[#:title "Blue Circle" #:duration "10 minutes"
                #:prerequisites "Fast-Functions"]{

@itemlist/splicing[
          @item{Now it's your turn!}
          @tag[selftaught]{@item{INSERT VIDEO FOR SELFTAUGHT HERE}}
          @pedagogy{@item{Raise your hand if you want to help me act out this next function. We'll come up with some examples together, and your group will have to write two more on paper!}}
          @pedagogy{@item{Hand the student the sign that says "bc" and ask them to come to the whiteboard.}}
          @pedagogy{@item{@skit{When I say "bc 50", you'll draw a solid blue circle of size 50. Let's try it out. "bc fifty!". Wait for student to draw a circle. Then have several other students give examples to your function, by calling out "bc" and a number. Make sure that the student answering gives an appropriately sized circle return every time.}}}
          @item{I want to write a function called @code{bc}, which takes in a number and draws me a solid, blue circle that is whatever size the number was. @pedagogy{Just like our volunteer here.}}
          @item{First, you need to write down the CONTRACT for this function. @pedagogy{Once again, everyone in your group needs to have the correct answer! You'll have 2 minutes. GO!}}
          @item{Now it's time to write some examples. Let's look at the first example "bc" drew on the board, for @code{(bc 50)}. @think-about[#:question "What shape did they draw? What color? What size? How would you write the code to draw that shape?" #:answer @list{@pedagogy{(write on the board):} @code{ (EXAMPLE (bc 50) (circle 50 "solid" "blue" ))}}]}
          @tag[group]{@item{You have 2 minutes for EVERYONE in your group to write out 2 examples of your own. ALL OF THEM have to be correct for your team to get this point. GO!}}
          @pedagogy{@item{Countdown: 30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES ON ME. (Don't forget to wait for total silence, attention.)}}
          @pedagogy{@item{Give points, praise kids for neat handwriting and good teamwork.}}
          @pedagogy{@item{Give the countdown, then review answers with the class and assign points. }}
          @item{Time for the last part: writing the function header and body. @tag[group]{Your team will have 2 minutes to complete this. GO!}}
          @pedagogy{@item{Give the countdown, then review answers with the class and assign points. }}
          @tag[selftaught]{@item{@embedded-wescheme[#:id "Blue Circle"
                   #:definitions-text "; Try out Blue Circle"]}}
          ]}
                                                 
@lesson[#:title "Double" #:duration "10 minutes" #:prerequisites "Fast-Functions"]{

@itemlist/splicing[
         @pedagogy{@item{@think-about[#:question @list{I want a volunteer to be a function called "double", which takes in a number and multiplies it by two. @pedagogy{Hand the sign to the student.} So if I say "double 3", what will I get back?"}]}}
         @tag[selftaught]{@item{Now think of a function that takes in a number and multiplies it by two. @think-about[#:question "What would double 3 be?" #:answer "6"]}} 
         @pedagogy{@item{Have a couple of students try out the function by giving examples}}
         @pedagogy{@item{You will have TWO minutes to write down that contract and two examples. Once you've got your examples, RAISE YOUR HAND and call me over, so I can check them. Two minutes, ready - go!}}
         @pedagogy{@item{Give the countdown, then review answers with the class and assign points.}}
         @pedagogy{@item{Raise your hand if you think you know how you could write an example for "double". (If you get blank stares, give them ONE example on the board. Otherwise, smile and move on.)}}
         @tag[group]{@item{Your groups will now have FIVE minutes to write two examples, and then circle and label what has changed. Then you can fill out the function header and body. Once you've got your examples, RAISE YOUR HAND and call me over, so I can check them. Do NOT go on to the function header and body until I have checked your examples! Any questions? GO!}}
         @pedagogy{@item{Give the countdown, then review answers with the class and assign points. If time allows, do another example, preferably one where the domain is something besides numbers.}}
                 @tag[selftaught]{@item{@embedded-wescheme[#:id "Double"
                   #:definitions-text "; Try out Double"]}}]}
        }
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
        @points[@point{@student{}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
}
       

@copyright[]
