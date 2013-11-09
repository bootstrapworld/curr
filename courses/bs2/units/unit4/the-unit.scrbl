#lang curr/lib

@title{Unit 4: Welcome to the World}

@declare-tags[management]

@overview{
@unit-descr{Students return to the Ninja World game, and codewalk through the 'update-world' and 'draw-world' functions. Making minimal changes to these functions, they are able to modify the dog's speed, add static clouds, etc. They then modify the world to include the ruby's x-coordinate, and systematically update each function in the source code to accommodate this new world. Additional iterations are possible if time allows, by adding more sets of coordinates to the World.
Students brainstorm their videogames, and derive the structure for their game world.}

}
@unit-lessons{
@lesson/studteach[#:title "Review"
        #:duration "5 minutes"
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
        @points[@point{@student{You have had a lot of practice with structs over the past few lessons, so now it's time for a challenge. @activity{Turn to @worksheet-link[#:page 19 #:name "Intro-unit4"] in your workbook. Fill in the blanks with the information you know about @code{auto}, @code{party}, and @code{world} structs.}}
                        @teacher{}}
                 ]
         }
@lesson/studteach[#:title "Codewalking"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Deepen their understanding of structures, constructors and accessors by being introduced to a third data structure.}
                                        @item{Discover the event-based microworld implementation of Racket, which uses events to modify the world.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{The Ninja World 2 file [NW2.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=DtoM5S0yyH" "WeScheme")] preloaded on students' machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Open up @(hyperlink "http://www.wescheme.org/view?publicId=DtoM5S0yyH" "Ninja World 2") and click "Run". What happens? Does it do the same thing as in the simulation last unit?}
                                 
Let's walk through it and figure out what's wrong. At the top of the screen, you see the @code{;; DATA} section. This is where we define everything we need to keep track of during the animation. As you can see, @code{define-struct} is used to define the World structure here. @activity{@itemlist[@item{What is in the world structure?}
                    @item{Take a look at the section labelled @code{;; STARTING WORLD}. What is the name of the first variable defined here?}
                    @item{What kind of thing is it?}
                    @item{How would you get the @code{dogX} out of the @code{START} world?}
                    @item{Like in the last Ninja World, if the dog is moving ten pixels to the right each time, what should the world be in the next frame?}
                    @item{Underneath the @code{START} world, define another world called @code{NEXT}. What will the value of @code{dogX} be in the @code{NEXT} world?}]}
                    
There are also a number of of values for images defined below, which will be used in the game. What are they images of? @activity{Type in their names in the interactions window to find out.}}
                        @teacher{}}
                 
                 @point{@student{Now that we have a world structure, we need to know how to draw it. @activity{Scroll down to where you see @code{;; GRAPHICS FUNCTIONS}. What is the name of this function? What is the Domain? The Range?}
Like the last lesson, the @code{draw-world} function is using @code{put-image} to place the @code{DOG} onto the @code{BACKGROUND} at some coordinates. @activity{What is it using for the dog's x-coordinate? The dog's y-coordinate?}
Think for a moment about how the Ninja World "game" worked in the last lesson. Every time it ran, @code{draw-world} had to check what the current world was, for the @code{dogX}, before it could draw it. Where in this @code{draw-world} function is it checking the current world? It's not! The function isn't looking at the world it's taking in, so it has no way to change the position of the dog!
@activity{@itemlist[@item{How would you get the @code{dogX} out of the world?}
                    @item{Which world is going to be used? (Which world is @code{update-world} taking in?)}
                    @item{@code{(world-dogX w)}}
                    @item{Now where do you need to put this @code{(world-dogX w)}? Which number here represents the x-coordinate of the @code{DANGER} on the @code{BACKGROUND}?}]}}
                         @teacher{This @code{draw-world} function will always draw the dog at (0, 400) on the screen. Even through the world is being updated and passed to @code{draw-world}, students should understand that unless the image of the dog is drawn at the UPDATING x-coordinate (@code{dogX}) the game will not animate.}}
                 
                 @point{@student{Suppose you want to add the @code{CLOUD} image to the game at the position (500, 400). How could you use @code{put-image} to stick them on the @code{BACKGROUND}?
@code[#:multi-line #t]{;; draw-world: world -> Image
;; place DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image CLOUD 
               500 400
               (put-image DANGER
                            (world-dogX w) 200
                             BACKGROUND)))}
@bitmap{images/NWorld2.png}
}                                                   
                         @teacher{Write the code with the kids, since this is their first time using @code{put-image} themselves. They'll have time to practice on their own later! Once they've put the image onto the background, have them click "Run" and take look at that cloud!}}
                 
                 @point{@student{Now scroll down to where it says @code{;; UPDATING FUNCTIONS}. This code is responsible for changing the World.
@activity{@itemlist[@item{What does @code{update-world} DO to the world?}
                    @item{@code{update-world} will make a new world and add 10 to the @code{dogX} of that world.What does that mean, in terms of how the dog moves? Does it go to the right, left, up, down?}
                    @item{If the dog is at 100, where will it be next? After that?}
                    @item{How could you make the dog move faster? Slower? Backwards?}
                    @item{Write two @vocab{examples} for @code{update-world}, using the @code{START} world and the @code{NEXT} world you already defined.}]}}
                         @teacher{}
                         }
                 ]
         }
