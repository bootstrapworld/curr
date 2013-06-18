#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Intro to Programming"
     #:duration "15 minutes"
     #:overview "Students are introduced to the programming environment"
     #:learning-objectives @itemlist[@item{Students will be able to identify the Interactions and Definitions window}
                                      @item{Students will be able to enter and evaluate simple arithmetic expressions in the Interactions window}
                                      @item{Students will be able to convert Circles of Evaluation into correctly-formed programs}
                                      @item{Students will be able to explain an 'unbounded identifier' error message}
                                      @item{Students will be able to explain the purpose of error messages}
                                      @item{Given a Circle of Evaluation, students will be able to complete a partially-written program}
                                      @item{Given a bank of Circles of Evaluation and programs, students will be able to match them}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "A-SSE.1-2" "N-Q" "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Open the programming tool of your choice: If you've installed, DrRacket, double-click the application to launch it. If you are using @(hyperlink "http://www.wescheme.org" "WeScheme.org"), enter your username and password to log in, then click "Start a New Program".}
                        @teacher{@management{Have the students look at the editor on their computers. Refer to overhead projector as necessary.}}
                        }
                 
                @point{@student{@bitmap{images/1.5.png}This screen is called the @vocab{editor}, and it looks something like the diagram you see here. There are a few buttons at the top, but most of the screen is taken up by two large boxes: the @vocab{Definitions window} at the top and the @vocab{Interactions window} at the bottom.}
                        @teacher{The Definitions window is where programmers define values and functions in their program, while the Interactions window allows them to experiment with those values and functions. This is analogous to writing a series of function definitions on a blackboard, and having student evaluate expressions using those function on scrap paper. As students are not yet defining values of their own, it is not important that students understand this distinction right now.}
                        }
                
                @point{@student{@bitmap{images/1.4.png} A program is a @vocab{legal expression} that, when evaluated, produces a value. You've been writing programs using mathematical expressions since you first learned how to add! Just as in English, there are rules that determine whether a sentence makes sense. Programs have rules too!  A program can be very complicated, but it doesn't have to be: the simplest programs of all are just Numbers. @bold{Rule 1: All values are legal expressions.} 
                                  @activity{What do you think @code{4} will evaluate to? Enter 4 in the Definitions window, and click "Run". You will see the value @code{4} appear in the Interactions window below. Type 10 on a @italic{new line} in the Definition window and click "Run". The computer now has to evaluate two separate programs, and you will see @code{4 10} printed out below. 
                                Try typing in other numbers and see what happens.
                                @embedded-wescheme[#:id "Intro to Racket and Numbers"                                             
                                  #:height 200
                                  #:hide-toolbar? #f
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #f
                                  #:definitions-text "4"]}
                                }
                        @teacher{@management{Draw students' attention to the Language Table (see Lesson Overview for Unit 1), which currently sits empty. Add "Numbers" to the Types section of the language table.}}
                        }
                
                @point{@student{We can also enter programs directly into the Interactions window. (In fact, we will ONLY be using the Interactions window for the next few activities!)
                                @activity{Enter a number down below, and hit "Return" instead of clicking Run. You should see that number printed out, just as if you'd written it in the Definitions window and clicked "Run". Now click "Run": what happens?}
                               }
                        @teacher{}
                        }
                
                @point{@student{@activity{Try evaluating numbers, like @code{10345017}, or negative numbers, like @code{-2}. Is there a limit to how big a number can be? What happens if you write a decimal? What happens when you click on a decimal, like @code{1.5}? You get a new type of number, a fraction, like @code{3/4}.}}
                        @teacher{The editing environment evaluates all fractions and returns them as decimals by default. This can be surprising to students at first, so you may want to take a moment to explain what's going on, and show them that these decimals can be converted back to fractions just by clicking on them.}
                        }
                
                @point{@student{@activity{The computer obviously knows about Numbers, but what happens if you type in something that it @italic{doesn't} know about? Will it complain? Crash? Guess? Try asking the computer to evaluate @code{dog} in the Interactions window.
                              @embedded-wescheme[#:id "Exploring bugs"                                                                                   
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "dog"]}
                                 }
                        @teacher{Have students read the error message aloud, and discuss what it means.}
                        }
                
                @point{@student{These error messages are really useful for programmers. Rather than saying "this program doesn't work", the computer does the best it can to tell you what went wrong, and to give you as much information as possible to help you fix the problem. Make sure you always read these messages carefully!}
                        @teacher{@management{}}
                        }
                         
                @point{@student{The Circles of Evaluation are also easy to convert into computer programs. To translate a Circle of Evaluation into a program, begin with an open parenthesis @code{(}, and then the function written at the top of the circle. Then translate the inputs from left to right in the same way, adding a closing parenthesis @code{)} when you're done. This process gives us the second rule for  @vocab{legal expressions} @bold{Rule 2: Just as in the Circle of Evaluation, each open parenthesis must be followed by @italic{one} function, then by one or more legal expressions, and finally by a closing parenthesis.} <ANIMATED GIF?>
                                                                   
                      <EXAMPLE WITH NO-NESTING, EXAMPLE WITH NESTING>
                       Take a look at the example below. What happens when you hit Return at the end of this line? Try converting the other circles you drew into code.
                                 @embedded-wescheme[#:id "Circle1"     
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(+ 4 5)"]}
                        @teacher{Have students practice converting simple Circles of Evaluation into code.}
                        }   
                                         @point{@student{When a Circle of Evaluation has other circles inside of it, the translation still follows the same rules: each Circle requires a new set of parentheses. Here's the same Circle of Evaluation, translated into code:
                                @embedded-wescheme[#:id "Circle2"     
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(* 6 (+ 4 5))"]}
                        @teacher{}
                        }
                @point{@student{What happens if you have too many parentheses? Too few? What if you forget to put a space between a function and one of the inputs? Experiment with each of these bugs, and see what kind of error message comes back.
                @embedded-wescheme[#:id "Circle3"     
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(-2 1)"]}
                        @teacher{}
                        }
                @point{@student{@bitmap{images/ExpressionDiagram.png}All of the expressions that follow the function name are called @vocab{arguments} to the function.}
                        @teacher{}
                        }
                ]}