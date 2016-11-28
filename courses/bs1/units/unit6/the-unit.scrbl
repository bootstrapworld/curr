#lang curr/lib
@declare-tags[]

@title{Unit 6: Teaching Functions to Compare}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Students discover Boolean types, and use them to create programs that test values, and then model scenarios using these programs.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1WvlflsKM28IOwgyV2HttnGxul3sAUnL0-KOZhvb6C2s/edit?usp=sharing" "Warmup activity sheet").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@item{@student{What datatypes have you seen so far? Can you think of @code{Number} values? @code{String} values? @code{Image} values?
                               What are some expressions that evaluate to a @code{Number}? How about the other datatypes?}
                       @teacher{Before introducing a new datatype (Booleans), this would be a good time to quickly review the three major 
                                contexts students have learned for working with expressions: Circles of Evaluation, Contracts and Design Recipe.
                                In this lesson, students will apply each one of them to Booleans, discovering that everything they've already 
                                learn still applies - even in the new type.}}]}

@lesson/studteach[
     #:title "Booleans"
     #:duration "10 minutes"
     #:overview "Students are introduced to a new type (Boolean), and practice using it with Circles of Evaluation, Contracts and Code."
     #:learning-objectives @itemlist[@item{Students learn about Boolean values and functions that manipulate them}]
     #:evidence-statements @itemlist[@item{Students will know the two Boolean values (true and false)}
                                     @item{Students will write Circles of Evaluation for Boolean-producing functions}
                                     @item{Students learn how to use arithmetic operators (like @code{<} and @code{>}) that produce Booleans}
                                    ]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator/dr-assess "Booleans" "enough-cash-design-recipe-assess" "Do You Have Enough Cash?")
                       (make-exercise-locator/dr-assess "Booleans" "long-name-design-recipe-assess" "Is This Name Long?")
                       (make-exercise-locator/dr-assess "Booleans" "equal-length-design-recipe-assess" "Do Strings Have the Same Size?")
                       (make-exercise-locator/dr-assess "Booleans" "enough-carpet-design-recipe-assess" "Do You Have Enough Carpet?")
		       )
     #:standards (list "7.EE.3-4" "BS-IDE" "BS-PL.1" "BS-PL.2")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[@item{Students are logged into WeScheme.org, OR have opened DrRacket.}]
     #:prerequisites (list "Intro to Programming" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-IDE&1&1")]{What would each of the following expressions @vocab{evaluate} to? (If you're not sure, you can type it in and try it out!)
                              @itemlist[@item{@code{(+ 1 4)}}
                                         @item{@code{(/ 4 2)}}
                                         @item{@code{(circle 10 "solid" "blue")}}
                                         @item{@code{(< 3 4)}}]}}
                        @teacher{[@(hyperlink "https://www.youtube.com/watch?v=OMQO66wWqjk" "Video")]}
                        }
                 @point{@student{The last expression, @code{(< 3 4)},
                                                      uses a new function that @italic{compares Numbers}, returning
                                                      @code{true} if 3 is less than 4. What do you think it would return if the numbers were swapped?
                                                      @activity[#:forevidence (list "BS-IDE&1&1")]{
                                                                                                   The function @code{<} tests if one number is less than another. Can you think of some other tests? 
                                                                                                                Try them out in the Interactions window.} }
                         @teacher{Give students plenty of practice here! You can see a video demonstration of this intro at @(video-link (hyperlink "http://www.youtube.com/watch?v=X7gAXxpBhUo" "Video Lesson: Intro to Booleans"))}
                         }
                 @point{@student{Functions like @code{<}, @code{>} and @code{=} all consume two Numbers as their Domain, and produce a special value called a 
                         @vocab{Boolean} as their Range. Booleans are answers to a yes-or-no question, and Boolean functions are used to perform tests. 
                         In a videogame, you might test if a player has walked into a wall, or if their health is equal to zero. A machine in a doctor's 
                         office might use Booleans to test if a patient's heartrate is above or below a certain level.
                                                @bannerline{Boolean values can only be @code{true} or @code{false}.}}
                         @teacher{}
                         }
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1")]{Try typing a Number into the Interactions window and hitting Enter. What do you expect to get back? What about a String? Now try a Boolean, such as @code{false}.  
                                    As with all values, Booleans evaluate to themselves. The Circles of Evaluation can also be used with Booleans: try converting each of the following math expressions into Circles of Evaluation, and then converting those Circles into code:
                                    @itemlist[@item{@math{10 = 16.1}}
                                               @item{@math{-13 \gt 5}}
                                               @item{@math{40-1 \lt 90*2}}
                                               @item{@math{0 = -5 + 10}}]}}
                         @teacher{}
                         }
                 @point{@student{There are many other functions that produce Booleans. Here's one that can be used to compare two @vocab{Strings}: @code[#:multi-line #t]{(string=? "apples" "oranges")}
                                 Comparing strings comes in handy if you want to make sure the password someone typed is the right password. It comes in handy if you want to know whether 
                                 the user hit the @code{"up"} key or the @code{"down"} key. Where else might a programmer want to compare two strings?
                                 @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&3")]{Make sure you've written down the complete @vocab{Contract} for all four Boolean functions.}}
                         @teacher{Make sure students are comfortable using Booleans to compare more complex subexpressions, rather than just comparing two Numbers.}
                         }
                 ]}
                 
