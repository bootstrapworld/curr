#lang curr/lib

@title{Unit 3: Structures, Reactors, and Animations}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star text scale rotate put-image} "circle(25, \"solid\", \"red\")"))]{

@unit-descr{Students create a complete animation (of a sunset) from scratch, and learn how to use data structures
            to capture the essence of an animation. They apply the put-image function to draw single frames from data
	    structure instances, and write a function to generate new frame data from previous frame data.  They learn
	    how to use reactors to combine their data and functions into a full running animation.}
}
@unit-lessons{
@lesson/studteach[#:title "Animations in Pyret"
        #:duration "55 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Capture essence of an animation in a data structure}
	 		                 @item{Create images for single frames of an animation}
					 @item{Write a function to generate data structure instances for a frame from the instance for the previous frame}
					 @item{Use reactors to define animations}
					 @item{Understand how animations are built from simple functions}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students create a complete animation of a sunset}
	                             @item{Students learn to use data structures to model the state of an animation}]
        #:standards (list "L1:6:CT.1" "L2:CT:1" "L2:CPP:4" "L2:CPP:5"
	                  "BS-M" "BS-IDE" "BS-PL.1"  "BS-PL.3" "BS-DS.1" "BS-DS.2" "BS-R" "BS-PL.P")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running the Pyret Editor}
     		             @item{The @editor-link[#:public-id "0B9rKDmABYlJVSm94cFA4T3R2NTA" "sunset starter file"] loaded on student machines}
			     ]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
	
	@point{@student{You've learned how to create data structures, and how to create images. Now it's time to put these together to create an animation in Pyret.  We'll even go a step further than what we did in Bootstrap:Algebra, creating an animation with movement in two dimensions.}
	       @teacher{}}
	@point{@student{In Bootstrap:Algebra, many decisions about your animation were made for you. We told you how many characters you had and which aspects of them could change during the animation.  The danger always moved in the x-axis, the player always moved in the y-axis.  In Bootstrap:Reactive, we give you much more control of your game: you decide how many characters you will have, and what aspects of them can change (position, color, size, etc).  In order to have this flexibility, we need to do a little more work to set up the animation.  Let's break down an animation to see what we need.}
	       @teacher{}}
	@point{@student{Let's create an animation of a sunset.  The sun will start at the top-left corner of the screen and fall diagonally down and right across the sky. Here's a running version of the animation we are trying to create. Notice that the sun dips below the horizon in the bottom-right corner.
	                @bannerline{@animated-gif{images/sunset.gif}}
	                In Bootstrap:Algebra, we talked about how an animation is made of a sequence of images that we flip through quickly.
                        We continue to think of an animation as a sequence of images in Bootstrap:Reactive. For example, here are the first three frames of the sunset
			animation:
			 @bannerline{@bitmap{images/first-three-sunset-frames.png}}
			}
	       @teacher{}
	       }
	@point{@student{Where will we get this sequence of images? We don't want to create them all by hand.
			Instead, we want to write programs that will create them for us.
                        This is the power of computer programming.  It can automate tasks (like creating
			new images) that might otherwise be tedious for people to do. There are four steps to creating
			animations programs.  You've actually already done the first three in the first two units, but
			now we need to show you how to put them together.}
	       @teacher{This is a key point at which to emphasize why functions are important to computer science.
	       		Computers are good at repetition, but they need instructions
                        telling them what steps to repeat.  Functions capture those instructions.}
	       }
	@point{@student{@bannerline{@bold{Step 1: Define the data structure}}
		        The first step is to develop a @vocab{data structure} for the information that changes across frames.
			To do this, we need to figure out what @vocab{fields} our data structure will need.
			@activity{Turn to @worksheet-link[#:name "animation-sunset"] in your workbook. Copy the three sunset
			images we gave you into the boxes at the top of the worksheet.}
			To identify the fields, we have to figure out what information is needed to create each
			frame image. Information that changes from frame to frame must be in the data structure.

			@activity{On your worksheet, fill in the table just below the three images to indicate
			what information changes across the frames.}

			Hopefully, you identified two pieces of changing information: the x-coordinate of
			the sun and the y-coordinate of the sun. Each image also contains the horizon (the
			brown rectangle), but that is the same in every frame. Let's write down a data
			structure that captures the two coordinates.

			@activity{Fill in the second table, giving a name and type for each of the x-coordinate and y-coordinate.
			Then fill in the @code{SunsetState} data structure definition that we started for you
			at the bottom of the page. Use @code{sunset} as the name of the constructor.}
			
                        You should have come up with something like this: a data block with numbers for the two coordinates.
                      @code[#:multi-line #t]{
		      # a SunsetState is the x-coordinate of the sun 
		      # and the y-coordinate of the sun
		      data SunsetState:
		       | sunset(
		           xpos :: Number,
		           ypos :: Number)
		      end}
		       The term @vocab{state} is used in computer science to refer to the details of a program
		       at a specific point in time.  Here, we use it to refer to the details that are unique to
		       a single frame of the animation.
		  }
		@teacher{We have the students copy the images into the workbook partly to make sure they
			 understand what images they are working with and partly so that they have a
			 self-contained worksheet page for later reference.
			 
			 We are adopting a convention here, in which we include "State" in the name of the data block,
			 then use the same base name (without "State") for the constructor.
                         By not conflating the names here, students should have an easier time distinguishing between
			 the constructor name and data structure name.}
		}
	@point{@student{Any time we make a data structure, we should make some sample @vocab{instances}: this helps check
			that we have the right fields and gives us data to use in making examples later.
			@activity{At the bottom of the worksheet, use the @code{sunset} constructor to write
			write down the @code{SunsetState} instance for the first frame (labeled "Sketch A").
			It has x-coordinate 10 and y-coordinate 300.}
	                }
   	       @teacher{}}
     	@point{@student{@bannerline{@bold{Step 2: Draw one frame}}
			The second step in making an animation is to write a function that consumes an instance of one state
	                and produces the image for that instance. We call this function @code{draw-state}. For sunset, @code{draw-state}
			takes a @emph{SunsetState} instance and produces an image with the sun at that location
			(dipping behind the horizon when low in the sky). This function should use @code{put-image}, as we did with the hikers in unit 1.
			
			@activity{Go to @worksheet-link[#:name "draw-state"] in your workbook and develop the @code{draw-state} function
			          described there. Type in your function and use it (in the interactions window) to draw several individual sunset frames.}
			}
			
	       @teacher{You may have noticed that we used @code{SunsetState} instead of @code{sunset} as the domain name.
	                Remember that @code{sunset} is just the name of the constructor, while @code{SunsetState} is the
			name of the type.  We use @code{SunsetState} whenever we need a type name for the domain or range.}}

     	@point{@student{We can now draw one frame, but an animation needs many frames. How can we draw multiple frames?
	                Let's simply the problem a bit: if you have the instance for one frame, how do we compute the instance
			for the next frame?  Note we didn't ask how to produce the @emph{image} for the next frame. We only asked
			how to produce the next @code{SunsetState} instance.  Why?  We just wrote @code{draw-state}, which
			produces the image from a @code{SunsetState}.  So if we can produce the instance for the next
			frame, we can use @code{draw-state} to produce the image.}
	       @teacher{Separating the instance from the image of it is key here: when we produce an animation, we actually
	                produce a sequence of instances, and use @code{draw-state} to produce each one.  Students may
			need some practice to think of the instance as separate from the image that goes into the animation.}}
			
     	@point{@student{@bannerline{@bold{Step 3: Produce the next frame instance}}
			The third step in making an animation is to write a function that consumes an instance of one state
	                and produces the instance for the next state. We call this function @code{next-state-tick}. For sunset, 
			@code{next-state-tick} takes a @code{SunsetState} instance and produces a @emph{SunsetState}
			instance that is just a little lower in the sky.
			@activity{Go to @worksheet-link[#:name "next-state-tick"] in your workbook and develop the @code{next-state-tick} function
				  described there. Use the sample @code{SunsetState} instances that you developed in
				  step 1 as you make your examples of the function. Then, type in the code you have so far (including the data definition for @code{SunsetState} into the @editor-link[#:public-id "0B9rKDmABYlJVSm94cFA4T3R2NTA" "sunset starter file"], and make sure
				  your examples are producing the expected answers.}
			}
	       @teacher{}}
	       
     	@point{@student{Together, the @code{draw-state} and @code{next-state-tick} functions are the building blocks for an
	                animation. To start to see how, let's first use these two functions to create the first
			several frames of an animation by hand (then we'll show you how to make more frames automatically).
			@activity{Run each of the following expressions in the interactions window in turn. Just copy and
			          paste them, rather than type them by hand each time:
				  @itemlist[
				  @item{@code{draw-state(sunset(10,300))}}
				  @item{@code{next-state-tick(sunset(10,300))}}
				  ]
				  Now use @code{draw-state} on the result of @code{next-state-tick}, then call
				  @code{next-state-tick} again:
				  @itemlist[
				  @item{@code{draw-state(sunset(18,296))}}
				  @item{@code{next-state-tick(sunset(18,296))}}
				  @item{@code{draw-state(sunset(26,292))}}
				  @item{@code{next-state-tick(sunset(26,292))}}
				  ]}
		          Do you see the sun getting lower in the sky from image to image?
			  Do you see how we are creating a "chain" of images by alternating calls
			  to @code{draw-state} and @code{next-state-tick}? We use @code{next-state-tick} to
			  create the instance for a new frame, then use @code{draw-state} to produce the image
			  for that frame.
			
			@activity{(Optional) Here's another way to see the same sequence of expressions. Run each of the
			          following expressions in the interactions window in turn. Just copy and 
			          paste them, rather than type them by hand each time:
				  @itemlist[
				  @item{@code{draw-state(sunset(10,300))}}
				  @item{@code{draw-state(next-state-tick(sunset(10,300)))}}
				  @item{@code{draw-state(next-state-tick(next-state-tick(sunset(10,300))))}}
				  @item{@code{draw-state(next-state-tick(next-state-tick(next-state-tick(sunset(10,300)))))}}
				  ]}
		        Do you see what this sequence
			of expressions does? Each one starts with the sun in the upper-left corner, calls
			@code{next-state-tick} one or more times to compute a new position for the sun, then draws the state.
			Notice that this sequence only has us write down one @code{SunsetState} instance
			explicitly (the first one).  All the others are computed from @code{next-state-tick}.
			If we could only get Pyret to keep making these calls for us, and to show us the images
			quickly one after the next, we'd have an animation!
			}
	       @teacher{These sequences show students how the two functions work together to create an animation.
	       If you feel the second one that composes @code{next-state-tick} with itself many times is too
	       complicated for your students, you can skip it. The goal of the second sequence is to show that we
	       only need an initial instance and the two functions to generate a sequence of images that make
	       up an animation.}}

        @point{@student{@bannerline{@bold{Step 4: Define an animation with a reactor}}
	                The fourth (and final) step in making an animation is to tell Pyret to create an
	 		animation using an initial @code{SunsetState} instance and our @code{draw-state} and
			@code{next-state-tick} functions. To do this, we need a new construct called a
			@vocab{reactor}. A reactor gathers up the information needed to create an animation:
                        @itemlist[@item{An instance of the data at the start of the animation}
                                   @item{(Optional) A function that knows how this data should change automatically as time passes}
                                   @item{(Optional) A function that knows how to take this data and draw one frame of the animation}]}
                @teacher{Proceed slowly here -- this is a very abstract concept, so you'll want to do a lot of checking for understanding.}
                }
        @point{@student{A reactor is designed to "react" to different events. When the computer's clock ticks,
                        we'd like to call @code{next-state-tick} on the reactor's state, and have it update to the next state
                        automatically. Reactors have event @vocab{handlers}, which connect events to functions.
                
			Here, we define a reactor named @code{sunset-react} for the sunset animation:
			@code[#:multi-line #t]{
                          sunset-react = reactor:
  			    init: sunset(10, 300),
			    on-tick: next-state-tick,
			    to-draw: draw-state	  
                          end}
			@code{init} tells the reactor which instance to use when the program starts. In this example,
                        the program will start with a @code{SunsetState} instance with the sun at (10, 30). @code{on-tick}
                        and @code{to-draw} are event @vocab{handlers}, which connect @code{tick} and @code{draw} events
                        to our @code{next-state-tick} and @code{draw-state} functions.
			@activity{Copy this reactor definition into your sunset animation program.}
			}
	       @teacher{The reactor is new to Bootstrap:Reactive. In Bootstrap:Algebra, every student had the same reactor "under the hood", 
                        and had to fill in the handlers. This made it easy to focus on the basics and write those handlers,
                        but it also meant that everyone's game looked a lot alike!  In Bootstrap:Reactive, however, students get to 
                        customize the states of their reactors, and gives them a lot of flexibility in how to deal with events!}
               }

     	@point{@student{If you run your sunset program after adding the reactor, nothing seems to happen. We have set
			up an animation by defining @code{sunset-react}, but we haven't told Pyret to run it.  You could define
			multiple reactors in the same file, so we have to tell Pyret explicitly when we want to run one.
			@activity{Type @code{interact(sunset-react)} in the interactions window to run your sunset animation.}
			}
	       @teacher{The Bootstrap:Algebra teachpacks started the animation automatically.  In Bootstrap:Reactive, you
	       		have to start the animation manually by calling @code{interact}.}}

        @point{@student{What happens when we call @code{interact}?  The following diagram summaries what Pyret does to
			run the animation. It
			draws the initial instance, then repeatedly calls @code{next-state-tick} and @code{draw-state} to
			create and display successive frames of your animation.  
			
 	                @bannerline{@bitmap{images/world-model.png}}

			These are the same computations you did by hand in the interactions window a little while
			ago, but Pyret now automates the cycle of generating and drawing instances.  By having
			functions that can generate instances and draw images, we can let the computer do the work of
			creating the full animation.}
               @teacher{This figure may be too complex for some students.  Hopefully it helps you, and perhaps them,
	                see how an animation arises from the two functions we've written in this lesson.}}
	@point{@student{Functions are essential to creating animations, because each frame comes from a different @code{SusetState}
			instance. The process of drawing each instance is the same, but the instance is different each time.
			Functions are computations that we want to perform many times.  In an animation, we perform
			the @code{draw-state}and @code{next-state-tick} functions once per frame.  Animations are an
			excellent illustration of why functions matter in programming.}
	       @teacher{Whether you are primarily teaching math or CS, helping students see the idea of functions and
	       		repeated computations is a key part of what Bootstrap tries to teach.  Animations are a powerful
			illustration of repeated computations that functions can capture naturally.}}
	@point{@student{Summarizing what we have seen so far, we have to write four things in order to make an animation:
                        @itemlist[#:style 'ordered
                           @item{Create a @vocab{data structure} to hold the information that changes across frames. This information is called the @vocab{state}.}
                           @item{Write a @vocab{function} to generate an image of the current state (we'll call this @code{draw-state}).}
                           @item{Write a @vocab{function} to generate a new state from a given state (we'll call this @code{next-state-tick}).}
                           @item{Define a @vocab{reactor} that will use an initial instance of the state and the two functions to create an animation.}
                        ]
			At this point, you could create your own animation from scratch by following these four steps.  If you do,
			you may find it helpful to use the animation design worksheet on page @worksheet-link[#:name "build-own-design"]
			in your workbook: it takes you through sketching out your frames, developing the data structure for your
			animation state, and writing the functions for the animation. It also gives you a checklist of the four
			steps above. The checklist mentions a fifth (optional) step, which involves getting your characters to
			respond when the user presses a key.  You'll learn how to do that in the next unit.
                        }
               @teacher{The animation-design worksheet is a condensed summary of the steps to creating an animation.  If your
	       		students still need more scaffolding, follow the sequence of sheets that we used to develop sunset,
			including explicit worksheets for @code{draw-state} and @code{next-state-tick}. If your students are
			doing fine without the scaffolding of the design recipe worksheets, the condensed worksheet should
			suffice to keep them on track (though they should still write tests and follow the other steps of
			the design recipe as they work).}}

	@point{@student{You have just seen the incredible power of functions in programming! Functions let us
	                @emph{generate content automatically}. In the early days of making cartoons,
                        artists drew every frame by hand.  They had to decide at the beginning how many frames
			to create. Here, we let the computer generate as many frames as we want,
                        by letting it call @code{next-state-tick} over and over until we stop the animation.
			If we want to slow down the sunset, we simply change the new coordinates
                        within @code{next-state-tick}.  If we start with a larger screen size, the computer
			will continue to generate as many images as we need to let the sun drop out of the window.
                        The computer can give us this flexibility as long as @italic{we provide a function that tells
			the computer how to generate another frame}.
	       }
	       @teacher{}}
	       ]
	       }
         
	       
@lesson/studteach[#:title "From Animations to Structures"
        #:duration "55 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students practice identifying the data that underlies animations}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students develop data structures to capture several pre-defined animations}]
        #:standards (list "BS-DS.2" "BS-R")
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[
      	@point{@student{You've learned the components of an animation in Pyret. The data structure for the state lies at the heart of the animation: each of the initial state, the @code{draw-state} function and the @code{next-state-tick} function are based on the data structure you choose. Being able to figure out the data structure you need for an animation is therefore a critical skills in making your own animations.  In this lesson, we are going to practice identifying the data and creating the data structures for various animations. We will not write the entire animation.
	       We are just going to practice identifying the data and writing the data structures.}
	       @teacher{Figuring out the data structure is actually one of the most creative tasks in programming. More complex problems can be captured through multiple data structures. For example, we might have some information that could be computed from other information, so we have to decide what data to include and what to compute.  Or, we might want to combine multiple smaller data structures into a larger one, having a data structure for a coordinate (with both x- and y-positions), and a data structure for a character that has a coordinate and a color. We don't expect that you can envision all of these possibilities right now.  We do want you to be aware that students may come up with different ideas, and that this is appropriate and interesting at this stage.  Your students can have some valuable discussions about design once they start brainstorming different ways to organize data for a problem.}}
	@point{@student{@bold{Exercise: Jumping Cow} -- Look at this animation of a cow jumping over the moon.
	                @animated-gif{images/cowjump.gif} 
	                @activity{Go to @worksheet-link[#:name "animation-data-1-blank1"] in the workbook. Draw three frames from this animation.
				  Choose ones that highlight differences across the frames.
			          The frames don't need to be consecutive.}
			When you chose which frames to draw, did you include ones with different images or heights of the cow?
			Choosing images with some variation will help you think through the data in your animation.
			@activity{Fill in the table of what information changes across the frames.}
			In this case, the cow's x-coordinate and y-coordinate are both changing. The image changes too,
			but the position (coordinates) determines which image to use.  The state data structure therefore
			only needs to store the coordinates.
			@activity{Fill in the table of what fields you need for each piece of changing information.
			          Write a data structure @code{CowState} to capture the data in this animation.}
			}
	       @teacher{If students want to include the image in the state, that is fine too. Examples like this
	       		are good for raising discussion about what parts of an animation depend on one another.
			The image doesn't need to be in the state, but it isn't wrong to include it there either.}}
	       
	@point{@student{@bold{Exercise: Falling Person} -- Look at this animation of a person falling through the sky while two
			birds fly upwards.
	                @animated-gif{images/falling.gif} 
	                @activity{Go to @worksheet-link[#:name "animation-data-1-blank2"] in the workbook. Draw three frames from this animation.
				  Choose ones that highlight differences across the frames.
			          The frames don't need to be consecutive.}
			When you chose which frames to draw, did you include ones with the two birds at different distances from each other?
			@activity{Fill in the table of what information changes across the frames.}
			In this case, there are five pieces of information: the y-coordinate of the person,
			the x- and y-coordinates of the first bird, and the x- and y-coordinates of the second bird.
			Do we really need the x-coordinates of the birds?  They only move in the y-axis, but once they go off screen,
			their x-coordinates can change for their next pass upward.  You only notice that the x-axis changes if you
			look at frames from multiple passes, rather than three consecutive frames.
			@activity{Fill in the table of what fields you need for each piece of changing information.
			          Write a data structure @code{FallingState} to capture the data in this animation.}
			}
	       @teacher{}}
	       
	 @point{@student{@bold{Exercise: Pulsing Star} -- Look at this animation of a star that pulses as it moves across the sky.
	                @animated-gif{images/pulsingstar.gif} 
	                @activity{Go to @worksheet-link[#:name "animation-data-1-blank3"] in the workbook. Draw three frames from this animation.
				  Choose ones that highlight differences across the frames.
			          The frames don't need to be consecutive.}

		        When you chose which frames to draw, did you show the star getting smaller and then getting larger again?

			@activity{Fill in the table of what information changes across the frames.}

			The x- and y-coordinates of the star change, as does the size of the star. These changes are easy to see across
			two frames. Something else changes too, but you have to look across at least three frames to see it. Imagine you
			had a single frame with the star at size 25. In the next frame, should the star be larger or smaller? It's hard
			to tell, because we don't know whether the star is currently in a "growing" phase or a "shrinking" one.  This
			animation actually has a fourth state field: the direction of growth of the star. When the star is getting bigger,
			the star's size should increase in the next frame. When the star is getting smaller, the size should decrease in
			the next frame.

			@activity{Fill in the table of what fields you need for each piece of changing information.
			          Write a data structure @code{StarState} to capture the data in this animation.}

		        What type did you choose for the field that tracks the direction of growth?  You have several choices: a boolean
			such as @code{is-growing}, a string such as @code{direction} (with values @code{"grow"} or @code{"shrink"}), or
			a number such @code{growth-rate} which is the amount to add to the size from state to state (a positive value
			grows the star while a negative value shrinks it).  The code for @code{next-state-tick} will be cleaner if you
			use the number, but the others make sense before you've thought ahead to the code.}
			
	       @teacher{The type for tracking direction of growth gives potential for a good discussion. None of these answers are
	                wrong.  If they were to use the boolean or the string, however, their @code{next-state-tick} function would
			need a conditional to decide whether to add or subtract from the current size.  In this exercise, they
			aren't writing the animations, so this is less of an issue. Our real goal is to get them to imagine
			animations and to identify the state information that underlies each one.}
			}

	@point{@student{@bold{Exercise: Light Dimmer} -- Look at this animation of a slider to control the brightness of a light.
	                @animated-gif{images/dimmer.gif} 
	                @activity{Go to @worksheet-link[#:name "animation-data-1-blank4"] in the workbook. Draw three frames from this animation.
				  Choose ones that highlight differences across the frames.
			          The frames don't need to be consecutive.}
			When you chose which frames to draw, did you include the far left position when the light goes out? It can be useful
			to think about the extreme cases when picking frames to focus on.
			@activity{Fill in the table of what information changes across the frames.}
			In this case, we see two things changing: the y-coordinate of the slider and the brightness of the light.
			You could have one field for each of these. Or, you could just have a field for the y-coordinate and compute
			the brightness from that value (you can control the brightness of a shape by putting a number from 0 to 255
			in place of "solid" or "outline" in the arguments to the shape-image functions).
			@activity{Fill in the table of what fields you need for each piece of changing information.
			          Write a data structure @code{LightState} to capture the data in this animation.}
			}
	       @teacher{As an example of using the transparency argument, @code{circle(25, 150, "white")} creates a semi-bright white circle.}}

	@point{@student{@bold{Exercise: Pong} For a real challenge of your data structure design skills, figure out the world data structure
			needed for a single-paddle pong game (a ball bouncing off the walls and a single user-controlled paddle). If
			you want to build an entire Pong game, see the optional unit on how to do this.}
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
        @points[@point{@student{You've learned how to create an animation in Pyret. You've learned how to create a data structure for
	                        the state of your animation.  You've written a function to draw the frame for one instance of your state
				data.  You've written another function to produce the state instance for the next frame, and you've learned how
				to write a reactor to create an animation from these pieces. Your state data structures can contain
				information far beyond the coordinates for players: you can include images, sizes of characters,
				colors of elements, and so on.  Once you control the data structure, you can create much richer animations
				than you could in Bootstrap:Algebra. Coming up, we will show you how to use keys to control your players.  Later,
				we show you how to add other common game features to your Bootstrap:Reactive programs.}
                        @teacher{Have students volunteer what they learned in this lesson}}
                        
                        ]}

       
}

  
