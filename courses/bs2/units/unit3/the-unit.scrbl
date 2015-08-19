#lang curr/lib
@declare-tags[]

@title{Unit 3: Structures and Worlds}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Car" @code{car .model .hp .rims .color .price}))]{

@unit-descr{Students, having worked with pre-made data structures in the last lesson (Cars), generalize their understanding by defining more data structures of their own, accessing their fields, and writing functions that produce them. 
}
}
@unit-lessons{
@lesson/studteach[#:title "Review: The Party Struct"
        #:duration "10 minutes"
        #:overview ""
         #:learning-objectives @itemlist[@item{Write complex functions that consume, modify and produce structures}
            @item{Deepen their understanding of structures, constructors and accessors by being introduced to a new data structure.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define a new data structure: a party }
          @item{Students will write functions that access fields of a car, and produce new cars}]
        #:standards (list)
        #:materials @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVUUt1SUc5UnVsdm8" "Party Planner"] file preloaded on students' machines}
                              @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In the last lesson you learned about a new kind of data structure, called a Car. However, a Car isn't the only kind of structure- we can create any kind we want! Let's define another one. In this exercise, you’ll be a party planner. Data structures will be a useful way to represent each Party that you’re planning, keeping track of its location, theme, and number of guests.
                                @activity{@itemlist[@item{What datatype could be used to represent the location of a Party?}
                                                    @item{What about the Party's theme? (This could be something like "50s" or "laser tag".)}
                                                    @item{How about the number of guests?}]
                                           Fill out the Party structure definition on @worksheet-link[#:page 13 #:name "Data Structures"] in your workbook.}
@code[#:multi-line #t]{# a Party is a location, theme, and number of guests
                       data Party:
                         | party(location :: String, 
                                 theme    :: String, 
                                 guests   :: Number)
                       end}
Once the Party structure is defined, you have access to new pieces of code: a function to make a Party, and three @vocab{dot-accessors} to get the location, theme, and number of guests out of the Party. 
@activity{@itemlist[@item{What is the @vocab{Name} of the function that creates a Party?}
                                                  @item{What is the function's @vocab{Domain}? (What kinds of things are part of a Party?)}
                                                  @item{What is the @vocab{Range} of this function?}
                                                  @item{On @worksheet-link[#:page 13 #:name "Data Structures"], use the constructor function to define two new Parties of your own.}
                                                  @item{Right below your new Parties, list how you would access the fields of @code{party1}. How would you get the location out of @code{party1}? (Think about how you got the model or color out of a Car.)}]}}
                        @teacher{}}
                 
                 @point{@student{@activity{@itemlist[@item{Open the @editor-link[#:public-id "0B9rKDmABYlJVUUt1SUc5UnVsdm8" "Party Planner"] file. Take a look at the first four lines in the definitions area. Do they match what you have written in your workbook for the data definition of @code{Party}?} 
                                                      @item{Now define two new Party structures of your own. No matter what party you're planning, make sure that your party has the right inputs in the right order.}]
                                            }
                                  }
                         @teacher{As with the Car structure, repetition is key: have students identify the fields of each of their parties, and ask them lots of 
                                  questions: How would you get the @code{theme} out of @code{Halloween}? How would you get the number of guests out of @code{JulyFourth}?}}
                 ]
         }

@lesson/studteach[#:title "Autobody Shop"
        #:duration "80 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will write complex functions that consume, modify and produce structures}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define functions that produce a Car}]
        #:standards (list)
        #:materials @itemlist[@item{The  @editor-link[#:public-id "0B9rKDmABYlJVSlI4VEZLLUI4UkU" "Autobody Shop"] used in the previous unit}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[@point{@student{In the last lesson you learned about a new data structure, called a Car. 
                                @activity{@itemlist[@item{What is a Car? What information is part of a Car structure?}
                                                     @item{What function creates a Car?}
                                                     @item{How do you get the model out of a Car? The price? The color?}]}
                                As part of running an autobody shop, we'll take people's Cars and upgrade 
                                them, making them better in some way, then return them to the customer. Let's figure out how to write functions to help us do that.}
                        @teacher{}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 14 #:name "paint-job"] in your workbooks. Write a function called @code{paint-job}, which takes in a Car and a color, and returns a new Car that is mostly the same as the original, but painted the given color.
                                                   @itemlist[@item{What is the domain for this function? We'll need to know which Car we're taking in, 
                                                                   AND what color we're painting it.}
                                                              @item{What do you think our autobody shop is going to give back? What would be the range of 
                                                                    @code{paint-job}?}]}
               @code[#:multi-line #t]{
# paint-job: Car String -> Car:
# consumes a Car and returns a Car that is the same as the original, but painted the given color.}
               In your first example, use the original @code{car1} and turn it purple. We know our customer will expect to get a Car back: you wouldn't bring your Car
               into the shop and be OK with only getting a pair of rims back! But we won't be returning the same Car- The car we get back must have the same model, hp, value, etc. as the given Car, but one thing needs to be different: the color!}
                         @teacher{It might not be immediately obvious to students that when a function returns a Car, they must use the @code{car} constructor function to 
                                  produce it. This way the function does not return the same value it was given, but instead creates a Car with the same specs as the given Car, where only the color is different. By starting with a "fresh" Car, students are forced to think about every single field in order. Thinking about what exactly
                                  makes up a Car and going back to the contract for @code{car} gives them lots of practice with the Car struct and dot-accessors.}}
                 
                 @point{@student{The moment you write @code{Car} in the function's Range, you know that you'll need to call the @code{car} constructor and give it five things: the model, hp, rims, color, and price of that car. 
                                 We already know what model this car should be: the same as the given car! So how could you access JUST the model of @code{car1} and use it in your @code{car} function?
                       
    @code[#:multi-line #t]{examples:
                               paint-job(car1, "purple") is car(car1.model,
                                                                car1.hp,
                                                                ...)
                           end}
                                @activity{@itemlist[@item{The horsepower also doesn't change with a paint job. So how do you get the hp out of @code{car1}?}
                                                     @item{The rim size shouldn't change with a paint job. How do you get the rims out of car1?}
                                                     @item{What about the color? Based on the purpose statement, what should the color of this Car be?}]}
                                Don't forget the last part of the Car struct- the price! The purpose statement for @code{paint-job} doesn't say anything about the price
                                changing, so how do you get the original price out of car1?
                                
@code[#:multi-line #t]{examples:
                           paint-job(car1, "purple") is car(car1.model,
                                                            car1.hp, 
                                                            car1.rims, 
                                                            "purple", 
                                                            car1.price)
                       end}}
                         @teacher{Remind students that the arguments to each function in Pyret @italic{must} be separated by commas. This wasn't necessary in Racket, but they 
                                                                                               will receive error messages if they don't use commas correctly in Pyret code.}}
                 
                 @point{@student{@activity{@itemlist[@item{Write one more example for the function @code{paint-job}, this time using it to paint @code{car2} green.}] 
                      Next, circle and label what changes between the two examples. How many variables will this function need? Then write the definition, using your examples to help you.}
                        
After replacing the changing things with variables, your definition should look similar to: 
@code[#:multi-line #t]{fun paint-job(a-car, color):
                           car(a-car.model, 
                               a-car.hp, 
                               a-car.rims, 
                               color, 
                               a-car.price)
                       end}}
                         @teacher{Students may be tempted to put @code{color} in quotes, because the color of the car must be a string. However, the domain of 
                                  @code{paint-job} tells us that the function will take in a Car and a string, so whatever color is input will already 
                                  have quotes around it. Values evaluate to themselves, so the string "color" cannot evaluate to anything other than "color".
                                  If we want color to be a variable, or shortcut for "purple", "green", "blue", etc. it must be written WITHOUT quotation marks.}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 14 #:name "turbocharge"] in your workbooks. When you turbocharge an engine, you get
                                           more power out of it. Your bodyshop offers a turbocharging service that adds 20 horsepower to any engine, but keeps everything
                                           else the same. 
                    @itemlist[@item{Fill out the @vocab{Contract} and @vocab{Purpose Statement} for the function.}
                              @item{Write two examples for how one would use @code{turbocharge}.}
                              @item{Circle and label what varies between those examples and label it with a @vocab{variable} name.}
                              @item{Define the function.}]}}
                         @teacher{Give students plenty of time to practice using dot-accessors, extracting pieces of the Car structures and modifying them.}}]
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
        @points[@point{@student{So far you've worked with three data structures: Coords, Parties, and Cars. In the next lesson, you'll look at a new struct as you dissect a video game, and start thinking about the struct(s) you'll need to create for your own game!}
                        @teacher{Have students volunteer what they learned in this lesson}}
                        
                        ]}
       }

       


  

