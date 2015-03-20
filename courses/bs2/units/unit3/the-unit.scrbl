#lang curr/lib
@declare-tags[management]

@title{Unit 3: Structures and Worlds}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Auto" @code{auto .model .hp .rims .color .value}))]{

@unit-descr{Students, having made pre-built data structures in the last lesson (autos), will generalize their understanding by defining more data structures of their own, accessing their fields, and writing functions that produce them. 
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
          @item{Students will write functions that access fields of an auto, and produce new autos}]
        #:standards (list)
        #:materials @itemlist[@item{The Party Planner file [Party.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "zLYLPQ5d6K" "WeScheme"] preloaded on students' machines}
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
        @points[@point{@student{In the last lesson you learned about a new kind of data struct, called an auto. However, an auto isn't the only kind of struct- we can create any kind of struct we want! Let's define another one. In this exercise, you’ll be a party planner. Data structures will be a useful way to represent each party that you’re planning, keeping track of its location, theme, and number of guests.
                                @activity{@itemlist[@item{What datatype could be used to represent the location of a party?}
                                                    @item{What about the party's theme? (This could be something like "50s" or "laser tag".)}
                                                    @item{How about the number of guests?}]
                                           Fill out the second struct definition on @worksheet-link[#:page 13 #:name "Party Planner"] in your workbook.}
@code[#:multi-line #t]{# a party is a location, theme, and number of guests
                       data Party:
                         | party(location :: String, theme :: String, guests :: Number)
                       end}}
                        @teacher{}}
                 
                 @point{@student{@activity{Open the @editor-link[#:public-id "zLYLPQ5d6K" "PARTY PLANNER"] file. Take a look at the first two 
                                                    lines in the definitions area. Do they match what you have written?} 
                                 Now that the party struct is defined, you have access to new pieces of code: a function to make a party, and three @vocab{dot-accessors}
                                 to get the location, theme, and number of guests out of the party. 
@activity{Turn to your contracts sheet. @itemlist[@item{What is the @vocab{Name} of the function that @italic{makes a party?}}
                                                  @item{What is the function's @vocab{Domain}? (What kinds of things are part of a party?)}
                                                  @item{What is the @vocab{Range} of this function?}
                                                  @item{How would you get the location out of a party? (Think about how you got the model or color out of an auto.)}
                                                  @item{Now define two new party structures of your own. No matter what party you're planning, make sure that it has the right 
                                           types of things in the right order.}]}
}
                         @teacher{As with the autos struct, repetition is key: have students identify the fields of each of their parties, and ask them lots of 
                                  questions: How would you get the @code{theme} out of @code{Halloween}? How would you get the number of guests out of @code{JulyFourth}?}}
                 ]
         }

@lesson/studteach[#:title "Autobody Shop"
        #:duration "80 minutes"
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
        @points[@point{@student{In the last lesson you learned about a new data structure, called an auto. 
                                @activity{@itemlist[@item{What is an auto? What things are described in an auto struct?}
                                                     @item{What function creates an auto?}
                                                     @item{How do you get the model out of an auto? The value? The color?}]}
                                But we don't just want to take an auto and give it right back. We're running an autobody shop! We'll take people's cars and change 
                                them, making them better in some way, and then return them to the customer. Let's figure out how to do that.}
                        @teacher{}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 9 #:name "paint-job"] in your workbooks. Write a function called @code{paint-job},
                                           which changes the color of an automobile.
                                                   @itemlist[@item{What is the domain for this function? We'll need to get instructions about which auto we're changing, 
                                                                   AND what color we're making it.}
                                                              @item{What do you think our autobody shop is going to give back? What would be the range of 
                                                                    @code{paint-job}?}]}
               @code[#:multi-line #t]{
# paint-job: Auto, String -> Auto:
# Changes the color of an auto}
               In your first example, use the original @code{car1} and turn it purple. We know our customer will expect to get an auto back: you wouldn't bring your car
               into the shop and be OK with only getting a pair of rims back! But we won't be returning the same auto- it will be almost identical, with only the color changed.}
                         @teacher{It might not be immediately obvious to students that when a function returns an auto, they must use the @code{auto} function to 
                                  produce it. By starting with a "fresh" auto, students are forced to think about every single field in order. Thinking about what exactly
                                  makes up an auto and going back to the contract for @code{auto} gives them lots of practice with the auto struct and dot-accessors.}}
                 
                 @point{@student{The moment you write @code{auto}, you know that you'll need to give it five things: the model, hp, rims, color, and value of that auto. 
                                 We already know what model this car should be: the same as the given auto! But what if you didn't know exactly what string to use. 
                                 How could you access JUST the model of @code{car1} and use it in your @code{auto} function?
                       
    @code[#:multi-line #t]{check:
                               paint-job(car1, "purple") is auto(car1.model, ...)
                           end}
                                @activity{@itemlist[@item{The horsepower also doesn't change with a paint job. So how do you get the hp out of @code{car1}?}
                                                     @item{The rim size shouldn't change with a paint job. How do you get the rims out of car1?}
                                                     @item{What about the color? In this example @code{paint-job} is taking in @code{car1} and the string @code{"purple"}. 
                                                           So this auto's color will just be @code{"purple".}}]}
                                Don't forget the last part of the auto struct- the value! The purpose statement for @code{paint-job} doesn't say anything about the value
                                changing, so how do you get the original value out of car1?
                                
@code[#:multi-line #t]{check:
                           paint-job(car1, "purple") is auto(car1.model, car1.hp, car1.rims, "purple", car1.value)
                       end}}
                         @teacher{}}
                 
                 @point{@student{@activity{Write one more test case for the function @code{paint-job}, this time using it to paint @code{car2} green. 
                                          @itemlist[@item{Circle and label what changes between the two tests. How many variables will this function need?}
                                                     @item{Write the definition, using the test cases to help you.}]}
                        
After replacing the changing things with variables, your definition should look similar to: 
@code[#:multi-line #t]{fun paint-job(car :: Auto, color :: String) -> Auto:
                           auto(car.model, car.hp, car.rims, color, car.value)
                       end}}
                         @teacher{Students may be tempted to put @code{color} in quotes, because the color of the car must be a string. However, the domain of 
                                  @code{paint-job} tells us that the function will take in an auto and a string, so whatever color is input will already 
                                  have quotes around it. Values evaluate to themselves, so the string "color" cannot evaluate to anything other than "color".
                                  If we want color to be a variable, or shortcut for "purple", "green", "blue", etc. it must be written WITHOUT quotation marks.}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 10 #:name "turbocharge"] in your workbooks. When you turbocharge an engine, you get
                                           more power out of it. Your bodyshop offers a turbocharging job that adds 20 horsepower to any engine, but keeps everything
                                           else the same. 
                    @itemlist[@item{Fill out the @vocab{Contract} and @vocab{Purpose Statement} for the function.}
                              @item{Write two @vocab{Test Cases} for how one would use @code{turbocharge}.}
                              @item{Circle and label what varies between those examples and label it with a @vocab{variable} name.}
                              @item{Define the function.}]}}
                         @teacher{Give students plenty of time to practice using dot-accessors, extracting pieces of the Auto structs and modifying them.}}]
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
        @points[@point{@student{So far you've worked with three data structures: Posns, Parties, and Autos. In the next lesson, you'll look at a new struct as you dissect a video game, and start thinking about the struct(s) you'll need to create for your own game!}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
       }

       


  

