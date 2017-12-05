#lang curr/lib

@title{Unit 1: Everything you learned in Bootstrap:Algebra}


@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
   @unit-descr{While learning a new programming language, students review the major concepts and material from Bootstrap:Algebra, including Contracts, Expressions dealing with numbers, strings and images, Variable definitions, Function definitions, and the Design Recipe.}
}
@unit-lessons{
@lesson/studteach[
      #:title "Introduction to Pyret"
      #:duration "30 minutes"
      #:overview ""
      #:learning-objectives @itemlist[]
      #:evidence-statements @itemlist[]
      #:product-outcomes @itemlist[]
      #:standards (list "BS-PL.1" "BS-IDE" "BS-PL.3")
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
        @points[@point{@student{Welcome back to Bootstrap! In Bootstrap:Algebra, you used a @vocab{programming language} called Racket to make your video games. We chose this language because it behaves like algebra, but there are many different languages you could use to make video games. In Bootstrap:Reactive, you’re going to learn a new language, called Pyret. Pyret has many of the features of Racket, but with a different @vocab{syntax} that looks more like popular languages such as Python. This unit will help you make the switch to Pyret syntax in no time!}
                       @teacher{@bold{Why the language switch?}
                                 
                                 Some students and teachers may already have experiences with languages such as HTML, JavaScript, or Python.  With each new language, one encounters new syntax (how the language looks) and semantics (how the language behaves). Each of these languages has settings for which it is particularly appropriate and effective, and learning each teaches new lessons about programming style. The world of computing is multi-lingual, and we think a good introduction to computing should be, too.
                                 
                                 @bold{Why Pyret?} 
                                 
                                 Pyret, the language we will learn in Bootstrap:Reactive, takes all the nice parts of the Bootstrap:Algebra language, and uses a syntax that is similar to traditional industry languages like Python. This means it shares the mathematical behavior of Racket, and allows for easy image-manipulation, test-cases, and the Design Recipe. This lets teachers and students to use what they know about Racket as they progress into Bootstrap:Reactive. Pyret also has some unique features that make programming interactive programs more pleasant than in WeScheme.

                                 
This new syntax gives us an opportunity to show students that key programming ideas, like defining and using functions, carry over across different languages. It also provides a stepping stone towards more traditional languages, without diving head first into a language like Python, in which we'd have to learn different rules for numbers (among other things), new terminology for errors, and use functions that don’t always correspond to algebra. Pyret also provides us with the ability to write interactive programs and use images in a familiar way.}}
                 
                 @point{@student{Open your workbook to @worksheet-link[#:name "Review"]. Here we have a table, with examples of value definitions in Racket and Pyret. On the left-hand column, we've defined values in Racket, and on the right we have the same values defined in Pyret. For instance, the first line on the left-hand side says @code{(define AGE 14)}. Directly to the right, we have the Pyret @vocab{syntax}: @code{AGE = 14}, which does the same thing: defines a variable called AGE, which has a value of 14.
                         @activity[#:forevidence (list "BS-PL.1&1&1")]{ Take a look at the other values defined here for Numbers, Strings, Images, and Booleans. On the right-hand side of the table, practice defining values in Pyret:
                           @itemlist[@item{two additional Numbers}
                                     @item{two additional Strings}
                                     @item{one more Boolean}
                                     @item{one more Image}]}
                         The last row of the table on @worksheet-link[#:name "Review-page2"] shows you the same function definition in Racket and Pyret. We'll go into more detail on functions soon.}
                         @teacher{}}  
               @point{@student{Open the @editor-link[#:public-id "0B9rKDmABYlJVdHZESmZ6ZnRmdXc" "Review file"] in a new window. The first thing you’ll notice is that we’re no longer using WeScheme to edit our programs, although the Pyret editor behaves very similarly. The definitions area (where you write code you want to save for later) is on the left side of the screen, and the interactions area (where you write code you just want to test out once, like scratch paper) is on the right. The top of the editor has space to write a name for your program, and the "Run" button at the top right will clear the interactions area and run whatever program is written in the definitions area.}
                       @teacher{}}
               @point{@student{The first line of code here will be new to you: Since Pyret has a lot more functions than we used in Bootstrap:Algebra in Racket, to keep things simple we’ve grouped some of these functions into @vocab{libraries}. The line @code{include image} tells Pyret to load all of the functions from the image library for use in this file, so we can use familiar functions like @code{star}, @code{triangle}, @code{rectangle}, @code{scale}, @code{rotate}, and more.
                               
                               @activity[#:forevidence (list "BS-IDE&1&1")]{@itemlist[@item{What are the names of the variables defined in this file? What are their values?}
                                                          @item{What would you get back if you were to evaluate each of those variables in the Interactions area? Take a guess first, then click "Run" and type the name of each variable into the interactions area. Were your guesses correct?}]
                                                 Look at the variable @code{OUTLINE} on line 16.
                                                 @itemlist[@item{What shape will this draw?}
                                                           @item{How big do you think it will be?}
                                                           @item{Will it be solid or outline?}
                                                           @item{What color will it be?}]
                                                 Try evaluating @code{OUTLINE} in the interactions area. Was the fill what you expected it to be?}
       The problem is that we used a very confusing variable name: the name was "OUTLINE," but the value was a solid green star. Remember: always choose your variable names carefully!
       @activity[#:forevidence (list "BS-PL.1&1&1" "BS-PL.3&1&1")]{Replace this variable name with something more descriptive.}}
                       @teacher{Remind students about the importance of good variable names: they make code more readable, and a descriptive variable name makes it very clear what is being defined.}}
               
               @point{@student{As you can see, Pyret uses the same data types that we used in Racket: Numbers, Strings, Images, and Booleans are used in Pyret, and look and behave in the same way. @activity{In your review file, define the new Numbers, Strings, Images, and Boolean you wrote in your workbook on @worksheet-link[#:name "Review"].}}
                       @teacher{}}
               
               @point{@student{Now we have values, and we know how to define shortcuts for them. There are also plenty of built-in functions, which let us play around with these values. 
@activity[#:forevidence (list )]{What are some functions you know that work on numbers? How many can you list?}}
                   @teacher{Remind students that arithmetic operations, such as +, -, *, and / are functions.}}
               
               @point{@student{One of the big changes from Racket to Pyret is the way arithmetic functions are used. In Pyret, you can write these expressions with math notation, like so: @code{(2 + 9)} or @code{(10 * 8)}. @bold{But don't forget to leave a space before and after the function!} Pyret will report an error if you write something like @code{2+9} without spaces around the @code{+}.}
                       @teacher{The spaces matter because Pyret allow various non-alphabetic characters to be used in names of variables and identifiers.  Pyret needs the spaces
		       		to tell whether @code{-} is a minus sign or a hyphen, for example.  The spacing rule thus applies to all arithmetic function characters.}}
               
               @point{@student{Another difference between Racket and Pyret is that Pyret requires commas between each input to a function. So, @code{circle(50 "solid" "red")} will return an error message, because you need commas between each input. @code{circle(50, "solid", "red")} is the correct code. Keep this in mind as you write your programs!}
                       @teacher{}
                       }
                        ]
         }
   
@lesson/studteach[
        #:title "Contracts"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list "BS-PL.2&1&1")
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                  @point{@student{It's important to keep track of how functions work, and Bootstrap:Algebra introduced the idea of @vocab{Contracts}. The contract for the @code{star} function is shown below. @code[#:multi-line ""]{# star :: Number String String -> Image}
Contracts summarize three pieces of essential information about a function: 
@itemlist[@item{The @vocab{Name} of the function: in this case, @code{star}.}
                    @item{The @vocab{Domain} of a function, which is the type(s) of data that the function expects. In this case, a Number and two Strings.}    
                    @item{The @vocab{Range} of this function, which is the type of data that the function produces: In this case, an Image!}]
@bannerline{Every contract has three parts: Name, Domain and Range!}
A contract is a note we write to ourselves about how to use the function. Just as in Bootstrap:Algebra, it will be helpful to keep track of the contracts for each function you learn about. The last page in your workbook has a table labeled "Contracts," where you can (and should!) copy down each contract as you learn it.
Contracts in Pyret are just as important as they are in Racket, and are written the same way. You write contracts as comments: pieces of text for humans only, which are ignored by the computer. In Racket we used a @code{;} (semicolon) before Contracts, but in Pyret, just put a @code{#} (pound sign, or octothorpe) before a line of text to turn it into a comment!
@activity[#:forevidence (list "BS-PL.2&1&1")]{The Contract for @code{+} is shown below.
          @code[#:multi-line ""]{#  +  :: Number Number -> Number}                
Write down the Contracts for @code{*}, @code{-}, @code{/} and @code{num-sqrt} in your Contracts page. (You know @code{num-sqrt} as the @code{sqrt} function in Racket!)}}                             
       @teacher{Emphasize to students that a function's contract can tell you a LOT about that function. It may also be useful to ask them to articulate reasons why Contracts are a good thing, so they are able to say it in their own voice. Make sure they write every contract down in their workbooks!}}
                   @point{@student{@activity[#:forevidence (list "BS-PL.2&1&1")]{Below are some Pyret expressions using functions you used in Bootstrap:Algebra. For each one, identify which function is being used and write its Contract in your Contracts page. If you need help, try typing the expressions into your computer. @itemlist[@item{@code{circle(75, "solid", "red")}}
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
        #:standards (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-M&1&1" "BS-DR.3&1&1")
        #:materials @itemlist[@item{Design Recipe Sign}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[@point{@student{Now you know how to define values in Pyret, and you know how to use Contracts for pre-built functions. But what about defining functions of your own? In Bootstrap:Algebra, you used a tool called the @vocab{Design Recipe} to define functions from word problems. Let’s review the steps of the Design Recipe in Pyret. 
                                  @activity{Turn to @worksheet-link[#:name "Fast-Functions-double"] in your workbook.}
                                  Here we have a function definition: @code[#:multi-line #t]{# double :: Number -> Number
                                                                                             examples:
                                                                                                 double(5) is 2 * 5
                                                                                                 double(7) is 2 * 7
                                                                                             end

                                                                                             fun double(n):
                                                                                                 2 * n
                                                                                             end}
                                  @bannerline{Step 1: Write the Contract and Purpose Statement}
                                  @activity[#:forevidence (list "F-IF.1-3&1&1")]{@itemlist[@item{What is the @vocab{Name} of this function?  How do you know?}
                                                       @item{How many inputs does it have in its @vocab{Domain}?}
                                                       @item{What type of data is the @vocab{Domain}?}
                                                       @item{What is the @vocab{Range} of this function?}
                                                       @item{What do you think this function does? What would be a good @vocab{Purpose Statement} for this function?}
                                                       ]}
                                  The @vocab{Contract} is a way of thinking about the function in a general way, without having to worry about exactly how it will work or how it will be used. By starting with simple questions such as these, later steps will be @bold{much} easier to think about.}
                          @teacher{Review the importance of definitions for students (Defining values helps cut down on redundancy and makes future changes easier, defining functions also allows for simplicity and testability.) Be sure to use vocabulary - Contract, Domain, Range, Example, etc. - regularly and carefully, pushing students to use the proper terms throughout. The Design Recipe is a useful tool for having students think about word problems and break them down into smaller parts (Contract, purpose statement, examples, and code). Instead of jumping into writing a function, students should first note what data types the function will take in and produce, and practice using their own words to describe what the function does. After this step, the Contract and Purpose Statement can be relied on to write examples for the function.}}
                   
                  @point{@student{@bannerline{Step 2: Give Examples}
                                   In Bootstrap:Algebra you wrote EXAMPLES for every function, to show how the function could be used with some inputs. Those examples also worked to test your function, and would give you error messages if the expected result didn’t match the result produced by the function body. Pyret has the same thing, but written differently. Here are our examples for the function @code{double}:
@code[#:multi-line #t]{examples:
                             double(5) is 2 * 5
                             double(7) is 2 * 7
                       end}
The key words here are @italic{examples} and @italic{is}. Pyret knows that anything within the @code{examples:} and @code{end} lines are your examples, and just like in Racket, we start with the name of the function and some input(s), followed by the code we expect to get back. This time, we have the word @code{is} between them, to say:
...@italic{test}... is equivalent to ...@italic{result}...
Once you’ve defined the function itself, Pyret will automatically check your examples to make sure your results match the function body. If they don’t, you’ll get an error message, just like in Bootstrap:Algebra.}
                          @teacher{Make sure students are writing Pyret code for the results of their examples. @code{double(5) is 10}, while technically correct, doesn’t show us the work and thought process behind the code, and makes it much harder to define the function in the next step. Writing examples is akin to "showing your work" in math class: You want to see @italic{how} students arrived at their answers, not just that they have an answer. It is also much easier to debug a function using the design recipe, because you can check each section individually for errors. Writing examples for code is also called "unit testing," something professional programmers do all the time.}}
                  
                  @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1")]{At the bottom of @worksheet-link[#:name "Fast-Functions-double"] in your workbook, write the contract and two examples for a function called @code{triple}, which takes in a number as its input and multiplies it by 3.}
                                    Now look at your two examples. What is the only thing that changes from one to the other? @activity{In your workbook, circle what is changeable, or @vocab{variable}, between your two examples.} 
               The only thing that changes is the Number being given to @code{triple} and multiplied by 3. Remember from Bootstrap:Algebra that once you've circled and labeled what changes in each example, it becomes incredibly easy to define the function! All you need to do is replace the thing that changes with its label! 
               @bannerline{Step 3: Define the function}
                @code[#:multi-line #t]{fun double(n):
                                          2 * n
                                      end}
               Like writing examples, defining the function is just a bit different in Pyret. To start, we write the word @code{fun} instead of @code{define}. Then it’s just like you remember from Bootstrap:Algebra. Copy everything from your @code{examples} that doesn’t change (except for the word @code{is}!), and replace the changeable thing with the variable you picked. Don’t forget a colon ( : ) after your function header, and the word @code{end} at the end of the function body, to let the computer know you’re finished defining that function!
               @activity[#:forevidence (list "8.F.1-3&1&1")]{Now write the function header and body for @code{triple}. Don't forget to replace the changing thing with a variable!}}
            @teacher{Just as writing a Contract helps us write examples, writing examples makes it easier to write the function definition: circling what changes between the examples makes it obvious that the @italic{changeable} thing is where we need to use a @italic{variable} in our function. You will want to explicitly connect each step in the Design Recipe to every other step. Ask students to justify each part of their Contract by referring back to the Word Problem, to justify each step of their examples by referring back to their Contract, and to justify each step of the definition by referring to their Contract and Examples. The same variable name can be used in multiple functions, just as in math (where many functions use x as the variable name, for example).
                     This activity can be done as a team competition: teams have one minute to write the contract and two examples for @code{triple}, and another minute for the function header and body. Assign points to the teams that complete each function. Make sure students fill out the ENTIRE contract, with two examples, before they circle what changes and move on to the function body. Build these good habits early in the course!}}
                  
          @point{@student{Try using the Design Recipe to solve the following word problems (in the "Fast Function" areas starting on @worksheet-link[#:name "Fast-Functions-blank"] of your workbook):
                          @activity[#:forevidence (list "BS-M&1&1" "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.3&1&1")]{@itemlist/splicing[
                               @item{Write a function @code{plus1}, that takes in a number and adds one to it}
                               @item{Write a function @code{mystery}, that takes in a number and subtracts 4}
                               @item{Write a function @code{red-spot}, that takes in a number and draws a solid red circle, using the number as the radius}]}
            }
          @teacher{Have a student act out one of the functions they've defined. They will take on the name and behavior of that function (@code{plus1}, @code{red-spot}, etc.) and can be used by the class. Remind the class that in order to use the function they must practice @vocab{calling} it by name with some input(s).}
          
          @point{@student{For some extra practice with Pyret syntax, turn to @worksheet-link[#:name "Bug-Hunting"] in your workbook and see if you can spot the bugs in the Pyret code in the left column. Circle each error (some sections might have more than one!), and then write the correct code in the right column.}
                 @teacher{Students will make syntax errors when learning any new language. This workbook page is intended to give them practice finding syntax bugs on paper first, to help identify the same bugs while typing later on.}}
          }]}
       
@lesson/studteach[
     #:title "Images in Pyret"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVaVpta3FVc0wydG8" "Take a hike!"] Starter file preloaded on students' machines.}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{You'll be working with a lot of animations in Bootstrap:Reactive. In Bootstrap:Algebra, the way your game characters moved and where they were placed on the screen was mostly determined for you. In this course, you have all the control over your animation. To start, let's practice making static scenes: images with no animation. Do you remember the @code{put-image} function from Racket? Pyret has the same function, and its contract should look familiar:  @code[#:multi-line #t]{# put-image : Image, Number, Number, Image -> Image}.
                               @activity{@itemlist[@item{Open the @editor-link[#:public-id "0B9rKDmABYlJVaVpta3FVc0wydG8" "Take a hike!"] starter file.}
                                                   @item{At the beginning of the file, we've provided you with a few image values. What are their names?}
                                                   @item{Try typing @code{HIKER1} into the interactions area. What do you see?}
                                                   @item{Look below the line that says @code{# Creating a scene}. What is the name of the value defined here?}
                                                   @item{What data type is @code{SCENE}? How do you know?}]}
                               This piece of code uses the @code{put-image} function to place the image of the boat onto the @code{BACKGROUND} at the coordinates 750, 200. To find out the best place to put the image of the boat, first we had to find out how large the background image was. Two functions help with this:  @code[#:multi-line #t]{# image-width :: Image -> Number} which returns the width of the given image (in pixels), and   @code[#:multi-line #t]{# image-height :: Image -> Number} which returns the height of the given image.
                               @activity{Try evaluating @code{image-width(BACKGROUND)} in the interactions area to find the total width of the background.}}
                        @teacher{}}
                 @point{@student{Since the range of @code{put-image} is an image, the expression @code{put-image(BOAT, 750, 200, BACKGROUND)} will evaluate to an image. If we then want to put the image of a hiker onto @italic{this} image (like creating a collage), we can do that by nesting expressions using the @code{put-image} function. 
                          @code[#:multi-line #t]{put-image(HIKER1, 700, 500, 
                                                           put-image(BOAT, 750, 200, BACKGROUND))}
                          @activity{Now it's time to create your own scene. To start,
                                    @itemlist[@item{Place both hikers onto the mountains.}
                                              @item{Get some perspective: scale the image of the hiker higher on the mountain, so they appear smaller than the other hiker.}
                                              @item{Find your own images to add to the scene using the @code{image-url} function. (This works just like the @code{bitmap/url} function from Bootstrap:Algebra. 
                                    @code{# image-url :: String -> Image}}]
                                    }
                                    @bold{Hint:} Recall the image manipulation functions you used in Bootstrap:Algebra. These may come in handy! @itemlist[@item{# scale :: Number Image -> Image}
                                   @item{# rotate :: Number Image -> Image}]
                                    }
                         @teacher{In the upcoming lessons, students will be creating their own scenes from scratch, and then animating them. This activity is meant to familiarize students with the @code{put-image} function, and have them practice placing, moving, and scaling images onto a background. Once students have copied the necessary contracts into their workbook, this activity could be assigned for homework, or completed as an in-class activity.}
                         }
                 ]
         }
                         
                                
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
      ]{@points[@point{@student{You just reviewed the first half of the entire Bootstrap:Algebra course in one unit, and learned how to write material from Bootstrap:Algebra in the @vocab{syntax} of a new language! Throughout Bootstrap:Reactive you’ll use all the concepts that you learned in Bootstrap:Algebra, as well as brand new data types, functions, and programming concepts. Of course, you’ll do it all with the help of our old friend the Design Recipe, which will help you write your own functions for your own videogame! Since this is Bootstrap:Reactive, the games you will be able to create will be even more interactive and advanced than in Bootstrap:Algebra. There’s a lot to learn... onward to Unit 2!}
                       @teacher{If time permits, have students practice solving other algebra word problems using the Fast Functions sections on @worksheet-link[#:name "Fast-Functions-blank"] and @worksheet-link[#:name "Fast-Functions-blank"] in their workbook.}}
                                  ]
         }
       }
       
