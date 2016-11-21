#lang curr/lib

@title{Unit 4: Functions that Ask Questions}
@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Students are introduced to conditionals using @tt{if}, on both built-in data (like numbers) and on programmer-defined data structures.
            They then use conditionals to implement an animation that goes through distinct phases.
            }
}

@unit-lessons{
@lesson/studteach[#:title "What to Wear"
        #:duration "15"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students learn conditional expressions by writing a simple function}]
        #:standards (list "N-Q" "BS-IDE" "BS-DS.2")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Language Table}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVaUw0VjdiOE5DVzQ" "What to Wear"] file, preloaded on students' machines}
                                 @item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
@point{@student{

  In Bootstrap:1, you learned about the @code{cond} syntax for writing
  @emph{conditional expressions}, which would ask questions and pick different
  answers depending on the results.  Pyret has a similar feature, the @code{if}
  expression.

  @activity{
    Open the file at @editor-link[#:public-id "0B9rKDmABYlJVaUw0VjdiOE5DVzQ" "What to Wear"] and do the following:

    @itemlist[

      @item{Click Run, so that you can use @code{wear} in the interactions pane.}

      @item{What does @code{wear(50)} evaluate to?}

      @item{What does @code{wear(100)} evaluate to?}

      @item{What is the domain and range of the @code{wear} function?}

      @item{What is the name of the variable in the @code{wear} function?}

      @item{Change the @code{wear} function to return the shorts outfit when it's cold
      (less than 30 degrees).}

      @item{@bold{Challenge:} Change the @code{wear} function to use Celsius degrees
      rather than Fahrenheit.}

    ]
  }
}

@teacher{}}

@point{@student{The @code{if} expression is similar to the @code{cond} expression from Racket
  in Bootstrap:1.  The difference is in the syntax; the
  behavior is the same.An @code{if} expression has a few parts, in order:

  @itemlist[
    @item{An @code{if} clause}
    @item{Any number of @code{else if} clauses}
    @item{An optional @code{else:} clause}
    @item{An @code{end} keyword}
  ]

  The @code{if} clause has a question, followed by a @code{:} (a colon),
  followed by an answer for if the question evaluates to @code{true}.  Each
  @code{else if} clause also has a question, followed by a colon, followed by
  an answer for if the question evalautes to @code{true}.

  Just like in Racket, the @code{else:} clause runs if none of the questions in
  the other clauses evaluated to @code{true}.  It catches all the cases that
  aren't covered by a specific question in one of the @code{if} or @code{else
  if} clauses.

}
@teacher{We mention that the @code{else:} clause at the end of an @code{if} expression is optional. Typically, it is important to make sure your code will account for all possible conditions, and ending with @code{else:} is a useful catchall condition if all of the other conditions return false. However, this is optional in the case that every single possible condition is covered by @code{else if} statements.}
}

@point{@student{At this point, we need to remember an important lesson about the Design
  Recipe for conditionals from Boostrap:1.

  If we look at the examples for @code{wear}, and circle everything that
  changes, both the input (the temperature) and the output (the image) change.
  However, @code{wear} only has a single variable according to the domain in
  its contract.  Also, the image is completely dependent on the temperature –
  it isn't a separate independent variable, so it wouldn't make sense for it to
  be another element in the domain of @code{wear}.

  The fact that we have @emph{more changing things than elements in the
  domain} tells us that @code{wear} must be a piecewise function.  This is
  the same rule as in Bootstrap:1, and just as we could in Racket, we can tell
  that a function must be piecewise just by looking at its contract and the
  examples.  This helps us identify when a function we are writing in our games
  needs to use @code{if}, as long as we follow the Design Recipe when building
  it.

}
@teacher{ This is an important point to review.  Conditionals are a big moment in
  Bootstrap:1, and the extension of the Design Recipe is key for
  students to design their own piecewise functions later on.  In the next
  exercise, make sure they use the Recipe steps to remind them of the mechanics
  of this type of function.

}
}
]
}

