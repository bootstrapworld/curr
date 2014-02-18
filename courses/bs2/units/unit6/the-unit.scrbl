#lang curr/lib

@title{Unit 6: Key Events}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{Students return to the subject of partial functions, this time defining a key-event handler that modifies their world when certain keys are pressed.}
}
@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}
                            @item{Student workbooks}
                            @item{Language Table}
                            @item{Signs for kids, entitled "update-world", "draw-world" and "big-bang"}
                            @item{Cutout images of the dog and ruby}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{The Ninja World 3 file [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "t77yPXKDWs " "WeScheme"] projected onto the board}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{So far, we've been working with three main functions to make our game and animate our world: @code{update-world}, 
                                @code{draw-world}, and @code{big-bang}. At this point, your game might use a few more functions than these, but 
                                Ninja World is still as basic as you remember it. 
                                @activity{@itemlist[@item{Open the @editor-link[#:public-id "t77yPXKDWs" "Ninja World 3"]
                                                         file and press "Run", to watch the dog and the ruby fly across the screen.}
                                                     @item{What is the contract for each of the functions in this game? What do they do?}
                                                     @item{Each time @code{update-world} is called, What changes about the dog? How does it change?
                                                                     What about the ruby?}
                                                     @item{Where on the screen does @code{draw-world} put the image of the dog? the ruby? The clouds?}
                                                     @item{If you were to call @code{update-world} on @code{(make-world 0 640)}, What would you get back? 
                                                                               What is the world that is produced? Where are the dog and ruby after that 
                                                                               world is evaluated?}]}
                                In this version of Ninja World, both the dog and the ruby are moving as they should. But that's old news: you've already 
                                made the characters in your game move on their own. Let's add more.}
                        
                        @teacher{This lesson is another opportunity to have students"act out the three main functions in Ninja World. Draw a box on the 
                                 board with @code{(make-world 0 640)} in it, labelled "world". Ask for a volunteer, and given them the @code{update-world}
                                 nametag to wear. Ask for @code{update-world}'s Contract and Purpose Statement. Go through a few iterations of having 
                                 @code{update-world} evaluate the world on the board, and each subsequent world that they update. 
                                 @management{Make sure to call them by name, i.e. "@code{(update-world (make-world 0 640))}"} (In the first example, 
                                 the student should erase the 0 and write a 10, and erase the 640 and write a 635. If they are stuck, refer them back 
                                 to the code.) Take another student, and give them the @code{big-bang} sign. They'll start the whole 
                                 animation, and will have a timer. Instruct the class to yell "tick!" every five seconds, and when they do, 
                                 @code{big-bang} will give the current world to @code{update-world}, who will then update it and replace it with the new 
                                 world. Let this go on for a few iterations, so the rest of the class can see the world structure being changed while 
                                 they count down. Finally, give the @code{draw-world} sign to another volunteer, along with the cutouts 
                                 of the dog and ruby. As before, ask for their name, domain, range. 
                                 When they are called, they will be given a @code{world} structure and will place the image of the dog and the ruby at the 
                                 appropriate spots on the board. Change the value of the world back to @code{(make-world 0 640)}. Call on @code{draw-world}
                                 a few times with different worlds, so the class can see the dog and ruby moving accross the screen. When each 
                                 volunteer has practiced, put all the functions together: On each "tick" the class makes, @code{big-bang} will call on 
                                 @code{update-world} to update the current world, and then @code{draw-world} to draw that updated world. Again, go 
                                 through a few iterations, so the class can see the world structure changing and characters moving in as a result.}}
                 
                 @point{@student{The time is nigh: we need to get that ninja cat onto the screen so that our game is playable. She'll be able to move up and down. 
                                 @activity{@itemlist[@item{Do we need to change anything in the code to make this work?}
                                        @item{What part of the game will we need to keep track of if Ninja Cat is moving up and down? What would be a 
                                              good @vocab{variable} name for this?}]}
                                 We need to keep track of the cat's y-coordinate, so let's add a @code{catY} to the world.  
                                 @activity{@itemlist[@item{Where in the code is the world struct defined?}
                                                      @item{If the cat is in the center of the screen, what should the value of @code{catY} be?}
                                                      @item{Add another number to the world struct, representing the cat's y-coordinate.}]}}
                         @teacher{}}
                 @point{@student{Right now, even though the cat's y-coordinate has been added to the world struct, there's no function to take in keypresses and
                                 make it move. This is what we're going to write next. But before we figure out how to write the function to move the cat,
                                 we need to actually add her into the game. 
                                 @activity{Which functions will need to change, now that the world structure is different?}
                                 Since the world now contains three things, you'll need to change every single @code{make-world} in the code.
                                 @activity{@itemlist[@item{Starting from the first line, go through the code and look for every instance of 
                                                           @code{make-world}, changing it to reflect the new world struct.}
                                                      @item{How do you get the @code{catY} out of the world?}                                       
                                                      @item{We said that we'll be writing another function to handle keypresses and moving the cat, so just 
                                                            add the @code{catY} to @code{update-world}. Don't worry about changing its value.}
                                            @item{Inside  @code{draw-world}, use the @code{put-image} function to place the image of Ninja Cat on top of 
                                                          the other images in the game. If she starts in the center of the screen, on what x-coordinate 
                                                          will she be placed? What about her y-coordinate?}]}}
                         @teacher{After the @code{catY} is added to the world struct, but before any of the functions have changed, try running the 
                                  simulation again, giving the ninja cat cutout to the @code{draw-world} volunteer. The world now has three things in it
                                  (@code{dogX}, @code{rubyX}, and @code{catY}), but the updating and drawing functions will change only the dog and ruby's 
                                  positions. When @code{big-bang} starts the animation, only the @code{dogX} and @code{rubyX} will be updated. After a few 
                                  iterations, tell the volunteers that you've pressed the "up" key. If @code{draw-world} begins moving the ninja cat cutout,
                                  refer them back to the code. You haven't programmed anything to change @code{catY} yet.}}
                 ]
         }
                                         
@lesson/studteach[#:title "Keypress"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will extend their understanding of events to cover key-events}
            @item{Students will deepen their knowledge of conditionals, by combining them with struct accessor and constructor functions.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that the world structure is consistant across all the functions in Ninja World, we're ready to make the cat move.
                                @activity{Open your workbook to @worksheet-link[#:page 28 #:name "Keypress"]. Using the Design Recipe, write the
                                                                function @code{keypress} for the Ninja World game.} 
                                @bannerline{Step 1 - Contract and Purpose Statement}
                                The word problem tells us that the function's name will be @code{keypress}. What about the Domain? Think about what
                                the function needs to know in order to handle a keypress: it needs the World, otherwise it wouldn't know what to 
                                update. But it also needs to know what key was pressed (either @code{"up"} or @code{"down"}).
                                @activity{@itemlist[@item{What datatypes are @code{"up"} and @code{"down"}?}
                                                     @item{What is the Domain of @code{keypress}? The Range?}
                                                     @item{What is a good Purpose Statement for this function?}]}   
          @code[#:multi-line #t]{; keypress : World String -> World
                                 ; Given a world and key pressed, updates the world's catY}}
                        @teacher{}}
                 @point{@student{@bannerline{Step 2 - Examples}
                               @activity{Write an example using the @code{START} world, when the user presses @code{"up"}.
                                                                    @itemlist[@item{@code{(EXAMPLE (keypress START "up") ...)}}
                           @item{What should you get back? (HINT: Look at the Range)}
                           @item{What function makes a world? What things are part of this world?}
                           @item{@code[#:multi-line #t]{(EXAMPLE (keypress START "up") 
                                                                 (make-world ...dogX...rubyX...catY))}}
                           @item{Does the @code{dogX} change when the user presses @code{"up"}? How do you get the old @code{dogX} out of the @code{START} world?}
                           @item{@code[#:multi-line #t]{(EXAMPLE (keypress START "up")
                                                                 (make-world (world-dogX START)...rubyX...catY))}}
                           @item{Does the @code{rubyX} change when the user presses @code{"up"}? How do you get the old @code{rubyX} out of the @code{START} world?}
@item{@code[#:multi-line #t]{
(EXAMPLE (keypress START "up") (make-world (world-dogX START)
                                             (world-rubyX START)
                                              ...catY...))}}
                           @item{What about the @code{catY}? How much should it change if the user presses @code{"up"}? Let's say 10 pixels.}
                           @item{Should you add or subtract from the @code{catY} if the @code{"up"} key is pressed? Why?}]}
                
Your first example should look like: 
@code[#:multi-line #t]{
(EXAMPLE (keypress START "up") (make-world (world-dogX START)
                                           (world-rubyX START) 
                                        (+ (world-catY START) 10)))}}
                         @teacher{}}
                 @point{@student{@activity{Write one more example for @code{keypress} using the @code{START} world and the @code{"down"} key. Think about how the @code{catY} will change this time}
@code[#:multi-line #t]{(EXAMPLE (keypress START "down") (make-world (world-dogX START) 
                                         (world-rubyX START) 
                                         (- (world-catY START) 10)))}
@activity{Next, carefully go through your examples and circle @italic{everything} that changes. Does this function behave like the functions you've been working with?}}
                         @teacher{}}
                 @point{@student{@bannerline{Step 3 - Definition}
                @activity{What goes into the function header? What are some good variable names for the world and string (representing the key pressed) in the Domain?}
                 @code[#:multi-line #t]{(define (keypress w key)
	                                              ...)}
                 What now? This is a test of your programming intuition: you have two different examples, where you add 10 to @code{catY} in one case
                 but subtract 10 in another. How can a function behave so differently? It has multiple conditions, with a different response to each.
                 You've already seen this before, back in Bootstrap:1 - @code{cond}.
                 @code{cond} is a special function, which signals to the computer that the function will have multiple conditions: it behaves differently 
                 depending on what input(s) it gets. This is also known as a @vocab{piecewise function}.}
                        @teacher{Be sure to check students’ Contracts and EXAMPLEs during this exercise, especially when it’s time for them to circle and
                                 label what changes between examples. This is the crucial step in the Design Recipe where they should discover the need 
                                 for @code{cond}.}}
                 @point{@student{Each @vocab{piecewise function} has at least one @vocab{clause}. Each clause has a Boolean question and a result. In 
                                      your @code{keypress} function, there is a clause for the @code{"up"} key, and another for the @code{"down"} key.
                                      If the question evaluates to true, the expression gets evaluated and returned. If the question is false, the computer 
                                      will skip to the next @vocab{clause}. To write a function with multiple conditions, start with @code{cond} and use
                                      square brackets to add a branch. We know that every branch has a test and a result, making a @vocab{clause}. 
                                      @code[#:multi-line #t]{(define (keypress w key)
	                                   (cond
		                                 [...test...  ...result...]))}}
                         @teacher{}}
                 @point{@student{Let's start the first branch. It will test if the @code{key} pressed is equal to @code{"up"}. @activity{What function can we use to test if two strings are equal?}
@code[#:multi-line #t]{(define (keypress w key)
	(cond
		[(string=? key "up")  ...result...]))}}
                         @teacher{Square brackets enclose the question (a statement returning a boolean) and answer for each clause. There can only be one
                                  expression in each answer.}}
                 @point{@student{What is the result if the key is @code{"up"}? (HINT: Look back at your EXAMPLES for help.) You can copy in the example 
                                 for @code{"up"}, and change all instances of @code{START} to the @vocab{variable}, @code{w}:
@code[#:multi-line #t]{(define (keypress w key)
	(cond
		[(string=? key "up")  (make-world (world-dogX w) 
                                                  (world-rubyX w) 
                                               (+ (world-catY w) 10))]))}
@activity{What is the second condition that needs to be considered? What expression will test that condition? Write the second branch of the @code{keypress} function.}}
                         @teacher{}}
                 @point{@student{We also need to test whether the user pressed the @code{"down"} key:
                 @code[#:multi-line #t]{(define (keypress w key)
	(cond
                [(string=? key "up")  (make-world (world-dogX w) 
                                                  (world-rubyX w) 
                                               (+ (world-catY w) 10))]
                                                       
		[(string=? key "down")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                 (- (world-catY w) 10))]))}
                               Now the computer knows what to do when either @code{"up"} or @code{"down"} is pressed, but there are lots of other keys on your keyboard. 
                               @activity{Type the above code into the Ninja Cat game and click "Run". Ninja Cat moves when you press the "up" and "down" 
                                         arrow keys. What happens if you press a different key? You should get an error...can you guess why?}}
                         @teacher{}}
                 @point{@student{Racket doesn't know what to do if any other key is pressed, because we haven't told it what to do. 
                               @activity{@itemlist[@item{Should the world change if the user hits the spacebar, or the @code{"r"} key?}
                                                    @item{Which world should be returned if any other key is pressed?}]}
Instead of enumerating all the values of the original world, we can use the variable, @code{w}: 
@code[#:multi-line #t]{(define (keypress w key)
	(cond
                [(string=? key "up")  (make-world (world-dogX w) 
                                                  (world-rubyX w) 
                                               (+ (world-catY w) 10))]
                                                      
		[(string=? key "down")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                 (- (world-catY w) 10))]
                [else w]))}
                 
The last clause in a conditional can be an @code{else} clause, which gets evaluated if all the previous clauses were @code{false}.}
                         @teacher{@code{else} clauses are best used as a catch-all for cases that you can’t otherwise enumerate. If you can state a precise 
                                   question for a clause, write the precise question instead of else. For example, if you have a function that does
                                   different things depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to
                                   write the two questions @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{else}. 
                                   Explicit questions make it easier to read and maintain programs. When you use @code{else}, someone has to read
                                   all the previous questions to know what condition else corresponds to: they can’t just skim all the questions 
                                   to find the one that matches their situation. This makes code more readable and understandable.}}
                 ]
         }     
