#lang curr/lib
@declare-tags[]

@title{Unit 3: Structures, Worlds, and Animations}

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
	@point{@student{Let's create an animation of a sunset.  The sun will start at the top-left corner of the screen and fall diagonally down and right across the sky. [ASSUME WE DEFER THE LAND UNTIL LATER, SINCE THAT'S ONLY A DRAW ISSUE]. In Bootstrap:1, we talked about how an animation is made of a sequence of images that we flip through quickly. We continue to think of an animation as a sequence of images in Bootstrap:2. In order to see a sunset, we need a sequence of images like the following [INSERT PICTURE].  Flipping through them would yield the following animation [CAN WE EMBED A VIDEO OF THIS RUNNING?].}
	       @teacher{}
	       }
	@point{@student{Where will we get this sequence of images? We don't want to create them all by hand. Instead, we want to write functions that will create them for us. This is the power of computer programming.  It can automate tasks (like creating new images) that might otherwise be tedious for people to do.}
	       @teacher{}
	       }
	@point{@student{In order to create these images, we first have to figure out what information changes between images.
               @activity{What information is changing from frame to frame of this animation? What is fixed?  Fill in an animation design worksheet with this information. [MAY NEED TO SCAFFOLD THIS AS WE DO IN BS1]}
	       There are two pieces of information changing across these images: the x-coordinate of the sun and the y-coordinate of the sun. Given these two pieces of information, we could draw an image that puts the sun at those coordinates. More interestingly, however, we could compute the coordinates of the sun in the next frame. By repeating these two steps--drawing an image of the sun at coordinates and computing the next set of coordinates, we can generate an entire animation.  The following picture shows the sequence [PUT IN IMAGE OF DRAW-WORLD/NEXT-WORLD].}
	       @teacher{}}
	@point{@student{The first step in writing functions to generate sunset images is to have a data structure for the sun's coordinates.
	       @activity{Create a data structure that holds the x-coordinate of the sun and the y-coordinate of the sun.}
               You should have come up with something like this [DECIDE TERMS -- WORLD, DATA, ETC]:
                @code[#:multi-line #t]{# a SunsetData has the x-coordinate of the sun and the y-coordinate of the sun [PHRASE EACH COORD SEPARATEY LIKE THIS?]
		      data SunsetWorld:
		       | sunset-data(
		           xpos :: Number,
			   ypos :: Number
			   )
		       end}
		  }
		@teacher{}
		}
	 @point{@student{Here is a [GIVE DESCRIPTIVE NAME] worksheet showing three consecutive images in a sunset animation.  Under each image, we have written down the x-coordinate and y-coordinate of the sun in that image. 
	     @activity{In the [FILL] section, write the instance [VOCAB CHECK] of @code{SunsetWorld} that captures the coodinates of each image.}
		 }
	       @teacher{}}
	@point{@student{Now we want to develop a function @code{next-world} that generates the @code{SunsetWorld} for each frame from the @code{SunsetWorld} in the previous frame. Using the @code{SunsetWorld} instances [VOCAB] that you wrote under the frames above, write two examples of the @code{next-world} function.  [THIS NEEDS A BIT MORE SETUP TO FIT INTO THE FULL DESIGN RECIPE, BUT THIS IS THE IDEA].}
	       @teacher{}}
	@point{@student{Follow the design recipe and write @code{next-world}.}
	       @teacher{}}
	@point{@student{JOE -- would you introduce reactors and traces here, or should we just do @code{draw-world}.}
	       @teacher{}}
	@point{@student{Develop @code{draw-world}.}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	@point{@student{Now we start to see how an animation gets built:
	         @itemlist[@item{We define a data structure for the information that changes across frames.}
		           @item{We write a @code{next-world} function that consumes the data for one frame and produces the data for the next.}
			   @item{We write a @code{draw-world} function that consumes the data for one frame and produces an image for it.}
			   ]
	         An animation comes from combining @code{next-world} and @code{draw-world}.  We start with an initial world (here, the sun in the top-left corner).  @code{Draw-world} produces an image of the initial world. Calling @code{next-world} generates the world for the next frame. Using @code{draw-world} creates an image for that frame.  Then @code{next-world} generates the world for the third frame, and so on. If we know how to alternately call @code{draw-world} and @code{next-world} over and over, we would get a sequence of images that make up the animation.  But how do we call these functions?}
	       @teacher{}}
	@point{@student{You don't call these functions directly.  Instead, you tell Pyret that you want to build an animation using these two functions. You do this by creating something called a @vocab{reactor}, as follows:
	           @code[#:multi-line #t]{
		     r = reactor:
                       init: sunset-data(10,15),
                       on-tick: next-world,
                       to-draw: draw-world
                     end}
		       [NEED TO TALK ABOUT INITIAL SUN POSITION]
		       [NEED TO SHOW HOW TO RUN A REACTOR]
		       When you start a reactor, Pyret starts an animation. It uses the function you labeled @code{to-draw} to draw the initial world, then calls the function you labeled @code{on-tick} to generate the next world.  Pyret repeatedly calls these two functions (the on-draw and on-tick functions) to draw a world, compute the next one, draw the new world, compute the next one, and so on.
		       @activity{Write out the series of calls that Pyret makes to @code{draw-world} and @code{next-world}, starting from an initial world of FILL IN, until 4 images have been created.}
	               @activity{Need an activity that gives students a file with multiple next-world and draw-world functions.  Give them combos and ask them to predict what the resulting animation will look like.}
	               }
	       @teacher{}}
	@point{@student{You have just seen the incredible power of functions in programming! Functions let us @italic{generate content automatically}. In the early days of making cartoons, artists drew every frame by hand.  They had to decide at the beginning how many frames to create. Here, we let the computer generate as many frames as we want, by letting it call @code{next-world} over and over until we stop the animation.  If we want to slow down the sunset, we simply change the new coordinates within @code{next-world}.  If we start with a larger screen size, the computer will continue to generate as many images as we need to let the sun drop out of the window. The computer can give us this flexibility as long as @italic{we provide a function that tells the computer how to generate another frame}.
	@activity{Is it worth having an activity that has students compute how many frames are needed to get the sun off the screen under different next-world and initial screen size computations?}
	       }
	       @teacher{}}
	@point{@student{You have also seen the steps to creating an animation. They are broken out in the Animation Template [NEED NAME -- THIS IS THE THING WITH SPACES FOR THE DATA STRUCT, DRAW, NEXT, INIT, AND REACTOR PARTS -- IS THIS A WORKSHEET, A TEMPLATE FILE, SOMETHING ELSE?].  Whenever you want to create an animation, you will define these five pieces.}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	@point{@student{}
	       @teacher{}}
	       ]
	       }
	       
@lesson/studteach[#:title "Designing Worlds for Animations (metadata needs to be fixed)"
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
      	@point{@student{You've learned the components of an animation in Pyret. The data structure for the world lies at the heart of the animation: each of the initial world, the @code{draw-world} function and the @code{next-world} function are based on the data structure you choose. Being able to figure out the data structure you need for an animation is therefore a critical skills in making your own animations.  In this lesson, we are going to practice identifying the data and creating the data structures for various animations. We will not write the entire animation.  We are just going to practice identifying the data.}
	       @teacher{Figuring out the data structure is one of the most creative tasks in programming.  SAWY MORE ABOUT WHY THIS IS IMPORTANT AND INTERESTING.}}
	@point{@student{Look at this animation of a cow jumping over the moon.
	                @activity{Fill in the first part of an animation-design worksheet, drawing three individual frames.}
			Which frames did you pick?  Is the cow at the same height in each one, or did you pick frames at at least two different heights?  Choosing images with some variation will help you think through the data in your animation.
			@activity{What information is changing across the frames?}
			In this case, the cow's x-coordinate and y-coordinate are both changing.
			@activity{Write a data structure @code{Cow-World} to capture the data in this animation.}
			}
	       @teacher{}}
	@point{@student{Do Falling from the revisions sheet.  Point out that need one coordinate per character.  Shows multiple characters, and that don't always need both x and y coordinates.}
	       @teacher{}}
	@point{@student{Look at this animation of a star that pulses as it moves across the sky.
	                @activity{Fill in the first part of an animation-design worksheet, drawing three individual frames.}
			Which frames did you pick?  Is the star always getting smaller or always getting larger across your frames, or did you have it get smaller between two frames and larger between two other frames?  Choosing images that illustrate the various behaviors of the animation will help you think through the data that you need.
			@activity{What information is changing across the frames?}
			As in previous animations, the star's x-coordinate and y-coordinate are both changing. However, the star's size is also changing.
			@activity{Write a data structure @code{Star-World} to capture these three pieces of data.}
			Even though we aren't going to write the entire animation, thinking about examples of @code{next-world} can help us check whether our data struture has all the information it needs.  Assume you had the following @code{Star-World} structure and were trying to write examples for the @code{next-world} function.  Can you fill in the right side of the example?
			[INSERT Data block and an example next-world(star-data(100, 125, 25)) is _______________]
			This example is interesting because we don't know whether the star is getting larger or smaller.  The size is enough information to @italic{draw} the frame, but it isn't enough to compute the @code{next} frame.  To compute the next world, our data structure also needs to know whether the star is growing or shrinking.
			@activity{Edit your @code{Star-World} to capture information about the direction the star is growing.}
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
        @points[@point{@student{You've learned how to create an animation in Pyret. You saw how having control of drawing the world lets you create interesting effects like changing the color of the sun.  You've gotten a hint that you can make worlds with any information you want.  In upcoming lessons, we will make use of this to do even more interesting animations.}
                        @teacher{Have students volunteer what they learned in this lesson}}
                        
                        ]}
       }

       


  

