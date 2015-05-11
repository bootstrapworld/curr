#lang curr/lib

@title{Unit 2: Introduction to Data Structures}

@declare-tags[management]


@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt})
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
                        @teacher{Ask a few introductory review questions to test students' understanding, such as: 
                                 @itemlist[@item{What are the three parts of a Contract?}        
                                            @item{What is the Pyret code to draw a solid, green triangle of size 22?}
                                            @item{Why is it important to write at least 2 examples before defining a function?}]}} 
                 
                 @point{@student{To make sure the material from last unit is fresh in your mind, tackle the following activity: @activity{Turn to @worksheet-link[#:page 8 #:name "double-radius"] in your workbook. Write a function called @code{double-radius}, 
                                                   which takes in a radius and a color. It produces an outlined circle of whatever color was passed in, whose radius 
                                                   is twice as big as the input.}}
                        @teacher{@management{If walking through this example as a class, use a projector so kids can see the function being written on the computer: }}}
                 @point{@student{Remember how to use the design recipe to work through word problems? @bannerline{Step 1: Contract and Purpose Statement}
                                 @activity{ @itemlist[@item{What is the @vocab{Name} of this function?}
                                                       @item{What is the @vocab{Domain} of this function?}
                                                       @item{What is the @vocab{Range} of this function?}
                                                       @item{What does it do? Write a @vocab{Purpose Statement} describing what the function does in plain English.}]}
                                 @code[#:multi-line #t]{
# double-radius : Number, String -> Image
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
                                                       @item{Don't forget to include the lines @code{example:} and @code{end}!}]}
                                  Your examples should look similar to:
                                  @code[#:multi-line #t]{example:
                                                             double-radius(50, "pink") is circle(50 * 2, "outline", "pink")
                                                             double-radius(918, "orange") is circle(918 * 2, "outline", "orange")
                                                         end}}
                         
                         @teacher{Each one of these answers can be found in the Contract or Purpose Statement. Suggestion: Write these steps on the board, and draw 
                                  arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions
                                  each time they write examples, and then using their own work from the previous step to find the answers.}}
                @point{@student{@bannerline{Step 3: Definition}
                                Once you know what is changing between our two examples, you can define the function easily. The things that were circled and labeled in
                                the examples will be replaced with @vocab{variables} in the function definition. (You don't @bold{always} want to make a pink 
                                circle whose radius is double 50. You want to be able to change the color and radius.) 
                                @activity{Underneath your examples, copy everything that @bold{doesn't} change, and replace the changing things with the variable 
                                          names you used.}  
           @code[#:multi-line #t]{
# double-radius: Number, String -> Image
# Makes an outlined circle that's twice the radius.
fun double-radius(radius, color):
    circle(radius * 2, "solid", color)
end}}
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
        #:preparation @itemlist[@item{PARACHUTE JUMPER FILE}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{@activity{Open this link [PARACHUTE JUMPER] on your computer and press 'Run'. What happens?}
                                    The parachute jumper jumps out of the airplane and falls straight down, into the water! It's much safer to land on the shore. Let's take a look at the code to see why he falls into the water instead.
                                    @activity{Look at the function defined here called @code{fall}. @itemlist[@item{What is this function's Domain? Its Range?}
          @item{What does @code{fall} do with its inputs? What does it return now?}]}
                                    This function takes in two numbers, representing the x and y coordinate of the jumper, but it only changes and returns the y-coordinate, by subtracting 5 from it. But if only the parachute jumper's y-coordinate is changing, he'll always fall straight down, landing in the water every time. To reach the land, he'll have to fall diagonally. How could we make that happen?
                                    @activity{How should the jumper's x-coordinate change if he moves diagonally to the right (toward the land)? How should his y-coordinate change?}}
                           @teacher{}}
                    
                    @point{@student{Functions can only return one thing at a time, but we need to return both an x @bold{and} a y-coordinate in order to make the jumper move diagonally. Thankfully, Pyret (and many other languages) has a way to return multiple things withon one container, called a @vocab{Data Structure}.
                           @activity{Scroll up to where you see the line of code that says @code{data Coord:}.}
                           This is a special block of code that defines the data structure we'll be using, called coord. It contains just two numbers: an x and a y-coordinate. We'll go into more detail about how this line of code works later in the lesson. For now, the important thing this code tells you is how to @italic{make} a Coord, using a function called @code{coord}. @code{# coord : Number Number -> Coord}}
                            @teacher{Point out the difference in capitalization: @code{Coord} (capital C) is the name of the data structure, while @code{coord} (lowercase c) is the name of the function that creates a Coord. Make sure students understand the difference.}}
                    
                    @point{@student{Now it's up to us to protect the parachute jumper, and make sure he lands safely on the shore. @activity{Turn to @worksheet-link[#:page 10 #:name "fall"] in your workbook, read the word problem, and fill in the Contract and Purpose Statement for the function @code{fall}.}
    @code{# fall : Number Number -> Coord}
    Now for our two examples. Using @code{fall} with two numbers is easy, but what happens to those numbers? We can't return both at the same time... unless we use a data structure! @activity{@itemlist[@item{Accodring to the definition for @code{Coord}, what function makes a Coord?}
                    @item{@code{coord(.....)}}
                    @item{What two things are part of a Coord? Do we have values for those things as part of our first example?}
                    @item{We don't want our Coord to contain the same x and y values we gave the @code{fall} function. How will the values change? (Remember to show your work!)}
                    @item{Your first example should look something like: 
                          @code[#:multi-line #t]{example:
                                                    fall(30, 250) is coord(30 + 5, 250 - 5)
                                                 end}}
                    @item{Once your first example is complete, write one more example with different inputs for the x and y coordinates.}]}}
                            @teacher{Remind students to show every step of their work in the example step of the design recipe: if the x-coordinate increases by 5 while the y-coordinate decreases by 5, they should show the addition and subtraction within the Coord data structure, instead of just returning the new numbers.}}
                    
                    @point{@student{@activity{Now that you have two examples, it's time to define the function. You know the drill: circle and lable everything that changes between your two examples, copy everything that stays the same, and replace the changing things with the variables you chose.}
                                     When you finish, your function definition should look like: @code[#:multi-line #t]{fun fall(x, y):
                          coord(x + 5, y - 5)
                       end}
                                     Now, instead of just changing and returning one number (a y-coordinate), we can return @bold{both} the x and y-coordinates of the parachute jumper within a @vocab{Data Structure}. @activity{Open the [PARACHUTE JUMPER] code again and replace the buggy @code{fall} function with the one in your workbook to make the jumper land safely on the shore!}}
                           @teacher{}}
                    
                    @point{@student{In Bootstrap:1, you could only have a function return one thing: either a number, string, image, or boolean. In Bootstrap:2, our functions will still return one thing, but that thing can be a @vocab{Data Structure}, (or "struct" for short) containing any number of things within it. This way we could return both the x and y-coordinate of a player using a Coord, or create new structs and return even more detail about a player, like their health, position, amount of armor, or inventory.}
                            @teacher{In Bootstrap:1, students' games were made by keeping track of only a few numbers: the x-positions of the danger and target, and y-position 
                                     of the payer. In Bootstrap:2, students' games will be much more complex, and will require many more values to move characters, test conditions, 
                                     keep track of the score, etc. Data structures simplify code by organizing many different values: You couldn't represent every part of a player 
                                     (position, health, inventory, etc.) with one number or string, but you can represent all these things with a @vocab{data structure}.}}
                    ]
           }

@lesson/studteach[#:title "Cars"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Car}}
                                     @item{Students define variables bound to cars}]
        #:standards (list )
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The Cars file [Cars.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] |  @editor-link[#:public-id "P7qS37u1ZH" "PYRET EDITOR LINK"] preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Suppose you want to open up an autobody shop. You take people's cars and trick them out, giving them paint jobs, turbo-charging their engines, etc. 
                                   What type of thing is a car? Is it a number? String? Image? Boolean? You couldn't describe all of the important things 
                                   about a car with any one of those things. However, we could say that we care about a couple of things in our shop that can be
                                   described with these types.
                                   @activity{For each of the following aspects of a car, think about what datatype you might use to represent it:
                                             @itemlist[@item{The model of the car. That could be "Prius", "H2", "XTerra", or something else.}
                                                        @item{How much horsepower the car has.}
                                                        @item{How large the rims are.}
                                                        @item{What color the car is.}
                                                        @item{The value, or price of the car.}
                                                        @item{What datatype could we use to represent the entire car?}]}
                                   @bitmap{images/car3.png}                                                   
                                   Let's represent the different parts of a car like so:
                                   @itemlist[@item{@code{model}: @bold{String}}
                                              @item{@code{horsepower}: @bold{Number}}
                                              @item{@code{rims}: @bold{Number}} 
                                              @item{@code{color}: @bold{String}}
                                              @item{@code{value}: @bold{Number}}]
                                   These are the only things that you're going to keep track of in a car, but you can imagine how you might extend it to include other things.}
                           @teacher{@management{Copy the fields of a Car struct and its types onto the board.}}}
                    
                    @point{@student{Now that you know everything that is part of a car, you can use a struct to represent the car itself. Let's take a look at how this works.
                            @activity{Open the @editor-link[#:public-id "P7qS37u1ZH" "AUTOBODY SHOP"] file and read the line that starts with 
                                               @code{car1 = ...}
                                               @code{car1 = car("M5", 480, 28, "black", 50000)}
                                               @itemlist[@item{What is the name of this car?}
                                                          @item{What is the model of this car?}
                                                          @item{What is the horsepower of @code{car1}?}
                                                          @item{What is the rim size of @code{car1}?}
                                                          @item{What is the color of @code{car1}?}
                                                          @item{Finally, what is the value of @code{car1}?}]}
                            As you can see here, it's really easy to make this Car struct! We have a bit of code at the top of the file which tells the computer which order everything goes 
                            in, and we'll talk about that shortly. For now, let's practice defining some new cars.}
                            @teacher{The first code block in this file tells the computer that a @code{Car} is a new data structure, and the names of its fields. 
                                     Below there are three cars defined and assigned to the variables @code{car1}, @code{car2}, and @code{car3}. Ask students 
                                     questions about these cars to get them thinking about how they would define their own.}}

                    @point{@student{@activity{Define another car, called @code{new-car}. To start,
                                                                         @itemlist[@item{how would you define this variable?}
                                                                                    @item{What function is used to make an car?}
                                                                                    @item{Which thing comes first in an Car struct?}] 
                                              Now what do you expect to happen when you type @code{new-car} into the interactions area? Click 'Run' and try it out.}             
                                              @code{new-car = car("Taurus", 300, 20, "white", 5000)}}
                 @teacher{Have students walk you through the process of defining a variable called @code{new-car} and making a car with whatever model, hp, rims, etc. they like.}}
                 
                 @point{@student{@activity{Define two new variables for each of your favorite cars. Call one [yourname]-car (@code{nathan-car}, @code{sam-car}, @code{jill-car}, etc),
                                           or whatever name you prefer. You can make any kind of cars that you want, as long as your struct has the right types in the right orders!}}
                         @teacher{Repetition is key in this lesson. Have students identify each part of the Car struct for every car they've defined.
                                  What is the model of their first car? Its value? Ensure that students are using their inputs in the right order!}}
                    
                    @point{@student{When you defined these new cars, you used a new function: @code{car}!
                                    @activity{@itemlist[@item{What is the name of this function?}
                                                        @item{How about the domain?}
                                                        @item{How many things are in the domain?}]} The five things in the domain of @code{car} are, in fact, the five 
                                                              things that we have already listed! So in our workbook, on the Contracts page, we know to write:
@code[#:multi-line #t]{
# car : String Number Number String Number -> ___________________
# Model, hp, rims, color, value}}
                            @teacher{Remember to have students copy the contract into their workbooks, and write the contracts yourself on the board.}}
                    
                    @point{@student{With data structures, the order is very important: we always want the first string in @code{car} to be the car's model, the first number 
                                    to be its horsepower, etc. 
                                    @activity{Underneath the contract, write what each part of @code{car}'s domain represents.}}
                            @teacher{}}
                    
                    @point{@student{We know the name and domain, but what's the range? If I give @code{car} a String representing the model of a ar, a number for the hp, 
                                    another number for the rim size, a string for the color, AND a number for the value, what should I get back? A Car! But Pyret doesn't have a 
                                    datatype for a Car. We'll have to use a struct. Pyret doesn't have cars built into it, so later on you'll learn about defining your own 
                                    structures to use in YOUR videogame.}
                         @teacher{Cars are the first example of defining a new datatype that students will see, but Pyret allows you to define any number of new data structures to hold
                                  any combination of values. The important points to remember about structures is that whenever the constructor function is called (in this case, @code{car}), it must take in the same 
                                  number and type of values as in the structure's definition, and its inputs must be in the @italic{same order} as the definition. Unit Three introduces 
                                  students to even more data structures, and in Unit Four they begin defining their own.}}
              
                 @point{@student{@activity{After clicking the "Run" button, in Pyret, type @code{car1} into the interactions area and hit enter. What do you get back?}
                                  Does this make sense? What happened when you type just a number into the interactions area? We get that same number back! What about strings? Images? 
                                  Booleans? If we don't do anything to our input, or use any function on it, we get back exactly what we put in! Here, you put in a car, and got back that car!}
                         @teacher{Remind students that values will always evaluate to themselves. 4 evaluates to 4, the string @code{"pizza"} evaluates to @code{"pizza"}, and @code{car1} evaluates
                                  to @code{car("M5", 480, 28, "black", 50000)}}}
                
                  @point{@student{You can see what your cars look like by using the function provided at the bottom of the screen. It's called @code{draw-car}, and it takes a car as input and 
                                  gives you back an Image with your car in it.
                                  @activity{In the interactions window, type @code{draw-car(car1)} and see what happens. Use the function with the cars YOU defined!} @bitmap{images/car1.png}}
                         @teacher{Students will spend lots of time "drawing" their cars. Encourage them to define some new cars, and to alter the color, rim size, value, etc. to see their changes 
                                  reflected in the images. Don't forget to remind them to click "Run" after making any changes!}}
                  ]
           }
                 
           

@lesson/studteach[#:title "Dot-Accessors"
                  #:duration "10 minutes"
                  #:overview ""
                  #:learning-objectives @itemlist[]
                  #:evidence-statements @itemlist[]
                  #:product-outcomes @itemlist[@item{Students write code that extracts each field from those cars}]
                  #:standards (list)
                  #:materials @itemlist[]
                  #:preparation @itemlist[]
                  #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{@points[
                @point{@student{Suppose you want to get the model OUT of @code{new-car}. You don't care about the rim size, or horsepower, or anything else- you just want to 
                                know the model. Pyret has syntax for that, called @code{.model}.
                                @activity{If you type @code{new-car.model} into the interactions window, what should it evaluate to? Try it out! 
                                                      @itemlist[@item{What kind of thing did it return: A number, string, image, or struct?}
                                                                 @item{Practice taking the model out of EVERY Car you have defined, using @code{.model}}]}
                    
                                Of course, there are ways to access any part of a car, not just the model! What do you think you would get if you typed @code{car1.hp} in the interactions area? 
                                @activity{Try using the dot-accessors @code{.hp}, @code{.rims}, @code{.color} and @code{.value} on your cars! Do they do what you expect?}}
                 @teacher{A way to prompt students to use these accessors is to ask: "How do you get the horsepower out of a car?" "How do you get the color out of a car?"
                          Throughout the course you can set up a call and response system with students, where the question "How do you get the X out of a Y?" 
                          will prompt the name of the accessor.}}
                 
                 @point{@student{The previous syntax is known as @vocab{Dot-Accessors}. They allow you to specify what part of a struct you want, without 
                                 getting back the whole thing. If we want to know if we can afford a certain car, we probably only care whether the value is less than
                                 a certain amount. Likewise, if we want to know whether or not a character has died, we only need to know if his health is less than 0: 
                                 we might not care what his location is, or the color of his armor. Programmers use accessors a lot, in order to make large 
                                 pieces of data (like structures) more manageable.}
                         @teacher{}}]
         }
@lesson/studteach[#:title "Defining Data"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will generalize their understanding of function constructors and accessors}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{}]
        #:standards (list)
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[@point{@student{@activity{Look at the first few lines of the @editor-link[#:public-id "P7qS37u1ZH" "AUTOBODY SHOP"] file. They start with @code{data Car:}}
                                @code[#:multi-line #t]{data Car:
                                                         # a car is a model, hp, rims, color and value.
                                                         | car(model :: String, hp :: Number, rims :: Number, color :: String, value :: Number)
                                                       end}
This is the code that defines the Car data structure, or tells the computer what a car is and what goes into it. Just like we would expect from having
worked with cars, the @code{data Car:} code block says that we're defining a new data structure called a Car, and declaring its @vocab{constructor functionan}, called @code{car}. To make a ar, you must call the constructor function with five things: a model, which is a String, hp, a number, rims, another number color, a String, and value, which is a Number. Remember that order matters!}
                        @teacher{Stress the importance of being able to define your own datatypes
                                 to students: no longer are they bound by the single values of numbers, strings, or booleans! Pyret allows you to define brand new structures, containing 
                                 any combination of values.}}
                 
            @point{@student{Our struct is defined using @code{data Car} and the @code{car(...)} line, which tells the computer what things make up that struct, and what order and type each 
                                                          thing is. In return, we get new functions to use. Until we write these two lines, we don't have 
                                                          @code{car(...)} (to make a car), @code{.model} (to get the model out of the car), @code{.hp}, or any of 
                                                          the other dot-accessors, because Pyret doesn't know what a Car is- @italic{we haven't defined it}.
            @activity{To check this, type a pound sign (#) before the line which begins with @code{car(...)}. This comments it out, so that the computer ignores it. Hit run, and see what 
                                                                                         happens. Then turn to @worksheet-link[#:page 13 #:name "data structures"] in your workbook, and copy 
                                                                                         down the @code{car(...)} line.}}
                    @teacher{When the @code{car(...)} line is commented out, Pyret returns some errors, saying you're trying to use @italic{car} before its definition. It doesn't know what @code{car} is or does, because we never defined a Car struct. Make sure students understand that the line beginning with
                                      @code{data} and a line similar to @code{car(...)} are needed in order to create and work with any struct.}}
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
        @points[@point{@student{Structures are a powerful tool for representing complex data in a computer program. Simple videogames, like Pong, might only need to
                                keep track of a few numbers at once, like the position of the ball, position of each paddle and the score. But if a game has many 
                                different enemies, each with their own position and health, or multiple levels with their own background image, the game can get 
                                very complicated very fast, and structs are a great way to manage and make sense of all the data. Programmers can do a LOT with data
                                structures, and in the upcoming lessons you will create your own structs to make a customized videogame.}
           @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                          @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                          @item{Pass out exit slips, dismiss, clean up.}]}}
  
           }
 ]}}
       
       


