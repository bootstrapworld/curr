#lang curr/lib

@title{Unit 1: Everything you learned in Bootstrap 1...}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
   @unit-descr{While learning a new programming language, students review the major concepts and material from Bootstrap:1, including Contracts, Expressions dealing with strings and images, Variable definitions, Function definitions, and the Design Recipe.}
}
@unit-lessons{
@lesson/studteach[
      #:title "Introduction to Pyret"
      #:duration "50 minutes"
      #:overview ""
      #:learning-objectives @itemlist[]
      #:evidence-statements @itemlist[]
      #:product-outcomes @itemlist[]
      #:standards (list)
      #:materials @itemlist[@item{Editing environment (Pyret Editor)}]
      #:preparation @itemlist[@item{Computer for each student (or pair), running the Pyret Editor}
                              @item{Make sure the Review.arr file is loaded}
                              @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
      #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[@point{@student{Welcome back to Bootstrap! In Bootstrap:1, you used a @vocab{programming language} called Racket to make your video games. We chose this language because it behaves like algebra, but there are many different languages you could use to make video games. In Bootstrap:2, you’re going to learn a new language, called Pyret. Pyret is similar to Python, a programming language you may have heard of, but this language contains many of the features you remember from Racket. The syntax is a little different, but with a bit of practice you’ll pick it up in no time!}
                       @teacher{@management{Introduce teaching staff. Give some background: age, where you're from, something surprising about yourself, favorite food, etc. Anything to allow kids to connect. Have students introduce themselves. Set expectations and rules for the class.}}}
               @point{@student{Open this link [REVIEW LINK] in a new window. The first thing you’ll notice is that we’re no longer using WeScheme to edit our programs, although the Pyret editor behaves very similarly. The definitions area (where you write code you want to save for later) is on the left side of the screen, and the interactions area (where you write code you just want to test out once, like scratch paper) is on the right. The top of the editor has space to write a name for your program, and the “Run” button at the top right behaves just as it did in WeScheme.}
                       @teacher{}}
               @point{@student{At the top of the definitions area, there are some @vocab{variables} defined. In Racket, we would write @code{(define NUM 4)}. However, in Pyret we have @code{var NUM = 4}, which does the same thing: creates a variable called NUM, which has a value of 4.
                                      @activity{@itemlist[@item{What are the names of the other variables defined here? What are their values?}
                                                          @item{What would you get back if you were to evaluate each of those variables in the Interactions area? Take a guess first, then click "Run" and type the name of each variable into the interactions area. Were your guesses correct?}]
                                                 Look at the variable @code{OUTLINE} on line ______.
                                                 @itemlist[@item{What shape will this draw?}
                                                           @item{How big do you think it will be?}
                                                           @item{Will it be solid or outline?}
                                                           @item{What color will it be?}]
                                                 Try evaluating @code{OUTLINE} in the interactions area. Was the fill what you expected it to be?}
       The problem is that we used a very confuing variable name: the name was “OUTLINE," but the value was a solid green star. Remember: always choose your variable names carefully!}
                       @teacher{Remind students about the importance of good variable names: they make code more readable, and a descriptive variable name makes it very clear what is being defined.}}
               
               @point{@student{As you can see, Pyret uses the same data types that we used in Racket: Numbers, Strings, Images, and Booleans are used in Pyret, and look and behave in the same way. @activity{In your review file, define:
                           @itemlist[@item{two additional Numbers}
                                     @item{two additional Strings}
                                     @item{one more Boolean}
                                     @item{one more Image}]
                   and practice using them in the interactions window.}
                      IMAGES!!!!      }
                       @teacher{}}
               
               @point{@student{Now we have values, and we know how to define shortcuts for them. However, there are also plenty of built-in functions, which let us play around with these values. 
@activity{What are some functions you know that work on numbers? How many can you list?}}
                   @teacher{Remind students that arithmatical operations, such as +, -, *, and / are functions.}}
               
               @point{@student{One of the big changes from Racket to Pyret is using arithmetic functions. In Pyret, you can write these expressions with math notation, like so: @code{(2 + 9)} or @code{(10 * 8)}. Of course, there are lots of other functions that work on strings, images, booleans, and more. Page ____ contains examples of some of these function definitions in Racket and Pyret.

[Something something transition]}
                       @teacher{}}
              
                                  ]}
   
@lesson/studteach[
        #:title "Contracts"
        #:duration "10 minutes"
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
                  @point{@student{It's important to keep track of how these functions work, and Bootstrap 1 introduced the idea of @vocab{Contracts}. The contract for the @code{star} function is shown below. @code[#:multi-line ""]{; star: Number String String -> Image}
Contracts summarize three pieces of essential information about a function: 
@itemlist[@item{The @vocab{Name} of the function: in this case, @code{star}.}
                    @item{The @vocab{Domain} of a function, which is the type(s) of data that the function expects. In this case, a Number and two Strings.}    
                    @item{The @vocab{Range} of this function, which is the type of data that the function produces: In this case, an Image!}]
@bannerline{Every contract has three parts: Name, Domain and Range!}
A contract is a note we write to ourselves about how to use the function. Just as in Bootstrap 1, it will be helpful to keep track of the contracts for each function you learn about. The last page in your workbook has a table labeled "Contracts," where you can (and should!) copy down each contract as you learn it.
Contracts in Pyret are just as important, and are written the same way. You write contracts as comments: pieces of text for humans only, and ignored by the computer. In Pyret, just put a @code{#} before a line of text to turn it into a comment!
@activity{The Contract for @code{+} is shown below.
          @code[#:multi-line ""]{# +: Number Number -> Number}                
Write down the Contracts for @code{*}, @code{-}, @code{/} and @code{num-sqrt} (You know this as the @code{sqrt} function in Racket!)}
One notable difference between Racket and Pyret is that Pyret requires commas between each input to a function. So, @code{circle(50 “solid” “red”)} will return an error message, because @code{circle(50, “solid”, “red”)} is the correct code. Keep this in mind as you write your programs!}                             
       @teacher{Emphasize to students that a function's contract can tell you a LOT about that function. It may also be useful to ask them to articulate reasons why Contracts are a good thing, so they are able to say it in their own voice. @management{Make sure they write every contract down in their workbooks.}}}
                   @point{@student{@activity{Below are some Pyret expressions using functions you used in bootstrap 1. For each one, identify which function is being used and write its Contract in your Contracts page. If you need help, try typing the expressions into your computer. @itemlist[@item{@code{circle(75, "solid", "red")}}
                    @item{@code{rectangle(20, 30, "outline", "green")}}
                    @item{@code{ellipse(85, 100, "solid", "pink")}}
                    @item{@code{text("Hello world!", 50, "blue")}}]}}
                           @teacher{For even more practice, have students write contracts for various word problems. This is a great time to remind them about connections to algebra and applying skills learned in Bootstrap to their math classes.}}
]
           }

          
@lesson/studteach[
        #:title "The Design Recipe"
        #:duration "25 minutes"
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
          @points[@point{@student{Now you know how to define values in Pyret, and you know how to use Contracts for pre-built functions. But what about defining functions of your own? In Bootstrap:1, you used a tool called the @vocab{Design Recipe} to define functions from word problems. Let’s review the steps of the Design Recipe in Pyret. 
                                  @activity{Turn to @worksheet-link[#:page 4 #:name "Fast-Functions"] in your workbook.}
                                  Here we have a function definition: @code[#:multi-line #t]{# double: Number -> Number
                                                                                             # Takes a number, and multiplies it by two."
                                                                                             
                                                                                             check:
                                                                                                 double(5) is 2 * 5
                                                                                                 double(7) is 2 * 7
                                                                                             end

                                                                                             fun double(n :: Number) -> Number:
                                                                                                 2 * n
                                                                                             end}
                                  @bannerline{Step 1: Write the Contract and Purpose Statement}
                                  @activity{@itemlist[@item{What is the @vocab{Name} of this function?  How do you know?}
                                                       @item{How many inputs does it have in its @vocab{Domain}?}
                                                       @item{What kind of data is the @vocab{Domain}?}
                                                       @item{What is the Name given to this input?}
                                                       @item{What's the @vocab{Range} of this function?}
                                                       @item{In your own words, what does this function do?}
                                                       ]}
                                  The @vocab{Contract} is a way of thinking about the function in a general way, without having to worry about exactly how it will work or how it will be used. Starting with simple questions such as these will make later steps @bold{much} easier to think about.}
                          @teacher{@management{Review the importance of definitions for students (Defining values helps cut down on redundancy and makes future changes easier, defining functions allows for simplicity and testability. Be sure to use vocabulary regularly and carefully, pushing students to use the proper terms throughout.)}
                                   The Design Recipe is a useful tool for having students think about word problems and break them down into smaller parts (Contract, purpose statement, examples, and code). Instead of jumping into writing a function, students should first note what data types the fuction will take in and produce, and practice using their own words to describe what the function does. After this step, the Contract and Purpose Statement can be relied on to write examples for the function.}}
                   
                  @point{@student{@bannerline{Step 2: Give Examples/Write Test Cases}
                                   In Bootstrap:1 you wrote EXAMPLES for every function, to show how the function could be used with some inputs. Those examples also worked to test your function, and would give you error messages is the expected result didn’t match the result produced by the function body. Pyret has the same thing, but written differently. Instead of using the word EXAMPLE, we’ll write check blocks, which behave the same way as our examples, showing us what we expect to get back when we use the function with certain inputs. Here are our tests for the function double:
@code[#:multi-line #t]{check:
                             double(5) is 2 * 5
                             double(7) is 2 * 7
                       end}
The key words here are @italic{check} and @italic{is}. Pyret knows that anything within the check: and end lines are your test cases, and just like in Racket, we start examples with the name of the function and some input(s), followed by the code we expect to get back. This time, we have the word is between them, to say:
...test... is equivalent to ...result...
Once you’ve defined the function itself, Pyret will automatically check your examples to make sure your results match the function body. If they don’t, you’ll get an error message, just like in Bootstrap:1.}
                          @teacher{Make sure students are writing Pyret code for the results of their tests. @code{double(5) is 10}, while technically correct, doesn’t show us the work and thought process behind the code, and makes it much harder to write the function in the next step. Writing examples is akin to "showing your work" in math class: You want to see @italic{how} students arrived at their answers, not just that they have an answer. It is also much easier to debug a function using the design recipe, because you can check each section individually for errors. Writing test cases for code is also called "unit testing," something professional programmers do all the time.}}
                  
                  @point{@student{@activity{In your workbook, write the contract and two test cases for a function called @code{triple}, which takes in a number as its input and multiplies it by 3.}
                                    Now look at your two test cases. What is the only thing that changes from one to the other? @activity{In your workbook, circle what is changeable, or @vocab{variable}, between your two test cases.} 
               The only thing that changes is the Number being given to @code{triple} and multiplied by 3. Remember from Bootstrap 1 that once you've circled and labeled what changes in each example, it becomes incredibly easy to define the function! All you need to do is replace the thing that changes with its label! 
               @bannerline{Step 3: Define the function}
               Like writing examples, defining the function is just a bit different in Pyret. To start, we write the word fun instead of define. Then, it’s just like you remember from Bootstrap:1. Copy everything from your examples that doesn’t change (except for the word is!), and replace the changeable thing with the variable you picked. Don’t forget a colon ( : ) after your function header, and the word end at the end of the function body, to let the computer know you’re finished defining that function!
               @code[#:multi-line #t]{fun double(n):
                                          2 * n
                                      end}
               @activity{Now write the function header and body for @code{triple}. Don't forget to replace the changing thing with a variable!}}
            @teacher{Just as writing a Contract helps us write test cases, writing the test cases makes it easier to write the definition of a function: circling what changes between the examples makes it obvious that the @italic{changeable} thing is where we need to use a @italic{variable} in our function. You will want to explicitly connect each step in the Design Recipe to every other step. Ask students to justify each part of their Contract by referring back to the Word Problem, to justify each step of their test cases by referring back to the Word Problem and Contract, and finally to justify each step of the definition by referring to the Word Problem, Contract and Examples. The same variable name can be used in multiple functions, just as in math (where many functions use x as the variable name, for example)
                     @management{This activity can be done as a team competition: teams have one minute to write the contract and two test cases for @code{triple}, and another minute for the function header and body. Assign points to the teams that complete each function.} Make sure students fill out the ENTIRE contract, with two test cases, before they circle what changes and move on to the function body. Build these good habits early in the course!}}                                         
          @point{@student{Try using the Design Recipe to solve the following word problems:
                          @activity{@itemlist/splicing[
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
      ]{@points[@point{@student{You just reviewed the first half of the entire Bootstrap 1 course in one unit, AND learned a lot of syntax for a whole new language! Throughout Bootstrap 2 you’ll use all the concepts that you learned in Bootstrap 1, as well as brand new data types, functions, and programming concepts. Of course, you’ll do it all with the help of our old friend the Design Recipe, which will help you write your own functions for your own videogame! Since this is Bootstrap 2, the games you will be able to create will be even more interactive and advanced than in Bootstrap 1. There’s a lot to learn... onward to Unit 2!}
                       @teacher{}}
                                  ]
         }
       }