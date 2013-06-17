#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Circles of Evaluation"
     #:duration "20 minutes"
     #:overview "Students identify the order of operations for complex arithmetic expressions through diagramming (circles) and solving (the numerical answer). This lesson introduces students to the Circles of Evaluation, which are essentially a sentence diagramming tool for arithmetic expressions. This is a powerful way to understand Order of Operations, as it forces students to focus on the structure of expressions over their computed result."
     #:learning-objectives @itemlist[@item{Students deepen their understanding of Order of Operations}
                                     @item{Make the jump from PEMDAS to function composition, when thinking about arithmetic}
                                      @item{Students are introduced to Racket syntax}]
     #:product-outcomes @itemlist[@item{Students convert between multiple representations of arithmetic (Conventional, Circles of Evaluation, and Racket) for several examples}]
     #:standards @itemlist[@item{}]
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Have students practice translating very simple (one-operation) expressions into simple (one-circle) Circles of Evaluation. By choosing the numbers in these examples carefully, you can gradually introduce nesting by replacing a number in one expression with the Circle of Evaluation for another expression that computes the same number. @italic{Replace the 7 in @code{7+5} with the Circle for @code{10-3}.}}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first opportunity to expose students to core vocabulary words, so be sure to use words like @bold{function}, @bold{value} and @bold{expression} carefully and consistently. Ask students to identify the parts of a Circle of Evaluation, and push them to use the vocabulary as well.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{So far, the only programs you know how to write are very simple: just Numbers, which evaluate to themselves. But suppose you want to @italic{do something} to those Numbers? What if you wanted to add them?}
                        @teacher{}
                        }
                
                @point{@student{Addition is an example of a @italic{function}: an operation that takes in certain kinds of values and produces a new value. You've used the addition function thousands of times, with lots of different numbers! What other functions have you used? A useful way to look at these functions is called the @italic{Circle of Evaluation.}}
                        @teacher{This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to draw examples! @management{(Tip: make this exciting for kids! Ask them to give you a drumroll, and then proudly announce what this Circle is called!)}}
                        }
                @point{@student{We can write programs inside this Circle, and it will evaluate them the exact same way that the computer will. If you know how to draw a Circle of Evaluation for a program, you'll know exactly how to write the code.}
                        @teacher{}
                        }
                @point{@student{@bitmap{images/JumbledCircle.png} Without rules, however, it can be hard to figure out what a program is supposed to do. Does this Circle represent 4-5 or 5-4? }
                        @teacher{@management{Have students discuss how they would interpret the expression inside the circle. How many interpretations are there?}}
                        }
                @point{@student{@bitmap{images/FixedCircle.png} To eliminate this confusion, Circles of Evaluation have two rules: (1) All circles have one function, which we will draw at the top of the circle. (2) It matters in what order the inputs are written - We will always read and compute inputs from @bold["left to right"]. How do we evaluate this expression? The same way we always have: we apply the function to it's inputs. In this Circle, the function is subtraction and the inputs are 4 and 5. When we evaluate the expression, the answer comes out to -1, just we would expect.}          
                        @teacher{}
                        }
                @point{@student{@activity{Try drawing the Cirlce of Evaluation for the following expressions: @code{6 * 4, 7 - 10, 351 / -1}}}
                        @teacher{It's important for students to view the Circles of Evaluation as "just another way or writing arithemetic". Have students discuss whether associativity and commutativity still matter here (they do).}
                        }
                @point{@student{The Circles of Evaluation are also easy to convert into computer programs. To translate a Circle of Evaluation into a program, begin with an open parenthesis ("("), and then the function written at the top of the circle. Then translate the inputs from left to right, adding a closing parenthesis (")") when you're done. Take a look at the example below. What happens when you hit Return at the end of this line? Try converting the other circles you drew into code.
                                 @embedded-wescheme[#:id "Circle1"     
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(+ 4 5)"]}
                        @teacher{Have students practice converting simple Circles of Evaluation into code.}
                        }   
                @point{@student{@bitmap{images/Nesting.png}To use use multiple functions in the same expression, we can combine Circles of Evaluation together.  Look at the Circle of Evaluation you've written for @code{351 / -1}. We already know that the Circle for @code{4 - 5} will evaluate to -1, so we can @italic{replace the number with the expression.} Does this change what the expression evaluates to?}
                        @teacher{At this point, the Circles of Evaluation can be used as an assessment tool for Order of Operations: rather than relying on students' ability to @italic{compute} the correct answer for a complex expression (which can result in false negatives, where a student applies PEMDAS correctly but makes a mistake in calculation), drawing the Circle exercises a students' ability to see the structure inside the arithemetic.}
                        }
                @point{@student{@bitmap{images/NestedCircle.png}How would evaluate this Circle of Evaluation?(1) We know we are multiplying because that's the function at the top of the Circle (2) The Number 6 comes first, because it's on the left-hand side and (3) On the right-hand side is @italic{the result of adding 4 and 5}, because that expression is a separate circle altogether. @code{4 + 5} evaluates to 9, and @code{6 * 9} is 54.}
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic expressions and then convert them into Circles, or giving them Circles and having them translate them back into arithmetic.}
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
                @point{@student{@activity{Complete the exercises provided on @worksheet-link[#:page 4 #:name "Circles-of-Evaluation-Practice"] of the student workbook.}}
                        @teacher{}
                        }
                         ]}