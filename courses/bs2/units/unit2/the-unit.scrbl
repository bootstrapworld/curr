#lang curr/lib

@title{Unit 2: Introduction to Data Structures}

@declare-tags[]


@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text}))
                                                                                                          ]{
@unit-descr{Students discover the need for data structures, and practice defining them.}
}
@unit-lessons{
              
@lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students will deepen their understanding of function definitions and the Design Recipe}]
     #:evidence-statements @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "N-Q" "8.F.1-3" "F-IF.1-3" "F-LE.5" "A-SSE.1-2" "BS-M" "BS-PL.3" "BS-DR.1" "BS-DR.1" "BS-DR.2" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Pens/pencils for students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Workbook"] folders with names on covers, and something to write with}]
     #:preparation @itemlist[@item{Write Agenda on board}
                             @item{Display class posters, Language Table, Design Recipe}
                             @item{Seating arrangements: ideally clusters of desks/tables}]
     
      #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{In the previous unit, you reviewed almost everything from Bootstrap:1 including Datatypes, Contracts, and the Design Recipe. 
                                In this unit you will go above and beyond all that, and learn an entirely new datatype that will be the basis for everything you'll do in Bootstrap:2.}
                        @teacher{Ask a few introductory review questions to test students' understanding: 
                                 @itemlist[@item{What are the three parts of a Contract?}        
                                            @item{What is the Pyret code to draw a solid, green triangle of size 22?}
                                            @item{Why is it important to write at least 2 examples before defining a function?}]}} 
                 
                 @point{@student{To make sure the material from the previous unit is fresh in your mind, tackle the following activity: @activity{Turn to @worksheet-link[#:page 8 #:name "double-radius"] in your workbook. Write a function called @code{double-radius}, 
                                                   which takes in a radius and a color. It produces an outlined circle of whatever color was passed in, whose radius 
                                                   is twice as big as the input.}}
                        @teacher{If walking through this example as a class, use a projector so kids can see the function being written on the computer.}}
                 @point{@student{Remember how to use the design recipe to work through word problems? @bannerline{Step 1: Contract and Purpose Statement}
                                 @activity[#:forevidence (list "N-Q&1&1" "F-IF.1-3&1&1" "F-LE.5&1&1" "BS-M&1&2" "BS-DR.1&1&1" "BS-DR.1&1&2")]{ @itemlist[@item{What is the @vocab{Name} of this function? How do you know?}
                                                       @item{How many inputs does it have in its @vocab{Domain}?}
                                                       @item{What kind of data is the @vocab{Domain}?}
                                                       @item{What is the @vocab{Range} of this function?}
                                                       @item{What does this function do? Write a @vocab{Purpose Statement} describing what the function does in plain English.}]}
                                 @code[#:multi-line #t]{
# double-radius : Number String -> Image
# Makes an outlined circle that has twice the given radius.}}
                         @teacher{Review the purpose of Contracts: once we know the Name, Domain, and Range of a function, it's easy to write examples using those datatypes.}}
           
                 @point{@student{@bannerline{Step 2: Examples} 
                                  @activity[#:forevidence (list "BS-DR.2&1&1")]{Using only the Contract and Purpose Statement, see if you can answer the following questions:
                                            @itemlist[@item{Every example begins with the name of the function. Where could you find the name of the function?}
                                                       @item{Every example has to include sample inputs. Where could you find out how many inputs this function needs, 
                                                             and what type(s) they are?}
                                                       @item{Every example has to include an expression for what the function should do when given an input. Where 
                                                             could you look to find out what this function does?}
                                                       @item{Write two examples on your paper, then circle and label what is changing between them. When labeling,
                                                             think about what the changing things represent.}
                                                       ]}
Don't forget to include the lines @code{examples:} and @code{end}! Your examples should look similar to:
                                  @code[#:multi-line #t]{examples:
                                                           double-radius(50, "pink") is circle(50 * 2, "outline", "pink")
                                                           double-radius(918, "orange") is circle(918 * 2, "outline", "orange")
                                                         end}}
                         
                         @teacher{Each one of these answers can be found in the Contract or Purpose Statement. Suggestion: Write these steps on the board, and draw 
                                  arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions
                                  each time they write examples, and then using their own work from the previous step to find the answers.}}
                @point{@student{@bannerline{Step 3: Definition}
                                Once you know what is changing between our two examples, you can define the function easily. The things that were circled and labeled in
                                the examples will be replaced with @vocab{variables} in the function definition. 
                                @activity[#:forevidence (list "BS-DR.3&1&1")]{Underneath your examples, copy everything that @bold{doesn't} change, and replace the changing things with the variable 
                                          names you used. (Don't forget to add the @code{fun} and @code{end} keywords, as well as the colon (:) after the function header!)}  
           @code[#:multi-line #t]{
# double-radius: Number, String -> Image
# Makes an outlined circle that's twice the radius.
fun double-radius(radius, color):
  circle(radius * 2, "outline", color)
end}
           @activity[#:forevidence (list "N-Q&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1" "A-SSE.1-2&1&1" "BS-M&1&1" "BS-PL.3&1&3" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{For more practice, turn to @worksheet-link[#:page 9 #:name "double-width"] in your workbook and complete the Design Recipe for the @code{double-width} function.}}
                @teacher{Check students understanding: Why do we use variables in place of specific values? Why is it important to have descriptive variable
                         names, as opposed to @code{n} or @code{x}?
                          Remind students about nested functions: A function whose range is a number can be used inside of a function requiring a number in its domain, as in 
                                 @code{circle(2 * 25, "outline", "red")}.}}
                ]}
                
                
@lesson/studteach[
        #:title "Introducing Structures"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will understand the limitations of atomic datatypes}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students identify real-world behaviors that require data structures}]
        #:standards (list "5.OA.1-2" "7.EE.3-4" "8.F.1-3" "8.F.4" "8.F.5" "F-IF.1-3" "A-SSE.1-2" "F-LE.1-4" "F-LE.5" "BS-M" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-IDE")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVWTBKc3QxT3lDVE0" "Parachute Jumper"] file preloaded on student machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{@activity{Open @editor-link[#:public-id "0B9rKDmABYlJVWTBKc3QxT3lDVE0" "this link"] on your computer and press 'Run'. What happens?}
                                    The parachute jumper jumps out of the airplane and falls straight down, into the water! It's much safer to land on the shore. Let's take a look at the code to see why he falls into the water instead. There are a few new concepts in this file, but first, let's focus on what you already know.
                                    @activity[#:forevidence (list "8.F.1-3&1&1" "8.F.5&1&1" "F-IF.1-3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&3")]{Look at the function defined here called @code{next-position}. @itemlist[@item{What is this function's Domain? Its Range?}
          @item{What does @code{next-position} do with its inputs?}]}
                                    This function takes in two numbers, representing the x and y coordinate of the parachute jumper, but it changes and returns only the y-coordinate, by subtracting 5 from it. But if only the y-coordinate is changing, he'll always fall straight down, landing in the water every time. To reach the land, he'll have to fall diagonally. How could we make that happen?
                                    @activity[#:forevidence (list "F-LE.5&1&1")]{How should the jumper's x-coordinate change if he moves diagonally to the right (toward the land)? How should his y-coordinate change?}}
                           @teacher{}}
                    
                    @point{@student{Functions can return only one thing at a time, but we need to return both an x @bold{and} a y-coordinate in order to make the jumper move diagonally. Thankfully, we have a way to combine multiple things within one container, called a @vocab{Data Structure}. Just like Racket and Pyret have built-in functions and also let you define your own functions, these languages allow you to create your own data structures as well. For this project, we've created a structure for you to use called @code{JumperState}, which contains two Numbers, representing an x and a y-coordinate.                                                                            @activity{Look at line 6, where we've defined @code{JumperState}. We'll go through the new syntax for defining a data structure, because very soon you'll be defining brand new structures of your own!}
                            @itemlist{@item{First, we've written a comment to remind ourselves what we're creating. In this case, we're calling our new structure @code{JumperState}, which contains two numbers: an x and y-coordinate.}
                                      @item{The next line begins with @code{data JumperState:}. Similar to the keyword @code{fun} you learned in the last lesson, @code{data} tells the computer that you're about to define a new type of data. This is a @bold{very} powerful  piece of code: In Bootstrap:1, you wrote programs using four @vocab{data types}: Numbers, Strings, Images, and Booleans. In this course, now you can create brand new data types, which can be passed into functions themselves. We can use these data types to create complex animations, multi-player video games, or account for both coordinates of a parachute jumper, so he moves in 2-dimensions! We called this data type @code{JumperState}, because it represents the current state, or position, of the parachute jumper, but we could choose any name we want. As a convention, the name of a new data structure is capitalized.}
                                      @item{The next line begins with the | symbol, sometimes called a "bar" or "pipe", followed by the name of the @code{constructor function} for the structure (in this case, @code{jumper}.) If you want to use an Image in your program, you must call the function that creates it: rectangle, triangle, square, etc. Similarly, if we want to create a JumperState in a program (perhaps to alter the movement of a parachute jumper), we must use the @code{jumper} @vocab{constructor function} with its inputs (two numbers, called x and y).} 
                                                                                                                              @item{How do we know what these inputs are? The block of code we've given you defines all of this! @code[#:multi-line #t]{data JumperState:
                                     | jumper(
                                        x :: Number, 
                                        y :: Number)
                                  end}
                                                                                                                              tells us that we're defining a new data type called @code{JumperState}, whose constructor function @code{jumper} takes in two things: x, which is a Number, and y, which is also a number. Once we've listed each input and its data type, we finish defining the structure with the @code{end} keyword, just like finishing an @code{example} block.}}}
                            @teacher{This is the first data block students see in this course, but they will soon be writing their own to create new data structures. It's worth spending the time to cover this new syntax, paying special attention to capitalization (the name of the structure is capitalized (JumperState), whereas its constructor function (jumper) is lowercase), double colons (::) before data types, and commas between inputs to the constructor function.}
                            }
                                     
                   
                    @point{@student{Now it's up to us to protect this parachute jumper, and make sure he lands safely on the shore. @activity[#:forevidence (list "F-IF.1-3&1&1" "F-LE.5&1&1" "BS-M&1&2" "BS-DR.1&1&1" "BS-DR.1&1&2")]{Turn to @worksheet-link[#:page 10 #:name "next-position"] in your workbook, read the word problem, and fill in the Contract and Purpose Statement for the function @code{next-position}.}
    @code[#:multi-line #t]{# next-position : Number Number -> JumperState
                           # Given 2 numbers, make a JumperState by adding 5 to x and subtracting 5 from y}}
                            @teacher{Point out that we're now using a new data type in a contract: @code{next-position} consumes two Numbers, and produces a @italic{JumperState}. Once we've defined a new data structure using the above data block, we can use it just like other datatypes.}}

                    @point{@student{Now for our two examples. Using, or @vocab{calling} @code{next-position} with two numbers is easy, but what happens to those numbers? We can't return both at the same time... unless we use a data structure! To do so we'll need to use the constructor function to make a structure from the data we already have. @activity[#:forevidence (list "5.OA.1-2&1&1" "5.OA.1-2&1&1" "7.EE.3-4&1&1" "A-SSE.1-2&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.4&1&1")]{@itemlist[@item{According to the definition for @code{JumperState}, what function makes a JumperState? What is its contract?}
                    @item{@code{# jumper : Number Number -> JumperState}}
                    @item{What two things are part of a JumperState? Do we have values for those things as part of our first example?}
                    @item{We don't want our JumperState to contain the same x and y values we gave the @code{next-position} function. How will the values change? (Remember to show your work!)}
                    @item{Your first example should look something like: 
                          @code[#:multi-line #t]{examples:
                                                   next-position(30, 250) is jumper(30 + 5, 250 - 5)
                                                 end}}
                    @item{Once your first example is complete, write one more example with different inputs for the x and y coordinates.}]}}
                            @teacher{Remind students to show every step of their work in the example step of the design recipe: if the x-coordinate increases by 5 while the y-coordinate decreases by 5, they should show the addition and subtraction within the JumperState data structure, instead of just returning the new numbers.}}
                    
                    @point{@student{@activity[#:forevidence (list "8.F.4&1&1" "F-LE.1-4&1&5" "BS-DR.3&1&1" "BS-DR.4&1&2")]{Now that you have two examples, it's time to define the function. You know the drill: circle and label everything that changes between your two examples, copy everything that stays the same, and replace the changing things with the variables you chose.}
                                     When you finish, your function definition should look like: @code[#:multi-line #t]{fun next-position(x, y):
                         jumper(x + 5, y - 5)
                       end}
                                     Now, instead of just changing and returning one number (a y-coordinate), we can return @bold{both} the x and y-coordinates of the parachute jumper within a @vocab{Data Structure}. @activity[#:forevidence (list "BS-IDE&1&1")]{Open the @editor-link[#:public-id "0B9rKDmABYlJVWTBKc3QxT3lDVE0" "Parachute Jumper"] code again and replace the original @code{next-position} function with the one in your workbook to make the parachute jumper land safely on the shore!}}
                           @teacher{}}
                    
                    @point{@student{In Bootstrap:1, a function could return only one thing: either a Number, String, Image, or Boolean. In Bootstrap:2, our functions will still return one thing, but that thing can be a @vocab{Data Structure}, (or just "structure" for short) containing any number of things within it. This way we could return both the x and y-coordinate of a player using a JumperState, or create new structures and return even more detail about a player, like their health, position, amount of armor, or inventory.}
                            @teacher{In Bootstrap:1, students' games were made by keeping track of just a few numbers: the x-positions of the danger and target, and y-position 
                                     of the player. In Bootstrap:2, students' games will be much more complex, and will require many more values to move characters, test conditions, 
                                     keep track of the score, etc. Data structures simplify code by organizing multiple values: You couldn't represent every part of a player 
                                     (position, health, inventory, etc.) with one number or string, but you can refer to all these things collectively with a @vocab{data structure}. This way, we can have one value (a data structure) containing multiple other values for easy access.}}
                    ]
           }

@lesson/studteach[#:title "Cakes"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Cake}}
                                     @item{Students define variables bound to Cakes}
                                     @item{Students will generalize their understanding of function constructors and accessors}]
        #:standards (list "N-Q" "F-IF.1-3" "BS-PL.1" "BS-DS.1" "BS-DS.2" "BS-IDE")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVU2lINzk1X0x2ODg" "Bakery"] file preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Suppose you own a famous bakery. You bake things like cookies, pastries, and tarts, but you're especially known for your world-famous cakes.
                                   What type of thing is a cake? Is it a number? String? Image? Boolean? You couldn't describe all of the important things 
                                   about a cake with any one of those data types. However, we could say that we care about a couple of details about each cake, each of which can be described with the types we already know.
                                   @activity[#:forevidence (list "N-Q&1&1" "BS-DS.2&1&1")]{For each of the following aspects of a cake, think about what datatype you might use to represent it:
                                             @itemlist[@item{The flavor of the cake. That could be "Chocolate", "Strawberry", "Red Velvet", or something else.}
                                                        @item{The color of the cake}
                                                        @item{The message on top of the cake}
                                                        @item{The number of layers}
                                                        @item{Whether or not the cake is an ice cream cake.}]
                                              What datatype could we use to represent the entire cake?}
                                   @bitmap{images/cake2.png}                                                   
                                   Now that we know everything that is part of a Cake, we can use a data structure to represent the Cake itself. Let's take a look at how this works.
                                   @activity{Open your workbook to @worksheet-link[#:page 11 #:name "Cake"].}
                                   At the top of this page we see a comment, stating what things are part of a Cake. Below that is a line that says @code{data Cake:}, which begins the definition of a new data structure, called Cake. On the next line, we define the function that makes a Cake (@code{cake}), and how @italic{exactly} to make a Cake - the names of each thing in a Cake structure, and their data types. 
                                   @activity{What is the first part of a Cake structure? What data type can we use to represent it?}
                                   There is a little bit of new syntax involved in defining structures. On the first line on @worksheet-link[#:page 11 #:name "Cake"], we want to write @code{flavor :: String,}, which tells Pyret that the first element of @italic{any} Cake will be its flavor, represented by a String. 
                                   @activity{What is the second part of a Cake structure? What data type can we use to represent it?}
                                   On the next line, write @code{color :: String}, which tells Pyret that the second element of any Cake will be its color, represented by a String.
                                   @activity[#:forevidence (list "N-Q&1&1")]{List each of the other fields of a cake (message, layers, and is-ice-cream), and note what data types will represent them. Don't forget commas to separate each field!}
                                   On your paper, you should have: 
                                   @code[#:multi-line #t]{ # a Cake is a flavor, color, message, number of layers, and whether or not it is an ice cream cake.
                                                       data Cake:
                                                         | cake(
                                                             flavor      :: String, 
                                                             color       :: String, 
                                                             message     :: String, 
                                                             layers      :: Number, 
                                                             is-iceCream :: Boolean)
                                                       end}
                             This is the code that defines the Cake data structure. It tells the computer what a Cake is and what goes into it. It also defines its constructor function, called @code{cake}. To make a Cake, you @italic{must} call the constructor function with five things: a @code{flavor}, which is a String, @code{color}, a String, @code{messgae}, another String, @code{layers}, a Number, and @code{is-iceCream}, which is a Boolean. Remember that order matters! For now, these are the only things that we're going to keep track of in a cake, but you can imagine how you might extend it to include other information.}
                        @teacher{Stress the importance of being able to define your own datatypes
                                 to students: no longer are they bound by the single values of numbers, strings, or booleans! Pyret allows you to define brand new @vocab{Data Structures}, containing 
                                 any combination of values.}}
                   
                    @point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVU2lINzk1X0x2ODg" "Bakery"] file and look at lines 3 - 10. Do they match what you have on your paper?} 
                                      Now take a look farther down, at line 12: @code{cake2 = cake("Chocolate", "brown", "Happy birthday!", 8, false)}
                                               @itemlist[@item{What is the name of this variable?}
                                                          @item{What is the flavor of @code{cake2}?}
                                                          @item{What is the color of @code{cake2}?}
                                                          @item{What is the message on @code{cake2}?}
                                                          @item{How many layers does @code{cake2} have?}
                                                          @item{Finally, is @code{cake2} an ice cream cake, or not?}]}
                            
                            @teacher{Below the data definition for Cake there are four Cakes defined and assigned to the variables @code{cake1}, @code{cake2}, @code{cake3}, and @code{cake4}. Ask students 
                                     questions about these Cakes to get them thinking about how they would define their own.}}
                    @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1" "BS-DS.1&1&4")]{Define another Cake, called @code{cake5}. To start,
                                                                         @itemlist[@item{how would you define this variable?}
                                                                                    @item{What function is used to make a Cake?}
                                                                                    @item{Which thing comes first in a Cake structure?}] 
                                              Now what do you expect to happen when you type @code{cake5} into the interactions area? Click 'Run' and try it out.}
                                              @code{cake5 = cake("Peanut Butter", "brown", "Congratulations!", 2, true)}}
                            @teacher{Have students walk you through the process of defining a variable called @code{cake5} and making a Cake with whatever flavor, color, message, etc. they like.}}
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1" "BS-DS.1&1&4")]{Define two new variables for some of your favorite Cakes. You can call them @code{cake6} and @code{cake7}, or whatever names you prefer. You can make any kind of Cakes that you want, as long as your structure has the right types in the right orders!}}
                         @teacher{Repetition is key in this lesson. Have students identify each part of the Cake struct for every Cake they've defined.
                                  What is the flavor of their first Cake? Its message? Ensure that students are using their inputs in the right order!}}
                 
                 @point{@student{At this point, you've worked with two different @vocab{Data Structures}: Coords and Cakes, and you've created different examples, or @vocab{instances}, of these structures. Throughout this course you'll create many more instances of structures than you will define whole new structures. For now, the important point is to recognize the difference between a structure @italic{definition} (the @code{data....} piece of code) and specific @vocab{instances} of a data structure (like @code{cake1}, or @code{coord(44, 75)}.}
                            @teacher{}}
                    
                    @point{@student{Based on these instances of Cakes you just wrote:
                                    @activity[#:forevidence (list "F-IF.1-3&1&1")]{@itemlist[@item{What is the name of the function that creates a Cake?}
                                                        @item{What is the Domain of this function?}
                                                        @item{How many things are in the domain?}]} The five things in the domain of @code{cake} are, in fact, the five things that we have already listed on @worksheet-link[#:page 11 #:name "Cake"]! With data structures, the order is very important: we always want the first string in @code{cake} to be the Cake's flavor, the first number to be its number of layers, etc.}
                                   
                         @teacher{Cakes are the first example of defining a new datatype that students will see, but Pyret allows you to define any number of new data structures to hold
                                  any combination of values. The important points to remember about structures is that whenever the constructor function is called (in this case, @code{cake}), it must take in the same 
                                  number and type of values as in the structure's definition, and its inputs must be in the @italic{same order} as the definition. Unit Three introduces 
                                  students to even more data structures, and in Unit Four they begin defining their own.}}
              
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1")]{After clicking the "Run" button, in Pyret, type @code{cake1} into the interactions area and hit enter. What do you get back?}
                                  Does this make sense? What happens when you type just a number into the interactions area? We get that same number back! What about Strings? Images? 
                                  Booleans? If we don't do anything to our input, or use any function on it, we get back exactly what we put in! Here, you put in a Cake, and got back that Cake!}
                         @teacher{Remind students that values will always evaluate to themselves. 4 evaluates to 4, the string @code{"pizza"} evaluates to @code{"pizza"}, and @code{cake1} evaluates
                                  to @code{cake("Vanilla", "white", "Happy wedding!", 4, false)}}}
                
                  @point{@student{You can see what your Cakes look like by calling the function provided at the bottom of the file. It's called @code{draw-cake}, and it takes a Cake as input and 
                                  gives you back an Image of your Cake.
                                  @activity[#:forevidence (list "BS-IDE&1&1")]{In the interactions area, type @code{draw-cake(cake1)} and see what happens. Use the function with the Cakes YOU defined!} @bitmap{images/cake3.png}}
                         @teacher{Students will spend lots of time "drawing" their Cakes. Encourage them to define some new Cakes, and to alter the color, message, layers, etc. to see their changes 
                                  reflected in the images. Don't forget to remind them to click "Run" after making any changes!}}
                  ]
           }
                 
          
@lesson/studteach[#:title "Dot-Accessors"
                  #:duration "10 minutes"
                  #:overview ""
                  #:learning-objectives @itemlist[]
                  #:evidence-statements @itemlist[]
                  #:product-outcomes @itemlist[@item{Students write code that extracts each field from those Cakes}]
                  #:standards (list "BS-IDE")
                  #:materials @itemlist[]
                  #:preparation @itemlist[]
                  #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{@points[
                @point{@student{Suppose you want to get the flavor OUT of @code{cake4}. You don't care about the message, color, or anything else - you just want to 
                                know the flavor. Pyret has syntax for that, called @code{.flavor}.
                                @activity[#:forevidence (list "BS-IDE&1&1")]{If you type @code{cake4.flavor} into the interactions area, what should it evaluate to? Try it out! 
                                                      @itemlist[@item{What kind of thing did it return: A Number, String, Image, Boolean, or structure?}
                                                                 @item{Practice taking the flavor out of EVERY Cake you have defined, using @code{.flavor}}]}
                    
                                Of course, there are ways to access any part of a Cake, not just the flavor! What do you think you would get if you typed @code{cake4.color} in the interactions area? 
                                @activity[#:forevidence (list "BS-IDE&1&1")]{Try using the dot-accessors @code{.color}, @code{.message}, @code{.layers} and @code{.is-iceCream} on your Cakes! Do they do what you expect?}}
                 @teacher{A way to prompt students to use these accessors is to ask: "How do you get the message out of a Cake?" or "How do you get the layers out of a Cake?"
                          Throughout the course you can set up a call and response system with students, where the question "How do you get the X out of a Y?" 
                          will prompt the name of the accessor.}}
                 
                 @point{@student{The previous syntax is known as @vocab{Dot-Accessors}. They allow you to specify exactly what part of a structure you want. If we want to know if we can fit a certain Cake through a doorway, we probably care only whether the number of layers is less than a certain amount. Likewise, if we want to know whether or not a character in our game has died, we need to know only if his health is less than 0: 
                                 we might not care what his location is, or the color of his armor. Programmers use accessors a lot, because they often need to know only one piece of information from a complex data structure.}
                         @teacher{}}
                                    
                                    
                  @point{@student{Our Cake structure is defined using @code{data Cake} and the @code{cake(...)} line, which tells the computer what things make up that structure, and what order and type each 
                                                          thing is. In return, we get new functions to use. Until we write these two lines, we don't have 
                                                          @code{cake(...)} (to make a Cake), @code{.flavor} (to get the flavor out of the Cake), @code{.color}, or any of the other dot-accessors, because Pyret doesn't know what a Cake is- @italic{we haven't defined it}.
            @activity[#:forevidence (list "BS-IDE&1&1")]{To see this for yourself, type a pound sign (#) before the line which begins with @code{cake(...)}. This comments it out, so that the computer ignores it. Hit run, and see what happens. }}
                    @teacher{When the @code{cake(...)} line is commented out, Pyret returns some errors, saying you're trying to use @code{cake} before its definition. It doesn't know what @code{cake} is or does, because we defined a Cake structure with no constructor. Make sure students understand that the line beginning with
                                      @code{data} and a line similar to @code{cake(...)} are needed in order to create and work with @italic{any} structure.}}         
                                    ]
         }

@lesson/studteach[#:title "Closing"
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
        @points[@point{@student{@vocab{Data Structures} are a powerful tool for representing complex data in a computer program. Simple videogames, like Pong, might need to
                                keep track of only a few numbers at once, such as the position of the ball, position of each paddle, and the score. But if a game has many 
                                different enemies, each with its own position and health, or multiple levels with their own background images, the game can get 
                                very complicated very fast, and structures are a great way to manage and make sense of all the data. Programmers can do a LOT with data
                                structures, and in the upcoming lessons you will create your own structures to make a customized videogame.}
           @teacher{Have students volunteer what they learned in this lesson!}}
  
           
 ]}
       }
       
       


