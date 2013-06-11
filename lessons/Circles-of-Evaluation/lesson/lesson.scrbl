#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Circles of Evaluation"
     #:duration "20 minutes"
     #:overview "StStudents identify the order of operations for complex arithmetic expressions through diagramming (circles) and solving (the numerical answer)"
     #:learning-objectives @itemlist[@item{Make the jump from PEMDAS to function composition, when thinking about arithmetic}
                                      @item{Students are introduced to Racket syntax}]
     #:product-outcomes @itemlist[@item{Students convert between multiple representations of arithmetic (Conventional, Circles of Evaluation, and Racket) for several examples}]
     #:standards @itemlist[@item{}]
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Up to now, the only programs you know how to write are very simple: just Numbers, which evaluate to themselves. But suppose you want to @italic{do something} to those Numbers? What if you wanted to add, subtract, multiply or divide them?}
                        @teacher{}
                        }
                
                @point{@student{Adding, subtracting, multipying and dividing are all examples of @italic{functions}: operations that take in certain kinds of values and produce a new value. You've probably used these functions many times, with lots of different numbers! A useful way to look at these functions is called the @italic{Circle of Evaluation.}}
                        @teacher{This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to draw examples! @management{(Tip: make this exciting for kids! Ask them to give you a drumroll, and then proudly announce what this Circle is called!)}}
                        }
                @point{@student{We can write programs inside the Circle, and it will evaluate them the exact same way that the computer will. If you know how to draw a Circle of Evaluation for a program, you'll know exactly how to write the code.}
                        @teacher{}
                        }
                @point{@student{<INSERT IMAGE> Without rules, however, it can be hard to figure out what a program is supposed to do. Does this Circle represent 4-5 or 5-4? }
                        @teacher{@management{Write 4 - 5 (jumbled, in no order in particular) in the Circle of Evaluation.}}
                        }
                @point{@student{To eliminate this confusion, Circles of Evaluation have two rules: (1) All circles have one function, which we will draw at the top of the circle. (2) It matters in what order the inputs are written - We will always read and compute inputs from @bold["left to right"].}          
                        @teacher{}
                        }
                @point{@student{@bitmap{images/1.5.png}<SPLIT THIS IMAGE INTO TWO> This Circle of Evaluation is an example that follows these rules. How do we compute this program? (1) We know we are multiplying because that's the function at the top of the Circle (2) The Number 6 comes first, because it's on the left-hand side and (3) On the right-hand side is @italic{the result of adding 4 and 5}, because that expression is a separate circle altogether.}
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic expressions and then convert them into Circles, or giving them Circles and having them translate them back into arithmetic.}
                        }
                @point{@student{<SIMPLE CIRCLE IMAGE> The Circles of Evaluation are also easy to convert into computer programs. To translate a Circle of Evaluation into a program, begin with an open parenthesis ("("), and then the function written at the top of the circle. Then translate the inputs from left to right, adding a closing parenthesis (")") when you're done. Take a look at the example below. What happens when you hit Return at the end of this line? Try using different numbers and different functions.
                                 @embedded-wescheme[#:id "Circle1"     
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(+ 4 5)"]}
                        @teacher{Have students practice converting simple Circles of Evaluation into code.}
                        }
                @point{@student{When a Circle of Evaluation has other circles inside of it, the translation still follows the same rules: each Circle requires a new set of parentheses. Here's a more complex example, using two circles <CIRCLE IMAGE>
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
                @point{@student{Complete the exercises provided on @worksheet-link[#:page 4 #:name "Circles-of-Evaluation-Practice"] of the student workbook.}
                        @teacher{}
                        }
                         ]}