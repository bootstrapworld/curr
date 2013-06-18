#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Exploring Order of Operations using the Circles of Evaluation"
     #:duration "20 minutes"
     #:overview "Students identify the order of operations for complicated arithmetic expressions through diagramming (circles) and evaluating (the numerical answer). This lesson introduces students to the Circle of Evaluation, which is a sentence diagramming tool for arithmetic expressions. This is a powerful way to understand Order of Operations, as it forces students to focus on the structure of expressions over their computed result."
     #:learning-objectives @itemlist[@item{Students will be able to explain why arithemetic expressions require structure}
                                     @item{Students will be able to identify the order of operations in an expression that includes adding, subtracting, multiplying and dividing}
                                     @item{Given a Circle of Evaluation, students will be able translate the expression into the arithmetic expression it represents}
                                     @item{Given an arithmetic expression, students will be able to complete a partially-finished Circle of Evaluation for the same expression}
                                     @item{Given a bank of Circles of Evaluation and Arithmetic expressions, students will be able to match them}
                                     @item{Students will be able to translate the structure of an arithmetic expression using the Circles of Evaluation}]
     #:product-outcomes @itemlist[@item{Students convert several arithmetic expressions between multiple representations}]
     #:standards (list "A-SSE.1-2" "N-Q"  "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Have students practice translating very simple (one-operation) expressions into simple (one-circle) Circles of Evaluation. By choosing the numbers in these examples carefully, you can gradually introduce nesting by replacing a number in one expression with the Circle of Evaluation for another expression that evaluates to the same number. @italic{Replace the 7 in @code{7+5} with the Circle for @code{10-3}.}}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first opportunity to expose students to core vocabulary words, so be sure to use words like @bold{function}, @bold{value} and @bold{expression} carefully and consistently. Ask students to identify the parts of a Circle of Evaluation, and push them to use the vocabulary as well.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Math is a language, just like English, Spanish, or any other language. We use nouns, like "bread", "tomato", "mustard" and "cheese" to describe physical pbjects. Math has @vocab{values}, like the numbers "1", "2" or "3", to describe quantities. Humans also use verbs like "toast", "slice", "spread" and "melt" to describe operations on these nouns. Mathematics has @vocab{functions} like addition and subtraction, which are operations performed on numbers. Just as you can "slice piece of bread", a person can also "add four and five".
                        @activity{@math{4+5} @vocab{evaluates to} @math{9}. What does @math{8*4} evaluate to? What does @math{20-16} evaluate to? <other examples>}                                   }
                        @teacher{Students should begin to look at math as a @italic{language}, and start thinking about ambiguity, syntax and grammer of math.}
                        }
                 @point{@student{A @vocab{mathematical expression} is like a sentence: it's an instruction for doing something. If you were to write instructions for making a sandwich, it would matter very much which came first: melting the cheese, slicing the bread, spreading the mustard, etc. The order of functions matters in mathematics, too. If someone says "four plus two minus one", they could mean several things:
                                @itemlist[@item{Add four and two, then subtract one @math{(4+2) - 1}}
                                          @item{Add four to the result of subtracting one from two @math{4 + (2-1)}}]
                        @activity{Write an expression of your own that can mean several things.}}
                        @teacher{}
                        }
                 
                 @point{@student{@bitmap{images/PEMDASTriangle.png}Depending on which way you read, or @vocab{evaluate} the expression, you might have a very different result! Mathematicians didn't always agree on the order to evaluate each operation, which could make things very confusing. Fortunately, the world of math has come to an agreement on a common set of rules for how to evaluate these expressions:}
                         @teacher{}}
                 @point{@student{When evaluating an expression, we begin by applying the operations written at the top of the pyramid (multiplication and division). Only after we have completed all of those operations can we move down to the lower level. If both operations are present (as in @math{4+2-1}), we @vocab{apply} them in the order they appear in the pyramid (addition first).
                          @activity{In what order should we apply the functions in the following example? 
                                    @math{19 \div 2 * 11 - 7 + 8}
                                    @itemlist[@item{@math{+ \div * - }}
                                              @item{@math{* \div - +}}
                                              @item{@math{\div * + -}}
                                              @item{@math{* \div + -}}]
}
                          @activity{Write down one reason why it is important to have rules about the order of operations.}}
                         @teacher{}
                         }
                
                @point{@student{All of these operations are examples of things called @vocab{functions}. A function is an operation that takes in certain kinds of values and produces a new value. You've used the addition function thousands of times, with lots of different numbers! We can diagram the order of operations in an expression using the @italic{Circle of Evaluation.}}
                        @teacher{@management{This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to draw examples!}}
                        }
                        
                @point{@student{@bitmap{images/FixedCircle.png} Circles of Evaluation have two rules: (1) Each circles must have one function, which we will write at the top of the circle. (2) The numbers are written below, from left to right.}          
                        @teacher{}
                        }
                @point{@student{@activity{Try drawing the Cirlce of Evaluation for the following expressions: @math{6 * 4, 7 - 10, \frac{351}{-1} }}}
                        @teacher{It's important for students to view the Circles of Evaluation as "just another way or writing arithemetic". Have students discuss whether associativity and commutativity still matter here (they do).}
                        }

                @point{@student{@bitmap{images/Nesting.png}To use use multiple functions in the same expression, we can combine Circles of Evaluation together.  Look at the Circle of Evaluation you've written for @math{351 / -1}. We already know that the Circle for @math{4 - 5} will evaluate to -1, so we can @italic{replace the number with the expression.} Does this change what the expression evaluates to?
                                @activity{<Partially-completed Circle of Evaluation is shown next to an arithmetic expression. Students are asked to complete the Circle by filling in what is missng>}
                      }
                        @teacher{From this point forward, the Circles of Evaluation are your assessment tool for Order of Operations. Quizzing students by asking them to correctly evaluate an expression is fraught with false negatives, as many student might get the order right but still have problems with basic calculation. This method is also vulnerable to Commutativity, since a student will correctly evaluate @math{1*2+2} even if they get the order of operations wrong! Circles of Evaluation have neither of these flaws, as they put them emphasis where it should be: exercising a students' ability to see the structure inside the arithemetic.}
                        }
                @point{@student{@bitmap{images/NestedCircle.png}How would evaluate this Circle of Evaluation?(1) We know we are multiplying because that's the function at the top of the Circle (2) The Number 6 comes first, because it's on the left-hand side and (3) On the right-hand side is @italic{the result of adding 4 and 5}, because that expression is a separate circle altogether. @math{4 + 5} evaluates to 9, and @math{6 * 9} is 54.
                        @activity{Given a completed circle of evaluation, write the arithmetic expression it represents.}    
                        @activity{Match the following Circles of Evaluation with the corresponding arithmetic expressions <insert examples>.}    
                        }
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic expressions and then convert them into Circles, or giving them Circles and having them translate them back into arithmetic.}
                        }
              

                         ]}