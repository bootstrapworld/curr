#lang curr/lib

@title{Unit 4: Welcome to the World}
@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Cake" @code{cake .flavor .color .message .layers .is-iceCream})
                                       (list "Party" @code{party .theme .location .guests}))]{
@unit-descr{Students are introduced to event-based programming using big-bang, and codewalk through the @code{next-world} and @code{draw-world} functions.
            They then modify these functions and experiment with the results, eventually leading to a point where they discover the
            need for structures.}
}
@unit-lessons{
@lesson/studteach[#:title "Review: Your Bakery"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students practice altering and adding fields to the @code{Cake} data structure}]
        #:standards (list "N-Q" "BS-IDE" "BS-DS.2")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Language Table}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVU2lINzk1X0x2ODg" "Bakery"] file used in the previous unit, preloaded on students' machines}
                                 @item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In our previous lesson, we worked on the @code{Cake} structure. Cakes have a flavor, a color, 
                                a message, number of layers, and an indicator of whether or not it's an ice cream cake.
                                @activity[#:forevidence (list "N-Q&1&1")]{What datatype do we use for each of these fields?}
                                What if we realize later, after defining our Cake struct, that it would be helpful to include more information about each cake, like 
                                a frosting color? Thankfully, working in Pyret, it’s easy to change our data definition so a Cake can include this as well.
                                @activity[#:forevidence (list "N-Q&1&1" "BS-DS.2&1&3")]{@itemlist[@item{How would you change the data definition to include this new information about cakes?}
                                                     @item{What new argument does the @code{cake} constructor need to take in? What kind of data is this?}
                                                     @item{Change your Cake definition so it includes this new information.}]}
                                Important! When you change @italic{any} data structure, @bold{all} @vocab{instances} of that structure will need to change as well. 
                                Right now our definitions for @code{cake1}, @code{cake2}, and @code{cake3} are creating cakes with only four inputs --- we need to 
                                add the information about the frosting color!

@activity[#:forevidence (list "BS-IDE&1&1" "BS-DS.2&1&3")]{Change the definitions of @code{cake1}, @code{cake2}, @code{cake3} and the other cakes you defined so they reflect the new Cake struct. }}
                        @teacher{}}
                 ]
         }