@lesson/studteach[#:title "Where's the Jumper?"
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
          @item{The @editor-link[#:public-id "0B9rKDmABYlJVX21wZ2lSMTRZbG8" "Where's the Jumper?"] file preloaded on students' machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
@point{
@student{Let's revisit the parachute jumper program from earlier.  We're going to write
a function that tells us where the jumper is for a given @code{JumperState}.
This is the kind of function you might need to write later on in your game, to
detect where characters are, and make decisions based on that information.

@activity{Open your workbook to @worksheet-link[#:page 110 #:name "Location"]. Use the design recipe to write a function to tell you where the parachute jumper is, based on the JumperState (either "cliff", "beach", "water", or "air").}
          
Use this picture to figure out the regions of the different parts of the
background image: 
@bitmap{images/Jumpersmall.png} 
 
 
 

@activity{Once you've completed the problem on paper, open the @editor-link[#:public-id "0B9rKDmABYlJVX21wZ2lSMTRZbG8" "Where's the Jumper?"] file. We've gotten you started with the contract and purpose statement for @code{location} in the file:}

@code[#:multi-line #t]{
location :: JumperState -> String
# Returns a string representing the location: either "cliff", "ground", "water", or "air"
}
Copy the work you have in your workbok to implement @code{location} on the computer.

}

@teacher{}
}

@point{
  @student{In addition to writing your examples, you can also check that the @code{location}
function's behavior matches what a drawing of a @code{JumperState} instance
shows.  For example, if @code{location} returns @code{"cliff"} on some input,
when we draw that same input, it ought to look like the parachutist has hit the
cliff!

@activity[]{Experiment with this function:  in the interactions pane, run @code{location(START)}:
what does it return (hopefully @code{"air"})?  Run @code{draw(START)}: does it
look like the jumper is in the air?  Do the same for an instance of a JumperState where the jumper is on the cliff, in the water, and on the ground.

}


  }
  @teacher{This kind of experimenting shows an important connection between functions that
work with instances of a data structure, and the way we draw those instances.
We have, in our design for the animation, an understanding of what different
regions of the screen mean.  Here, we see that the @code{draw} and
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
                @point{@student{@activity{Open your workbook to @worksheet-link[#:page 111 #:name "Piecewise Bug Hunting"]. In the left column, we've given you broken or buggy Pyret code. On the right, we've given you space to either write out the correct code, or write an explaination of the problems with the provided code.  Work through this workbook page, then check with your partner to confirm you've found all the bugs!}}

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
                @point{@student{Let's return to your @editor-link[#:public-id "" "sunset animation"] from the previous unit. Currently, the sun's x and y-coordinate change to make it move across the screen and disappear behind the horizon. In this unit, we'll make the animation a bit more realistic, by changing the @italic{color} of the sun as it gets lower in the sky. At the top of the screen, the sun should be yellow, then change to orange as it gets to the middle of the screen, and then become red as it reaches the bottom, close to the horizon.  
                                 @activity{Talk with your partner about how you might make this happen. Will you need to add something new to your @code{SunsetState} data structure, or can you change the look of your animation based on what is already there?}}
                        @teacher{There are a number of ways students can solve this problem. Once students have brainstormed with their partners, have a classroom discussion to have pairs share their ideas. For groups with different implementation ideas, encourage them to solve the problem their way, and share the differences in their code at the end of class.}}
                 @point{@student{Since the color of the sun will be changing, this is something we @italic{could} add to the @code{SunsetState} data structure, as a String. However, the color will not change independantly: we want the color to change based on the position of the sun in the sky, and get darker as it gets lower. @activity{@itemlist[@item{Will the color of the sun change based on its x or y position?}
                    @item{What function in your code determines how your animation @italic{looks}?}
                    @item{How might you change this function to draw a different scene depending on where the sun is located in the scene?}]}
We know we'll need to change our @code{draw-state} function in some way, since this is the function that changes how our animation is drawn. Our first instinct may be to turn it into a piecewise function, and draw something different when the @code{SunsetState}'s y-coordinate gets below 225 or below 150. @italic{however}, if we were to start coding, we might quickly find that we're writing the same code over and over. We don't want to change how large the sun is, or where the ground is drawn in the scene. The only thing we want to change is the actual image of the sun. To do this, we can write a helper function to ask questions about the @code{SunsetState}, and produce an image based on its y-coordinate, instead of doing that work inside @code{draw-state}.
@activity{Open your wokbook to @worksheet-link[#:page 222 #:name "sun-color"]. Here we have directions for writing a function called @code{sun-color}, Which consumes a @code{SunsetState} and produces an image of the sun, whose color is either "yellow", "orange", or "red" depending on its y-coordinate.}}
                        @teacher{The word problem assumes a background scene size of 400x300 pixels. Once students use their @code{sun-color} function in their animation, they may need to change the specific conditions if they have a much larger or smaller scene.}}
                 
                 @point{@student{Once you've completed and typed the @code{sun-color} function into your @editor-link[#:public-id "" "sunset animation"] program, it will need to be used within one of our main animation functions: either @code{draw-state} or @code{next-state-tick}.
                      @activity{@itemlist[@item{Which of these functions do you think will use @code{sun-color}? @bold{Hint: Which function handles how the animation looks?}}
                                          @item{How does @code{draw-state} currently know how the sun looks? What does it look like in the animation right now?}
                                          @item{How could you change the code so instead of always drawing the sun as a solid yellow circle, you instead draw the image returned by @code{sun-color} at the @code{SunsetState}'s x and y-coordinate?}]}
                      Inside of @code{draw-state}, your code should look similar to:
                      
@code[#:multi-line #t]{fun draw-state(a-sunset):
  put-image(rectangle(WIDTH, HORIZON-HEIGHT, "solid", "brown"),
    200, 50,
    put-image(sun-color(a-sunset),
      a-sunset.x, a-sunset.y,
      rectangle(WIDTH, HEIGHT, "solid", "light-blue")))
end }

@bold{Optional:} @itemlist[@item{Once you've completed changing the color of the sun, have it wrap around: after "setting" behind the horizon, have it reappear back at the top left corner of the scene, and repeat its journey.}
                                 @item{In addition to changing the color of the sun, have the background color change as well: it should be light blue when the sun is high in the sky, and get darker as the sun sets.}] 
     

      }
                        @teacher{Like changing the color of the sun, there are multiple valid ways of completing these optional activities. If you have students solving the same problem with different code, have them share their code with the class and have a dicsussion about the merits of each version.}
                        }
                 ]
         }
       }
       
       
       


