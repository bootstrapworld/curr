#lang curr/lib

@title{Unit 2: Introduction to Data Structures}

@declare-tags[]


@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text}))
                                                                                                          ]{
@unit-descr{Students discover the need for data structures and they practice defining them.}
}
@unit-lessons{
              
@lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students will deepen their understanding of function definitions and the Design Recipe}]
     #:evidence-statements @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list)
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
                 
                 @point{@student{To make sure the material from last unit is fresh in your mind, tackle the following activity: @activity{Turn to @worksheet-link[#:page 8 #:name "double-radius"] in your workbook. Write a function called @code{double-radius}, 
                                                   which takes in a radius and a color. It produces an outlined circle of whatever color was passed in, whose radius 
                                                   is twice as big as the input.}}
                        @teacher{If walking through this example as a class, use a projector so kids can see the function being written on the computer: }}
                 @point{@student{Remember how to use the design recipe to work through word problems? @bannerline{Step 1: Contract and Purpose Statement}
                                 @activity{ @itemlist[@item{What is the @vocab{Name} of this function? How do you know?}
                                                       @item{How many inputs does it have in its @vocab{Domain}?}
                                                       @item{What kind of data is the @vocab{Domain}?}
                                                       @item{What is the @vocab{Range} of this function?}
                                                       @item{What does this function do? Write a @vocab{Purpose Statement} describing what the function does in plain English.}]}
                                 @code[#:multi-line #t]{
# double-radius : Number String -> Image
# Makes an outlined circle that has twice the given radius.}}
                         @teacher{Review the purpose of Contracts: once we know the Name, Domain, and Range of a function, it's easy to write examples using those datatypes.}}
           
                 @point{@student{@bannerline{Step 2: Examples} 
                                  @activity{Using only the Contract and Purpose Statement, see if you can answer the following questions:
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
                                @activity{Underneath your examples, copy everything that @bold{doesn't} change, and replace the changing things with the variable 
                                          names you used. (Don't forget to add the @code{fun} and @code{end} keywords, as well as the colon (:) after the function header!)}  
           @code[#:multi-line #t]{
# double-radius: Number, String -> Image
# Makes an outlined circle that's twice the radius.
fun double-radius(radius, color):
    circle(radius * 2, "solid", color)
end}
           @activity{For more practice, turn to @worksheet-link[#:page 9 #:name "double-width"] in your workbook and complete the Design Recipe for the @code{double-width} function.}}
                @teacher{Check students understanding: Why do we use variables in place of specific values? Why is it important to have descriptive variable
                         names, as opposed to @code{n} or @code{x}?
                          Remind students about nested functions: A function whose range is a number can be used inside of a function requiring a number in its domain, as in 
                                 @code{circle(2 * 25, "solid", "red")}.}}
                ]}
                
                
@lesson/studteach[
        #:title "Introducing Structures"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will understand the limitations of atomic datatypes}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students identify real-world behaviors that require data structures}]
        #:standards (list )
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVbFpIZktoQ1pwWm8" "Parachute Jumper"] file preloaded on student machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{@activity{Open @editor-link[#:public-id "0B9rKDmABYlJVbFpIZktoQ1pwWm8" "this link"] on your computer and press 'Run'. What happens?}
                                    The parachute jumper jumps out of the airplane and falls straight down, into the water! It's much safer to land on the shore. Let's take a look at the code to see why he falls into the water instead.
                                    @activity{Look at the function defined here called @code{next-position}. @itemlist[@item{What is this function's Domain? Its Range?}
          @item{What does @code{next-position} do with its inputs?}]}
                                    This function takes in two numbers, representing the x and y coordinate of the jumper, but it only changes and returns the y-coordinate, by subtracting 5 from it. But if only the y-coordinate is changing, he'll always fall straight down, landing in the water every time. To reach the land, he'll have to fall diagonally. How could we make that happen?
                                    @activity{How should the jumper's x-coordinate change if he moves diagonally to the right (toward the land)? How should his y-coordinate change?}}
                           @teacher{}}
                    
                    @point{@student{Functions can only return one thing at a time, but we need to return both an x @bold{and} a y-coordinate in order to make the jumper move diagonally. Thankfully, we have a way to combine multiple things within one container, called a @vocab{Data Structure}.
                           @activity{For this activity we'll be working with a data structure called a Coord, which contains just two Numbers, representing an x and a y-coordinate. You make Coords using a function called @code{coord}.} 
@code[#:multi-line #t]{# coord : Number Number -> Coord}}
                            @teacher{Point out the difference in capitalization: Coord (capital C) is the name of the data structure, while @code{coord} (lowercase c) is the name of the function that creates a Coord. Make sure students understand the difference, because this is a required distinction between the structure name (capitalized) and constructor function (always lowercase).}}
                    
                    @point{@student{Now it's up to us to protect the parachute jumper, and make sure he lands safely on the shore. @activity{Turn to @worksheet-link[#:page 9 #:name "next-position"] in your workbook, read the word problem, and fill in the Contract and Purpose Statement for the function @code{fall}.}
    @code[#:multi-line #t]{# next-position : Number Number -> Coord
                           # Given 2 numbers, make a Coord by adding 5 to x and subtracting 5 from y}
    
    Now for our two examples. Using, or @vocab{calling} @code{next-position} with two numbers is easy, but what happens to those numbers? We can't return both at the same time... unless we use a data structure! To do so we'll need to use the constructor function to make a structure from data we already have. @activity{@itemlist[@item{According to the definition for @code{Coord}, what function makes a Coord?}
                    @item{@code{coord(.....)}}
                    @item{What two things are part of a Coord? Do we have values for those things as part of our first example?}
                    @item{We don't want our Coord to contain the same x and y values we gave the @code{next-position} function. How will the values change? (Remember to show your work!)}
                    @item{Your first example should look something like: 
                          @code[#:multi-line #t]{examples:
                                                    next-position(30, 250) is coord(30 + 5, 250 - 5)
                                                 end}}
                    @item{Once your first example is complete, write one more example with different inputs for the x and y coordinates.}]}}
                            @teacher{Remind students to show every step of their work in the example step of the design recipe: if the x-coordinate increases by 5 while the y-coordinate decreases by 5, they should show the addition and subtraction within the Coord data structure, instead of just returning the new numbers.}}
                    
                    @point{@student{@activity{Now that you have two examples, it's time to define the function. You know the drill: circle and label everything that changes between your two examples, copy everything that stays the same, and replace the changing things with the variables you chose.}
                                     When you finish, your function definition should look like: @code[#:multi-line #t]{fun next-position(x, y):
                          coord(x + 5, y - 5)
                       end}
                                     Now, instead of just changing and returning one number (a y-coordinate), we can return @bold{both} the x and y-coordinates of the parachute jumper within a @vocab{Data Structure}. @activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVbFpIZktoQ1pwWm8" "Parachute Jumper"] code again and replace the original @code{fall} function with the one in your workbook to make the jumper land safely on the shore!}}
                           @teacher{}}
                    
                    @point{@student{In Bootstrap:1, you could only have a function return one thing: either a number, string, image, or boolean. In Bootstrap:2, our functions will still return one thing, but that thing can be a @vocab{Data Structure}, (or "struct" for short) containing any number of things within it. This way we could return both the x and y-coordinate of a player using a Coord, or create new structs and return even more detail about a player, like their health, position, amount of armor, or inventory.}
                            @teacher{In Bootstrap:1, students' games were made by keeping track of only a few numbers: the x-positions of the danger and target, and y-position 
                                     of the player. In Bootstrap:2, students' games will be much more complex, and will require many more values to move characters, test conditions, 
                                     keep track of the score, etc. Data structures simplify code by organizing multiple values: You couldn't represent every part of a player 
                                     (position, health, inventory, etc.) with one number or string, but you can refer to all these things collectively with a @vocab{data structure}. This way, we can have one value (a data structure) containing multiple other values for easy access.}}
                    ]
           }

@lesson/studteach[#:title "Cars"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Car}}
                                     @item{Students define variables bound to Cars}
                                     @item{Students will generalize their understanding of function constructors and accessors}]
        #:standards (list )
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVSlI4VEZLLUI4UkU" "Autobody shop"] file preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Suppose you want to open up an autobody shop. You take people's cars and upgrade them, giving them paint jobs, turbo-charging their engines, etc. 
                                   What type of thing is a car? Is it a number? String? Image? Boolean? You couldn't describe all of the important things 
                                   about a car with any one of those data types. However, we could say that we care about a couple of details about each car, each of which can be described with the types we already know.
                                   @activity{For each of the following aspects of a car, think about what datatype you might use to represent it:
                                             @itemlist[@item{The model of the car. That could be "Prius", "Mustang", "XTerra", or something else.}
                                                        @item{The amount of horsepower in the car}
                                                        @item{The size of the rims}
                                                        @item{The color of the car}
                                                        @item{The price of the car.}]
                                              What datatype could we use to represent the entire car?}
                                   @bitmap{images/car3.png}                                                   
                                   Now that we know everything that is part of a Car, we can use a data structure (or just 'structure' for short) to represent the Car itself. Let's take a look at how this works.
                                   @activity{Open your workbook to @worksheet-link[#:page 10 #:name "Car"].}
                                   At the top of this page we see a comment, stating what things are part of a car. Below that is a line that says @code{data Car:}, which begins the definition of a new data structure, called Car. On the next line, we define the function that makes a Car (@code{car}), and how @italic{exactly} to make a Car - the names of each thing in a Car structure, and their data types. 
                                   @activity{What is the first part of a Car structure? What data type can we use to represent it?}
                                   There is a little bit of new syntax involved in defining structures. On the first line on @worksheet-link[#:page 10 #:name "Car"], we want to write @code{model :: String,}, which tells Pyret that the first element of @italic{any} Car will be its model, represented by a String. 
                                   @activity{What is the second part of a Car structure? What data type can we use to represent it?}
                                   On the next line, write @code{hp :: Number}, which tells Pyret that the second element of any Car will be its hp, represented by a Number.
                                   @activity{List each of the other fields of a car (rims, color, and price), and note what data types will represent them. Don't forget commas to separate each field!}
                                   On your paper, you should have: 
                                   @code[#:multi-line #t]{ # a car is a model, hp, rims, color and price.
                                                       data Car:
                                                         | car(model :: String, 
                                                                  hp :: Number, 
                                                                  rims :: Number, 
                                                                  color :: String, 
                                                                  price :: Number)
                                                       end}
                             This is the code that defines the Car data structure. It tells the computer what a Car is and what goes into it. It also defines its constructor function, called @code{car}. To make a Car, you @italic{must} call the constructor function with five things: a @code{model}, which is a String, @code{hp}, a Number, @code{rims}, another Number, @code{color}, a String, and @code{price}, which is a Number. Remember that order matters! For now, these are the only things that we're going to keep track of in a car, but you can imagine how you might extend it to include other information.}
                        @teacher{Stress the importance of being able to define your own datatypes
                                 to students: no longer are they bound by the single values of numbers, strings, or booleans! Pyret allows you to define brand new @vocab{Data Structures}, containing 
                                 any combination of values.}}
                   
                    @point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVSlI4VEZLLUI4UkU" "Autobody shop"] file and look at lines 3 - 10. Do they match what you have on your paper?} 
                                      Now take a look farther down, at line 12: @code{car2 = car("Prius", 160, 18, "blue", 20000)}
                                               @itemlist[@item{What is the name of this variable?}
                                                          @item{What is the model of @code{car2}?}
                                                          @item{What is the horsepower of @code{car2}?}
                                                          @item{What is the rim size of @code{car2}?}
                                                          @item{What is the color of @code{car2}?}
                                                          @item{Finally, what is the price of @code{car2}?}]}
                            
                            @teacher{Below the data definition for Car there are three Cars defined and assigned to the variables @code{car1}, @code{car2}, and @code{car3}. Ask students 
                                     questions about these Cars to get them thinking about how they would define their own.}}
                    @point{@student{@activity{Define another Car, called @code{car4}. To start,
                                                                         @itemlist[@item{how would you define this variable?}
                                                                                    @item{What function is used to make a Car?}
                                                                                    @item{Which thing comes first in a Car struct?}] 
                                              Now what do you expect to happen when you type @code{car4} into the interactions area? Click 'Run' and try it out.}
                                              @code{car4 = car("Taurus", 300, 20, "white", 5000)}}
                            @teacher{Have students walk you through the process of defining a variable called @code{car4} and making a Car with whatever model, hp, rims, etc. they like.}}
                 @point{@student{@activity{Define two new variables for each of your favorite Cars. You can call them @code{car5} and @code{car6}, or whatever names you prefer. You can make any kind of Cars that you want, as long as your structure has the right types in the right orders!}}
                         @teacher{Repetition is key in this lesson. Have students identify each part of the Car struct for every Car they've defined.
                                  What is the model of their first Car? Its price? Ensure that students are using their inputs in the right order!}}
                 
                 @point{@student{At this point, you've worked with two different @vocab{Data Structures}: Coords and Cars, and you've created different examples, or @vocab{instances}, of these structures. Throughout this course you'll create many more instances of structures than you will define whole new structures. For now, the important point is to recognize the difference between a structure @italic{definition} (the @code{data....} piece of code) and specific @vocab{instances} of a data structure (like @code{car1}, or @code{coord(44, 75)}.}
                            @teacher{}}
                    
                    @point{@student{Based on these instances of Cars you just wrote:
                                    @activity{@itemlist[@item{What is the name of the function that creates a Car?}
                                                        @item{What is the Domain of this function?}
                                                        @item{How many things are in the domain?}]} The five things in the domain of @code{car} are, in fact, the five things that we have already listed on @worksheet-link[#:page 10 #:name "Car"]! With data structures, the order is very important: we always want the first string in @code{car} to be the Car's model, the first number to be its horsepower, etc.}
                                   
                         @teacher{Cars are the first example of defining a new datatype that students will see, but Pyret allows you to define any number of new data structures to hold
                                  any combination of values. The important points to remember about structures is that whenever the constructor function is called (in this case, @code{car}), it must take in the same 
                                  number and type of values as in the structure's definition, and its inputs must be in the @italic{same order} as the definition. Unit Three introduces 
                                  students to even more data structures, and in Unit Four they begin defining their own.}}
              
                 @point{@student{@activity{After clicking the "Run" button, in Pyret, type @code{car1} into the interactions area and hit enter. What do you get back?}
                                  Does this make sense? What happens when you type just a number into the interactions area? We get that same number back! What about Strings? Images? 
                                  Booleans? If we don't do anything to our input, or use any function on it, we get back exactly what we put in! Here, you put in a Car, and got back that Car!}
                         @teacher{Remind students that values will always evaluate to themselves. 4 evaluates to 4, the string @code{"pizza"} evaluates to @code{"pizza"}, and @code{car1} evaluates
                                  to @code{car("M5", 480, 28, "black", 50000)}}}
                
                  @point{@student{You can see what your Cars look like by calling the function provided at the bottom of the screen. It's called @code{draw-car}, and it takes a Car as input and 
                                  gives you back an Image with your Car in it.
                                  @activity{In the interactions window, type @code{draw-car(car1)} and see what happens. Use the function with the Cars YOU defined!} @bitmap{images/car1.png}}
                         @teacher{Students will spend lots of time "drawing" their Cars. Encourage them to define some new Cars, and to alter the color, rim size, price, etc. to see their changes 
                                  reflected in the images. Don't forget to remind them to click "Run" after making any changes!}}
                  ]
           }
                 
          
@lesson/studteach[#:title "Dot-Accessors"
                  #:duration "10 minutes"
                  #:overview ""
                  #:learning-objectives @itemlist[]
                  #:evidence-statements @itemlist[]
                  #:product-outcomes @itemlist[@item{Students write code that extracts each field from those Cars}]
                  #:standards (list)
                  #:materials @itemlist[]
                  #:preparation @itemlist[]
                  #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{@points[
                @point{@student{Suppose you want to get the model OUT of @code{car4}. You don't care about the rim size, or horsepower, or anything else- you just want to 
                                know the model. Pyret has syntax for that, called @code{.model}.
                                @activity{If you type @code{car4.model} into the interactions window, what should it evaluate to? Try it out! 
                                                      @itemlist[@item{What kind of thing did it return: A number, string, image, or struct?}
                                                                 @item{Practice taking the model out of EVERY Car you have defined, using @code{.model}}]}
                    
                                Of course, there are ways to access any part of a Car, not just the model! What do you think you would get if you typed @code{car1.hp} in the interactions area? 
                                @activity{Try using the dot-accessors @code{.hp}, @code{.rims}, @code{.color} and @code{.price} on your Cars! Do they do what you expect?}}
                 @teacher{A way to prompt students to use these accessors is to ask: "How do you get the horsepower out of a Car?" or "How do you get the color out of a Car?"
                          Throughout the course you can set up a call and response system with students, where the question "How do you get the X out of a Y?" 
                          will prompt the name of the accessor.}}
                 
                 @point{@student{The previous syntax is known as @vocab{Dot-Accessors}. They allow you to specify what part of a structure you want. If we want to know if we can afford a certain Car, we probably only care whether the price is less than
                                 a certain amount. Likewise, if we want to know whether or not a character in our game has died, we only need to know if his health is less than 0: 
                                 we might not care what his location is, or the color of his armor. Programmers use accessors a lot, because they often need to know only one piece of information from a complex data structure.}
                         @teacher{}}
                                    
                                    
                  @point{@student{Our Car structure is defined using @code{data Car} and the @code{car(...)} line, which tells the computer what things make up that structure, and what order and type each 
                                                          thing is. In return, we get new functions to use. Until we write these two lines, we don't have 
                                                          @code{car(...)} (to make a Car), @code{.model} (to get the model out of the Car), @code{.hp}, or any of the other dot-accessors, because Pyret doesn't know what a Car is- @italic{we haven't defined it}.
            @activity{To see this for yourself, type a pound sign (#) before the line which begins with @code{car(...)}. This comments it out, so that the computer ignores it. Hit run, and see what happens. }}
                    @teacher{When the @code{car(...)} line is commented out, Pyret returns some errors, saying you're trying to use @code{car} before its definition. It doesn't know what @code{car} is or does, because we defined a Car structure with no constructor. Make sure students understand that the line beginning with
                                      @code{data} and a line similar to @code{car(...)} are needed in order to create and work with any structure.}}         
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
        @points[@point{@student{@vocab{Data Structures} are a powerful tool for representing complex data in a computer program. Simple videogames, like Pong, might only need to
                                keep track of a few numbers at once, like the position of the ball, position of each paddle and the score. But if a game has many 
                                different enemies, each with their own position and health, or multiple levels with their own background image, the game can get 
                                very complicated very fast, and structures are a great way to manage and make sense of all the data. Programmers can do a LOT with data
                                structures, and in the upcoming lessons you will create your own structures to make a customized videogame.}
           @teacher{Have students volunteer what they learned in this lesson!}}
  
           
 ]}
       }
       
       


