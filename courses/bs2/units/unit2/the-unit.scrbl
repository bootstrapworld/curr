#lang curr/lib

@title{Unit 2: Introduction to Data Structures}

@declare-tags[management]


@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text}))
                                                                                                          ]{
@unit-descr{Students discover the need for data structures and they practice defining them, making examples, and writing functions that produce them.}
}
@unit-lessons{
              
@lesson/studteach[
     #:title "Review"
     #:duration "20 minutes"
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
                @point{@student{In the previous unit, you reviewed almost everything from Bootstrap 1 including Datatypes, Contracts, and the Design Recipe. 
                                In this unit you will go above and beyond all that, and learn an entirely new datatype that will be the basis for everything you'll do in 
                                Bootstrap 2.}
                        @teacher{Ask a few introductory review questions to test students' understanding, such as: 
                                 @itemlist[@item{What are the three parts of a Contract?}        
                                            @item{What is the racket code to draw a solid, green triangle of size 22?}
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
; double-radius: Number String -> Image
; makes an outlined circle that's twice the radius}}
                         @teacher{Review the purpose of Contracts: once we know the Name, Domain, and Range of a function, it's easy to write EXAMPLEs using those datatypes.}}
           
                 @point{@student{@bannerline{Step 2: Examples} 
                                  @activity{Using only the Contract and Purpose Statement, see if you can answer the following questions:
                                            @itemlist[@item{Every Example begins with the name of the function. Where could you find the name of the function?}
                                                       @item{Every Example has to include sample inputs. Where could you find out how many inputs this function needs, 
                                                             and what types they are?}
                                                       @item{Every Example has to include an expression for what the function should do when given an input. Where 
                                                             could you look to find out what this function does?}
                                                       @item{Write two Examples on your paper, then circle and label what is changing between them. When labeling,
                                                             think about what the changing things represent.}]}
                                  Your examples should look similar to:
                                  @code[#:multi-line #t]{
(EXAMPLE (double-radius 50 "pink")
         (circle (* 50 2) "outline" "pink"))

(EXAMPLE (double-radius 918 "orange")
         (circle (* 918 2) "outline" "orange"))}}
                         
                         @teacher{Each one of these answers can be found in the Contract or Purpose Statement. Suggestion: Write these steps on the board, and draw 
                                  arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions
                                  each time they write examples, and then using their own work from the previous step to find the answers.}}
                @point{@student{@bannerline{Step 3: Definition}
                                Once you know what is changing between our two examples, you can define the function easily. The things that were circled and labeled in
                                the two examples will be replaced with @vocab{variables} in the function definition. (You don't @bold{always} want to make a pink 
                                circle whose radius is double 50. You want to be able to change the color and radius.) 
                                @activity{Underneath your examples, copy everything that @bold{doesn't} change, and replace the changing things with the variable 
                                          names you used.}  
           @code[#:multi-line #t]{(define (double-radius radius color)
                                          (circle (* radius 2) "solid" color))}}
                @teacher{Check students understanding: Why do we use variables in place of specific values? Why is it important to have descriptive variable
                         names, as opposed to @code{n} or @code{x}?}}
                
                @point{@student{@activity{Turn to @worksheet-link[#:page 8 #:name "double-width"] in your workbooks. Write a function called @code{double-width}, 
                                                  which takes in a height and a color. The function produces a solid rectangle, which is whatever height and 
                                                  color were passed in. Its width is twice the height.
                                         @itemlist[@item{Fill out the @vocab{Contract} for this function.
                                                        @itemlist[@item{What is the function's Name?}
                                                                   @item{What is the function's Domain?}
                                                                   @item{What is the function's Range?}]}
                                                    @item{Using the Contract you've written, write two @vocab{Examples} for the function.
                                                          @itemlist[@item{What part of the Contract helps you fill in the left side of an Example?}
                                                                     @item{What part of the Contract tells you what the function needs as input?}
                                                                     @item{How can the Range of a function help you write the Example?}]}
                                                    @item{Looking at those two examples, circle the parts that are @italic{change-able}, then label them with a good @vocab{variable name}.
                                                          @itemlist[@item{Why is it helpful to choose a variable name before defining the function?}]}]
                                         Now write the @vocab{function definition}, using the Examples you've written.}}
                        @teacher{This is very similar to the previous problem, and is meant to get students very comfortable with using the design recipe before delving into more complex problems. 
                                 Remind students about nested functions: A function whose range is a number can be used inside of a function requiring a number in its domian, as in 
                                 @code{(circle (* 2 25) "solid" "red")}.}}
                                   ]
         }
       
@lesson/studteach[
        #:title "Introducing Structs"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will understand the limitations of atomic datatypes}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students identify real-world behaviors that require data structures}]
        #:standards (list )
        #:materials @itemlist[@item{Structs bags: plastic bags containing eight cards (2 labeled "number", 2 "string", 2 "image", and 2 "boolean")}]
        #:preparation @itemlist[@item{}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{@activity{For each of the things below, figure out which datatype you would use to represent it in Racket. 
                                             Would you use a Number, String, Image, or Boolean for:
                     @itemlist[@item{a color}
                               @item{a picture of a circle}
                               @item{your name}
                               @item{your age}
                               @item{whether or not something is correct}
                               @item{an x-coordinate}
                               @item{your friend's favorite food}
                               @item{a picture of ninja cat}
                               @item{a set of coordinates}]}
            A set of coordinates requires two numbers: an x and a y. Unfortunately, functions can only return one piece of data at a time. 
            Can you use a String to return two numbers? Not if you want to add or subtract them! Why do you think you can't use an Image or a Boolean to represent two numbers?}
             @teacher{You can illustrate the importance of structures with an activity: Pass out bags of datatype cards, and instruct students to take out all of the cards from 
                      the bags, and set them on the table in front of them. List each thing above that could be returned by a Racket function, and have students hold up a card 
                      to show what datatype each would be.}}
                    
                    @point{@student{Every function that you could possibly write or use in Racket can only give back one thing. That is, the range only has one thing in it. 
                                    You need a new type of data - something that can hold more than one thing at once. Racket actually has a tool to make such a thing, and 
                                    it's called a @vocab{Data Structure}, or "struct" for short. A struct can hold any number of datatypes. It could have just two numbers, 
                                    to represent coordinates, or it could hold as many numbers as you want, as well as strings, images, booleans, or even other structs! 
                                    (We'll talk about nested structures in a later lesson.)}
                           @teacher{Set aside the two number cards; one for the x and one for the y coordinates. Then pick up your plastic bag. Put the two number cards 
                                    inside the plastic bag, and then hold it up. "How many @italic{things} am I holding? One!"}}
                   
                    @point{@student{Now imagine that you've put the two numbers that you're using to describe the x and y into a box. If you were to hold up the box, you'd 
                                    only be holding one thing! In the same way, complex structs can be defined in Racket to hold multiple things. Look at some more examples, 
                                    but remember that you might need a "struct" to group things together. 
                                    @activity{Which of the following things can represented using one piece of data (and which @italic{type} is it?), and which ones need a 
                                              struct to contain multiple pieces of data? 
                                              @itemlist[@item{the name and the age of a character}
                                                         @item{a flavor of soup, and whether it is hot or not}
                                                         @item{how many pets you have}
                                                         @item{a picture of a shape, with the number of sides and its color}
                                                         @item{a direction that a plane is traveling, and how fast it is going}]}}
                            @teacher{In Bootstrap 1, students' games were made by keeping track of only a few numbers: the x-positions of the danger and target, and y-position 
                                     of the payer. In Bootstrap 2, students' games will be much more complex, and will require many more values to move characters, test conditions, 
                                     keep track of the score, etc. Data structures simplify code by organizing many different values: You couldn't represent every part of a player 
                                     (position, health, inventory, etc.) with one number or string, but you can represent all these things with a @vocab{data structure}.}}
                    ]
           }

@lesson/studteach[#:title "Autos"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Auto}}
                                     @item{Students define variables bound to autos}]
        #:standards (list )
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The Autos file [Autos.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] |  @editor-link[#:public-id "P7qS37u1ZH" "WeScheme"] preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Suppose you want to open up an autobody shop. You take people's cars and trick them out, giving them paint jobs, turbo-charging them, etc. 
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
                    
                    @point{@student{Now that you know everything that is part of an auto, you can use a struct to represent the auto itself. (This is the very first time that 
                                    you're going to use structs, and they're going to play a HUGE part in your videogame.) Let's take a look at how this works.
                            @activity{Open the @editor-link[#:public-id "P7qS37u1ZH" "Autobody Shop"] file and read the line that starts with 
                                               @code{(define car1....)}
                                               @code{(define car1 (make-auto "M5" 480 28 "black" 50000))}
                                               @itemlist[@item{What is the name of this auto?}
                                                          @item{What is the model of this auto?}
                                                          @item{What is the horsepower of @code{car1}?}
                                                          @item{What is the rim size of @code{car1}?}
                                                          @item{What is the color of @code{car1}?}
                                                          @item{Finally, what is the value of @code{car1}?}]}
                            As you can see here, it's really easy to make this auto struct! We have a bit of code which tells the computer which order everything goes 
                            in...and we'll talk about that shortly. For now, let's practice defining some new autos.}
                            @teacher{The first line in this file tells the computer that an @code{auto} is a new data structure, and the names of its fields. 
                                     Below there are three autos defined and assigned to the variables @code{car1}, @code{car2}, and @code{car3}. Ask students 
                                     questions about these autos to get them thinking about how they would define their own.}}

                    @point{@student{@activity{Define another car, called @code{new-car}. To start
                                                                         @itemlist[@item{how would you define this variable?}
                                                                                    @item{What function is used to make an auto?}
                                                                                    @item{Which thing comes first in an auto struct?}] 
                                              Now what do you expect to happen when you type @code{new-car} into the interactions window? Click Run and try it out.}             
                                              @code{(define new-car (make-auto "Taurus" 300 20 "white" 5000))}}
                 @teacher{Have students walk you through the process of defining a variable called @code{new-car} and making an auto with whatever model, hp, rims, etc. they like.
                          If they struggle with making an auto, have them check their contracts page!}}
                 
                 @point{@student{@activity{Define two new variables for each of your favorite cars. Call one [yourname]-car (@code{nathan-car}, @code{sam-car}, @code{jill-car}, etc),
                                           or whatever name you prefer. You can make any kind of cars that you want, as long as your struct has the right types in the right orders!}}
                         @teacher{Repetition is key in this lesson. Have students identify each part of the auto struct for every auto they've defined.
                                  What is the model of their first auto? Its value? Ensure that students are using their inputs in the right order!}}
                    
                    @point{@student{When you defined these new autos, you used a new function: @code{make-auto}.
                                    @activity{@itemlist[@item{What is the name of this function?}
                                                        @item{How about the domain?}
                                                        @item{How many things are in the domain?}]} The five things in the domain of @code{make-auto} are, in fact, the five 
                                                              things that we have already listed! So in our workbook, on the Contracts page, we know to write:
@code[#:multi-line #t]{
; make-auto : String Number Number String Number -> ___________________
; Model, hp, rims, color, value}}
                            @teacher{Remember to have students copy the contract into their workbooks, and write the contracts yourself on the board.}}
                    
                    @point{@student{With data structures, the order is very important: we always want the first string in @code{make-auto} to be the auto's model, the first number 
                                    to be its horsepower, etc. 
                                    @activity{Underneath the contract, write what each part of @code{make-auto}'s domain represents.}}
                            @teacher{}}
                    
                    @point{@student{We know the name and domain, but what's the range? If I give @code{make-auto} a String representing the model of an auto, a number for the hp, 
                                    another number for the rim size, a string for the color, AND a number for the value, what should I get back? An Auto! But Racket doesn't have a 
                                    datatype for an Auto. We'll have to use a struct. Racket doesn't have autos built into it, so later on you'll learn about defining your own 
                                    structures to use in YOUR videogame.}
                         @teacher{Autos are the first example of defining a new datatype that students will see, but Racket allows you to define any number of new data structures to hold
                                  any combination of values. The important points to remember about structures is that whenever @code{make-[structure]} is called, it must take in the same 
                                  number and type of values as in the structure's definition, and its inputs must be in the @italic{same order} as the definition. Unit Three introduces 
                                  students to even more data structures, and in Unit Four they begin defining their own.}}
              
                 @point{@student{@activity{After clicking the "Run" button, in WeScheme, type @code{car1} into the interactions window and hit enter. What do you get back?}
                                  Does this make sense? What happened when you typed just a number into the interactions window? We got that same number back! What about strings? Images? 
                                  Booleans? If we don't do anything to our input, or use any function on it, we get back exactly what we put in! Here, you put in an auto, and got back that auto!}
                         @teacher{Remind students that values will always evaluate to themselves. 4 evaluates to 4, the string @code{"pizza"} evaluates to @code{"pizza"}, and @code{car1} evaluates
                                  to @code{(make-auto "M5" 480 28 "black" 50000)}}}
                
                  @point{@student{You can see what your cars look like by using the function provided at the bottom of the screen. It's called @code{draw-auto}, and it takes an auto as input and 
                                  gives you back an Image with your car in it.
                                  @activity{In the interactions window, type @code{(draw-auto car1)} and see what happens. Use the function with the cars YOU defined!} @bitmap{images/car1.png}}
                         @teacher{Students will spend lots of time "drawing" their autos. Encourage them to define some new autos, and to alter the color, rim size, value, etc. to see their changes 
                                  reflected in the images. Don't forget to remind them to click "Run" after making any changes!}}
                  ]
           }
                 
           

@lesson/studteach[#:title "Accessor Functions"
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
                                know the model. Racket has a function for that, called @code{auto-model}. If you give @code{auto-model} an auto, it will return the model 
                                of that auto. 
                                @activity{If you type @code{(auto-model new-car)} into the interactions window, what should it evaluate to? Try it out! 
                                                      @itemlist[@item{What kind of thing did it return: A number, string, image, or struct?}
                                                                 @item{Practice taking the model out of EVERY auto you have defined, using @code{auto-model}}]}
                                @activity{In your workbook, flip back to your contract sheet. Think about what kind of thing you gave to the @code{auto-model} function, 
                                          and what kind of thing you got back.
                                          @itemlist[@item{What is the name of this function?}
                                                     @item{What is the domain of this function?}         
                                                     @item{What about the range?}
                                                     @item{Write the contract for @code{auto-model} on your contract sheet.}]}
                                @code{; auto-model : auto -> String}
                    
                                Of course, there are functions to access any part of an auto, not just the model! What do you think the contract for @code{auto-hp} is? 
                                Write it down in your workbook.
                                @activity{Write down the contracts for @code{auto-rims}, @code{auto-color} and @code{auto-value}. Then try them out on your autos! Do they do what you expect?}}
                 @teacher{A way to prompt students to use these functions is to ask: "How do you get the horsepower out of an auto?" "How do you get the color out of an auto?"
                          Throughout the course you can set up a call and response system with students, where the question "How do you get the X out of a Y?" 
                          will prompt the name of the accessor function.}}
                 
                 @point{@student{The previous functions are known as @vocab{Accessor Functions}. They allow you to specify what part of a struct you want, without 
                                 getting back the whole thing. If we want to know if we can afford a certain auto, we probably only care whether the value is less than
                                 a certain amount. Likewise, if we want to know whether or not a character has died, we only need to know if his health is less than 0: 
                                 we might not care what his location is, or the color of his armor. Programmers use accessor functions a lot, in order to make large 
                                 pieces of data (like structures) more manageable.}
                         @teacher{}}]
         }
@lesson/studteach[#:title "Autobody Shop"
        #:duration "25 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will write complex functions that consume, modify and produce structures}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define functions that produce an auto}]
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
                @point{@student{Now you know all about how to work with automobiles in Racket!
                                @activity{@itemlist[@item{What function makes an auto?}
                                                     @item{Which function draws that auto?}
                                                     @item{How do you get the value out of an auto?}
                                                     @item{How do you get the color out of an auto?}]}
                                But you don't just want to take an auto and give it right back. You're running an autobody shop! You'll take people's cars and change 
                                them, making them better in some way, and then return them to the customer. Let's figure out how to do that.}
                        @teacher{}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 9 #:name "paint-job"] in your workbooks. Write a function called @code{paint-job},
                                           which changes the color of an automobile.
                                                   @itemlist[@item{What is the domain for this function? We'll need to get instructions about which auto we're changing, 
                                                                   AND what color we're making it.}
                                                              @item{What do you think our autobody shop is going to give back? What would be the range of 
                                                                    @code{paint-job}?}]}
               @code[#:multi-line #t]{; paint-job : Auto String -> Auto
; changes the color of an auto}
               In your first example, use the original @code{car1} and turn it purple. We know our customer will expect to get an auto back: you wouldn't bring your car
               into the shop and be OK with only getting a pair of rims back! But we won't be returning the same auto- it will be almost identical, with only the color changed.}
                         @teacher{It might not be immediately obvious to students that when a function returns an auto, they must use the @code{make-auto} function to 
                                  produce it. By starting with a "fresh" auto, students are forced to think about every single field in order. Thinking about what exactly
                                  makes up an auto and going back to the contract for @code{make-auto} gives them lots of practice with the auto struct and accessor 
                                  functions.}}
                 
                 @point{@student{The moment you write @code{make-auto}, you know that you'll need to give it five things: the model, hp, rims, color, and value of that auto. 
                                 We already know what model this car should be: the same as the given auto! But what if you didn't know exactly what string to use. 
                                 How could you access JUST the model of @code{car1} and use it in your @code{make-auto} function?
                       
    @code[#:multi-line #t]{(EXAMPLE (paint-job car1 "purple" (make-auto .....))}
                                @activity{@itemlist[@item{The horsepower also doesn't change with a paint job. So how do you get the hp out of @code{car1}?}
                                                     @item{The rim size shouldn't change with a paint job. How do you get the rims out of car1?}
                                                     @item{What about the color? In this example @code{paint-job} is taking in @code{car1} and the string @code{"purple"}. 
                                                           So this auto's color will just be @code{"purple".}}]}
                                Don't forget the last part of the auto struct- the value! The purpose statement for @code{paint-job} doesn't say anything about the value
                                changing, so how do you get the original value out of car1?
                                
@code[#:multi-line #t]{(EXAMPLE (paint-job car1 "purple") (make-auto (auto-model car1)
                                                                     (auto-hp car1)
                                                                     (auto-rims car1)
                                                                     "purple"
                                                                     (auto-value car1)))}}
                         @teacher{}}
                 
                 @point{@student{@activity{Write one more example for the function @code{paint-job}, this time using it to paint @code{car2} green. 
                                          @itemlist[@item{Circle and label what changes between the two examples. How many variables will this function need?}
                                                     @item{Write the definition, using the examples to help you.}]}
                        
After replacing the changing things with variables, your definition should look similar to: 
@code[#:multi-line #t]{(define (paint-job car color) (make-auto (auto-model car)
                                                                (auto-hp car)
                                                                (auto-rims car)
                                                                 color
                                                                (auto-value car)))}}
                         @teacher{Students may be tempted to put @code{color} in quotes, because the color of the car must be a string. However, the domain of 
                                  @code{paint-job} tells us that the function will take in an auto and a string, so whatever color is input will already 
                                  have quotes around it. Values evaluate to themselves, so the string "color" cannot evaluate to anything other than "color".
                                  If we want color to be a variable, or shortcut for "purple", "green", "blue", etc. it must be written WITHOUT quotation marks.}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 10 #:name "turbocharge"] in your workbooks. When you turbocharge an engine, you get
                                           more power out of it. Your bodyshop offers a turbocharging job that adds 20 horsepower to any engine, but keeps everything
                                           else the same. 
                    @itemlist[@item{Fill out the @vocab{Contract} and @vocab{Purpose Statement} for the function.}
                              @item{Write two @vocab{Examples} for how one would use @code{turbocharge}.}
                              @item{Circle and label what varies between those examples and label it with a @vocab{variable} name.}
                              @item{Define the function.}]}}
                         @teacher{Give students plenty of time to practice using accessor functions, extracting pieces of the Auto structs and modifying them.}}]
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
 ]}
       }
       


