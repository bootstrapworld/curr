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
                 
                 @point{@student{To make sure the material from last unit is fresh in your mind, tackle the following activity: @activity{Turn to @worksheet-link[#:page 7 #:name "double-radius"] in your workbook. Write a function called @code{double-radius}, 
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
                                             
                                          [ACTIVITY]
                                          }
                           @teacher{}}
                                          
                                          
                     
                    @point{@student{In Bootstrap:1, you could only have a function return one thing: either a number, string, image, or boolean. In Bootstrap:2, our functions will still return one thing, but that thing can be a @vocab{Data Structure}, ("struct" for short) containing any number of things within it. This way we could return both the x and y-coordinate of a player using a struct with just two numbers, representing coordinates, or return even more detail about a player, like their health, position, amount of armor, or inventory.}
                            @teacher{In Bootstrap:1, students' games were made by keeping track of only a few numbers: the x-positions of the danger and target, and y-position 
                                     of the payer. In Bootstrap:2, students' games will be much more complex, and will require many more values to move characters, test conditions, 
                                     keep track of the score, etc. Data structures simplify code by organizing many different values: You couldn't represent every part of a player 
                                     (position, health, inventory, etc.) with one number or string, but you can represent all these things with a @vocab{data structure}.}}
                    ]
           }

@lesson/studteach[#:title "Autos"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Auto}}
                                     @item{Students define variables bound to autos}]
        #:standards (list )
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The Autos file [Autos.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] |  @editor-link[#:public-id "P7qS37u1ZH" "PYRET EDITOR LINK"] preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Suppose you want to open up an autobody shop. You take people's cars and trick them out, giving them paint jobs, turbo-charging their engines, etc. 
                                   What type of thing is an auto? Is it a number? String? Image? Boolean? You couldn't describe all of the important things 
                                   about an automobile with any one of those things. However, we could say that we care about a couple of things in our shop that can be
                                   described with these types.
                                   @activity{For each of the following aspects of an automobile, think about what datatype you might use to represent it:
                                             @itemlist[@item{The model of the car. That could be "Prius", "H2", "XTerra", or something else.}
                                                        @item{How much horsepower the car has.}
                                                        @item{How large the rims are.}
                                                        @item{What color the car is.}
                                                        @item{The value, or price of the car.}
                                                        @item{What datatype could we use to represent the entire auto?}]}
                                   @bitmap{images/car3.png}                                                   
                                   Let's represent the different parts of a car like so:
                                   @itemlist[@item{@code{model}: @bold{String}}
                                              @item{@code{horsepower}: @bold{Number}}
                                              @item{@code{rims}: @bold{Number}} 
                                              @item{@code{color}: @bold{String}}
                                              @item{@code{value}: @bold{Number}}]
                                   These are the only things that you're going to keep track of in an auto, but you can imagine how you might extend it to include other things.}
                           @teacher{@management{Copy the fields of an auto struct and their types onto the board.}}}
                    
                    @point{@student{Now that you know everything that is part of an auto, you can use a struct to represent the auto itself. Let's take a look at how this works.
                            @activity{Open the @editor-link[#:public-id "P7qS37u1ZH" "AUTOBODY SHOP"] file and read the line that starts with 
                                               @code{car1 = ...}
                                               @code{car1 = auto("M5", 480, 28, "black", 50000)}
                                               @itemlist[@item{What is the name of this auto?}
                                                          @item{What is the model of this auto?}
                                                          @item{What is the horsepower of @code{car1}?}
                                                          @item{What is the rim size of @code{car1}?}
                                                          @item{What is the color of @code{car1}?}
                                                          @item{Finally, what is the value of @code{car1}?}]}
                            As you can see here, it's really easy to make this auto struct! We have a bit of code at the top of the file which tells the computer which order everything goes 
                            in, and we'll talk about that shortly. For now, let's practice defining some new autos.}
                            @teacher{The first code block in this file tells the computer that an @code{auto} is a new data structure, and the names of its fields. 
                                     Below there are three autos defined and assigned to the variables @code{car1}, @code{car2}, and @code{car3}. Ask students 
                                     questions about these autos to get them thinking about how they would define their own.}}

                    @point{@student{@activity{Define another auto, called @code{new-car}. To start,
                                                                         @itemlist[@item{how would you define this variable?}
                                                                                    @item{What function is used to make an auto?}
                                                                                    @item{Which thing comes first in an auto struct?}] 
                                              Now what do you expect to happen when you type @code{new-car} into the interactions area? Click 'Run' and try it out.}             
                                              @code{new-car = auto("Taurus", 300, 20, "white", 5000)}}
                 @teacher{Have students walk you through the process of defining a variable called @code{new-car} and making an auto with whatever model, hp, rims, etc. they like.}}
                 
                 @point{@student{@activity{Define two new variables for each of your favorite cars. Call one [yourname]-car (@code{nathan-car}, @code{sam-car}, @code{jill-car}, etc),
                                           or whatever name you prefer. You can make any kind of cars that you want, as long as your struct has the right types in the right orders!}}
                         @teacher{Repetition is key in this lesson. Have students identify each part of the auto struct for every auto they've defined.
                                  What is the model of their first auto? Its value? Ensure that students are using their inputs in the right order!}}
                    
                    @point{@student{When you defined these new autos, you used a new function: @code{auto}!
                                    @activity{@itemlist[@item{What is the name of this function?}
                                                        @item{How about the domain?}
                                                        @item{How many things are in the domain?}]} The five things in the domain of @code{auto} are, in fact, the five 
                                                              things that we have already listed! So in our workbook, on the Contracts page, we know to write:
@code[#:multi-line #t]{
# auto : String Number Number String Number -> ___________________
# Model, hp, rims, color, value}}
                            @teacher{Remember to have students copy the contract into their workbooks, and write the contracts yourself on the board.}}
                    
                    @point{@student{With data structures, the order is very important: we always want the first string in @code{auto} to be the auto's model, the first number 
                                    to be its horsepower, etc. 
                                    @activity{Underneath the contract, write what each part of @code{auto}'s domain represents.}}
                            @teacher{}}
                    
                    @point{@student{We know the name and domain, but what's the range? If I give @code{auto} a String representing the model of an auto, a number for the hp, 
                                    another number for the rim size, a string for the color, AND a number for the value, what should I get back? An Auto! But Pyret doesn't have a 
                                    datatype for an Auto. We'll have to use a struct. Pyret doesn't have autos built into it, so later on you'll learn about defining your own 
                                    structures to use in YOUR videogame.}
                         @teacher{Autos are the first example of defining a new datatype that students will see, but Pyret allows you to define any number of new data structures to hold
                                  any combination of values. The important points to remember about structures is that whenever the constructor function is called (in this case, @code{auto}), it must take in the same 
                                  number and type of values as in the structure's definition, and its inputs must be in the @italic{same order} as the definition. Unit Three introduces 
                                  students to even more data structures, and in Unit Four they begin defining their own.}}
              
                 @point{@student{@activity{After clicking the "Run" button, in Pyret, type @code{car1} into the interactions area and hit enter. What do you get back?}
                                  Does this make sense? What happened when you type just a number into the interactions area? We get that same number back! What about strings? Images? 
                                  Booleans? If we don't do anything to our input, or use any function on it, we get back exactly what we put in! Here, you put in an auto, and got back that auto!}
                         @teacher{Remind students that values will always evaluate to themselves. 4 evaluates to 4, the string @code{"pizza"} evaluates to @code{"pizza"}, and @code{car1} evaluates
                                  to @code{auto("M5", 480, 28, "black", 50000)}}}
                
                  @point{@student{You can see what your cars look like by using the function provided at the bottom of the screen. It's called @code{draw-auto}, and it takes an auto as input and 
                                  gives you back an Image with your car in it.
                                  @activity{In the interactions window, type @code{draw-auto(car1)} and see what happens. Use the function with the cars YOU defined!} @bitmap{images/car1.png}}
                         @teacher{Students will spend lots of time "drawing" their autos. Encourage them to define some new autos, and to alter the color, rim size, value, etc. to see their changes 
                                  reflected in the images. Don't forget to remind them to click "Run" after making any changes!}}
                  ]
           }
                 
           

@lesson/studteach[#:title "Dot-Accessors"
                  #:duration "10 minutes"
                  #:overview ""
                  #:learning-objectives @itemlist[]
                  #:evidence-statements @itemlist[]
                  #:product-outcomes @itemlist[@item{Students write code that extracts each field from those autos}]
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
                                                                 @item{Practice taking the model out of EVERY auto you have defined, using @code{.model}}]}
                    
                                Of course, there are ways to access any part of an auto, not just the model! What do you think you would get if you typed @code{car1.hp} in the interactions area? 
                                @activity{Try using the dot-accessors @code{.hp}, @code{.rims}, @code{.color} and @code{.value} on your autos! Do they do what you expect?}}
                 @teacher{A way to prompt students to use these accessors is to ask: "How do you get the horsepower out of an auto?" "How do you get the color out of an auto?"
                          Throughout the course you can set up a call and response system with students, where the question "How do you get the X out of a Y?" 
                          will prompt the name of the accessor.}}
                 
                 @point{@student{The previous syntax is known as @vocab{Dot-Accessors}. They allow you to specify what part of a struct you want, without 
                                 getting back the whole thing. If we want to know if we can afford a certain auto, we probably only care whether the value is less than
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
        @points[@point{@student{@activity{Look at the first few lines of the @editor-link[#:public-id "P7qS37u1ZH" "AUTOBODY SHOP"] file. They start with @code{data Auto:}}
                                @code[#:multi-line #t]{data Auto:
                                                         # an auto is a model, hp, rims, color and value.
                                                         | auto(model :: String, hp :: Number, rims :: Number, color :: String, value :: Number)
                                                       end}
This is the code that defines the Auto data structure, or tells the computer what an auto is and what goes into it. Just like we would expect from having
worked with autos, the @code{data Auto:} code block says that we're defining a new data structure called an Auto, and declaring its @vocab{constructor functionan}, called @code{auto}. To make an Auto, you must call the constructor function with five things: a model, which is a String, hp, a number, rims, another number color, a String, and value, which is a Number. Remember that order matters!}
                        @teacher{Stress the importance of being able to define your own datatypes
                                 to students: no longer are they bound by the single values of numbers, strings, or booleans! Pyret allows you to define brand new structures, containing 
                                 any combination of values.}}
                 
            @point{@student{Our struct is defined using @code{data Auto} and the @code{auto(...)} line, which tells the computer what things make up that struct, and what order and type each 
                                                          thing is. In return, we get new functions to use. Until we write these two lines, we don't have 
                                                          @code{auto(...)} (to make an auto), @code{.model} (to get the model out of the auto), @code{.hp}, or any of 
                                                          the other dot-accessors, because Pyret doesn't know what an Auto is- @italic{we haven't defined it}.
            @activity{To check this, type a pound sign (#) before the line which begins with @code{auto(...)}. This comments it out, so that the computer ignores it. Hit run, and see what 
                                                                                         happens. Then turn to PAGE ____ in your workbook, and copy 
                                                                                         down the @code{auto(...)} line.}}
                    @teacher{When the @code{auto(...)} line is commented out, Pyret returns some errors, saying you're trying to use @italic{auto} before its definition. It doesn't know what @code{auto} is or does, because we never defined an Auto struct. Make sure students understand that the line beginning with
                                      @code{data} and a line similar to @code{auto(...)} are needed in order to create and work with any struct.}}
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
       
       


