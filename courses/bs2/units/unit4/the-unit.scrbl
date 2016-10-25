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
        #:preparation @itemlist[@item{The @editor-link[#:public-id "" "What to Wear"] file, preloaded on students' machines}
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
    Open the file at @editor-link[#:public-id "" "What to Wear"] and do the following:

    @itemlist[

      @item{Click Run, so that you can use @code{wear} in the interactions pane.}

      @item{What does @code{wear(50)} evaluate to?}

      @item{What does @code{wear(100)} evaluate to?}

      @item{What is the domain and range of the @code{wear} function?}

      @item{What is the name of the variable in the @code{wear} function?}

      @item{Change the @code{wear} function to return the shorts outfit when it's cold
      (less than 30 degrees).}

      @item{Challenge: Change the @code{wear} function to use Celsius degrees
      rather than Fahrenheit.}

    ]
  }
}

@teacher{}}

@point{@student{

  The @code{if} expression is similar to the @code{cond} expression from Racket
  in Bootstrap:1.  The difference is in the syntax; the
  behavior is the same.

  An @code{if} expression has a few parts, in order:

  @itemlist{
    @item{An @code{if} clause}
    @item{Any number of @code{else if} clauses}
    @item{An optional @code{else:} clause}
    @item{An @code{end} keyword}
  }

  The @code{if} clause has a question, followed by a @code{:} (a colon),
  followed by an answer for if the question evaluates to @code{true}.  Each
  @code{else if} clause also has a question, followed by a colon, followed by
  an answer for if the question evalautes to @code{true}.

  Just like in Racket, the @code{else:} clause runs if none of the questions in
  the other clauses evaluated to @code{true}.  It catches all the cases that
  aren't covered by a specific question in one of the @code{if} or @code{else
  if} clauses.

}
@teacher{}
}

@point{@student{

  At this point, we need to remember an important lesson about the Design
  Recipe for conditionals from Boostrap:1.

  If we look at the examples for @code{wear}, and circle everything that
  changes, both the input (the temperature) and the output (the image) change.
  However, @code{wear} only has a single variable according to the domain in
  its contract.  Also, the image is completely dependent on the temperature –
  it isn't a separate independent variable, so it wouldn't make sense for it to
  be another variable in the domain of @code{wear}.

  The fact that we have @emph{more changing things than variables in the
  domain} tells us that @code{wear} must be a conditional function.  This is
  the same rule as in Bootstrap:1, and just as we could in Racket, we can tell
  that a function must be conditional just by looking at its contract and the
  examples.  This helps us identify when a function we are writing in our games
  needs to use @code{if}, as long as we follow the Design Recipe when building
  it.

}
@teacher{

  This is a really important point to review.  Conditionals are a big moment in
  Bootstrap:1, as well, and the extension of the Design Recipe is key for
  students to design their own conditional functions later on.  In the next
  exercise, make sure they use the Recipe steps to remind them of the mechanics
  of this type of function.

}
}
]
}

@lesson/studteach[#:title "Where's the Jumper?"
        #:duration "35"
        #:overview ""
        #:learning-objectives @itemlist[@item{write a conditional function from scratch using the Design Recipe}
                                        @item{practice using dot accessors and boolean operations}
                                        @item{reinforce the connection between a data structure and its drawing as an animation state}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[
          @item{The @editor-link[#:public-id "" "Where's the Jumper?"] file preloaded on students' machines}
          @item{The conditional function worksheet FILL LINK}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
@point{
@student{

Let's revisit the parachute jumper program from earlier.  We're going to write
a function that tells us where the jumper is for a given @code{JumperState}.
This is the kind of function you might need to write later on in your game, to
detect where characters are, and make decisions based on that information.

@activity[]{

Open the @editor-link[#:public-id "" "Where's the Jumper?"] file.  There is a
contract and purpose for a funciton called @code{location} in the file:

@code[#:multi-line #t]{
location :: JumperState -> String
# Returns a string representing the location: either "cliff", "ground", "water", or "air"
}

Use this picture to figure out the regions where the different parts of the
image are: FILL IMAGE (shade regions with coordinates for ground, air, water,
cliff, etc)

Use the conditional function worksheet to follow the Design Recipe and
implement @code{location}.

}
}
@teacher{}
}

@point{
  @student{

In addition to your examples, you can also check that the @code{location}
function's behavior matches what a drawing of a @code{JumperState} instance
shows.  For example, if @code{location} returns @code{"cliff"} on some input,
when we draw that same input, it ought to look like the parachutist has hit the
cliff.

@activity[]{

FILL may need to define START, etc here as instances that they work with in
examples and at interactions.

Experiment with this.  In the interactions pane, run @code{location(START)}:
what does it return (hopefully @code{"air"})?  Run @code{draw(start)}: does it
look like the jumper is in the air?  Do the same for an example of the jumper
on the cliff, in the water, and on the ground.

}


  }
  @teacher{
  
  
This kind of experimenting shows an important connection between functions that
work with instances of a data structure, and the way we draw those instances.
We have, in our design for the animation, an understanding of what different
regions of the screen mean.  Here, we see that the @code{draw} and
@code{location} functions both share this understanding to give consistent
information about the animation.

  
  }
}

]
}

}

@lesson/studteach[#:title "Handwritten/Bug Hunting for Conditionals"
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
      ]{

      Worksheets for evaluating if by hand, bug-hunting for syntax errors
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
      ]{

      Extend sunset with piecewise draw function (questions about sun-image, sun-color, etc)

      Two possible other extensions: wrap the sun around in update, change background color as well

      }