@lesson/studteach[
     #:title "onscreen? 1.0"
     #:duration "25 minutes"
     #:overview "Students use the Design Recipe to write a simple, Boolean-producing function"
     #:learning-objectives @itemlist[@item{Students use Booleans to determine whether a game element is partly visible onscreen}
                                     @item{Students write functions that use other functions they have written to compute answers}
                                    ]
     #:evidence-statements @itemlist[@item{Students can write functions that consume a single-axis coordinate and determine whether it is within the boundary of a fixed screen size}
                                     @item{Students can use one function they have written to compute the answer for another function}
]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-DR.2" "BS-DR.3" "F-IF.1-3" "F-IF.4-6" "7.EE.3-4" "8.F.1-3")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[@item{"Cage" [Cage.rkt from @(resource-link #:path "source-files.zip" #:label "source-files.zip") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "WeScheme")] preloaded on student machines.}]
     #:prerequisites (list "Booleans" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Many students struggle with the idea that "false" means "wrong". When students write EXAMPLEs for these functions, they will often avoid using "unsafe" coordinates, because they don't want to have an expression be "wrong". Remind them that these functions @bold{should} return false sometimes!}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Open the "Cage" program (Cage.rkt from @(resource-link #:path "source-files.zip" #:label "source-files.zip") or in @editor-link[#:public-id "bM6VNiLdkv" "WeScheme"]) on your computer, and click "Run". The window that pops up contains a butterfly, which you can move around using the arrow keys on your keyboard. This butterfly is named Sam, and the window is Sam's yard. Much like the videogame screen, this yard is 640 pixels wide by 480 pixels tall! As you can see, Sam is free to walk around the yard, and the coordinates at the top of the screen update to tell you his location.}
                        @teacher{This may be a good opportunity to review coordinates, for students who need the practice.}
                        }
                 @point{@student{@bitmap{images/buffer.png}Sam's mother tells him that it's okay for him to step outside of the yard, but only by a short distance! Specifically, she wants to make sure that she can always see at least a little piece of him. Sam is safe @italic{as long as some piece of him is onscreen}. That means he can go a little past zero on the lefthand size, or a little past 640 on the right - but how far @italic{can} he go?
                        }
                         @teacher{Pay close attention to the corner-cases: is Sam on the screen at 690? What about 680?}
                         }
                 @point{@student{@activity[#:forevidence (list "7.EE.3-4&1&5" "A-CED.1-4&1&1")]{Turn to @worksheet-link[#:name "Protecting-Sam"] in your workbook, and read through the top half of the page. Using the arrow keys, see how far Sam can go to the left @italic{while still staying onscreen}. You'll find that Sam is onscreen as long as his x-coordinate is @italic{greater than} -50, which is exactly the code that's filled in for the first problem on the page.
                                                                                                        @itemlist[@item{Find out how far Sam can go to the right while still being onscreen.}
                                                                                                                   @item{Fill in the code for the second problem.}
                                                                                                                   @item{Convert both of those expressions into Circles of Evaluation, using the empty Circles at the bottom of the page.}]}
                                  }
                         @teacher{}
                        }
                 @point{@student{Unfortunately, right now there is nothing to keep Sam from leaving his yard! Looking at the code for this program, we find three function definitions:
                                  @itemlist[@item{@code{safe-left?}, which takes in Sam's x-coordinate and checks to see if Sam is safe on the lefthand side of the screen. Right now, this function always returns @code{true}.}
                                             @item{@code{safe-right?}, which takes in Sam's x-coordinate and checks to see if Sam is safe on the righthand side of the screen. Right now, this function always returns @code{true}.}
                                             @item{@code{onscreen?}, which takes in Sam's x-coordinate and checks to see if at least tiny piece of Sam is on the screen. Right now, this function @italic{asks @code{safe-left?} if the given x-coordinate is safe.}}]
                                  Right now, all three functions return @code{true} no matter what Sam's x-coordinate is!}
                         @teacher{It's extremely valuable at this point to have three students stand, and act out each of these three functions:
                                  @itemlist[@item{Ask each student to tell you their Name, Domain and Range. If they get stuck, remind them that all of this information is written in their Contract!}
                                             @item{Practice calling each function, by saying their name and then giving them an x-coordinate. For example, "safe-left? fifty" means that the number @code{50} is being passed into @code{safe-left?}. That student should return "true", since the code currently returns @code{true} for all values of x.}
                                             @item{Do this for all three functions, and have the class practice calling them with different values as well.}
                                             @item{Note: the volunteer for @code{onscreen?} should first call @code{safe-left?}, before replying with the value.}]}
                         }
                 @point{@student{Right now @code{safe-left?} is ignoring Sam's x-coordinate, and blindly returning @code{true} no matter where he is. 
                                           What should the function be doing instead? 
                                           @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1")]{
                                                 Turn to @worksheet-link[#:name "safe-left"] in your workbook. Use the Design Recipe to fix this
                                                 function, so that @code{safe-left?} takes in Sam's x-coordinate and returns @code{true} or @code{false} 
                                                 depending on whether it is @italic{greater than -50}.}
                                           Once you have typed in the EXAMPLEs and definition for @code{safe-left?}, click "Run" and see if Sam is prevented 
                                           from flying off the lefthand side of the screen. Be sure to test your function in the Interactions window as well, 
                                           for example:
                                  @code[#:multi-line #t]{(safe-left? 50)
                                                         (safe-left? -100)
                                                         (onscreen? 50)
                                                         (onscreen? -100)}
                                  }
                         @teacher{Remind students that they've already written the check for this on page 19! 
                                  It may be helpful to have students complete this activity in parts, by giving them a short time
                                  to do the Contract and Purpose Statement, then a short time to write their first example, their second, etc. 
                                  By debriefing and reviewing after each step, you are likely to uncover misunderstandings earlier in the process.
                                 Have the three volunteers from earlier stand again, and act out the code now that @code{safe-left?} is written properly. As before, make sure students practice calling each function individually: now @code{safe-left?} will be able to return true and false (as will @code{onscreen?}), while @code{safe-right?} still returns only @code{true}.}
                         }
                 @point{@student{@activity[#:forevidence (list "7.EE.3-4&1&1" "7.EE.3-4&1&3" "7.EE.3-4&1&4" "7.EE.3-4&1&5" "7.EE.3-4&1&10" "F-IF.4-6&1&1")]{
                                     Turn to @worksheet-link[#:name "safe-right"] in your workbook. Use the Design Recipe to fix this function, 
                                     so that @code{safe-right?} takes in Sam's x-coordinate and returns @code{true} or @code{false} depending on whether it 
                                     is @italic{less than 690}.
                                     }
                                  }
                         @teacher{After walking through @code{safe-right?} section by section, students should be able to complete this activity on their own. 
                                  If students are doing well with programming, you might discuss whether to compare the x-coordinate to @code{690} or 
                                  @code{(+ 640 50); both yield the same computation, but the second reveals where 690 comes from (screen width plus 50).}
                                  }
                         }
                 @point{@student{Once you have typed in the EXAMPLEs and definition for @code{safe-right?}, click "Run" and see if Sam is prevented from flying off the righthand side of the screen. You may be surprised at what happens! Test your function in the Interactions window:
                                  @code[#:multi-line #t]{(safe-right? 50)
                                                         (safe-right? 810)
                                                         (onscreen? 50)
                                                         (onscreen? 810)}
                         Is @code{safe-right?} working the way you expected?  Is @code{onscreen?} working as you expected?
                         The @code{onscreen?} function is only talking to @code{safe-left?}, which means that Sam is only protected on the lefthand side of the screen.
                          @activity{Change the code for @code{onscreen?} so that it calls @code{safe-right?} instead. 
                                   Now Sam will be protected on the righthand side of the screen, but not the left. What should @code{onscreen?} be doing?}}
                         @teacher{Have the three actors stand again, and repeat the activity. Now @code{safe-left?} and @code{safe-right?} behave correctly, but @code{onscreen?} is still @bold{only talking to @code{safe-left}!}}
                         }
                 ]}
                 

@lesson/studteach[
     #:title "and/or"
     #:duration "10 minutes"
     #:overview "Students are introduced to and/or, two functions that consume Booleans"
     #:learning-objectives @itemlist[@item{Students learn to combine Boolean values with @code{and} and @code{or}}]
     #:evidence-statements @itemlist[@item{Students understand when to use each of @code{and} and @code{or}}
                                     @item{Students can write Circles of Evaluation for expressions that use @code{and} and @code{or}}
                                     @item{Students can write code expressions that use @code{and} and @code{or}}
                                     @item{Students can determine the answers produced by expressions that use @code{and} and @code{or}}]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator "AndOr" "boolean-coe-to-code1")
                       (make-exercise-locator "AndOr" "boolean-coe-to-code2"))
     #:standards (list)
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Booleans" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Many students struggle with the idea that "false" means "wrong". When students write EXAMPLEs for these functions, they will often avoid using "unsafe" coordinates, because they don't want to have an expression be "wrong". Remind them that these functions @bold{should} return false sometimes!}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[@point{@student{You've already learned many functions that allow you to create Booleans. The functions @code{<} and @code{>}, for example, will each return a boolean when applied to the appropriate input. What happens when you want to @italic{combine} these tests, to see if more than one thing is true? 
                                @activity{Consider the following statements - are they true or false?:
                                           @itemlist[@item{Sugar is sweet}
                                                      @item{Ice is hot}
                                                      @item{Sugar is sweet @bold{and} Ice is cold}
                                                      @item{Sugar is sweet @bold{and} Ice is hot}
                                                      @item{Sugar is sweet @bold{or} Ice is cold}
                                                      @item{Sugar is sweet @bold{or} Ice is hot}]}
                                }
                       @teacher{Challenge students on their answers here - ask them to explain why they choose "true" or "false" for the compound statements, especially if the individual statements are a mix of true and false.}
                       }
                @point{@student{@code{and} and @code{or} are two new functions.
                                 @bannerline{@code{and} will return "true" only if @italic{both inputs} are true. @code{or} will return "true" if @italic{at least one} input is true.}
                                 @code[#:multi-line #t]{
; and: Boolean Boolean -> Boolean
; Returns true if BOTH inputs are true
                                      
; or: Boolean Boolean -> Boolean  
; Returns true if EITHER of the inputs are true}
                                 @activity{Complete @worksheet-link[#:name "AND-and-OR"] in your workbook.}}
                        @teacher{}
                        }]
        }                                                                                             

@lesson/studteach[
     #:title "onscreen? 2.0"
     #:duration "25 minutes"
     #:overview "Students use the Design Recipe alongside their newfound knowledge of and/or, to write a function that performs two boolean tests."
     #:learning-objectives @itemlist[@item{Students will be able to compose Boolean functions results using @code{and} and @code{or}}
                                     @item{Students will understand how Booleans and Boolean functions are used to control the behavior of game elements}
                                     @item{Students will begin to appreciate why programs are written as compositions of several smaller functions}]
     #:evidence-statements @itemlist[@item{Students will be able to write functions that combine screen-boundary tests using @code{and} and @code{or}}
                                     @item{Students will understand why @code{and} is necessary to check for two boundaries}
                                     @item{Students will be able to explain why re-using existing functions is better than reproducing their computations}
                                     @item{Students will understand how they use Booleans and conditional to control how game elements behave at the screen boundaries}
]
     #:product-outcomes @itemlist[@item{Students detect when game elements have moved offscreen (so they can reappear on the other edge of the screen)}]
     #:exercises (list (make-exercise-locator/dr-assess "Onscreen2" "offscreen-design-recipe-assess" "Is a Character OffScreen?"))
     #:standards (list "A-CED.1-4" "F-IF.4-6" "A-SSE.1-2" "BS-DR.2")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[]
     #:prerequisites (list "onscreen? 1.0" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[@point{@student{Now that you know how to combine tests, how can @code{onscreen?} combine both tests to keep Sam onscreen?
                               @activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&4" "A-CED.1-4&1&1")]{
                                    Turn to @worksheet-link[#:name "onscreen"] in your workbook and write the completed @code{onscreen?} 
                                    function, so that it tests both @code{safe-left?} and @code{safe-right?}. Type in the examples and definition when you're done,
                                    click "Run", and see if Sam is protected on both sides!}
                               }
                       @teacher{Have the volunteers stand once again, and ask the class what @code{onscreen?} @italic{should} do. Should it be using @code{and} or @code{or}? Be sure to give specific examples of points that are onscreen, too far to the left and too far to the right, and challenge the students to justify their answers.}
                       }
                @point{@student{There are two ways to go about solving the @code{onscreen?} word problem: 
                                @code[#:multi-line #t]{(define (onscreen? x)
                                                         (and (> x -50) (< x 690)))}
                                and...
                                @code[#:multi-line #t]{(define (onscreen? x)
                                                         (and (safe-left? x) (safe-right? x)))}
                                Does it matter which one you use?}
                       @teacher{}
                       }
                @point{@student{There is more to being a writer than good spelling and grammar. There's more to being an architect or an artist than building a bridge or coloring in a canvas. All of these disciplines involved an element of @italic{design}. Likewise, there is more to being a Programmer than just writing code. You've gotten decent at writing code, and now you're able to write sophisticated programs that include multiple functions - congratulations! But that also means you're ready to consider what it means to @italic{design} the code that you write.}
                       @teacher{}
                       }
                @point{@student{Suppose you just built a car, but it's not working right. What would you do? Ideally, you'd like to test each part of the car (the engine, the transmission, etc) @italic{one at a time}, to see which one was broken. The same is true for code! If you have a bug, it's much easier to find when every function is simple and easy to test, and the only complex functions are just built out of simpler ones. In this example, you can test your @code{safe-left?} and @code{safe-right?} functions independently, before stitching them together into @code{onscreen?}.}
                       @teacher{}
                       }
                @point{@student{Another reason to define multiple, simple functions is the fact that it lets programmers be lazy. Suppose you have a few characters in a videogame, all of which need to be kept on the screen.  Some of them might only need @code{safe-left?}, others might only need @code{safe-right?}, and only a few might need @code{onscreen?}. What happens if the game suddenly needs to run on computers with differently-sized monitors, where the boundary is 1000 instead of 690? If you have simple and complex functions spread throughout your code, you'll need to change them all. If your complex functions just use the simpler ones, you'd only need to change them in one place!}
                       @teacher{}
                       }
                @point{@student{Badly designed programs can work just fine, but they are hard to read, hard to test, and easy to screw up if things change. As you grow and develop as a programmer, you'll need to think beyond just "making code work." It's not good enough if it just works - as artists, we should care about whether or not code is @italic{well designed}, too. This is what functions allow us to do! Everyone from programmers to mathematicians uses functions to carve up complex problems into simpler pieces, which make it possible to design elegant solutions to difficult problems.
                                @activity{Can you list three reasons why it's good to have several simple functions, rather than a single complex one?}}
                       @teacher{}
                       }
                @point{@student{The boundary-detection code you wrote (through @code{safe-left?} and @code{safe-right?}) is very useful for videogames. It can be used to stop a character from traveling through a wall, or to regenerate the character once it has left the screen. @activity{Open your game file, and scroll down past the @code{update-} functions until you see the definitions for @code{safe-left?}, @code{safe-right?} and @code{onscreen?}.  Right now, they all return true. Since your gamescreen has the same dimensions as Sam's yard (640x480), you can use the same code for each of these three functions! Make sure you include EXAMPLEs, so that your game code can test each function separately.}}
                       @teacher{}
                       }
                ]}
                  

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
        @points[
           @point{@student{You've learned how to use Booleans to constrain where elements can move in a game.  In the next unit, we'll discuss how to use Booleans to move game elements based on which keys users press while playing your game.}
                  @teacher{}}]}
}