@lesson/studteach[#:title "The Hollywood Principle"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Deepen their understanding of structures, constructors and accessors by being introduced to a third data structure.}
                                        @item{Discover the event-based microworld implementation of Pyret, which uses events to modify the World.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will act out the event-based programming model, beginning with a simple world containing just one number}]
        #:standards (list "N-Q" "F-IF.1-3" "F-IF.4-6" "F-LE.5" "BS-IDE" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVQTg2b2ZRQ2E0ZWc" "Intro to Big-Bang"] file preloaded on students' machines}
                                 @item{next-world, big-bang, and draw-world nametags}
                                @item{cutout image of dog}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now let's talk about animation. We'll start off with a really simple example that only uses Numbers, and gradually build up to 
                                using Data Structures. Suppose we want a simple animation of a fish, swimming across the screen from left-to-right. We can imagine
                                a series of frames, where the fish is a little further to the right in each frame:
                                @bitmap{images/frames.png}
                                }
                        @teacher{}
                        }
                 @point{@student{Behind-the-scenes, this animation is really just a single Number: the x-coordinate of the fish! For each x-coordinate, there's
                                 a simple mapping between the number and what picture is drawn onscreen. In fact, we could write a function that takes in the
                                 x-coordinate and puts the fish image at the right place. Let's call this function @code{draw}. 
                                 @bitmap{images/frames-with-draw.png}
                                 }
                         @teacher{For practice, have students try writing @code{draw} using an image of their own.}
                         }
                 @point{@student{There's also a mapping from one frame to the next: each x-coordinate is just 20 more than the previous one! That means there's
                                 also a mapping between the number for one frame and the next. We could express this with a function, too, which takes in
                                 the x-coordinate and produces the @italic{next} x-coordinate.
                                 @bitmap{images/frames-with-next.png}
                                 }
                         @teacher{For practice, have students try writing @code{draw} using an image of their own.}
                         }
                 @point{@student{If we put these functions together, we have all the ingredients in place to make an animation, using only a simple Number to
                                 keep track of our data!
                                 @bitmap{images/frames-everything.png}}
                         @teacher{}
                         }
                 @point{@student{Let's take a look at a Pyret program that does exactly that...
                                @activity[#:forevidence (list "N-Q&1&1" "F-IF.1-3&1&1" "F-LE.5&1&1")]{Open the @editor-link[#:public-id "0B9rKDmABYlJVQTg2b2ZRQ2E0ZWc" "Intro to Big-Bang"] program and read the code with
                                          your partner. Can you answer the questions below? 
                                          @bitmap{images/draw-world.png}
                                                   @itemlist[@item{Lines 7-19 define several values. What are their names?}
                                                              @item{Are these values Numbers, Strings or Images?}
                                                              @item{There are two functions defined farther down in the file. What are their names?}
                                                              @item{Scroll down to where the code says @code{"GRAPHICS FUNCTIONS"} (line 22).}
                                                              @item{What is the name of the function defined in this section?}
                                                              @item{What is the Domain of this function? The Range?}
                                                              @item{According to the purpose statement, what does this function do?}]}
                                 Every time @code{draw-world} runs, it gives back an image of the Dog, sitting on the Background at a certain location.
                                 Now look at the body of @code{draw-world}. It's using a function you might remember, called @code{put-image}, which takes
                                 in an image, and then places it on top of another image, using the x- and y-coordinates to determine where to put it. In this example, it 
                                 is placing the @code{DOG} onto the @code{BACKGROUND}. Notice that it's using the number @code{400} for the dog's y-coordinate,
                                 and the variable @code{current-world} as dog's x-coordinate. As the value of @code{current-world} changes, the dog will appear
                                 to move across the screen. The dog will appear to move to the right if this value gets larger, or to the left if it gets smaller.
                                
                                @activity[#:forevidence (list "N-Q&1&1" "F-IF.1-3&1&1" "F-LE.5&1&1" "F-IF.4-6&1&1" "F-IF.4-6&1&3")]{@bitmap{images/next-world.png}
                                          @itemlist[@item{Scroll down to where the code says @code{"UPDATING FUNCTIONS"} (line 32).}
                                                     @item{What is the name of the function defined in this section?} 
                                                     @item{What is the Domain of this function? The Range?}
                                                     @item{According to the purpose statement, what does this function do?}
                                                     @item{Will this function's output be larger than its input, or smaller?}]}
                                Every time @code{next-world} runs, it gives back a new number that is 10 larger than the number it was given.
                                }
                                
                        @teacher{These activities encourage students to read others' code and think about how it works, looking at the contracts and definitions and 
                                 piecing together what they already know. Ask a LOT of questions when going through the file: Why is @code{dogX} a good variable name? 
                                 What will @code{draw-world(10)} produce? @code{draw-world(NumberA)}? What about @code{update-world(1000)}? @code{update-world(NumberB)}?
                                 }
                        }
                 
                 @point{@student{@code{draw-world} doesn't know what the next world should be, and @code{next-world} has no idea how a world should be drawn. 
                                 They'll have to work together - in just the right way - to make sure the animation is smooth. Let's act this out in the real world
                                 to see what's going on.
                                 @activity[#:forevidence (list "BS-W&1&1" "BS-W&1&2")]{This activity will need two volunteers, a print-out of the dog and some pieces of paper. The wall will represent
                                           our game screen, with (0,0) being at the bottom left-hand corner of the wall. One volunteer
                                           will be @code{draw-world}. Their job is to put images onto the wall, at the appropriate location.
                                           When handed a @code{current-world} (a number, written on a piece of paper), they will stick the dog
                                           on the wall at the location (@italic{current-world}, 400). @code{next-world} has a different job: when they recieve a
                                           @code{current-world}, they will write a @italic{new} world (on another piece of paper) that is 10 larger than the one they
                                           were given.}
                                 }
                         @teacher{This activity needs to be @bold{very} carefully explained, so it's worth practicing giving instructions before you 
                                  try it in the classroom. First, be sure to designate a part of the wall to be the "background", and be sure to label 
                                  the coordinates of the corners. Second, it's helpful to create simple signs or nametags for your student volunteers,
                                  to designate which one is @code{draw-world} and which is @code{next-world}. Hand out slips of paper to the class and let
                                  them create different "worlds", and let them take turns handing each of these "worlds" to your volunteers. Don't move on
                                  until you're confident that the class understands what each function does, separately.}
                         }
                         
                 @point{@student{At this point, we have all the workers needed to make a simple animation:
                                 @itemlist[@item{@code{BACKGROUND-IMG, DOG-IMG}, etc. are all Image values that we can use for our animation.}
                                            @item{@code{draw-world} is a function that will draw a single frame of our animation, using a single number as input.}
                                            @item{@code{next-world} is a function thay will take the current world as input, and figure out what the
                                                   next world should be.}
                                            @item{We also know that @italic{time} is passing, and every second or so we'd like to see the next frame in our animation.}]
                                 What we're missing is a way to pull all of these workers together, so that they work in concert to create our animation.}
                         @teacher{OPTIONAL: Can your students brainstorm a pattern for each function to be called over time, in order to make the dog move across the wall?}
                         }
                 @point{@student{@bannerline{The Hollywood Principle: "Don't call us, we'll call you!"}
                                 In film-making, there's a saying: "Don't call us, we'll call you." Having @code{next-world} and @code{draw-world}
                                 fighting with one other is just going to cause chaos - we need a director, who will let each one know when it's time to do
                                 their job. In programming, this is called the "Hollywood Principle," and it is exactly how we're going to make the animation 
                                 work in our programs. The director is called @code{big-bang}, and its job is to call
                                 each function when it's time for something to happen. @code{big-bang} needs a world to begin, so the very first thing we
                                 do is pass a @italic{starting world} to @code{big-bang}. If that's all we do, then the world will never change over time.}
                         @teacher{Dramatically reveal the "big-bang" sign or nametag. Have a student volunteer to be @code{big-bang}, and start out
                                  by randomly-selecting a student to hand @code{big-bang} their "world". TIP: snap your fingers every 5 seconds,
                                  to demonstrate the passage of time. Students should see that the world doesn't change, no matter how much time has passed.
                                  Repeat for different students, so the class sees that the world can be @italic{any} starting value.}
                         }
                 @point{@student{The first thing we need to do is have @code{big-bang} call @code{next-world} every few seconds, passing the current world
                                 to that function and then holding whatever is returned. Now, every five seconds, @code{big-bang} will pass the world they are
                                 are holding over to @code{next-world}. @code{next-world} will produce a new piece of paper with the new value, and hand it
                                 back to @code{big-bang.} The process repeats on and on and on...}
                         @teacher{Have your students model this for the class, and encourage the whole classroom to say "tick" every 5 seconds.}
                         }
                 @point{@student{Now we can see the world changing, but we haven't used it to draw each frame yet. When should @code{big-bang} call
                                 @code{draw-world}? Every time a new world is produced, @code{big-bang} will hand it over to @code{draw-world}, which
                                 will use it to place the dog on the background.}
                         @teacher{Have students act this out.}
                         }
                 @point{@student{On your computers, scroll down to line 42, which include some comments and an example of using @code{big-bang}. 
                                 According to this code, what starting world is @code{big-bang} taking in? Try clicking "Run", to see what happens.
                                 Just as in our role-play, @code{big-bang} will happily display the current world forever, even as time passes. Try
                                 passing in different values besides @code{numberA} and see what happens. What we need to do is tell @code{big-bang} 
                                 which @vocab{events} to listen to, and which functions to call when those events occur. 
                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-W&1&1" "BS-W&1&2" "BS-W&1&3" "BS-W&1&4" "BS-W&1&5")]{@bitmap{images/big-bang.png}
                                   Uncomment line 49 by remove the @code{#} mark from the beginning of the line. Now @code{big-bang} will
                                           call @code{next-world} with the current world every time there is a "tick" event.
                                           @itemlist[@item{What do you think will happen when you click "Run"?}
                                                      @item{Try it out - did you see what you expected?}
                                                      @item{What will happen if you use a different starting value for the world?}
                                                      @item{What will happen if you change @code{next-world} so that it @italic{subtracts} 10,
                                                           instead of adding?}]
                                           Now try uncommenting line 50. This will tell @code{big-bang} who to call when it's time to draw the
                                           world.
                                           @itemlist[@item{What do you think will happen when you click "Run"?}
                                                      @item{Try it out - did you see what you expected?}
                                                      @item{What will happen if you use a different starting value for the world?}
                                                      @item{What will happen if you change @code{draw-world} so that it draws the @code{COIN-IMG}
                                                            instead of the @code{DOG-IMG}?}
                                                      @item{What will happen if you change @code{draw-world} so that uses the @code{current-world}
                                                            as the @italic{y-coordinate}, rather than the x-coordinate?}]
                                           }
                                 }
                         @teacher{Let students experiment here, challenging them to come up with the coolest @code{next-world} and @code{draw-world}
                                  functions.}
                         }
                  @point{@student{@code{big-bang} and The Hollywood Principle are all part of a programming paradigm used all over the world, called 
                                  @vocab{Event-Based Programming}. In Event-Based Programming, your program is just a chunk of data - called a "World"
                                  - which is changed whenever certain events fire. So far, the only events you know about are things like tick-events
                                  and draw-events, but you can imagine building other functions to handle key-events or mouse-events in your game 
                                  (this is also closely related to the Model-View-Controller pattern used to build professional systems.).
                                  However, the world that we're using here is just a single Number. What if we wanted to have both the Dog and the Coin
                                  in our animation, moving at different speeds? We'd need a way for the world to be @italic{two numbers}. To pull this 
                                  off, we'll need to combine Event-Based Programming with another concept we've learned...}
                          @teacher{Solicit student guesses for how to do this, reminding them of the last time they were confronted with this problem
                                   - during the Parachute Jumper exercise. The solution here is the same as it was there: Data Structures to the rescue!}
                          }
                 ]
         }
@lesson/studteach[#:title "Extending the World"
        #:duration "45 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will create a data structure for their animation}
                                        @item{Students will modify @code{draw-world} to add the coin, clouds and Ninja Cat.}
                                         @item{Students will iteratively expand the World structure, and trace these changes throughout their program}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students codewalk through a simple version of the Ninja Cat game, creating a new @code{World} data structure and adding animation}]
        #:standards (list "N-Q" "7.EE.3-4&1&1" "A-SSE.1-2&1&1" "BS-IDE" "BS-PL.1" "BS-PL.3" "BS-DS.1" "BS-DS.2" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{If we want the Dog and the Coin to be moving independently, we'll need a Word that is more than just one number. Specifically,
                                we'd like to be able to track the Dog's x-coordinate and the Coin's x-coordinates seperately. We need to make a data structure
                                that will contain both a dogX and a coinX. 
                                Let's add a @code{data:} block to the top of the file, declaring a World to contain both a @code{dogX} and a @code{coinX}. We'll
                                also make two sample Worlds, just for practice:
@code[#:multi-line #t]{
# The World is the x-coordinate of the dog and coin.
data World:
  | world(
      dogX  :: Number,
      coinX :: Number
      )
end

# Two sample worlds
worldA = world(0, 400)
worldB = world(200, 1000)
}
                                @activity[#:forevidence (list "N-Q&1&1" "BS-PL.1&1&2" "BS-PL.3&1&1" "BS-DS.1&1&1" "BS-DS.1&1&2" "BS-DS.1&1&3" "BS-DS.1&1&4")]{Type this into your programs, and answer the following questions:
                                          @itemlist[@item{What is the name of the @vocab{type} that is created by this data block?}
                                                     @item{What is the @vocab{constructor function} that makes a @code{World}?}
                                                     @item{How many inputs does the constructor take, and what are their types?}
                                                     @item{What type of data is @code{worldA}?}
                                                     @item{How would you get the @code{dogX} out of @code{worldA}?}
                                                     @item{How would you get the @code{coinX} out of @code{worldB}?}
                                                     @item{Define two new worlds, @code{worldC} and @code{worldD}.}]}
                                          }
                        @teacher{}
                        }
                 @point{@student{Now we need to modify the rest of our code so that is uses @italic{World}s instead of @code{Numbers}. Let's
                                 start with @code{draw-world}. Before adding the coin, let's first make sure the dog still moves now that
                                 we're using a structure for our World.
                                 @activity[#:forevidence (list "BS-DS.1&1&5" "BS-W&1&5")]{@itemlist[@item{Will the name of this function have to change? What about the Domain? The Range?}
                                                      @item{How will the purpose statement have to change?}
                                                      @item{Before, the body of function used @code{current-world} as the Dog's x-coordinate.
                                                            Now @code{current-world} is a World. How do we get the @code{dogX} out of that 
                                                            world?}
                                                      @item{Fix the code so that @code{current-world.dogX} is used to display the dog.}]}
                                 }
                         @teacher{Remind students that this is @italic{just about making the Dog move} - the Coin will come later!}
                         }
                 @point{@student{Now let's look at @code{next-world}. It's written to consume Numbers and produce Numbers, but now
                                 we need to change it to use Worlds instead.
                                 @activity[#:forevidence (list "BS-DS.1&1&4" "BS-DS.1&1&5" "BS-W&1&5")]{@itemlist[@item{Will the name of this function have to change? What about the Domain? The Range?}
                                                      @item{How will the purpose statement have to change?}
                                                      @item{The Range says we need to produce a new World. What function makes Worlds?}
                                                      @item{Use the @code{world} constructor to produce a new World, where the dog's
                                                            x-coordinate is 10 pixels to the right and the coin's x-coordinate is 5 pixels
                                                            to the left:}]
@code[#:multi-line #t]{
# next-world:  World -> World
# Add 10 to the dog's x-coordinate, subtract 5 from the coin's x
fun next-world(current-world): 
  world(current-world.dogX + 10,
        current-world.coinX - 5)
end}
}
                                 }
                         @teacher{This is a great opportunity to have students practice their vocabulary for working with structures.
                                  The revised @code{next-world} functions uses a @vocab{constructor function} and two @vocab{dot-accessors}.}
                         }
                 @point{@student{Finally, we need to change @code{big-bang} to use our new world structure.
                                 @activity[#:forevidence (list "BS-IDE&1&1" "BS-W&1&3" "BS-W&1&5")]{@itemlist[@item{Does the initial value given to @code{big-bang} need to change? If so, why?}
                                                      @item{Are we still calling @code{next-world} on tick-events?}
                                                      @item{Are we still calling @code{draw-world} on draw-events?}
                                                      @item{Make the changes you think are necessary, and click "Run". If everything
                                                            checks out, you should see your original animation, now using the new
                                                            World structure.}
                                                      @item{What happens if you change the starting World given to @code{big-bang}?
                                                            Try using @code{worldA}, @code{worldB}, etc. and see what happens!}]}
                                 }
                         @teacher{}
                         }
                                 
                 @point{@student{@bitmap{images/NWorld2.png}
Now it's time to add other images to our animation. Putting the Coin aside for a moment, let's try adding the 
                        Cloud for practice.
                        @activity[#:forevidence (list "7.EE.3-4&1&1" "A-SSE.1-2&1&1" "BS-IDE&1&1")]{How could you use @code{put-image} to place @code{CLOUD-IMG} onto the @code{BACKGROUND-IMG} 
                                  at position (500, 400)?
                                 
@code[#:multi-line #t]{
# draw-world:  World -> Image
# Place DOG-IMG and CLOUD-IMG onto BACKGROUND-IMG at the right coordinates
fun draw-world(current-world): 
  put-image(
    CLOUD-IMG, 
    500, 400,
    put-image(
      DOG-IMG, 
      current-world, 400, 
      BACKGROUND-IMG))
end}
Now try adding the @code{COIN-IMG}, this time at (250, 300).}
                        }                          
                 @teacher{Since this is their first time using @code{put-image} themselves, write the code to add the @code{CLOUD-IMG}
                          with the kids. They'll have time to practice on their own once they add the @code{COIN-IMG}. This is a good
                          time to offer some tidbits about "beautiful" code: point out the "staircase" pattern that develops when you
                          put images on top of one another. Challenge strong students to also add the Cat.}
                 }
                 
                 @point{@student{Now you've got the Cloud and the Coin sitting on screen, while the Dog moves to the right. But we also
                                 want to see that Coin moving as well, so our work isn't finished! Remember, the @code{current-world}
                                 now includes both a @code{dogX} and a @code{coinX} - we just need to use the @code{coinX} to figure 
                                 out where to put that image!
                                 @activity[#:forevidence (list "7.EE.3-4&1&1" "A-SSE.1-2&1&1" "BS-IDE&1&1" "BS-DS.1&1&5" "BS-W&1&5")]{Modify the code for @code{draw-world} so that the @code{COIN-IMG} is placed using the
                                           @code{coinX} from @code{current-world}. When you click "Run", you should see the dog
                                           move to the right and the coin move to the left! What will happen if you change the initial
                                           World that is given to @code{big-bang}?}
                                 }
                         @teacher{For strong students, challenge them to modify the @code{World} structure to also contain a 
                                  @code{cloudX}, and modify the rest of the code so that the clouds move on their own.
                         }
                         }
                 @point{@student{Suppose you wanted to add the Cat's x-coordinate to this animation, so it could move to the right.
                                 What would you have to change about the @code{World} structure? What about the @code{draw-world}
                                 and @code{next-world} functions? Suppose you also wanted to have the Cat move up and down - what
                                 would you change then?}
                         @teacher{}
                         }
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-DS.1&1&5" "BS-DS.2&1&3")]{Modify the @code{World} structure to include the cat's x- and y-coordinate, then change
                                           @code{draw-world} to place the cat into the image. (Note: since the cat will eventually respond to keypresses, and not move
                                           on it's own, it will just sit still for now.)}
                                  @code{next-world} is responsible for everything in our game that @italic{changes on its own},
                                  in response to time just naturally passing by. We want the cat to move in response to a key being
                                  pressed, which is just another kind of event. In the next lesson, you'll learn how to add
                                  a new function that will build Worlds in response to keypresses!}
                         @teacher{}}]
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
        @points[@point{@student{Now you have the basic building blocks of a simple Ninja Cat game and an understanding of how @code{draw-world}, 
                               @code{next-world}, and @code{big-bang} work together to create an animation in Pyret. In the next unit you'll include another event-handler to make the cat respond to key presses.}
                       @teacher{}}
                 ]
         }
       }