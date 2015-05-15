#lang curr/lib

@title{Unit 4: Welcome to the World}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Car" @code{car .model .hp .rims .color .value})
                                       (list "Party" @code{party .theme .location .guests}))]{
@unit-descr{Students return to the Ninja World game, and codewalk through the ’update-world’ and ’draw-world’ functions. Making minimal changes to these functions, they are able to modify the dog’s speed and add static clouds. They then modify the world to include the target’s x-coordinate, and systematically update each function in the source code to accommodate this new world. If time allows, additional iterations are possible by adding more sets of coordinates to the World. Students brainstorm their videogames, and derive the structure for their game world.}
}
@unit-lessons{
@lesson/studteach[#:title "Review: Autobody Shop"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Language Table}]
        #:preparation @itemlist[@item{The Cars file [Cars.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] |  @editor-link[#:public-id "P7qS37u1ZH" "PYRET EDITOR LINK"] preloaded on students' machines}
                                 @item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In our autobody shop we’ve been working with pretty basic cars. They have a model, horsepower, a rim size, color, and value.
                                @activity{What datatype do we use for each of these things?}
                                What if we realize later, after defining our Car struct, that it would be helpful to include more information about each car, like the number of years that it’s covered under warranty, the interior color, or whether or not it has antilock brakes? Thankfully, working in Pyret it’s easy to change our data definition so a car can include these things as well. 
                                @activity{@itemlist[@item{What new arguments does the @code{car} function need to take in? What kinds of things are these?}
                                                     @item{How would you change the data definition to include this new information about cars?}
                                                     @item{Change your Car definition on LINE 2 of the AUTOBODY SHOP file so it includes this new information.}]}
                                Important! When you change @italic{any} data structure, @bold{all} instances of that structure will need to change as well. Right now our definitions for @code{car1}, @code{car2}, and @code{car3} are creating cars with only five inputs- we need to add the three new arguments.

@activity{Change the definitions of car1, car2, car3 and the other cars you defined so they reflect the new Car struct. }}
                        @teacher{}}
                 ]
         }
