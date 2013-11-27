#lang curr/lib

@title{Unit 1: Everything you learned in Bootstrap 1...}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
   @unit-descr{Students review almost all of the material from Bootstrap 1, including Circles of Evaluation, Contracts, Expressions dealing with strings and images, Variable definitions, Function definitions, and the Design Recipe.}
}
@unit-lessons{
@lesson/studteach[
      #:title "Introduction"
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
        @points[@point{@student{Welcome back to Bootstrap! In Unit 1, we're going to be covering everything you did in Bootstrap 1. Let's see how much you remember!}
                       @teacher{@management{Introduce teaching staff. Give some background: age, where you're from, something surprising about yourself, favorite food, etc. Anything to allow kids to connect. Have students introduce themselves. Set expectations and rules for the class.}}}
                ]}
       
@lesson/studteach[
        #:title "Expressions"
        #:duration "30 minutes"
        #:overview "Students review racket expressions, defining variables, and circles of evaluation from Bootstrap 1"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
        #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                                @item{If using DrRacket, make sure the Review.rkt file is loaded}
                                @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[
           @point{@student{@activity{Open @(hyperlink "http://www.wescheme.org/view?publicId=pTQwdxSDp2" "this link") in a new window and click 'Edit'.}
At the top of the definitions window, there are a number of @vocab{variables} defined. 
@activity{@itemlist[@item{What are the names of the variables defined here? What is the value of each variable?}
                    @item{When you click "Run", and type the name of that variable into the interactions window, what should you get back? Try it out on your computer!}]
                    Look at the variable @code{OUTLINE} on line 20. 
                    @itemlist[@item{What shape will this draw?}
                              @item{How big do you think it will be?}
                              @item{Will it be solid or outline?}
                              @item{What color will it be?}]
                    Try it out! Was the fill what you expected it to be?}
The problem is that we used a very confusing variable name! The name was outline, but the value was "solid"! Remember: always choose your variable names carefully!}
                   @teacher{Review UI of the DrScheme or WeScheme IDE.
                            Remind students about the importance of good variable names: they make code more readable, and a descriptive variable name makes it very clear what is being defined.}
                   }
           @point{@student{@activity{In your review file, define:
                           @itemlist[@item{two additional Numbers}
                                     @item{two additional Strings}
                                     @item{one more Boolean}
                                     @item{one more Image}]
                   and practice using them in the interactions window.}
Now we have values, and we know how to define shortcuts for them. However, there are also plenty of pre-built functions, which let us play around with these values. @activity{What are some functions you know that work on numbers?}}
                   @teacher{Remind students that arithmatic operations like +, -, *, and / are functions.}
    }
           @point{@student{You've seen some Racket code already, but do you remember the tool you used in Bootstrap 1 which helps you to visualize the order of operations, and easily translate math expressions into Racket code? Let's review Circles of Evaluation!
                           @activity{@itemlist[@item{If you want to draw a circle of evaluation for the expression 10 - 6, what is the first thing you need?}
                                               @item{What is the function in this expression?}
                                               @item{Where inside the circle does the function go?}
                                               @item{What numbers are the inputs to the @code{-} function in this expression?}
                                               @item{Where inside the circle do the inputs go? in which order should the numbers appear?}]}
The expression 10 - 6 can be drawn as a Circle of Evaluation like so: 
@bitmap{images/CE1.png}
@activity{How would you convert this circle of evaluation into Racket code? 
          @itemlist[@item{What is the first part of any Racket expression? (Hint: If you break a circle in half, you're left with two things that look like which keys on a keyboard?)}
                    @item{What comes next in a Racket expression, right inside the parentheses?}
                    @item{Where do you look next? How do you know which input comes first in the Racket code?}
                    @item{How do you end, or close a Racket expression?}]}
The above Circle of Evaluation converts to this Racket expression: @code{(- 10 6)} Why would it be incorrect to write @code{(- 6 10)}?
@activity{Turn to @worksheet-link[#:page 3 #:name "circles-competition"] in your workbooks. Each row has a math expression. You'll have to convert that math expression into Circles of Evaluation, and then convert the Circle into Racket code.}}
                   @teacher{Review circles of evaluation and nested circles with numbers, as well as how to convert them to Racket code. Remind students that inputs are read from left to right, and order does matter!}
                   }
           ]}
       
@lesson/studteach[
        #:title "Contracts"
        #:duration "20 minutes"
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
                  @point{@student{It's important for us to keep track of how our functions work - in Bootstrap 1 you also learned about @vocab{Contracts}. The contract for the @code{star} function is shown below. @code[#:multi-line ""]{; star: Number String String -> Image}
Contracts summarize three pieces of essential information about a function: @itemlist[@item{The @vocab{Name} of the function: in this case, @code{star}}
                    @item{The @vocab{Domain} of a function, which is the type(s) of data that the function expects: in this case, a Number and two Strings.}     @item{The @vocab{Range} of this function, which is the type of data that the function produces: in this case an Image.}]
@bannerline{Every contract has three parts: Name, Domain and Range!}
A contract is like a note we write to ourselves about how to use the function. Just like in Bootstrap 1, it will be helpful to keep track of the contracts for each function you learn about. The first page in your workbook has a table labeled "Contracts", where you can (and should!) copy down each contract as you learn it.@activity{The Contract for @code{+} is shown below.
          @code[#:multi-line ""]{; +: Number Number -> Number}                
Can you write the Contracts for @code{*}, @code{-}, @code{/} and @code{sqrt}?}}                               
       @teacher{Emphasize to students that a function's contract can tell you a LOT about that function. @management{Make sure they write every contract down in their workbooks.} Review contracts for image-producing functions like @code{circle}, @code{triangle}, @code{rectangle}, @code{ellipse}, etc.}}
                   @point{@student{@activity{Below are some expressions using functions you used in bootstrap 1. For each one, identify which function is being used, and write its Contract in your Contracts page. If you need help, try typing the expressions into your computer. @itemlist[@item{@code{(circle 75 "solid" "red")}}
                    @item{@code{(rectangle 20 30 "outline" "green")}}
                    @item{@code{(ellipse 85 100 "solid" "pink")}}
                    @item{@code{(text "Hello world!" 50 "blue")}}]}}
                           @teacher{For even more practice, have students write contracts for various word problems. this is a great time to remind them about connections to algebra:}}
                   ]
           }
          
@lesson/studteach[
        #:title "The Design Recipe"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students review the Design Recipe and become comfortable using it to write functions}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define functions to meet a goal, or problem statement.}]
        #:standards (list)
        #:materials @itemlist[@item{Design Recipe Sign}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[@point{@student{You remember how to define values, and you know how to use contracts for pre-built functions. Do you remember how to define a function of your own? In Bootstrap 1, you used a tool called @vocab{The Design Recipe} to define functions from word problems. Let's review the steps of the Design Recipe: 
                                  @activity{Turn to @worksheet-link[#:page 4 #:name "Fast-Functions"] in your workbook.} Here we have a function definition: @code[#:multi-line #t]{;double : Number -> Number
;takes a number and multiplies it by two

(EXAMPLE (double 5) (* 2 5))
(EXAMPLE (double 7) (* 2 7))

(define (double n)  (* 2 n))}
                @bannerline{Step 1: Write the Contract}
                @activity{@itemlist[
            @item{What is the @vocab{Name} of this function?  How do you know?}
            @item{How many inputs does it have in its @vocab{Domain?}}
            @item{What kind of data is the @vocab{Domain?}}
            @item{What is the Name given to this input?}
            @item{What's the @vocab{Range} of this function?}
            ]}
The @vocab{Contract} is a way of thinking about the function in a general way, without having to worry about exactly how it will work or how it will be used. Starting with simple questions like these will make later steps @bold{much} easier to think about.}
                          @teacher{}}
                   
                  @point{@student{@bannerline{Step 2: Give Examples}
                                  Now let's talk about what the function does to its input. @activity{Look at the two EXAMPLEs, written above. @itemlist[@item{What will happen if you type @code{(double 5)} into the interactions window? What about @code{(double 7)}?}
                 @item{What would happen if you changed the name of the input @code{n} to something else, like @code{x}? What else would have to change?}]}
Once we know a function's contract, it becomes easy to write examples: we start by using the function with some input(s) (@code{(double 5)}), then writing in racket code what we expect the computer to do with those inputs. (In this case, @code{double} will multiply the example input by 2.)}
                           @teacher{}}
                           
                    @point{@student{@activity{In your workbook, write the contract and two EXAMPLEs for a function called @code{triple}, which takes in a number as its input and multiplies it by 3.}}
                          @teacher{}}                                         
                    @point{@student{Now look at your two EXAMPLEs. What is the only thing that changes from one to the other? @activity{In your workbook, circle what is changeable, or @vocab{variable}, between your two EXAMPLEs.} 
               The only thing that changes is the Number being given to @code{triple} and multiplied by 3. Remember from Bootstrap 1 that once you've circled and labeled what changes in each example, it becomes incredibly easy to define the function! All you need to do is replace the thing that changes with its label! 
               @bannerline{Step 3: Define the function}
               @activity{Now write the function header and body for @code{triple}. Don't forget to replace the changing thing with a variable!}}
            @teacher{This activity can be done as a team competition: teams have one minute to write the contract and two examples for @code{triple}, and another minute for the function header and body. Assign points to the teams that complete each function! Make sure students fill out the ENTIRE contract, with two examples, before they circle what changes and move on to the function body. Build these good habits early in the course!}}                                         
          @point{@student{@activity{@itemlist/splicing[
                               @item{Write a function @code{plus1}, that takes in a number and adds one to it}
                               @item{Write a function @code{mystery}, that takes in a number and subtracts 4}
                               @item{Write a function @code{red-spot}, that takes in a number and draws a solid red circle, using the number as the radius}]}
            }
          @teacher{@code{red-spot} is a difficult function to write, and some students won't know quite what to do. This is intentional! Give them some time to be frustrated with it, and then cut it short.}
          }]}
                                               
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
      ]{@points[@point{@student{You just reviewed the first half of the entire Bootstrap 1 course in one unit! Throughout Bootstrap 2 you'll use all the concepts and many of the functions you learned in Bootstrap 1, as well as learn brand new data types, fucntions, and programming concepts. Of course, you'll do it all with the help of our old friend the Design Recipe, which will help you write your own functions for your own videogame! Since this is Bootstrap 2, the games you will be able to create will be even more interactive and advanced than in Bootstrap 1. There's a lot to learn... onward to Unit 2!}
                       @teacher{}}
                                  ]
         }
       }