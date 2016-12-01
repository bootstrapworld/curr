#lang curr/lib
@declare-tags[]

@title{Unit 3: Structures, Reactors, and Animations}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Cake" @code{cake .flavor .color .message .layers .is-iceCream}))]{

@unit-descr{Students, having worked with pre-made data structures in the last lesson (Cakes), generalize their understanding by defining more data structures of their own, accessing their fields, and writing functions that produce them. 
}
}
@unit-lessons{
@lesson/studteach[#:title "Animations in Pyret (still need to fix lesson metadata)"
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
        @points[
	
	@point{@student{You've learned how to create data structures, and how to create images. Now it's time to put these together to create an animation in Pyret.  We'll even go a step further than what we did in Bootstrap:1, creating an animation with movement in two dimensions.}
	       @teacher{}}
	@point{@student{In Bootstrap:1, many decisions about your animation were made for you. We told you how many characters you had and which aspects of them could change during the animation.  The danger always moved in the x-axis, the player always moved in the y-axis.  In Bootstrap:2, we give you much more control of your game: you decide how many characters you will have, and what aspects of them can change (position, color, size, etc).  In order to have this flexibility, we need to do a little more work to set up the animation.  Let's break down an animation to see what we need.}
	       @teacher{}}
	@point{@student{Let's create an animation of a sunset.  The sun will start at the top-left corner of the screen and fall diagonally down and right across the sky.
                        In Bootstrap:1, we talked about how an animation is made of a sequence of images that we flip through quickly.
                        We continue to think of an animation as a sequence of images in Bootstrap:2. In order to see a sunset, we need a sequence of images like the following
                       [INSERT PICTURE].
                       Flipping through them would yield the following animation [CAN WE EMBED A VIDEO OF THIS RUNNING?].}
	       @teacher{}
	       }
	@point{@student{Where will we get this sequence of images? We don't want to create them all by hand. Instead, we want to write functions that will create them for us.
                        This is the power of computer programming.  It can automate tasks (like creating new images) that might otherwise be tedious for people to do.}
	       @teacher{This is a key point at which to emphasize why functions are important to computer science. Computers are good at repetition, but they need instructions
                        telling them what steps to repeat.  Functions capture those instructions.}
	       }
	@point{@student{In order to create these images, we first have to figure out what information changes between images (during the animation).
               @activity{What information is changing from frame to frame of this animation? What is fixed?  Fill in [FILL PART NUMBER] an animation design worksheet with this information.}
	       There are two pieces of information changing across the sunset images: the x-coordinate of the sun and the y-coordinate of the sun.
               Given these two pieces of information, we could draw an image that puts the sun at those coordinates. More interestingly, however, we could compute the
               coordinates of the sun in the next frame. By repeating these two steps--drawing an image of the sun at coordinates and computing the next set of coordinates,
               we can generate an entire animation!}
	       @teacher{}}
        @point{@student{Understanding the interaction between drawing and computing new coordinates is essential for understanding how an animation works.
                        The following image gives an example [PUT IN IMAGE OF DRAW-WORLD/NEXT-WORLD WITH EXPLANATION].}
               @teacher{}}
	@point{@student{Summarizing what we have seen so far, we have to write three things in order to make an animation:
                        @itemlist[#:style 'ordered
                           @item{Create a state structure to hold the information that changes across frames. This information is called the @vocab{state}.}
                           @item{Write a function to generate a new state from a given state (we'll call this @code{next-state-tick}).}
                           @item{Write a function to generate an image of the current state (we'll call this @code{draw-state}).}
                        ]
                        Let's work on these one at a time.
                        }
               @teacher{}}
        @point{@student{
	       @activity{Create a data structure named @code{SunsetState} that holds the x-coordinate of the sun and the y-coordinate of the sun.}
               You should have come up with something like this: a data block with numbers for the two coordinates.
                @code[#:multi-line #t]{# a SunsetState has the x-coordinate of the sun and the y-coordinate of the sun
		      data SunsetState:
		       | sunset(
		           xpos :: Number,
			   ypos :: Number
			   )
		       end}
		  }
		@teacher{We are adopting a convention here, in which we include "State" in the name of the data block, then use the same base name (without "State") for the constructor.
                         By not conflating the names here, students should have an easier time distinguishing between the constructor name and data structure name.}
		}
	 @point{@student{@activity{For each of the sunset images that you drew [CURRENTLY NO POINT ABOVE DOES THIS] above, write down the @code{SunsetState} instance that corresponds to that image.}
                         For example, when the sun is at the top-left corner, you might have written
                         @code[#:multi-line #t]{sunset(10, 15)}
                         }
	       @teacher{}}
	@point{@student{You now have a data structure for the state of your animation.  Next, create a function that computes the next state of the
                        animation from a given state.  In the case of sunset, this function should produce a new @code{SunsetState} instance that has fallen a bit in the sky
                        from the given one. Across all of our animations, we will call this function @code{next-state-tick}.
                        @activity{Using the @code{SunsetState} instances that you wrote under the frames above, write two examples of the @code{next-state-tick} function.
                         [WHICH WORKSHEETS IF ANY TO REFERENCE HERE?].}
                        }
	       @teacher{}}
	@point{@student{@activity{Finish the design recipe and write @code{next-state-tick}. [UPDATE ONCE AGREE ON WORKSHEETS]}
                         Don't forget to test you @code{next-state-tick} function in the interactions window.}
	       @teacher{}}
	@point{@student{Now let's write @code{draw-state}, which takes a @code{SunsetState} and draws the sun at the state's coordinates.
                       @activity{Fill in a Design Recipe [CHECK] worksheet for @code{draw-state}.}
                       [DO WE TEND TO PUT THE SOLUTIONS IN HERE FOR THE FIRST ANIMATION??]
                       }
	       @teacher{}}
	@point{@student{Let's try some expressions in the interactions window to show you how these two functions work together to create an animation.
                        @activity{Enter each of these expressions in the interactions window in turn [CHECK SYNTAX] [GO THROUGH NAMES OR NESTED EXPRESSIONS HERE?]:
                                  @itemlist[@item{draw-state(sunset(10,15))}
                                            @item{next-state-tick(sunset(10,15))}
                                            @item{draw-state(next-state-tick(sunset(10,15)))}
                                            @item{draw-state(next-state-tick(next-state-tick(sunset(10,15))))}
                                           ]}
                        Do you see the series of images that you are creating? Do you see the sun moving down a bit across each one?  If we had a long
                        sequence of these images, we'd have our sunset animation.
                       }
	       @teacher{}}
	@point{@student{Of course, we don't want to have to call these functions by hand to try to create an animation.  We want Pyret to do that for us
                       (it will be faster, and the sun will appear to move that way).  We tell Pyret to make an animation by creating something called a
                       @vocab{reactor}.  Here's an example:
	           @code[#:multi-line #t]{
		     r = reactor:
                       init: sunset(10,15),
                       on-tick: next-state-tick,
                       to-draw: draw-state
                     end}
		       [NEED TO TALK ABOUT INITIAL SUN POSITION]
		       [NEED TO SHOW HOW TO RUN A REACTOR]
		       When you start a reactor, Pyret starts an animation. It uses the function you labeled @code{to-draw} to draw the initial state, then calls the function you labeled @code{on-tick} to generate the next state.  Pyret repeatedly calls these two functions (the on-draw and on-tick functions) to draw a state, compute the next one, draw the new state, compute the next one, and so on.
		       @activity{Write out the series of calls that Pyret makes to @code{draw-state} and @code{next-state-tick}, starting from an initial state of [FILL IN], until 4 images have been created.}
	               @activity{Need an activity that gives students a file with multiple next-state-tick and draw-state functions.  Give them combos and ask them to predict what the resulting animation will look like.}
	               }
	       @teacher{}}
	@point{@student{You have just seen the incredible power of functions in programming! Functions let us @italic{generate content automatically}. In the early days of making cartoons,
                        artists drew every frame by hand.  They had to decide at the beginning how many frames to create. Here, we let the computer generate as many frames as we want,
                        by letting it call @code{next-state-tick} over and over until we stop the animation.  If we want to slow down the sunset, we simply change the new coordinates
                        within @code{next-state-tick}.  If we start with a larger screen size, the computer will continue to generate as many images as we need to let the sun drop out of the window.
                        The computer can give us this flexibility as long as @italic{we provide a function that tells the computer how to generate another frame}.
	@activity{[QUESTION]Is it worth having an activity that has students compute how many frames are needed to get the sun off the screen under different next-state-tick and initial screen size computations?}
	       }
	       @teacher{}}
	@point{@student{You have also seen the steps to creating an animation. They are broken out in the Animation Template [NEED NAME -- THIS IS THE THING WITH SPACES FOR THE DATA STRUCT,
                        DRAW, NEXT, INIT, AND REACTOR PARTS -- IS THIS A WORKSHEET, A TEMPLATE FILE, SOMETHING ELSE?].  Whenever you want to create an animation, you will define these five pieces.}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	       ]
	       }
         
	       
@lesson/studteach[#:title "Designing Data Structures for Animations (metadata needs to be fixed)"
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
        @points[
      	@point{@student{You've learned the components of an animation in Pyret. The data structure for the state lies at the heart of the animation: each of the initial state, the @code{draw-state} function and the @code{next-state-tick} function are based on the data structure you choose. Being able to figure out the data structure you need for an animation is therefore a critical skills in making your own animations.  In this lesson, we are going to practice identifying the data and creating the data structures for various animations. We will not write the entire animation.  We are just going to practice identifying the data.}
	       @teacher{Figuring out the data structure is one of the most creative tasks in programming.  SAY MORE ABOUT WHY THIS IS IMPORTANT AND INTERESTING.}}
	@point{@student{Look at this animation of a cow jumping over the moon.
	                @activity{Fill in the first part of an animation-design worksheet, drawing three individual frames.}
			Which frames did you pick?  Is the cow at the same height in each one, or did you pick frames at at least two different heights?  Choosing images with some variation will help you think through the data in your animation.
			@activity{What information is changing across the frames?}
			In this case, the cow's x-coordinate and y-coordinate are both changing.
			@activity{Write a data structure @code{CowState} to capture the data in this animation.}
			}
	       @teacher{}}
	@point{@student{Do "Falling" from the revisions sheet.  Point out that need one coordinate per character.  Shows multiple characters, and that don't always need both x and y coordinates.}
	       @teacher{}}
	@point{@student{Look at this animation of a star that pulses as it moves across the sky.
	                @activity{Fill in the first part of an animation-design worksheet, drawing three individual frames.}
			Which frames did you pick?  Is the star always getting smaller or always getting larger across your frames, or did you have it get smaller between two frames and larger between two other frames?  Choosing images that illustrate the various behaviors of the animation will help you think through the data that you need.
			@activity{What information is changing across the frames?}
			As in previous animations, the star's x-coordinate and y-coordinate are both changing. However, the star's size is also changing.
			@activity{Write a data structure @code{StarState} to capture these three pieces of data.}
			Even though we aren't going to write the entire animation, thinking about examples of @code{next-state-tick} can help us check whether our data struture has all the information it needs.  Assume you had the following @code{StarState} structure and were trying to write examples for the @code{next-state-tick} function.  Can you fill in the right side of the example?
			[INSERT Data block and an example next-state-tick(star-data(100, 125, 25)) is _______________]
			This example is interesting because we don't know whether the star is getting larger or smaller.  The size is enough information to @italic{draw} the frame, but it isn't enough to compute the @code{next} frame.  To compute the next state, our data structure also needs to know whether the star is growing or shrinking.
			@activity{Edit your @code{StarState} to capture information about the direction the star is growing.}
			}
	       @teacher{Different ways to capture growth -- boolean, number that use to multiply, string -- good chance for a design discussion [FILL AND FINISH]}}
	@point{@student{Light Dimmer -- point here is that two visual effects might be due to the same variable.}
	       @teacher{}}
	@point{@student{For a real challenge, do single-paddle pong}
	       @teacher{}}
         ]}
       

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
        @points[@point{@student{You've learned how to create an animation in Pyret. You saw how having control of drawing the state lets you create interesting effects like changing the color of the sun.  You've gotten a hint that you can make states with any information you want.  In upcoming lessons, we will make use of this to do even more interesting animations.}
                        @teacher{Have students volunteer what they learned in this lesson}}
                        
                        ]}

       
}

  

