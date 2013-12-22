#lang curr/lib
@declare-tags[management]

@title{Unit 3: Structures and Worlds}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Auto" @code{make-auto auto-model auto-hp auto-rims auto-color auto-value}))]{

@unit-descr{Students, having made pre-built data structures in the last lesson (autos), will generalize their understanding by defining various data structures of their own and accessing their fields. Students are introduced to Racket's purely-functional microworld implementation. This requires an understanding of functions, data structures, and an introduction to events-based programming. To accomplish this, students first work with a simple world (a number, representing a dog's x-coordinate). This world is consumed and produced by the update-world function, and drawn by draw-world. To understand events, they act out the World model, actually becoming event handlers and timers, to simulate a running program.}
}
@unit-lessons{
@lesson/studteach[#:title "Review: the Autobody Shop"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In the last lesson you learned about a new kind of data struct, called an auto. 
                                @activity{@itemlist[@item{What is an auto? What things are described in an auto struct?}
                                                    @item{How do you make an auto?}
                                                    @item{How do you get the model out of an auto? The value? The color?}]}
     Last time all of these were used to make an autobody shop, where you had functions that would increase the auto's @code{hp}, or paint it a new @code{color}. This next problem 
     will be even harder, so remember to refer back to the last two functions you wrote in your workbook, in case you need some hints.}
                        @teacher{Take a few minutes to review structs and autos with your students.}}
            @point{@student{You may have heard of the show "Pimp My Ride", where the hosts get an old, beat-up car and make it WAY cooler. Let's implement something like this in Racket...
            @activity{Turn to @worksheet-link[#:page 12 #:name "pimp"] in your workbooks. Write a function called @code{pimp}, which takes in an Auto and returns a new Auto which has an 
                              extra 100 horsepower, has 30 inch rims, is painted red, and has increased in value by $10,000.
                              @itemlist[@item{What is the @vocab{contract} for this function?}
                                         @item{For the first EXAMPLE, let's upgrade @code{car3}. How will you start the example?}
                                         @item{@code{(EXAMPLE (pimp car3) ...)}}
                                         @item{According to the contract, we know that the Range of the @code{pimp} function is an auto. How do you make an auto?}
                                         @item{What's the first part of an auto? The @code{model}. Does the model change, according to the function's @vocab{purpose statement}? 
                                               How do you get the @code{model} out of @code{car3}?}
                                         @item{How do you get the @code{hp} out of @code{car3}?}
                                         @item{Does the horsepower change when we "pimp" our auto? You'll need to get the @code{hp} out of @code{car3}, @italic{and add 100 to it.}}
                                         @item{According to the @vocab{purpose statement}, every auto that gets pimped will have 30 inch rims. Does it matter what the original rim size was?}
                                         @item{Likewise, every car will be painted red. Do we need to reference the original color at all?}
                                         @item{Finally, how do you get the @code{value} out of @code{car3}? Will the @code{value} increase or decrease after the auto is upgraded?}
                                       ]}
Putting it all together, the first example should look like:

@code[#:multi-line #t]{(EXAMPLE (pimp car3) (make-auto (auto-model car3)
                                                    (+ (auto-hp car3) 100)
                                                        30
                                                        red
                                                    (+ (auto-value car3) 10000)))}
@activity{Write one more example, circle what changes, and then define the @code{pimp} function. If you're stuck, look back at the contract and your first example.}}                             
                    @teacher{This is an opportunity for students to practice nested expressions. Not only will they use accessor functions to access the fields of the original auto, 
                             they will need to modify them according to the problem statement. If they get stuck, have them draw the circle of evaluation for adding 100 to the auto's 
                             horsepower, 10,000 to the auto's value, etc.}}
            ]
         }
                                                                 
@lesson/studteach[#:title "define-struct"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will generalize their understanding of function constructors and accessors}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{The Autos file [Autos.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=P7qS37u1ZH" "WeScheme")] preloaded on students' machines}]
        #:preparation @itemlist[]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{@activity{Open the @(hyperlink "http://www.wescheme.org/view?publicId=P7qS37u1ZH" "Autobody Shop") file, and look at the first two lines at the top. 
                                                   They start with @code{;an auto is...} and @code{define-struct}.}}
                        @teacher{You can use the given Autos file, or your students' own files from the previous lesson.}}
                @point{@student{@code[#:multi-line #t]{; an auto is a (make-auto String Number Number String Number)
(define-struct auto (model hp rims color value))}
In the last unit we skipped over the part of the code that defines the auto struct, or tells the computer what an auto is and what goes into it. Just like we would expect from having
worked with autos, the @code{define-struct} line says that an auto has five things....a model, hp, rim, color, and value. But how do we know which number is which? Remember that order
matters! Look at the order of the fields in the @code{define-struct} line. The first string is the model, the first number is the horsepower, the second number is the rim size, and so on.}
                        @teacher{Stress the importance of being able to define your own datatypes to students: no longer are they bound by the single values of numbers, strings, or booleans! Racket allows you to define brand new structures, containing any combination of values. But these structures won't be usable without the @code{(define-struct ...)} line!}}
                 
            @point{@student{A struct is defined using the @code{define-struct} function, which tells the computer what things make up that struct, and what order and type each 
                                                          thing is. In return, we get new functions to use. Until we write this @code{define-struct} line, we don't have 
                                                          @code{make-auto} (to make an auto), @code{auto-model} (to get the model out of the auto), @code{auto-hp}, or any of 
                                                          the other accessor functions, because Racket doesn't know what an Auto is- @italic{we haven't defined it}.
            @activity{To check this, type a semi-colon before the line which begins with @code{define-struct}. This comments it out, so that the computer ignores it. Hit run, and see what 
                                                                                         happens. Then turn to @worksheet-link[#:page 13 #:name "define-struct"] in your workbook, and copy 
                                                                                         down the define-struct line.}}
                    @teacher{When the @code{define-struct} line is commented out, Racket returns an error, saying you're trying to use an identifier before its definition. That means that 
                                      it doesn't know what @code{make-auto} is or does, because we never defined an auto struct. Make sure students understand that @code{define-struct} 
                                      is needed in order to create and work with any struct.}}
            ]
         }
           
@lesson/studteach[#:title "The Party Struct"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Write complex functions that consume, modify and produce structures}
            @item{Deepen their understanding of structures, constructors and accessors by being introduced to two new data structures.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define two new complex data structures: party and world}
          @item{Students will write functions that access fields of an auto, party, or world, and produce new autos, parties, and worlds.}]
        #:standards (list)
        #:materials @itemlist[@item{The Party Planner file [Party.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=zLYLPQ5d6K" "WeScheme")] preloaded on students' machines}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that you know how to define your own structs, let's define another one. Instead of working in an autobody shop, this time you'll be a 
                                party planner. Data structures will be a useful way to represent each party that you're planning, keeping track of its location, theme, 
                                and number of guests.
                                @activity{@itemlist[@item{What datatype could be used to represent the location of the party?}
                                                     @item{What about the party's theme? (This could be something like @code{"50s"}, or @code{"laser tag"})}
                                                     @item{How about the number of guests?}]
                                           Fill out the second struct definition on @worksheet-link[#:page 13 #:name "Party Planner"] in your workbook.}
@code[#:multi-line #t]{; a party is a (make-party String String Number)
                       (define-struct party (location theme guests))}}
                        @teacher{}}
                 
                 @point{@student{@activity{Open the @(hyperlink "http://www.wescheme.org/view?publicId=zLYLPQ5d6K" "Party Planner") file. Take a look at the first two 
                                                    lines in the definitions window. Do they match what you have written?} 
                                 Now that the party struct is defined, you have access to four new functions: One to make a new party, and three @vocab{accessor functions}
                                 to get the location, theme, and number of guests out of the party. 
@activity{Turn to your contracts sheet. @itemlist[@item{What is the @vocab{Name} of the function that @italic{makes a party?}}
                                                  @item{What is the function's @vocab{Domain}? (What kinds of things are part of a party?)}
                                                  @item{What is the @vocab{Range} of this function?}
                                                  @item{How would you get the location out of a party? (Think about how you got the model or color out of an auto.)}
                                                  @item{Write the contracts for @code{party-location}, @code{party-theme}, and @code{party-guests}.}]}}
                         @teacher{}}
                 
                 @point{@student{@activity{Now define two new party structures of your own. No matter what party you're planning, make sure that it has the right 
                                           types of things in the right order.}}
                         @teacher{As with the autos struct, repetition is key: have students identify the fields of each of their parties, and ask them lots of 
                                  questions: How would you get the @code{theme} out of @code{Halloween}? How would you get the number of guests out of @code{JulyFourth}?}}
                 
                 @point{@student{Now it's time to write some functions using the party struct. Remember, as a party planner you'll need to be able to change 
                                 information for each party. 
      @activity{Turn to @worksheet-link[#:page 14 #:name "RSVP"]. Write a function called @code{RSVP}, which takes in a party and adds one to its number of 
                        guests.
                        @itemlist[@item{What's the name of the function? Domain? Range?}
                                   @item{Write the @vocab{contract} and @vocab{purpose statement} on your page.}
                                   @item{Write your first EXAMPLE for the party "Halloween". How do you start?}
                                   @item{@code[#:multi-line #t]{(EXAMPLE (RSVP "Halloween")....)}}
                                   @item{What does this function produce? (If you're stuck, look back at your contract.)}
                                   @item{Which function do we use to make a party?}
                                   @item{According to the @code{RSVP} function, will the location of this party change? Of course not. So how do you get the @code{location}
                                         out of a party?}
                                   @item{@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween) (make-party (party-location Halloween)
		                               .....))}}
                               @item{What about the theme? If someone new RSVPs, do we suddenly have to make this a Christmas party? What function gets the @code{theme} 
                                     out of a party?}
                               @item{@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween (make-party (party-location Halloween)
        (party-theme Halloween)
		.....))}}
                               @item{Lastly, what happens to the number of guests, when someone new RSVPs to the party?}]}
      The first @code{RSVP} example should be written as: 
@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween) (make-party (party-location Halloween)
                                                             (party-theme Halloween)
                                                          (+ (party-guests Halloween) 1)))}}
                         @teacher{Every structure will have its own unique accessor functions for each field. Have students practice accessing each part of the Party Struct and altering them (or not!) based on the word problem.}}
                 @point{@student{@activity{On @worksheet-link[#:page 15 #:name "relocate"], write a function called @code{relocate}, which takes in a party AND the location that
                                              it's moving to, and makes a new party at that location. Go through each part of the design recipe: contract, examples, and definition.}}
                         @teacher{}}
                 ]
         }

       
@lesson/studteach[#:title "Acting Out Ninja World"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Discover the event-based microworld implementation of Racket, which uses events to modify the world.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{The Ninja World 1 file [NW1.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=fW705a0idU" "WeScheme")] preloaded on students' machines}
                                @item{update-world, big-bang, and draw-world nametags}
                                @item{cutout image of dog}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Do you remember the Ninja Cat game from Bootstrap 1? In this course, you're going to completely deconstruct the game, and recreate it using 
                                a world structure to make it more complex. This version of Ninja Cat might look a bit different than you remember: 
                                @activity{Open the @(hyperlink "http://www.wescheme.org/view?publicId=fW705a0idU" "Ninja World 1") file and press "Run". 
                                                   @itemlist[@item{What do you see in this game?}
                                                              @item{Go back to the code and look at the line where the @code{world} structure is defined.}
                                                              @item{What function defines a struct?}
                                                              @item{What is the name of the structure defined in this file?}
                                                              @item{The @code{world} is made up of just one thing: @code{dogX}. What does @code{dogX} represent in the game?
                                                                    What kind of thing is that?}
                                                              @item{Take a look at the section labelled @code{;; STARTING WORLD}. There is a variable defined here, called 
                                                                    @code{START}. What kind of a thing is @code{START}? A number? String? Image? Boolean?}
                                                              @item{what function makes a @code{world}?}
                                                              @item{Skip a bit farther down to where it says @code{;; UPDATING FUNCTIONS}. What is the name of the function 
                                                                    defined here? What's it's domain and range?}
                                                              @item{Think about what the @code{update-world} function is doing. How does it get the @code{dogX} out of the
                                                                    world? What is it doing to the dog's x-coordinate?}]}
                                Every time @code{update-world} runs, it makes a new world, adding 10 to the @code{dogX} of the original world.}
                                
                        @teacher{These activities encourage students to read others' code and think about how it works, looking at the contracts and definitions and 
                                 piecing together what they already know. Ask a LOT of questions when going through the file: How do we know we need to make a new 
                                 world in @code{update-world}? (Because the range is a world). Why is @code{dogX} a good variable name for our world? Ask them to
                                 guess what they think expressions like @activity{(on-tick update-world)} will do in the game.}}
                 
                 @point{@student{@activity{Now skip down to the last function defined in our code: @code{big-bang}. This is a special function that will begin an animation, 
                                          but it needs help from other functions to update and draw the world. 
                                          @itemlist[@item{Which world is @code{big-bang} taking in?}
                                                     @item{In the code, @code{big-bang} is calling on a few different functions. What new functions can you see used in 
                                                                        @code{big-bang}?}]}
                                  The function @code{on-tick} acts kind of like a timer, and on each "tick", it updates the world. Right now the world struct is 
                                  just one number, representing the x-coordinate of the dog. @code{(on-tick update-world)} tells the computer to update 
                                  the world on every tick.
                                 @activity{@itemlist[@item{How does it do that? think back to what @code{update-world} does to the @code{dogX} of the world.}
                                                      @item{Try evaluating @code{(big-bang START (on-tick update-world))} in to the interactions window and see what happens.}]}

                                 The world structure is updating, but this isn't much of a game without images! We need to know how to @italic{draw} the world.
                                 @activity{Scroll up to where you see @code{;; GRAPHICS FUNCTIONS}. 
                                                                      @itemlist[@item{What is the name of the function defined here?}
                                                                                 @item{What is the Domain of this function? The Range?}
                                                                                 @item{According to the purpose statement, what does this function do?}]}
                                 Now look at the body of @code{draw-world}. It's using a function you might remember from Bootstrap 1, called @code{put-image}, which takes
                                 in an image, and then places it on top of another image, using the x- and y-coordinates to determine where to put it. In this example, it 
                                 is placing the @code{DOG} onto the @code{BACKGROUND}. @activity{What is it using for the dog's x-coordinate? The dog's y-coordinate?}}
                         @teacher{Once students understand the purpose of these three functions, they need to understand how they work together. Have volunteers act out 
                                  @code{update-world} and @code{big-bang}, giving them nametags with the function names on them and having them come to the board.
                                  Have them explain to the class what their contracts are and what they do. Write: "World" on the board, with the number @code{0} beneath it. 
                                  When you yell "@code{(big bang 0)}", have the class start counting time, yelling "tick!" ever five seconds. On every tick, @code{big-bang} 
                                  must call on @code{update-world} to update the world written on the board. This results in the number changing over time, starting with 0.
                                  
                                  Then have another volunteer be @code{draw-world}, giving them the "draw-world" nametag and the dog cutout. Draw a large 
                                  rectangle on the board, representing the screen. Now have big-bang call both @code{update-world} and @code{draw-world} on each "tick", 
                                  causing the number on the board to increase and the dog to move across the screen a little each time. Have the class go through a few 
                                  iterations of this. By acting out these steps, students are demonstrating exactly how the three functions work together in the code to 
                                  complete the computer animation.}}
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
        @points[@point{@student{If you were to act out these functions, relying on @code{big-bang} to update the world, then using the result of @code{update-world} to 
                                draw the world, and putting them all together to create an animation, it could get tricky, and the animation wouldn't be as fast as 
                                what you see on the computer. Fortunately, Racket has the capability to run all these functions and more in a fraction of the time, 
                                to create and draw a smooth, complete game. In the next few lessons, you'll be using structs to extend this world into an actual, 
                                complex game, and writing functions for Ninja World AND your own games to make them playable and unique.
                                }
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
       }

       


  