@lesson/studteach[#:title "Codewalking"
        #:duration "40 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Deepen their understanding of structures, constructors and accessors by being introduced to a third data structure.}
                                        @item{Discover the event-based microworld implementation of Pyret, which uses events to modify the world.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{The NINJA WORLD 1 FILE [NW1.arr from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "nQq3AAg5nn" "WeScheme"] preloaded on students' machines}
                                 @item{update-world, big-bang, and draw-world nametags}
                                @item{cutout image of dog}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Do you remember the Ninja Cat game from Bootstrap:1? In this course, you're going to completely deconstruct the game, and recreate it using a world structure to make it more complex. This version of Ninja Cat might look a bit different than you remember...
                                @activity{Open the @editor-link[#:public-id "fW705a0idU" "NINJA WORLD 1"] file and press "Run". 
                                                   @itemlist[@item{What do you see in this game?}
                                                              @item{Go back to the code and look at the line where the @code{world} data structure is defined.}
                                                              @item{What is the name of this data structure?}
                                                              @item{The @code{world} is made up of just one thing: @code{dogX}. What does @code{dogX} represent in the game? What kind of thing is that?}
                                                              @item{Take a look at the section labelled @code{# STARTING WORLD}. There is a variable defined here, called 
                                                                    @code{START}. What kind of a thing is @code{START}? A number? String? Image? Boolean?}
                                                              @item{what function creates a @code{world}?}
                                                              @item{There are a number of values for images defined below. What are they images of? Type their names into the interactions area to find out.}]}
                                @activity{@itemlist[@item{Skip a bit farther down to where it says @code{# UPDATING FUNCTIONS}. What is the name of the function 
                                                                    defined here? What's its domain and range?}
                                                              @item{Think about what the @code{update-world} function is doing. How does it get the @code{dogX} out of the
                                                                    world? What is it doing to the dog's x-coordinate? How will this make the dog move? Does it go to the right, left, up, or down?}
                                                              @item{If the dog is at 100, where will it be next? After that?}
                                                              @item{How could you make the dog move faster? Slower? Backwards?}]}
                                Every time @code{update-world} runs, it creates a world, adding 10 to the @code{dogX} of the original world.}
                                
                        @teacher{These activities encourage students to read others' code and think about how it works, looking at the contracts and definitions and 
                                 piecing together what they already know. Ask a LOT of questions when going through the file: How do we know we need to make a new 
                                 world in @code{update-world}? (Because the range is a world). Why is @code{dogX} a good variable name? Ask them to
                                 guess what they think expressions like @activity{update-world(START)} will do in the game.}}
                 
                 @point{@student{@activity{Now skip down to the last function defined in our code: @code{big-bang}. This is a special function that will begin an animation, 
                                          but it needs help from other functions to update and draw the world. 
                                          @itemlist[@item{Which world is @code{big-bang} taking in?}
                                                     @item{In the code, @code{big-bang} is calling on a few different functions. What new functions can you see used in 
                                                                        @code{big-bang}?}]}
                                  The function @code{on-tick} acts kind of like a timer, and on each "tick", it updates the world. Right now the world struct is 
                                  just one number, representing the x-coordinate of the dog. @code{on-tick(update-world)} tells the computer to update 
                                  the world on every tick.
                                 @activity{@itemlist[@item{How does it do that? Think back to what @code{update-world} does to the @code{dogX} of the world.}]}
                                 @code{on-tick(update-world)} tells the computer how to update the world structure, but this wouldn't be much of a game without images! We need to know how to @italic{draw} the world, too.}
                         @teacher{}}
                 @point{@student{@activity{Scroll up to where you see @code{# GRAPHICS FUNCTIONS}. 
                                                                      @itemlist[@item{What is the name of the function defined here?}
                                                                                 @item{What is the Domain of this function? The Range?}
                                                                                 @item{According to the purpose statement, what does this function do?}]}
                                 Now look at the body of @code{draw-world}. It's using a function you might remember from Bootstrap 1, called @code{put-image}, which takes
                                 in an image, and then places it on top of another image, using the x- and y-coordinates to determine where to put it. In this example, it 
                                 is placing the @code{DOG} onto the @code{BACKGROUND}. @activity{What is it using for the dog's x-coordinate? The dog's y-coordinate?}}
                         @teacher{Each of these three functions work together to create the game that students see. @code{data World:} and @code{world(...)} tells the 
                                  computer what a world contains, @code{draw-world} draws the images onto the screen, and @code{update-world} changes the 
                                  world, according to the rules of the game. Point out to students that without all of these functions, the game would not be 
                                  playable.
                                  Once students understand the purpose of these functions, they need to understand how they work together. Have volunteers act out 
                                  @code{update-world} and @code{big-bang}, giving them nametags with the function names on them and having them come to the board.
                                  Have them explain to the class what their contracts are and what they do. Write: "World" on the board, with the number @code{0} beneath it. 
                                  When you yell "@code{big bang(0)}", have the class start counting time, yelling "tick!" every five seconds. On every tick, @code{big-bang} 
                                  must call on @code{update-world} to update the world written on the board. This results in the number changing over time, starting with 0.
                                  
                                  Then have another volunteer be @code{draw-world}, giving them the "draw-world" nametag and the dog cutout. Draw a large 
                                  rectangle on the board, representing the screen. Now have big-bang call both @code{update-world} and @code{draw-world} on each "tick", 
                                  causing the number on the board to increase and the dog to move across the screen a little each time. Have the class go through a few 
                                  iterations of this. By acting out these steps, students are demonstrating exactly how the three functions work together in the code to 
                                  complete the computer animation.}}
                
                 @point{@student{Suppose you want to add the @code{CLOUD} image to the game at the position (500, 400). How could you use
                                 @code{put-image} to stick it onto the @code{BACKGROUND}?
@code[#:multi-line #t]{# draw-world:  World -> Image
    #Place DANGER and CLOUD onto BACKGROUND at the right coordinates
    fun draw-world(w :: World): 
    put-image(CLOUD, 500, 400,
        put-image(DOG, w.dogX, 400, BACKGROUND))
end}
@bitmap{images/NWorld2.png}
}                                                   
                         @teacher{Since this is their first time using @code{put-image} themselves, write the code with the kids. They'll have 
                                  time to practice on their own later. Point out the "staircase" pattern that develops when you put images on
                                  top of one another. Once they've put the image onto the background, have them click "Run" and 
                                  take a look at that cloud!}}
                 ]
         }
@lesson/studteach[#:title "Extending the World"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will modify draw-world to add clouds and a coin}
                                         @item{Students will iteratively expand the World structure, and trace these changes throughout their program}]
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
        @points[@point{@student{Let's make this game more exciting: 
                                @activity{If you wanted to draw the @code{TARGET} into the world, at the coordinates (500, 300), What will 
                                                                    you need to modify?}
                                If the @code{TARGET} isn't moving, then nothing new will be changing in the game, so we don't need to 
                                change the world structure. The @code{draw-world} function will need to change, however, if we want 
                                the @code{TARGET} to show up in the game.
                                @activity{Using @code{put-image}, place the @code{TARGET} image on top of everything you have already, 
                                          so that it shows up when you click "Run".}
@code[#:multi-line #t]{# draw-world : World -> Image
    #Place DANGER, CLOUD and TARGET onto BACKGROUND at the right coordinates
 fun draw-world(w :: World):
    put-image(TARGET, 500, 300,
        put-image(CLOUD, 500, 400,
            put-image(DANGER, w.dogX, 200, BACKGROUND)))
end}}
                        @teacher{This section requires that you walk through and model each one of the changes to the code, with students
                                 following along on their own computers. You can write the code on the board or use a projector to show the
                                 code, and use cutouts of the dog and coin to model their behavior.}}
                 
                 @point{@student{Now suppose the @code{TARGET} is flying across the screen, moving left slowly at 5 pixels each frame. 
                                 The coin's position will be changing, so this time the world @italic{does} need to be modified.
                                 @activity{@itemlist[@item{What specifically will be changing about the coin?}
                                                      @item{How does the world struct need to change?}
                                                      @item{What is a good variable name to represent the coin's x-coordinate? How about 
                                                            @code{coinX}?}
                                                      @item{How has the contract for @code{world} changed? Update it on your 
                                                                                     contracts sheet!}
                                                      @item{Now that the world structure includes a @code{coinX}, What new dot-accessor do you have access to?}]}
                                 @code{.coinX}!}
                         @teacher{}}
                 
                 @point{@student{Because the world structure is different now, we need to go through the code, line-by-line, and change every
                                 @code{world} we find. Look at the @code{START} variable - It uses @code{world}, which now requires 
                                 two inputs in its Domain. 
                                 @activity{@itemlist[@item{What should the coin's x-coordinate be when the simulation starts? Include 
                                                           this number in the @code{START} world.}
                                                      @item{Do the definitions of the image variables need to change? Why not?}
                                                      @item{What about @code{draw-world}? Does its contract change? The contract says it 
                                                            takes a World as its Domain, and it still does. The only thing that has changed 
                                                            is @italic{what a world contains}. Does @code{draw-world} still produce an Image?}
                                                      @item{What needs to change about the body of @code{draw-world}? Right now the coin is being 
                                                            drawn at the coordinates (500, 300) every time, but we want the position (namely, its 
                                                            x-coordinate) to change. How do you get the @code{coinX} out of the world? Place the
                                                            image of the TARGET at that x-coordinate.}]}
@code[#:multi-line #t]{# draw-world : World -> Image
    #Place DANGER, CLOUD and TARGET onto BACKGROUND at the right coordinates
 fun draw-world(w :: World):
    put-image(TARGET, w.coinX, 300,
        put-image(CLOUD, 500, 400,
            put-image(DANGER, w.dogX, 200, BACKGROUND)))
end}}
                         @teacher{}}
                 
                 @point{@student{What about @code{update-world}? Does the contract change, now that the world structure is different? Why or why 
                                 not? @activity{Open your workbook to @worksheet-link[#:page 16 #:name "Update-world"], and copy down the contract.}
                                 Once again, the contract tells you a LOT about how to write the function. Here's a quick tip: if the range is a World, you know that you'll have to create a world at some point. @activity{How do you make a world?}}
                         @teacher{}}
                 @point{@student{The moment you write @code{world}, your instincts should kick in right away: Every world contains a @code{dogX}
                                 and a @code{coinX}, so you can write them down automatically.
                                 Now you can ask yourself: What happens to @code{dogX} be? In the game, the dog will still be moving to the right by 
                                 10 pixels. 
                                 @activity{@itemlist[@item{Start by writing two examples for @code{update-world}. For the first, what will happen if you call @code{update-world} on START?}
                                                      @item{How will you update the x-position of the dog? How do you get the @code{dogX} out of the world?}
                                                      @item{How would you add ten to that?}
                                                      @item{We said we wanted the coin to move to the left by 5 pixels. How do you get the @code{coinX} 
                                                            out of the world?}
                                                      @item{If it's moving to the left, will you add or subtract from the position?}
                                                      @item{Which world are you pulling the @code{dogX} and @code{coinX} out of?}
                                                      @item{The coin's x-coordinate needs to be added. Where does it begin, in the @code{START} world? 
                                                            If it goes left by 5 pixels, where should it end up in the first example?}]}
                                 
                                 @code[#:multi-line #t]{examples:
                                                        update-world(START) is world(START.dogX + 10, START.coinX + 5)
                                                        end
                                 }
                                 @activity{Complete the Design Recipe for @code{update-world}, and type it into Ninja World!}}          
                         @teacher{Every time the world (or @italic{any} structure) changes, every single instance of @code{world} (or @code{car},
                                  @code{party}, etc.) will need to change to reflect that. Have students find instances of @code{world} and 
                                  incorporate @code{coinX} into the new world. Any time they add something new to their game they will need to do 
                                  the same thing, so make sure they understand that every change to the world structure requires careful reading 
                                  and editing of their world functions.}}
                         ]
         }

@lesson/studteach[#:title "Game Brainstorming"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will define their World structures}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{You have been working with structures for the last three lessons, and you've gotten really good at defining, making and 
                                accessing them. Now, you're going to define the World structure for YOUR GAME! 
                                @activity{Suppose I have a racing game, where my player is at the bottom of the screen, sitting in their car. In front 
                                          of them, I have two lanes, with cars coming at me as I catch up to them. To move out of the way, I need to 
                                          change into the left or right lane of the road. 
                                          @itemlist[@item{What are all the things I need to keep track of in my game?}
                                                     @item{@code{PlayerX} - a number}
                                                     @item{@code{CarY} - a number}
                                                     @item{@code{Car2Y} (if I want another car) - a number}
                                                     @item{@code{Score} - a number}
                                                     @item{How would I define this world?}
                                                     @item{How do I get the playerX out of my word? My CarY? My Car2Y? The score?}
                                                     @item{What if I wanted the player's car to change color as the score goes up? How would my world 
                                                           structure need to change?}
                                                     @item{Now think about YOUR game - what will be @italic{changing} in your world?}]}} 
                                                                                
                  @teacher{Make sure students collaborate with their partner(s) to brainstorm a game that they will both be happy with. Make sure 
                           you force them to think about their world structures, and start simple: Limit their world structure to no more than five
                           things, initially.}}
                 
                 @point{@student{@activity{Turn to @worksheet-link[#:page 17 #:name "Game Design 1"] in your workbooks. First, you're going to draw a rough sketch of what your
                             game should look like when the user clicks "Run".
           @itemlist[@item{Keep your @code{world} structure limited to five or fewer things to begin with - you can add more things to make it more complex later on.}
                     @item{Make a list of all the images you'll need in your game.}
                     @item{Make a list of everything that changes in your game - if something moves, will you need to keep track of it's
                           x-coordinate? y? both?}]}}
                        @teacher{Many students will want to create ambitious games at first, with many values in their world structure. Make sure they start
                                 simple at first: Once they have a simple game working, they can add more elements and features to make it more advanced.
                                 Check their work: Does each pair's world structure correspond to the things that are changing in their game?}}

                 @point{@student{Now that you've gotten a list of everything that changes, it's time to turn them into a World structure.
            @activity{Turn to @worksheet-link[#:page 18 #:name "Game Design 2"] in your workbooks, and define your world structure. When you're done, 
                              write down the contract for @code{world}, and all of the dot-accessors that you need to work with your structures. 
                              @itemlist[@item{Define an example world called START, which is how your world should look a split-second after the
                                              game begins. Write it in on the bottom of @worksheet-link[#:page 18 #:name "Game Design 2"].}]}}
                        @teacher{Review each team's structure and make sure it accurately models their world. Also be sure to check their 
                                 @code{world} contract and dot-accessors.}}
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
        @points[@point{@student{Now you have the basic building blocks of your game and an understanding of how @code{draw-world}, 
                               @code{update-world}, and @code{big-bang} work together to create an animation in Pyret. In the next unit you'll
                               use your world structure to write the @code{draw-world} and @code{update-world} functions for your own game.}
                       @teacher{Have the class take turns telling their peers about their games: Who the player is, what their danger, target, etc. 
                                will be. Most importantly, have them tell the class what they have in their World structure.
@itemlist[@item{Make sure student names are on page 17}
                   @item{Take page 17 itself, or take photos of page 17, to prep game images for the next unit.}
                   @item{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be 
                         no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds!}
                   @item{TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these 
                         images usually have transparent backgrounds to begin with.}]}
                       }
                 ]
         }
       }