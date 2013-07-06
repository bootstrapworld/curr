#lang curr/lib
@declare-tags[pedagogy management]

@title{Unit 4: The Design Recipe}

@overview{

@unit-descr{Students are introduced to the Design Recipe and apply it to simple problems.}
@state-standards
@length-of-lesson[90]

@pedagogy{
@materials[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders @tag[group]{- in pairs! - with names on covers}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
 }

 @(language-table (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))
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
     #:title "The Full Design Recipe"
     #:duration "25 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students will become familiar with the steps of the Design Recipe, using the traditional full-page format}]
     #:product-outcomes @itemlist[@item{Students will write functions to solve simple problems by using the Design Recipe}]
     #:standards (list)
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
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
                 @point{@student{Let's see an example of this kind of animation, using a function to make a rocket-blast off! Turn to @worksheet-link[#:page 11 #:name "Design-Recipe-Rocket-Height"] in your workbook], and read the word problem carefully. 
                         @bannerline{A rocket blasts off, traveling at 7 meters per second. Write a function called @code{rocket-height} that takes in the number of seconds that have passed since the rocket took off, and which produces the height of the rocket at that time.}
                         @activity{@itemlist[@item{What is the function taking in as input? What type of data is that?}
                                              @item{What is the function producing as outnput? What type of data is that?}
                                              @item{What are the three parts of a @vocab{Contract?}}
                                              @item{What is the @vocab{Name} of the function you are being asked to define?}
                                              @item{What is the @vocab{Domain} of the function?}
                                              @item{What is the @vocab{Range} of the function?}]}}
                         @teacher{Check student understanding carefully, to make sure students read the problem carefully. It may be helpful to draw a diagram or table on the board, and to have students verbally walk through a few examples.}
                         }
                 @point{@student{The Contract is a way of thinking about the function in a general way, without having to worry about exactly how it will work or how it will be used. Starting with simple questions like these will make later steps much easier to think about. However, the Contract doesn't always enough information! The Domain for @code{star}, for example, specifies that the function needs a Number and two Strings, but doesn't mention the fact that the first String must be @code{"solid"} or @code{"outline"}. To add this information, programmers write @vocab{Purpose Statements}, which are simple sentences that explain what a function does.
                                 @activity{Underneath the Contract, write a simple Purpose Statement for @code{rocket-height}.}
                                 @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                        ; multiply the number of seconds by 7 to find the height}}
                         @teacher{This is an opportunity to talk about the importance of writing, clarity, and brevity. What information is essential for a purpose statement? What information is irrelevant.}
                         }
                 @point{@student{Armed with the Contract and Purpose Statement, it becomes easy to write an @code{EXAMPLE}. Every example begins with the name of the function and a sample input, both of which are written in the Contract. In this case, you know that the function is called @code{rocket-height} and that it expects a single number as input. The Purpose Statement goes further, telling you that the input is multiplied by 7. We can use this two write two examples, with different numbers of seconds as inputs.
                                @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; multiply the number of seconds by 7 to find the height
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))}
                                @bold{Note:} The example shown above is broken into two lines! As functions and examples become more complex, it will become difficult to squeeze them into a single line. In your workbooks, every example and definition from this point onwards will use the two-line format.
                                @activity{In your workbooks, write two new examples using different values for the number of seconds. Both examples will have a lot in common (they all use @code{rocket-height} as the function name, they all multiply their input by 7, etc). Once you are done writing them, circle only the parts of the examples that are @italic{changeable}.}}
                         @teacher{The main idea for students in this activity is to realize that the Contract and Purpose Statement can be relied upon to write examples. Ask students to justify  every part of each example, using only the Contract and Purpose Statement. @pedagogy{Students are often tripped up by the switch from one-line examples to two-line ones. Be @italic{very} careful to point this out to students, and to check their workbooks to see where they are writing their examples.} At the end of the activity, make sure that students circle ONLY what has changed.}
                 }
                 @point{@student{By comparing two different examples, it is easy to tell what changes. According to the Purpose Statement, it is the number of seconds that the rocket has been flying.
                                 @activity{On your paper, label the items you circled with "seconds".}}
                         @teacher{Have a discussion with students about why "seconds" is a better name than "time". Talk about specificity, relevance, and readability.}}
                 @point{@student{Labeling what is @italic{changeable} gives programmers a sense for the names of a function's @vocab{variables}. 
                                                  @activity{How many variables does @code{rocket-height} have? What is it's name? Define the function, using all the information from your Examples, Contract and Purpose Statement.}
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
                                                      @item{How do do all of these steps help a programmer @vocab{define} a function?}]}
                                 }
                         @teacher{}
                         }
                 @point{@student{You may have noticed that the Examples for @code{rocket-height} wrote out the multiplication (@code{(* 11 7)}), rather than the actual answer (@code{77}). Why bother to show the way a calculation is performed? Programmers do this so that their Examples can provide hints about what process is taking place. In the provided Rocket code ([Rocket.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=KY4s7msuh6" "WeScheme")]), you will see why it is so important to show your work when writing examples. 
                                 @activity{Click "Run", and wait until a window appears with a rocket at the bottom of the screen and numbers for "time" and "height" at the top. This animation is set to update the rocket every time the spacebar is pressed, to simulate time going by. Hit the spacebar a few times, and notice that the time at the top of the window increases. Does the rocket move? Time is passing, but our rocket's height hasn't changed! Close the rocket window, so that you can see the code.}}
                         @teacher{}
                         }
                 @point{@student{The Contract for this function is correct: the function's Name, Domain and Range are all accurately written here. However, the next step definitely has some problems:
                                  @itemlist[#:style 'ordered
                                                    @item{There is only one Example. This makes it difficult to notice what is changing, which could lead to bugs when choosing variables}
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
@pedagogy{
@lesson[#:title "Practicing the Design Recipe"
        #:duration "20 minutes"]{@itemlist/splicing[
                  @pedagogy{@item{Note: if space allows, this section can also be done on the board with multiple, simultaneous challenges. See the video links for an example.}}
                   @pedagogy{@item{@skit{I need another volunteer, to act out a new function called @code{red-square}
                                                                                                         
     When I say "red-square fifty", I want you to make a solid, red square where each side is 50 pixels long. "red-square fifty!" "red-square ninety!" etc..}}}
                   @item{Turn to @worksheet-link[#:page 12 #:name "Design-Recipe-Red-Square"] in your workbooks. You'll have 2 minutes to read the @bold{Word Problem} and to underline the function's name, domain and range. GO!}
                   @pedagogy{@item{Count down the last 10 seconds, and then collect answers from teams.}}
                   @item{Now you'll have another minute to fill in the contract for your function. GO!}
                   @pedagogy{@item{Count down the last 10 seconds then collect answers from teams. Keep score!}}
                   @item{@bold{Step 1: Contract}}
                   @item{@think-about[#:question "What's the name of the function we're trying to write? What kind of Domain did we say it expects? Range? Fill these in under as the three parts of your contract."
                                      #:answer @list{"Name: " @code{red-square} "; Domain: Number; Range: Image"}]}
                                                                                                 
                   @pedagogy{@item{Count down the last 10 seconds, and then collect answers from teams.}}
                   @item{Now you have to give two example. Again, you'll have one minute. GO!}
                   @item{@bold{Step 2: Give Examples}}
                   @item{When given the number 20, what should @code{red-square} draw? A solid, red square of size 20.
                         @itemlist[@item{@think-about[#:question "How do I write the Racket code for that?"
                                                      #:answer @code{(rectangle 20 20 "solid" "red")}]}
                                  @item{Fill in the boxes with the Racket code for the other examples, including the generalized pattern.            }
                                  @item{Now circle everything that changes between the examples, and label it.}]}
                   @pedagogy{@item{Count down the last 10 seconds then collect answers from teams. Don't forget to keep score!}}
                   @item{Now for the final step! @tag[(pedagogy group)]{This one is worth two points: one for filling in everything on the "define" line and one for filling in the body of the function.} You'll need to fill in the name of your function and a name for the variable. Then you'll need to figure out what goes on the next line for the function's body. You will have two minutes for this. GO!}
                   @item{@bold{Step 3: Code} @itemlist[
                   @item{As always, we start with the function header: "define", then the name of the function and the names of the inputs from our Domain. @think-about[#:question "What is the name of our function here? What is the name of our input?" #:answer @list{"Name: " @code{red-square} " ; Input: size (number is the type)"}]}
                   @item{Now you need to fill in the function body. Which pattern can we use for this? The general one.}
                   ]}
                   @item{@pedagogy{Have kids turn their monitors on, and type in the code. Do their tests work?}
                          @tag[selftaught]{Now you should try typing in the code and running some tests to see if it works.} @tag[selftaught]{@embedded-wescheme[#:id "example4"
                                                          #:interactions-text ""]}}]}
                                
                                
@lesson[#:title "Even More Practice (Yard Area)"
        #:duration "20 minutes"]{
  @itemlist/splicing[
     @item{@pedagogy{If your students seem to be getting the hang of the Design Recipe, you can introduce the WeScheme Design Recipe Widget as described here. If they're still struggling, hold off until they really understand what the Design Recipe is for.} Now that you're getting a feel for the Design Recipe, I'd like to show you a way to fill out the Design Recipe @italic{on the computer}, so you don't need to write anything twice.}
      @item{In the WeScheme toolbar, click on the button that says "Recipe". A form will appear, with boxes for you to enter the function's Name, Domain and Range. Once you've filled these out, the form will unlock the next step in the Design Recipe: EXAMPLEs!}
      @item{Remember that every EXAMPLE has two parts! First, you need to write down an example of that function applied to some inputs. If your friend were acting as one of the functions we've done in the past (green-triangle, blue-circle, etc.), this is what you would say to them to make them do some work. The second part is the code for @italic{the work they would do.}}
      @item{Each of these parts much have it's own set of parenthesis, since they each have to be a valid Racket expression. If you make a mistake typing them in, the computer will tell you by outlining the box in red. Click on a red box for hint about what might be wrong.}
      @item{When you have two EXAMPLEs written out, the computer will unlock the last part of the Design Recipe: defining the function! Just as before, you can look at your examples and copy everything that @italic{has not changed}, and replace what has changed with a variable. }
      @item{When you're all done, you can click the "Insert" button, and WeScheme will take copy your Contract, Examples and Definition right into the editor!}
      @item{Doing things on the computer can be a real time-saver, but it's not as flexible as doing them on paper. For the final round, you can choose which method you'd like to use. In the future, you can also choose which one to use -- some people find they prefer sticking to paper to think things through, and others prefer working straight on the machine.}
     @item{Okay, now it's time for the final round. When I say go, @tag[group]{teams will } turn to @worksheet-link[#:page 13 #:name "Design-Recipe-Yard-Area"], and begin. @tag[group]{This time, each time will have 5 minutes to }Read the @bold{Word Problem}, write the contract, and fill out the examples. @tag[group]{One point for each section. } Any questions? On your mark ... get set ... GO!}
     @pedagogy{@item{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @item{Now @tag[group]{you'll have 5 more minutes to }finish the Design Recipe@tag[group]{, } and @tag[group]{to }type in your function and test cases. On your mark ... get set ... GO!}
     @pedagogy{@item{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @pedagogy{@item{If time allows, pass out extra Design Recipe worksheets [@resource-link[#:path "DesignRecipeWorksheet.pdf" #:label "PDF"] | @resource-link[#:path "DesignRecipeWorksheet.odt" #:label "Ooo"]], and run another round: e.g., one of
                                                                                   
           @code[#:multi-line #t]{
                (define (years-ago year) (- 2012 year))
                (define (plural word) (string-append word "s")) 
                (define (diamond size color) (rotate 45 (rectangle size size "solid" color)))
                 }}}]}
                                
@lesson[#:title "Closing" 
        #:duration "10 minutes"]{@itemlist/splicing[
           @item{What you have learned is powerful: a structured way to approach @bold{solving any word problem}. First you state the problem as clearly as you can, then think about the data. Then you come up with examples of how the finished product should look, and write a template using only what you know. Only then do you solve!}
            @item{Engineers use this when they design cars, by testing each part before putting them together. Journalists use this when they write articles, by making an outline to be sure that each paragraph makes sense before fitting it into a story. Chefs use it when they make food, tasting each part of a dish before assembling it into a meal. Everyone, in every profession, needs to solve problems, and being able to break complex problems down into simpler parts is the key to being good at solving them. To succeed in this class, you need to be masters of solving Word Problems. Fortunately, you've got the Design Recipe on your side. Once you've got the recipe down, you'll be able to tackle anything!}
            @item{Next time, you will use the Design Recipe to animate the characters in your game! Don't forget the recipe - it will save your life over the next few lessons!}
            @pedagogy{@item{Who can tell us one thing we learned today?}}
            @tag[selftaught]{@item{List a few things that you've learned today
                                   
                                   @free-response[#:id "chp4review"]}}
            @pedagogy{@item{Who saw someone else in the class do something great?}}                                       
            @tag[(pedagogy group)]{@item{Cleanup, dismissal}}]}
}
@copyright[]

                                

                   
                                 
                              
               
                           
   