@lesson/studteach[#:title "Keypresses in Your Game"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Using conditionals, students will write a function to handle different keypresses in their game.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In Ninja World, the player can only press two keys: @code{"up"} or @code{"down"}. 
                                @activity{@itemlist[@item{What field in the World changes when the player presses @code{"up"}? 
                                                         How does it change?}
                                                     @item{Think about the person playing your game. How will they control the game? What
                                                           key will make YOUR player move up? Down? What else can they do? Move side-to-side? 
                                                           Jump? Teleport? Shoot a projectile?}
                                                     @item{Turn to @worksheet-link[#:page 27 #:name "Lesson 6"] in your workbooks.
                                                                   Write down the various keys that the user can hit to control the game. 
                                                                   For each one, write down the field in your world struct that changes, 
                                                                   and how it changes.}]}}
                        @teacher{Review students' workbook pages, and check for understanding: could they change multiple things in their game
                                 with one keypress?}}
                 @point{@student{@activity{Turn to @worksheet-link[#:page 30 #:name "Keypress-in-Game"] in your workbooks. Choose 3 
                                           keys that control the game, and go through the design recipe: Write EXAMPLES for what should 
                                           happen to your START world depending on which key was pressed. Then define your function. Once
                                           you've completed the Design Recipe, type your @code{keypress} function into your games.}

                                  Of course, keypresses can do a lot more in a videogame than just move a character up and down. By using what
                                  your learned about Boolean functions, you can add more advanced movement. Here are some ideas:
@itemlist[
          @item{@bold{Warping:} instead of having the player’s y-coordinate change by adding or subtracting, replace it with a Number to 
                 have the player suddenly appear at that location. (For example, hitting the @code{"c"} key causes your player to warp back
                 to the center of the screen, at y=240.)}
          @item{@bold{Boundary-detection:} Change the condition for moving up so that the player only moves up if @code{key} = @code{"up"} 
                 AND the player's y-coordinate is less than @code{480}. Likewise, change the condition for @code{"down"} to also check 
                 that the player's y-coordinate is greater than 0.}
          @item{@bold{Wrapping:} Add a condition (before any of the keys) that checks to see if the player’s y-coordinate is above 
                 the screen @code{(> y 480)}. If it is, have the player warp to the bottom. Add another condition so that the player 
                 warps back up to the top of the screen if it moves below the bottom.}
          @item{@bold{Challenge:} Have a character hide when the @code{"h"} key is pressed, only to re-appear when it is pressed again.}]
}
                         @teacher{Hint for the challenge: multiply by -1!}}
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
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{With @vocab{conditionals} and @vocab{piecewise functions}, you can make a lot of things happen in your 
                                     game with just a few lines of code, like controlling the movement of characters. Speaking of 
                                     controlling characters, what happens in Ninja World when the dog and ruby go off the screen? 
                                     They keep going, but don't come back - the same problem we had in Bootstrap:1, and if you 
                                     need a refresher on how to fix it, that's what we'll be covering in the next unit.}
                       @teacher{Have students show each other their (controllable games).}}
                 ]
         }
       }

       