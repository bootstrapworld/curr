#lang curr/lib

@title{Unit 1: Everything you learned in Bootstrap:1}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
   @unit-descr{While learning a new programming language, students review the major concepts and material from Bootstrap:1, including Contracts, Expressions dealing with numbers, strings and images, Variable definitions, Function definitions, and the Design Recipe.}
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
                              @item{The @editor-link[#:public-id "0B9rKDmABYlJVdHZESmZ6ZnRmdXc" "Review file"] preloaded on students' machines.}
                              @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
      #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Welcome back to Bootstrap! In Bootstrap:1, you used a @vocab{programming language} called Racket to make your video games. We chose this language because it behaves like algebra, but there are many different languages you could use to make video games. In Bootstrap:2, you’re going to learn a new language, called Pyret. Pyret is similar to Python, a programming language you may have heard of, but this language contains many of the features you remember from Racket. The @vocab{syntax} is a little different, but with a bit of practice you’ll pick it up in no time!}
                       @teacher{Introduce teaching staff. Give some background: age, where you're from, something surprising about yourself, favorite food, etc. Anything to allow kids to connect. Have students introduce themselves. Set expectations and rules for the class.}}
                 @point{@student{Open your workbook to @worksheet-link[#:page 1 #:name "Review"]. Here we have a table, with examples of value definitions in Racket and Pyret. On the left-hand column, we've defined values in Racket, and on the right we have the same values defined in Pyret. For instance, the first line on the left-hand side says @code{(define AGE 14)}. Directly to the right, we have the Pyret @vocab{syntax}: @code{AGE = 14}, which does the same thing: defines a variable called AGE, which has a value of 14.
                         @activity{Take a look at the other values defined here for Numbers, Strings, Images, and Booleans. On the right-hand side of the table, practice defining values in Pyret:
                           @itemlist[@item{two additional Numbers}
                                     @item{two additional Strings}
                                     @item{one more Boolean}
                                     @item{one more Image}]}
                         The last row of the table on @worksheet-link[#:page 2 #:name "Review"] shows you the same function definition in Racket and Pyret. We'll go into more detail on functions soon.}
                         @teacher{}}  
               @point{@student{Open the @editor-link[#:public-id "0B9rKDmABYlJVdHZESmZ6ZnRmdXc" "Review file"] in a new window. The first thing you’ll notice is that we’re no longer using WeScheme to edit our programs, although the Pyret editor behaves very similarly. The definitions area (where you write code you want to save for later) is on the left side of the screen, and the interactions area (where you write code you just want to test out once, like scratch paper) is on the right. The top of the editor has space to write a name for your program, and the “Run” button at the top right will clear the interactions area and run whatever program is written in the definitions area.}
                       @teacher{}}
               @point{@student{@activity{@itemlist[@item{What are the names of the variables defined here? What are their values?}
                                                          @item{What would you get back if you were to evaluate each of those variables in the Interactions area? Take a guess first, then click "Run" and type the name of each variable into the interactions area. Were your guesses correct?}]
                                                 Look at the variable @code{OUTLINE} on line 18.
                                                 @itemlist[@item{What shape will this draw?}
                                                           @item{How big do you think it will be?}
                                                           @item{Will it be solid or outline?}
                                                           @item{What color will it be?}]
                                                 Try evaluating @code{OUTLINE} in the interactions area. Was the fill what you expected it to be?}
       The problem is that we used a very confusing variable name: the name was “OUTLINE," but the value was a solid green star. Remember: always choose your variable names carefully!
       @activity{Replace this variable name with something more descriptive.}}
                       @teacher{Remind students about the importance of good variable names: they make code more readable, and a descriptive variable name makes it very clear what is being defined.}}
               
               @point{@student{As you can see, Pyret uses the same data types that we used in Racket: Numbers, Strings, Images, and Booleans are used in Pyret, and look and behave in the same way. @activity{In your review file, define the new Numbers, Strings, Images, and Boolean you wrote in your workbook on @worksheet-link[#:page 1 #:name "Review"].}}
                       @teacher{}}
               
               @point{@student{Now we have values, and we know how to define shortcuts for them. There are also plenty of built-in functions, which let us play around with these values. 
@activity{What are some functions you know that work on numbers? How many can you list?}}
                   @teacher{Remind students that arithmetic operations, such as +, -, *, and / are functions.}}
               
               @point{@student{One of the big changes from Racket to Pyret is the way arithmetic functions are used. In Pyret, you can write these expressions with math notation, like so: @code{(2 + 9)} or @code{(10 * 8)}. @bold{But don't forget to leave a space before and after the function!}}
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
                  @point{@student{It's important to keep track of how functions work, and Bootstrap:1 introduced the idea of @vocab{Contracts}. The contract for the @code{star} function is shown below. @code[#:multi-line ""]{; star: Number String String -> Image}
Contracts summarize three pieces of essential information about a function: 
@itemlist[@item{The @vocab{Name} of the function: in this case, @code{star}.}
                    @item{The @vocab{Domain} of a function, which is the type(s) of data that the function expects. In this case, a Number and two Strings.}    
                    @item{The @vocab{Range} of this function, which is the type of data that the function produces: In this case, an Image!}]
@bannerline{Every contract has three parts: Name, Domain and Range!}
A contract is a note we write to ourselves about how to use the function. Just as in Bootstrap:1, it will be helpful to keep track of the contracts for each function you learn about. The last page in your workbook has a table labeled "Contracts," where you can (and should!) copy down each contract as you learn it.
Contracts in Pyret are just as important as they are in Racket, and are written the same way. You write contracts as comments: pieces of text for humans only, which are ignored by the computer. In Racket we used a @code{;} before Contracts, but in Pyret, just put a @code{#} before a line of text to turn it into a comment!
@activity{The Contract for @code{+} is shown below.
          @code[#:multi-line ""]{# +: Number Number -> Number}                
Write down the Contracts for @code{*}, @code{-}, @code{/} and @code{num-sqrt} in your Contracts page. (You know @code{num-sqrt} as the @code{sqrt} function in Racket!)}
One notable difference between Racket and Pyret is that Pyret requires commas between each input to a function. So, @code{circle(50 “solid” “red”)} will return an error message, because you need commas between each input. @code{circle(50, “solid”, “red”)} is the correct code. Keep this in mind as you write your programs!}                             
       @teacher{Emphasize to students that a function's contract can tell you a LOT about that function. It may also be useful to ask them to articulate reasons why Contracts are a good thing, so they are able to say it in their own voice. Make sure they write every contract down in their workbooks!}}
                   @point{@student{@activity{Below are some Pyret expressions using functions you used in Bootstrap:1. For each one, identify which function is being used and write its Contract in your Contracts page. If you need help, try typing the expressions into your computer. @itemlist[@item{@code{circle(75, "solid", "red")}}
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
        #:product-outcomes @itemlist[@item{Students define functions based on a problem statement.}]
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
                                  @activity{Turn to @worksheet-link[#:page 3 #:name "Fast-Functions"] in your workbook.}
                                  Here we have a function definition: @code[#:multi-line #t]{# double: Number -> Number
                                                                                             examples:
                                                                                                 double(5) is 2 * 5
                                                                                                 double(7) is 2 * 7
                                                                                             end

                                                                                             fun double(n):
                                                                                                 2 * n
                                                                                             end}
                                  @bannerline{Step 1: Write the Contract and Purpose Statement}
                                  @activity{@itemlist[@item{What is the @vocab{Name} of this function?  How do you know?}
                                                       @item{How many inputs does it have in its @vocab{Domain}?}
                                                       @item{What type of data is the @vocab{Domain}?}
                                                       @item{What is the @vocab{Range} of this function?}
                                                       @item{What do you think this function does? What would be a good @vocab{Purpose Statement} for this function?}
                                                       ]}
                                  The @vocab{Contract} is a way of thinking about the function in a general way, without having to worry about exactly how it will work or how it will be used. By starting with simple questions such as these, later steps will be @bold{much} easier to think about.}
                          @teacher{Review the importance of definitions for students (Defining values helps cut down on redundancy and makes future changes easier, defining functions allows for simplicity and testability. Be sure to use vocabulary - Contract, Domain, Range, Example, etc. - regularly and carefully, pushing students to use the proper terms throughout.) The Design Recipe is a useful tool for having students think about word problems and break them down into smaller parts (Contract, purpose statement, examples, and code). Instead of jumping into writing a function, students should first note what data types the fuction will take in and produce, and practice using their own words to describe what the function does. After this step, the Contract and Purpose Statement can be relied on to write examples for the function.}}
                   
                  @point{@student{@bannerline{Step 2: Give Examples}
                                   In Bootstrap:1 you wrote EXAMPLES for every function, to show how the function could be used with some inputs. Those examples also worked to test your function, and would give you error messages if the expected result didn’t match the result produced by the function body. Pyret has the same thing, but written differently. Here are our examples for the function @code{double}:
@code[#:multi-line #t]{examples:
                             double(5) is 2 * 5
                             double(7) is 2 * 7
                       end}
The key words here are @italic{examples} and @italic{is}. Pyret knows that anything within the @code{examples:} and @code{end} lines are your examples, and just like in Racket, we start with the name of the function and some input(s), followed by the code we expect to get back. This time, we have the word @code{is} between them, to say:
...@italic{test}... is equivalent to ...@italic{result}...
Once you’ve defined the function itself, Pyret will automatically check your examples to make sure your results match the function body. If they don’t, you’ll get an error message, just like in Bootstrap:1.}
                          @teacher{Make sure students are writing Pyret code for the results of their examples. @code{double(5) is 10}, while technically correct, doesn’t show us the work and thought process behind the code, and makes it much harder to define the function in the next step. Writing examples is akin to "showing your work" in math class: You want to see @italic{how} students arrived at their answers, not just that they have an answer. It is also much easier to debug a function using the design recipe, because you can check each section individually for errors. Writing examples for code is also called "unit testing," something professional programmers do all the time.}}
                  
                  @point{@student{@activity{In your workbook, write the contract and two examples for a function called @code{triple}, which takes in a number as its input and multiplies it by 3.}
                                    Now look at your two examples. What is the only thing that changes from one to the other? @activity{In your workbook, circle what is changeable, or @vocab{variable}, between your two examples.} 
               The only thing that changes is the Number being given to @code{triple} and multiplied by 3. Remember from Bootstrap:1 that once you've circled and labeled what changes in each example, it becomes incredibly easy to define the function! All you need to do is replace the thing that changes with its label! 
               @bannerline{Step 3: Define the function}
                @code[#:multi-line #t]{fun double(n):
                                          2 * n
                                      end}
               Like writing examples, defining the function is just a bit different in Pyret. To start, we write the word @code{fun} instead of @code{define}. Then it’s just like you remember from Bootstrap:1. Copy everything from your @code{examples} that doesn’t change (except for the word @code{is}!), and replace the changeable thing with the variable you picked. Don’t forget a colon ( : ) after your function header, and the word @code{end} at the end of the function body, to let the computer know you’re finished defining that function!
               @activity{Now write the function header and body for @code{triple}. Don't forget to replace the changing thing with a variable!}}
            @teacher{Just as writing a Contract helps us write examples, writing examples makes it easier to write the function definition: circling what changes between the examples makes it obvious that the @italic{changeable} thing is where we need to use a @italic{variable} in our function. You will want to explicitly connect each step in the Design Recipe to every other step. Ask students to justify each part of their Contract by referring back to the Word Problem, to justify each step of their examples by referring back to their Contract, and to justify each step of the definition by referring to their Contract and Examples. The same variable name can be used in multiple functions, just as in math (where many functions use x as the variable name, for example).
                     This activity can be done as a team competition: teams have one minute to write the contract and two examples for @code{triple}, and another minute for the function header and body. Assign points to the teams that complete each function. Make sure students fill out the ENTIRE contract, with two examples, before they circle what changes and move on to the function body. Build these good habits early in the course!}}
                  
          @point{@student{Try using the Design Recipe to solve the following word problems:
                          @activity{@itemlist/splicing[
                               @item{Write a function @code{plus1}, that takes in a number and adds one to it}
                               @item{Write a function @code{mystery}, that takes in a number and subtracts 4}
                               @item{Write a function @code{red-spot}, that takes in a number and draws a solid red circle, using the number as the radius}]}
            }
          @teacher{Have a student act out one of the functions they've defined. They will take on the name and behavior of that function (@code{plus1}, @code{red-spot}, etc.) and can be used by the class. Remind the class that in order to use the function they must practice @vocab{calling} it by name with some input(s).}
          
          @point{@student{For some extra practice with Pyret syntax, turn to @worksheet-link[#:page 6 #:name "Bug Hunting"] in your workbook and see if you can spot the bugs in the Pyret code in the left column. Circle each error (some sections might have more than one!), and then write the correct code in the right column.}
                 @teacher{Students will make syntax errors when learning any new language. This workbook page is intended to give them practice finding syntax bugs on paper first, to help identify the same bugs while typing later on.}}
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
      ]{@points[@point{@student{You just reviewed the first half of the entire Bootstrap:1 course in one unit, and learned how to write material from Bootstrap:1 in the @vocab{syntax} of a new language! Throughout Bootstrap:2 you’ll use all the concepts that you learned in Bootstrap:1, as well as brand new data types, functions, and programming concepts. Of course, you’ll do it all with the help of our old friend the Design Recipe, which will help you write your own functions for your own videogame! Since this is Bootstrap:2, the games you will be able to create will be even more interactive and advanced than in Bootstrap:1. There’s a lot to learn... onward to Unit 2!}
                       @teacher{If time permits, have students practice solving other algebra word problems using the Fast Functions sections on @worksheet-link[#:page 4 #:name "Fast Functions"] and @worksheet-link[#:page 5 #:name "Fast Functions"] in their workbook.}}
                                  ]
         }
       }
       