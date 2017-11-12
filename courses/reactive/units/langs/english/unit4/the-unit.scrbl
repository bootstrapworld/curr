#lang curr/lib

@title{Unit 4: Functions that Ask Questions}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt} "")
                                       (list "String" @code{string-append string-length} "")
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image} ""))]{
@unit-descr{Students are introduced to conditionals using @tt{if-expressions}, on both built-in data (like numbers) and on programmer-defined data structures.
            They then use conditionals to implement an animation that goes through distinct phases. They also learn about helper functions, which abstract away
            frequently-used code to improve readability and reduce duplication.
            }
}

@unit-lessons{
@lesson/studteach[#:title "What to Wear"
        #:duration "15"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students learn conditional expressions by writing a simple function}]
        #:standards (list "BS-IDE" "BS-DS.2")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Language Table}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVaUw0VjdiOE5DVzQ" "What to Wear"] file, preloaded on students' machines}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
@point{@student{

  In Bootstrap:Algebra, you learned about the @code{cond} syntax for writing
  @emph{conditional expressions}, which would ask questions and pick different
  answers depending on the results.  Pyret has a similar feature, the @code{if}
  expression.

  @activity{
    Open the file at @editor-link[#:public-id "0B9rKDmABYlJVaUw0VjdiOE5DVzQ" "What to Wear"]. After reading through the definition for the @code{wear} function:

    @itemlist[

      @item{Click Run, so that you can use @code{wear} in the interactions area.}

      @item{What does @code{wear(50)} evaluate to?}

      @item{What does @code{wear(100)} evaluate to?}

      @item{What is the domain and range of the @code{wear} function?}

      @item{What is the name of the variable in the @code{wear} function?}

      @item{Change the @code{wear} function to return the shorts outfit when it's cold
      (less than 30 degrees).}

    ]
  }
}

@teacher{}}

@point{@student{The @code{if} expression is similar to the @code{cond} expression from Racket
  in Bootstrap:Algebra.  The difference is in the syntax; the
  behavior is the same. An @code{if} expression has a few parts, in order:

  @itemlist[
    @item{An @code{if} clause}
    @item{Any number of @code{else if} clauses}
    @item{An optional @code{else} clause}
    @item{An @code{end} keyword}
  ]

  The @code{if} clause has a question, followed by a @code{:} (a colon),
  followed by an answer for if the question evaluates to @code{true}.  Each
  @code{else if} clause also has a question, followed by a colon, followed by
  an answer for if the question evaluates to @code{true}. Just like in Racket, the @code{else:} clause runs if none of the questions in the other clauses evaluated to @code{true}.  It catches all the cases that aren't covered by a specific question in one of the @code{if} or @code{else if} clauses.

}
@teacher{We mention that the @code{else:} clause at the end of an @code{if} expression is optional. Typically, it is important to make sure your code will account for all possible conditions, and ending with @code{else:} is a useful catchall condition if all of the other conditions return false. However, this is optional in the case that every single possible condition is covered by @code{else if} statements.}
}

@point{@student{At this point, we need to remember an important lesson about the Design
  Recipe for conditionals from Bootstrap:1. If we look at the examples for @code{wear}, and circle everything that
  changes, both the input (the temperature) and the output (the image) change.
  However, @code{wear} only has a single variable according to the domain in
  its contract.  Also, the image is @emph{completely dependent} on the temperature –
  it isn't a separate independent variable, so it wouldn't make sense for it to be another element in the domain of @code{wear}. The fact that we have @emph{more changing things than elements in the domain} tells us that @code{wear} must be a @vocab{piecewise function}.  This is the same rule as in Bootstrap:Algebra, and just as we could in Racket, we can tell that a function must be piecewise just by looking at its contract and the examples.  This helps us identify when a function we are writing in our games needs to use @code{if}, as long as we follow the Design Recipe when building it. Another way to recognize a piecewise function when looking at your examples is to note whether or not there are elements which @italic{completely depend} on another. In @code{wear}, the image depends on the temperature, and does not change independently, or in response to any other changes in the function. Keep an eye out for these dependent variables in your examples as you write them to help identify piecewise functions.

}
@teacher{ This is an important point to review.  Conditionals, or Piecewise functions, are a big moment in
  Bootstrap:Algebra, and the extension of the Design Recipe is key for
  students to design their own piecewise functions later on.  In the next
  exercise, make sure they use the Recipe steps to remind them of the mechanics
  of this type of function.

}
}
]
}

@lesson/studteach[#:title "Where's my Order?"
        #:duration "35"
        #:overview ""
        #:learning-objectives @itemlist[@item{write a piecewise function from scratch using the Design Recipe}
                                        @item{practice using dot accessors and boolean operations}
                                        @item{reinforce the connection between a data structure and its drawing as an animation state}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[
          @item{The @editor-link[#:public-id "0B9rKDmABYlJVNDdsNDBNcHdSVWs" "Where's my Order?"] file preloaded on students' machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
@point{
@student{Let's revisit the package delivery program from earlier.  We're going to write
a function that tells us where the package is for a given @code{DeliveryState}.
This is the kind of function you might need to write later on in your game, to
detect where objects or characters are, and make decisions based on that information. For instance, you may need to know whether a character has reached a portal at a certain part of the screen to advance to the next level, or if they've fallen into dangerous lava, which reduces their health!

@activity{Open your workbook to @worksheet-link[#:name "location"]. Use the design recipe to write a function to tell you where the falling box is (either "road", "house", "delivery zone", or "air"), based on the DeliveryState.}
          
Use this picture to figure out the regions of the different parts of the
background image:
@bitmap{images/deliverysmall.png} 
 
 
 

@activity{Once you've completed the problem on paper, open the @editor-link[#:public-id "0B9rKDmABYlJVNDdsNDBNcHdSVWs" "Where's my Order?"] file. We've gotten you started with the contract and purpose statement for @code{location} in the file:}

@code[#:multi-line #t]{
# location :: DeliveryState -> String
# Consumes a DeliveryState and produces a String 
# representing the location of the box: 
# either "road", "delivery zone", "house", or "air"

}
Copy the work you have in your workbook to implement @code{location} on the computer.

}

@teacher{}
}

@point{
  @student{In addition to writing your examples, you can also check that the @code{location}
function's behavior matches what a drawing of a @code{DeliveryState} instance
shows.  For example, if @code{location} returns @code{"road"} on some input,
when we draw that same input, it ought to look like the package has landed in the road!

@activity[]{Experiment with this function!  
            @itemlist[
                      @item{Click "Run" to compile your program, then close the animation window.}
                       @item{In the interactions pane, evaluate @code{location(START)}. What does it return (hopefully @code{"air"})?}
                       @item{Evaluate @code{draw-state(START)}. does it look like the box is in the air?}  
                       @item{Do the same for an instance of a DeliveryState where the box is in the road, on the house, and in the delivery zone.}]

}


  }
  @teacher{This kind of experimenting shows an important connection between functions that
work with instances of a data structure, and the way we draw those instances.
We have, in our design for the animation, an understanding of what different
regions of the screen mean.  Here, we see that the @code{draw-state} and
@code{location} functions both share this understanding to give consistent
information about the animation.}
}

]
}

@lesson/studteach[#:title "Piecewise Bug Hunting"
        #:duration "15"
        #:overview ""
        #:learning-objectives @itemlist[@item{Practice with conditional syntax}]
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
      ]{@points[
                @point{@student{@activity{Open your workbook to @worksheet-link[#:name "piecewise-bug-hunting"]. In the left column, we've given you broken or buggy Pyret code. On the right, we've given you space to either write out the correct code, or write an explanation of the problems with the provided code.  Work through this workbook page, then check with your partner to confirm you've found all the bugs!}}

        @teacher{}
      }
                 ]
        }

@lesson/studteach[#:title "Colorful Sun"
        #:duration "20"
        #:overview ""
        #:learning-objectives @itemlist[@item{Add a conditional to a draw function}
                                        @item{See a piecewise function in action in a reactor} ]
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
      ]{@points[
                @point{@student{Let's return to your @editor-link[#:public-id "0B9rKDmABYlJVSm94cFA4T3R2NTA" "sunset animation"] from the previous unit. Currently, the sun's x and y-coordinate change to make it move across the screen and disappear behind the horizon. In this unit, we'll make the animation a bit more realistic, by changing the @italic{color} of the sun as it gets lower in the sky. At the top of the screen, the sun should be yellow, then change to orange as it gets to the middle of the screen, and then become red as it reaches the bottom, close to the horizon.}
		      @teacher{}}
		 @point{@student{In programming, it is fairly common that you will change a program that you've already
		                 written to do something new or different. Modifying existing code is a valuable skill, and
				 one that we want to practice with this exercise.  It is so useful, in fact, that we've
				 created a worksheet to help you map out what needs to change in an existing animation
				 to support new behavior.
				 @activity{Turn to @worksheet-link[#:name "animation-extension-1-sun"]. Fill in the description
				 	   of the animation change and three sample images at the top of the first page.
					   If you don't have colored pencils, just make an annotation near each sketch
					   as to what color the sun should be in that sketch.}
			         Once you know what new behavior you want, the next task is to build it into your code.
				 The next two tables in the worksheet ask you to think about the NEW features that are
				 changing in your game and how you might capture them.
                                 @activity{Talk with your partner about what new information is changing and how you might
				           build that into your program. Does the color change in a predictable way?
					   Is the color a new field that is independent of the fields you already have?
					   Based on your answer, do you think you will need to add something new to your
					   @code{SunsetState} data structure, or can you change the look of your animation
					   based on what is already there?}}
                        @teacher{There are a number of ways students can solve this problem. Once students have brainstormed
				 with their partners, have a classroom discussion to have pairs share their ideas.}}
                 @point{@student{Since the color of the sun will be changing, we @italic{could} add a field to the
		 		 @code{SunsetState} data structure, such as a String with the current color name.
				 However, the color will not change independently:
				 we want the color to change based on the position of the sun in the sky, and get darker as it gets lower.
				 Let's figure out how to make the sun color change based only on the fields we already have.
				 @activity{Fill in the table at the bottom of the worksheet
					   assuming we are not changing the data structure: which components
					   (including existing functions) need to change?}
				 If we have decided not to add fields, you should have marked that the @code{draw-state}
				 method changes, but nothing else needs to.  We only change @code{next-state-tick} and
				 @code{next-state-key} if there has been a change to the data structure.}
			 @teacher{You may need to guide students to realizing that a change in the appearance of the
			 	  animation can be done entirely through draw-state. This is another point for
				  emphasizing the separation between maintaining instances and drawing instances.}}
		@point{@student{How do we change @code{draw-state}? Our first instinct may be to turn it into a piecewise function,
				and draw something different when the @code{SunsetState}'s y-coordinate gets below 225 or below 150.
				This would yield code along the lines of:

				@code[#:multi-line #t]{fun draw-state(a-sunset):
				                         if a-sunset.y < 150:
				                           put-image(
                                                           rectangle(WIDTH, HORIZON-HEIGHT, "solid", "brown"),
				                                     200, 50,
				          		  	     put-image(circle(25, "solid", "yellow"),
									       a-sunset.x, a-sunset.y,
						            rectangle(WIDTH, HEIGHT, "solid", "light-blue")))
			                                 else if a.sunset.y < 225:
							   # same code with "orange" as sun color
							 else:
							   # same code with "red" as sun color
							end
						       end }

				Notice that this version contains three very similar calls to @code{put-image}. The @italic{only}
				thing that is different about these three calls is the color we use to draw the sun. Whenever you
				find yourself writing nearly-identical expressions multiple times, you should create another
				function that computes the piece that is different. You can then write the
			        overall expression just once, calling the new function to handle the different part. Functions
				that handle one part of an overall computation are called @vocab{helper functions}.}
                        @teacher{}}
		@point{@student{Assume for the moment that we had written a helper function called @code{draw-sun} that takes a
		       		@code{SunsetState} and returns the image to use for the sun. If we had such a function, then
				our @code{draw-state} function would look as follows:

				@code[#:multi-line #t]{fun draw-state(a-sunset):
				                         put-image(
                                                         rectangle(WIDTH, HORIZON-HEIGHT, "solid", "brown"),
				                                   200, 50,
				          			   put-image(draw-sun(a-sunset),
									     a-sunset.x, a-sunset.y,
						               rectangle(WIDTH, HEIGHT, "solid", "light-blue")))
						       end }
				
				@activity{Open your workbook to @worksheet-link[#:name "draw-sun"]. Here we have directions for
				writing a function called @code{draw-sun}, Which consumes a @code{SunsetState} and produces an
				image of the sun, whose color is either "yellow", "orange", or "red" depending on its y-coordinate.}}
                        @teacher{The word problem assumes a background scene size of 400x300 pixels. Once students use their
				 @code{draw-sun} function in their animation, they may need to change the specific conditions
				 if they have a much larger or smaller scene.}}
                 
                 @point{@student{Once you've completed and typed the @code{draw-sun} function into your @editor-link[#:public-id "0B9rKDmABYlJVSm94cFA4T3R2NTA" "sunset animation"] program, modify @code{draw-state} to use it as we showed just above.}
		        @teacher{}}

                 @point{@student{Now let's think about having the sunset animation "start again" after the sun sets, with the sun
		 		 reappearing in the upper-left corner.

				 @activity{Assume you edited your animation to restart the sun at the upper left after it sets.
				 What color @italic{should} the sun be
				 when it appears at the upper-left the second time around?  What color @italic{will} it be
				 based on your code?  Will it be yellow again, or will the color have changed somehow to red?}

				 To figure this out, think about what controls the color of the sun in your current code.

				 @activity{Edit the sunset animation so that the animation restarts. Which of your functions
				 has to be modified to include this change?  Is restarting fundamentally about drawing one
				 frame or about generating new instances?  Use that question to help yourself figure out which
				 function to modify.  You could use the space for examples of functions at the end of your
				 worksheet on extending the animation to write a new example before you modify your code.}
				 }
                        @teacher{This question about the color of the sun is an especially good question-and it likely to
			         come up-from students who may have experience programming with variables and updates in other languages,
				 such as Scratch (where the color would have changed to red). In our approach, where we simply
				 determine the sun color from the y-coordinate, the sun should naturally restart as yellow.
				 Of course, if students had maintained the sun color as a separate field in their data structure,
				 they would have to consider this issue, and manually reset the sun color as well as the y-coordinate
				 when restarting the animation.}}

                   @point{@student{@bold{Optional:}In addition to changing the color of the sun, have the background color change
		                   as well: it should be light blue when the sun is high in the sky, and get darker as the sun sets.} 
     
                          @teacher{Like changing the color of the sun, there are multiple valid ways of completing this
			           optional activity. If you have students solving the same problem with different code,
				   have them share their code with the class and have a discussion about the merits of each version.}
                        }
                 ]
         }
       }
       
       
       