@lesson/studteach[#:title "Extending the World"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will modify draw-world to add clouds and a ruby}
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
        @points[@point{@student{Let's make this game more exciting: @activity{If you wanted to draw the @code{TARGET} into the world, at the coordinates (500, 300), What will you need to modify?}
If the @code{TARGET} isn't moving, then nothing new will be changing in the game, so we don't need to change the world structure. The @code{draw-world} function will need to change, however, if we want the @code{TARGET} to show up in the game.
@activity{Using @code{put-image}, place the @code{TARGET} image on top of everything you have already, so it shows up when you click "Run".}
@code[#:multi-line #t]{;; draw-world: world -> Image
;; place DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image TARGET
             500 300
             (put-image CLOUD 
                        500 400
                       (put-image DANGER
                                 (world-dogX w) 200
                                   BACKGROUND)))}}
                        @teacher{This section requires that you model each one of the changes to the code, with students following along. You can do this on a projector, or write the code on the board, with visuals such as a rectangle modeling the screen, and cutouts of the dog and ruby that are moved to correspond with the current world. Make sure everyone can see what you're doing!}}
                 
                 @point{@student{Now suppose the @code{TARGET} is flying across the screen, moving left slowly at 5 pixels each frame. The ruby's position will be changing, so this time the world DOES need to be modified. @activity{@itemlist[@item{What specifically will be changing about the ruby?}
                              @item{How does the world struct need to change?}
                              @item{What is a good variable name to represent the ruby's x-coordinate? How about @code{rubyX}?}
                              @item{How has the contract for @code{make-world} changed? Update it on your contracts sheet}
                              @item{What new function do you now have access to, now that the world structure includes a @code{rubyX}? Write it in your contracts page!}]}
@code{; world-rubyX :  world -> Number}}
                         @teacher{}}
                 
                 @point{@student{Because the world structure is different, we need to go through the code, line-by-line, and change every @code{world} we find. Look at the @code{START} variable - It uses @code{make-world}, which now requires two inputs in it's Domain. @activity{@itemlist[@item{What should the ruby's x-coordinate be when the simulation starts? Include this number in the @code{START} world.}
                    @item{Now change the definition of @code{NEXT}. Don't forget to think about how the ruby's x-coordinate will change from the @code{START} world to the @code{NEXT} world}
                    @item{Do the image variable definitions need to change? Why not?}
                    @item{What about @code{draw-world}? Does its contract change? The contract says it takes a World as it's Domain, and it still does. All that's changed is what's IN a world. Does @code{draw-world} still produce an Image?}
                    @item{What needs to change about the body of @code{draw-world}? Right now the ruby is being drawn at the coordinates (500, 300) every time, but we want the position (namely, its x-coordinate) to change. How do you get the @code{rubyX} out of the world? Place the image of the TARGET at that x-coordinate.}]}
@code[#:multi-line #t]{(define (draw-world w)
                               (put-image TARGET
                                          (world-rubyX w) 300
                                          (put-image CLOUD ....)))}}
                         @teacher{}}
                 
                 @point{@student{What about @code{update-world}? Does the contract change, now that the world structure is different? Why or why not? @activity{Get rid of the function body of @code{update-world} completely, because a lot needs to change here, but don't delete the contract!}
Once again, the contract tells you a LOT about how to write the function. Here's a quick tip: if the range is a World, you know that you'll have to make a world at some point. @activity{How do you make a world?}
The moment you write @code{make-world}, your instincts should kick in right away. What's in the world? A @code{dogX} and a @code{rubyX}, so you should write them down without even thinking! Don't use your brain yet!
NOW you need to think: What should the @code{dogX} be? In the game, the dog will stil be moving to the right by 10 pixels. @activity{@itemlist[@item{How will you update the x-position of the dog? How do you get the @code{dogX} out of the world?}
                    @item{How would you add ten to that?}
                    @item{We said we wanted the ruby to move to the left by 5 pixels. How do you get the @code{rubyX} out of the world?}
                    @item{If it's moving to the left, will you add or subtract from the position?}
                    @item{Which world are you pulling the @code{dogX} and @code{rubyX} out of?}
                    @item{Do the examples for @code{update-world} need to change?}
                    @item{Look at the first example: how many things are being passed into @code{make-world}? How many should there be? Look at its domain!}
                    @item{The ruby's x-coordinate needs to be added. Where does it begin, in the @code{START} world? If it goes left by 5 pixels, where should it end up in the first example?}
                    @item{Fix the second example in the same way, adding the ruby's x-coordinate.}]}
}          
                         @teacher{Every time the world (or @italic{any} structure) changes, every single instance of @code{make-world} (or @code{make-auto}, @code{make-party}, etc. will need to change to reflect that. Have students practice going through every function in the code, looking for each instance of @code{make-world}, and incorporating the @code{rubyX} into the new world. Any time they add something new to their game they will need to do the same thing, so make sure they understand that every change to the world structure requires careful reading and editing of their world functions.}}
                         ]
         }

@lesson/studteach[#:title "Game Brainstorming"
        #:duration "15 minutes"
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
        @points[@point{@student{You have been working with structures for the last three lessons, and you've gotten really good at defining, making and accessing them. Now, you're going to define the World structure for YOUR GAME! @activity{Suppose I have a racing game, where my player is at the bottom of the screen, sitting in their car. In front of them, I have two lanes, with cars coming at me as I catch up to them. To move out of the way, I need to change into the left or right lane of the road. @itemlist[@item{What are all the things I need to keep track of in my game?}
                @item{@code{PlayerX} - a number}
                @item{@code{CarY} - a number}
                @item{@code{Car2Y} (if I want another car) - a number}
                @item{@code{Score} - a number}
                @item{How would I define this world?}
                @item{How do I get the playerX out of my word? My CarY? My Car2Y? The score?}
                @item{What if I wanted the player's car to change color as the score goes up? How would my world structure need to change?}
                @item{Now think about YOUR game - what will be @italic{changing} in your world?}]}} 
                  
                  @teacher{Pass out some scratch paper for the students to brainstorm on. If they are working in pairs to program their games, make sure they are collaborating with their partner(s) to brainstorm a game that they will both be happy with. Make sure you force them to think about their world structures, and start simple! Limit their world structure to five things, initially.}}
                   ]
         }
                  
@lesson/studteach[#:title "Game Design!"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Student will define their World structures}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{It's time to start work on your game!
           @activity{Turn to @worksheet-link[#:page 20 #:name "Game Design 1"] in your workbooks. First, you're going to draw a rough sketch of what your game should look like when the user clicks "Run".
           @itemlist[@item{Keep your world struct limited to five or fewer things to begin with - you can add more things to make it mre complex later on.}
                     @item{Now make a list of all the images you'll need in your game.}
                     @item{Now make a list of everything that changes in your game - if something moves, will you need to keep track of it's x-coordinate? y? both?}]}}
                        @teacher{}}
                 ]
         }

@lesson/studteach[#:title "Defining the World"
        #:duration "20 minutes"
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
        @points[@point{@student{Now that you've gotten a list of everything that changes, it's time to turn them into a World structure!
            @activity{Turn to @worksheet-link[#:page 21 #:name "Game Design 2"] in your workbooks, and define your world structure. When you're done, write down all of the contracts that you need to work with your structures. @itemlist[@item{Define an example world called START, which is how your world should look a split-second after the game begins. Write it in on the bottom of @worksheet-link[#:page 21 #:name "Game Design 2"].}]}}
                        @teacher{Review each team's structure, and make sure it accurately models their world. Also be sure to check their contracts, which should include @code{make-world}, and functions to access every part of their world structure!}}
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
        @points[@point{@student{Now you have the basic building blocks of your game, and an understanding of how @code{draw-world}, @code{update-world}, and @code{big-bang} work together to create an animation in Racket. In the next unit you'll use your world structure to write the drawing and updating funtions for your own game!}
                       @teacher{Have the class take turns telling their peers about their games: Who the player is, what their danger, target, etc. will be. Most importantly, have them tell the class what they have in their World structure.
@itemlist[@item{Make sure student names are on page 20}
                   @item{Take page 20 itself, or take photos of page 20, to prep game images for the next unit.}
                   @item{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds!}
                   @item{TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with.}]}
                       }
                 ]
         }
       }