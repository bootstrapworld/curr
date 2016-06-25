#lang curr/lib
@declare-tags[]

@title{Unit 3: Structures and Worlds}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Cake" @code{cake .flavor .color .message .layers .is-iceCream}))]{

@unit-descr{Students, having worked with pre-made data structures in the last lesson (Cakes), generalize their understanding by defining more data structures of their own, accessing their fields, and writing functions that produce them. 
}
}
@unit-lessons{
@lesson/studteach[#:title "Review: The Party Struct"
        #:duration "10 minutes"
        #:overview ""
         #:learning-objectives @itemlist[@item{Write complex functions that consume, modify and produce structures}
            @item{Deepen their understanding of structures, constructors and accessors by being introduced to a new data structure.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define a new data structure: a party }]
        #:standards (list "N-Q" "F-IF.1-3" "BS-M" "BS-IDE" "BS-PL.1" "BS-DS.1" "BS-DS.2")
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
        @points[@point{@student{In the last lesson you learned about a new kind of data structure, called a Cake. However, a Cake isn't the only kind of structure - we can create any kind we want! Let's define another one. In this exercise, you’ll be a party planner. Data structures will be a useful way to represent each Party that you’re planning, keeping track of its location, theme, and number of guests.
                                @activity[#:forevidence (list "N-Q&1&1" "BS-M&1&2" "BS-DS.2&1&2")]{@itemlist[@item{What datatype could be used to represent the location of a Party?}
                                                    @item{What about the Party's theme? (This could be something like "50s" or "laser tag".)}
                                                    @item{How about the number of guests?}]
                                           Fill out the Party structure definition on @worksheet-link[#:page 13 #:name "Parties"] in your workbook.}
@code[#:multi-line #t]{# a Party is a location, theme, and number of guests
                       data Party:
                         | party(
                             location :: String, 
                             theme    :: String, 
                             guests   :: Number
                           )
                       end}
Once the Party structure is defined, you have access to new pieces of code: a function to make a Party, and three @vocab{dot-accessors} to get the location, theme, and number of guests out of the Party. 
@activity[#:forevidence (list "F-IF.1-3&1&1" "BS-DS.1&1&1" "BS-DS.1&1&2" "BS-DS.1&1&3" "BS-DS.1&1&4" "BS-DS.1&1&5")]{@itemlist[@item{What is the @vocab{Name} of the function that creates a Party?}
                                                  @item{What is the function's @vocab{Domain}? (What kinds of things are part of a Party?)}
                                                  @item{What is the @vocab{Range} of this function?}
                                                  @item{On @worksheet-link[#:page 13 #:name "Data Structures"], use the constructor function to define two new Parties of your own.}
                                                  @item{Right below your new Parties, list how you would access the fields of @code{party2}. How would you get the location out of @code{party2}? (Think about how you got the model or color out of a Car.)}]}}
                        @teacher{}}
                 
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1" "BS-DS.1&1&4")]{@itemlist[@item{Open the @editor-link[#:public-id "0B9rKDmABYlJVUUt1SUc5UnVsdm8" "Party Planner"] file. Take a look at the first four lines in the definitions area. Do they match what you have written in your workbook for the data definition of @code{Party}?} 
                                                      @item{Now define two new Party structures of your own. No matter what party you're planning, make sure that your party has the right inputs in the right order.}]
                                            }
                                  }
                         @teacher{As with the Cake structure, repetition is key: have students identify the fields of each of their parties, and ask them lots of 
                                  questions: How would you get the @code{theme} out of @code{Halloween}? How would you get the number of guests out of @code{JulyFourth}?}}
                 ]
         }

@lesson/studteach[#:title "Your Bakery"
        #:duration "80 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will write complex functions that consume, modify and produce structures}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will write functions that access fields of a Cake, and produce new Cakes}]
        #:standards (list "7.EE.1-2" "F-IF.1-3" "A-CED.1-4" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-DS.1")
        #:materials @itemlist[@item{The  @editor-link[#:public-id "0B9rKDmABYlJVU2lINzk1X0x2ODg" "Bakery"] file used in the previous unit}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[@point{@student{In the last lesson you learned about a new data structure, called a Cake. 
                                @activity[#:forevidence (list "BS-DS.1&1&1" "BS-DS.1&1&2" "BS-DS.1&1&3")]{@itemlist[@item{What is a Cake? What information is part of a Cake structure?}
                                                     @item{What function creates a Cake?}
                                                     @item{How do you get the flavor out of a Cake? The message? The color?}]}
                                As part of running a bakery, we'll take orders for Cakes and bake them to the customers specifications. Let's figure out how to write functions to help us do that.}
                        @teacher{}}
                 
                 @point{@student{@activity[#:forevidence (list "F-IF.1-3&1&1" "BS-DR.1&1&1" "BS-DS.2&1&1")]{Turn to @worksheet-link[#:page 14 #:name "change-flavor"] in your workbooks. Write a function called @code{change-flavor}, which takes in a Cake and a flavor, and returns a new Cake that is mostly the same as the original, but is now the given flavor.
                                                   @itemlist[@item{What is the domain for this function? We'll need to know which Cake we're taking in AND what flavor it should be.}
                                                             @item{What do you think our bakery is going to give back? What would be the range of @code{change-flavor}?}]}
               @code[#:multi-line #t]{
# change-flavor: Cake String -> Cake:
# consumes a Cake and produces a Cake that is the same as the original, but has the given flavor.}
               In your first example, use the original @code{cake1} and make it strawberry. We know our customer will expect to get a Cake back: you wouldn't return a Cake made incorrectly to a bakery and be OK with only getting a frosting message back! But we won't be returning the same Cake with our function - we're making a @italic{new} Cake, which must have the same message, color, layers, etc. as the given Cake, but one thing needs to be different: the flavor!}
                         @teacher{It might not be immediately obvious to students that when a function returns a Cake, they must use the @code{cake} constructor function to 
                                  produce it. This way the function does not return the same value it was given, but instead creates a Cake with the same specs as the given Cake, where only the flavor is different. By starting with a "fresh" Cake, students are forced to think about every single field in order. Thinking about what exactly
                                  makes up a Cake and going back to the contract for @code{cake} gives them lots of practice with the Cake struct and dot-accessors.}}
                 
                 @point{@student{The moment you write @code{Cake} in the function's Range, you know that you'll need to call the @code{cake} constructor and give it five things: the flavor, color, message, layers, and is-iceCream of that cake. 
                  @code[#:multi-line #t]{examples:
                                             change-flavor(cake1, "strawberry") is 
                                             cake(
                                               ...flavor...
                                               ...color...
                                               ...message...
                                               ...layers...
                                               ...is-iceCream...
                                             )
                                         end}
                                                                        
                                 We already know what flavor this cake should be: strawberry! So we can start by giving our @code{cake} function the given String as its first input (since the first input to the @code{cake} function @italic{must} be its flavor).
                                 
    @code[#:multi-line #t]{examples:
                               change-flavor(cake1, "strawberry") is 
                               cake(
                                 "strawberry",
                                 ...)
                           end}
                                @activity[#:forevidence (list "BS-DS.1&1&5")]{@itemlist[@item{We also know what color this Cake should be: the same as the given Cake! So how could you access JUST the color of @code{cake1} and use it in the @code{cake} function? Use the dot-accessor!
                                                         The message of the cake doesn't change, either. So how do you get the message out of @code{cake1}?}
                                                     @item{The number of layers shouldn't change if you change the flavor. How do you get the layers out of @code{cake1?}}]}
                                Don't forget the last field in the Cake struct: @code{is-iceCream}! The purpose statement for @code{change-flavor} doesn't say anything about the inside make-up of the Cake
                                changing, so how do you get the original is-iceCream out of @code{cake1}?
                                
@code[#:multi-line #t]{examples:
                           change-flavor(cake1, "strawberry") is 
                           cake("strawberry",
                             cake1.color, 
                             cake1.message, 
                             cake1.layers, 
                             cake1.is-iceCream
                           )
                       end}}
                         @teacher{Remind students that the arguments to each function in Pyret @italic{must} be separated by commas. This wasn't necessary in Racket, but they 
                                                                                               will receive error messages if they don't use commas correctly in Pyret code.}}
                 
                 @point{@student{@activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.4&1&1" "BS-DR.4&1&2")]{@itemlist[@item{Write one more example for the function @code{change-flavor}, this time using it to make @code{cake2} a vanilla cake.} 
                                                      @item{Next, circle and label what changes between the two examples. How many variables will this function need? Then write the definition, using your examples to help you.}]}
                        
                                  After replacing the changing things with variables, your definition should look similar to: 
                                  @code[#:multi-line #t]{fun change-flavor(a-cake, new-flavor):
                                                           cake(
                                                             new-flavor, 
                                                             a-cake.color, 
                                                             a-cake.message, 
                                                             a-cake.layers, 
                                                             a-cake.is-iceCream
                                                           )
                                                         end}}
                         @teacher{Students may be tempted to put @code{new-flavor} in quotes, because the flavor of the Cake must be a string. However, the domain of 
                                                                 @code{change-flavor} tells us that the function will take in a Cake and a String, so whatever flavor is input will already 
                                                                 have quotes around it. Values evaluate to themselves, so the string "new-flavor" cannot evaluate to anything other than "new-flavor".
                                                                 If we want new-flavor to be a variable, or shortcut for "strawberry", "vanilla", "chocolate", etc. it must be written WITHOUT quotation marks.}}
                 
                 @point{@student{@activity[#:forevidence (list "7.EE.1-2&1&1" "A-CED.1-4&1&1" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "BS-DS.1&1&5")]{Turn to @worksheet-link[#:page 15 #:name "will-melt"] in your workbooks. Your bakery needs to know if certain Cakes need to be refrigerated. If the temperature is greater than 32 degrees AND the given cake is an ice cream cake, the function should return true. 
                                                   @itemlist[@item{Fill out the @vocab{Contract} and @vocab{Purpose Statement} for the function.}
                                                              @item{Write two examples for how one would use @code{will-melt}.}
                                                              @item{Circle and label what varies between those examples and label it with a @vocab{variable} name.}
                                                              @item{Define the function.}]}}
                         @teacher{Give students plenty of time to practice using dot-accessors, extracting pieces of the Cake structures and modifying them.}}]
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
        @points[@point{@student{So far you've worked with three data structures: Coords, Parties, and Cakes. In the next lesson, you'll look at a new struct as you dissect a video game, and start thinking about the struct(s) you'll need to create for your own game!}
                        @teacher{Have students volunteer what they learned in this lesson}}
                        
                        ]}
       }

       


  

