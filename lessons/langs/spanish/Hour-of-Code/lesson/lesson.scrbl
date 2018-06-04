#lang curr/lib

@lesson/studteach[
     #:title "Introduction to Programming" 
     #:duration "10 min"
     #:overview "Students are "
     #:learning-objectives @itemlist[@item{}
                                    ]
     #:evidence-statements @itemlist[@item{}
                                    ]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list )
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{In Bootstrap, every computer program is made up of @vocab{Expressions} 
                     and @vocab{Definitions}. Expressions are pieces of code that produce a value.
                     Just like in math class, expressions can be simple numbers like 4 and 9
                     (4 evaluates to 4, 9 evaluates to 9, etc). They can also be more complex,
                     using functions to add and subtract numbers (@math{4+9} evaluates to 13).
                     }
             @teacher{}}
     @point{@student{In the editor below, we've written down a single number. 
                     @activity{Click the editor so that the cursor follows the number, and hit "Run". 
                               @itemlist[@item{Did the number evaluate to itself?}
                                         @item{Try evaluating a really big number, like @math{658362729}}
                                         @item{Try evaluating a really small number, like @math{0.0000000001}}
                                         @item{Try evaluating a negative number, like @math{-45}}
                                         @item{Try evaluating a fraction, like @math{1/4}}]
                               HINT: when you evaluate the fraction, you get back the decimal 0.25. 
                               Try clicking on the decimal!
                               }
                     @embedded-wescheme[#:width "100%"
                                        #:height 100
                                        #:definitions-text "42"]}
                     
             @teacher{}}
     
     @point{@student{In Bootstrap, there are other kinds of values besides Numbers. For example,
                     our programming language has values called @vocab{Strings}. A String is anything
                     in quotes, such as @code{"This String"}. Like Numbers, String values are very
                     simple: they just evaluate to themselves. (TIP: Notice that the computer makes all Numbers
                     blue and all Strings green, to help us keep track of which is which!)
                     @activity{Try typing your name as a string into the editor below, and hitting "Run".
                               @embedded-wescheme[#:width "100%"
                                                  #:height 100
                                                  #:definitions-text "\"Here is a simple string!\""]}
                               }
             @teacher{}
             }
     
     @point{@student{A @vocab{mathematical expression} is like a sentence: it's an instruction 
                     for doing something. The expression @math{4+5} tells us to add 4 and 5.  
                     To @vocab{evaluate} an expression, we follow the instructions 
                     in the expression.  The expression @math{4+5} @vocab{evaluates to} @math{9}.                         
                     @activity{@itemlist[@item{What does @math{8*4} evaluate to?}
                                         @item{What does @math{20-16} evaluate to?}
                                         @item{What does @math{16-20} evaluate to?}]}
                     }
             @teacher{}}
     

     @point{@student{@bitmap{images/FixedCircle.png} We can diagram sentences in math - and in programming -
                      using a @vocab{Circle of Evaluation}.  Here is an example of a Circle of Evaluation, 
                      for the math expression @math{4-5}. Circles of Evaluation show the @italic{structure}
                      of an expression.  All Circles of Evaluation have two rules:
                       @bannerline{Circle Rule 1: Each circle must have one function, which goes at the top 
                                   of the circle.}
                       @bannerline{Circle Rule 2: The numbers are written below, in order from left to right.}
                }
                @teacher{[@(new-tab "https://www.youtube.com/watch?v=AMFaPKHp3Mg" "Video")] This section 
                          benefits enormously from visual aids, diagrams, etc. Make sure you have plenty 
                          of board space to draw examples!}
                }
      @point{@student{@activity{On paper, try drawing the Circle of Evaluation for each of the following expressions:
                                @itemlist[#:style 'ordered
                                                  @item{@math{6*4}}
                                                  @item{@math{7-10}}
                                                  @item{@math{5 + 8}}
                                                  @item{@math{\frac{351}{-1} }}]
                                          }}
                       @teacher{It's important for students to view the Circles of Evaluation as "just another way 
                                of writing arithemetic". Have students discuss whether associativity and 
                                commutativity still matter here (they do).}
                 }
       @point{@student{The Circles of Evaluation are also easy to convert into code. To translate a Circle of
                       Evaluation into a program, begin with an open parenthesis @code{(}, and then the function written at
                       the top of the circle. Then translate the inputs from left to right in the same way, adding a closing
                       parenthesis @code{)} when you're done. 
      
                       @activity{
                       Here is is a simple Circle of Evaluation: @sexp{(- 4 5)}
                       You can see the same code typed out in the editor below. 
                                  @itemlist[#:style 'ordered
                                                     @item{What do you think this program will evaluate to?}
                                                     @item{Move the cursor to the end of the line and hit "Run"}
                                                     @item{Was your guess right?}
                                                     @item{Notice that the copmputer will highlight the matching parentheses
                                                           whenever your cursor is next to one. For more complex expressions,
                                                           this will help you keep track of which expression is which.}
                                                     @item{Try converting the other Circles of Evaluation you drew 
                                                           on paper into code, and typing them into the computer.}]
                                 @embedded-wescheme[#:width "100%"
                                                            #:height 100
                                                            #:definitions-text "(- 4 5)"]}
                       }
                        
                        @teacher{Have students practice converting simple Circles of Evaluation into code.  If you want to help students 
                                 understand when to use the parentheses, here are two explanations that we find useful.  First, the
                                 parens look like the Circle, and the Circle encloses the function name and its inputs.  Second, we
                                 use a more visual description of an ant eating its way through the expression.  The ant eats into the 
                                 Circle (an open paren), then goes to the function at the top, then to the arguments from left to right,
                                 then finally out of the Circle (a close paren).  If the ant encounters another Circle while writing 
                                 down the arguments, it needs another open paren, etc.}
                        }
       
       @point{@student{Just as we can use mathematical functions like @code{+}, @code{-}, and @code{/} to do things with
                       Numbers, we can use other functions with Numbers and Strings. Here is a very simple Circle of Evaluation
                       that uses Numbers and Strings to do something cool - can you guess what it is?
                       @sexp{(star 50 "solid" "red")}
                       @activity{We've converted this Circle of Evaluation into code for you.
                                 @itemlist[@item{What do you think it will do when you click "Run"?}
                                            @item{Try changing the first String from @code{"solid"} to @code{"outline"}}
                                            @item{Can you make the star larger? Smaller?}
                                            @item{What other colors can you try?}]
                                 @embedded-wescheme[#:width "100%"
                                                    #:height 200
                                                    #:definitions-text "(star 50 \"solid\" \"red\")"]}
                         }
       @teacher{}
       }
       
       @point{@student{@code{star} is a function that takes three inputs: a Number for the size of the star,
                        a String for the size, and a String for the color. What if a programmer forgets one of these?
                        When something like this happens, computers use @vocab{Error Messages} to give helpful 
                        hints about what is wrong. 
                        @activity{Can you see the problem in the code below? Click "Run" to see what kind of 
                                  message the computer will give you. You can even click on the colored parts of
                                  the error, and see the corresponding code blink!
                                  @embedded-wescheme[#:width "100%"
                                                     #:height 200
                                                     #:definitions-text "(star 50 \"solid\" 24)"]}
                        }
               }

       @point{@student{Error messages are really helpful when you're starting to program. You can try experimenting with
                       different functions, reading the error messages, and figuring out how to use them. In the editor
                       below, we've filled in an example of a function that you've never seen before, BUT...it has an error!
                       Can you figure out what it is? For a hint, click "Run" and read the error message out loud.
                        @embedded-wescheme[#:width "100%"
                                           #:height 200
                                           #:definitions-text "(rectangle 50 100 \"solid\" )"]
                        See if you can figure out how to use the following functions: @code{triangle, circle, ellipse, text}.
                       }
               @teacher{}}
       
       @point{@student{To use multiple functions in the same expression, we can combine Circles
                       of Evaluation. Suppose we wanted to add @math{1+2} and @math{3+4}. Here is the Circle of
                       Evaluation to do just that:
                       @sexp{(+ (+ 1 2) (+ 3 4))}
                                @activity{For practice, try finishing the Circle of Evaluation shown below, so that it represents
                                          @math{(23 + 7) * (13 - 5)}
                                          @sexp{(* (+ 23 BSLeaveAHoleHere) (BSLeaveAHoleHere BSLeaveAHoleHere BSLeaveAHoleHere))}
                                          }
                                @activity{
                                          @sexp{(star (* 10 10) "solid" "red")}
                                          Here is a Circle of Evaluation that nests a multiplication expression inside a star
                                          expression. Experiment with the editor below, which has the code for another nested 
                                          expression. How big a star will this code draw?
                                           @embedded-wescheme[#:width "100%"
                                                            #:height 200
                                                            #:definitions-text "(star (* 10 10) \"solid\" \"red\")"]}
                                                                                                                
                                }
              @teacher{From this point forward, the Circles of Evaluation are your assessment tool for Order of Operations. 
                       Quizzing students by asking them to correctly evaluate an expression is fraught with false negatives,
                       as many student might get the order right but may still have problems with basic calculations. This 
                       method is also vulnerable to Commutativity, since a student will correctly evaluate @math{1*2+2} 
                       even if they get the order of operations wrong! Circles of Evaluation have neither of these flaws,
                       as they put the emphasis where it should be: exercising a student's ability to see the structure 
                       inside the arithemetic.}
              }
               ]
   }
                                                                                                                    