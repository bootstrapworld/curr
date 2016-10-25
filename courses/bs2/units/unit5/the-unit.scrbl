#lang curr/lib

@title{Unit 5: Key Press Events}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]
@unit-descr{Students return to the subject of piecewise functions, this time defining a key-event handler that modifies a world when certain keys are pressed.}
@unit-lessons{
@lesson/studteach[#:title "Using Keys to Move a Character in Two Dimensions"
        #:duration "45 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students learn how to connect keypress events with their functions}
                                        @item{Students get practice with piecewise functions}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students implement the entire Sam the Butterfly activity from Bootstrap:1 with a character of their choice}]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{The @editor-link[#:public-id "" "Moving Character"] file preloaded on students' machines}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
@points[@point{
@student{

  An important kind of behavior in not only games, but interactive programs in
  general, is to respond to keypresses from the user.  We've already seen one
  kind of interactivity, which is getting the next state from the current one
  on a tick, which we use to drive animations forward in time.  A keypress is
  another kind of event, and we'll re-use the idea of a function like
  @code{next-state-tick}, this time called @code{next-state-key} which will
  compute the next state from the current one.

  We're going to use this idea to build up a reactor with a character moving in
  two dimensions, where the movement is triggered by key presses.

@activity[]{

Open up the @editor-link[#:public-id "" "Moving Character"] template file.  It
contains a data block for representing a character's position
(@code{CharState}) that has an x and y position.  We've filled in a picture of
Sam the Butterfly from Bootstrap:1, but you can fill in another image if you
wish.

There is a drawing function provided that simply draws the character image on a
white background at the x and y coordinate in a @code{CharState}.

There is also a contract for a function @code{next-state-tick}, which looks
like:

  @code[#:multi-line #t]{
next-state-key :: CharState, String -> CharState
# Moves the character by 5 pixels in the corresponding direction
# if an arrow key ("up", "left", "down", or "right") is pressed,
# and leaves the character in place otherwise
  }

Your job is to use the Design Recipe to fill in examples and an implementation
of @code{next-state-key}.

}

  A key event is different from a tick event in an important way.  When a key
  event happens, the next state may differ depending on which key was pressed.
  That means the @code{next-state-key} function needs not only the current
  state, but also which key was pressed, as parts of its domain.  That's why 
  @code{next-state-key} has an additional variable, @code{key}, which
  represents the key pressed by the user.
}
@teacher{}
}

@point{

@student{

@activity[]{
Once you've implemented @code{next-state-key}, experiment with it in the interactions pane:

@itemlist[
  @item{Try @code{draw-state(next-state-key(middle, "left"))}.  How is the output different from @code{draw-state(middle)}?}
  @item{Try using a few different calls to @code{next-state-key} to move the character several times, then draw it.  For example:

    @code[#:multi-line #t]{
draw-state(next-state-key(next-state-key(middle, "left"), "up"))
    }
  }
]
}

  Just like with ticks, we see that we can manually pass key press strings into
  this function, and see what an animation would look like if we drew the
  corresponding states.  That's cool, but it would be much more exciting if we
  could hook up this function to a reactor, which will send in actual
  keypresses from someone playing the game.  To do this, we need to create a
  reactor, and instead of using @code{on-tick}, we will use @code{on-key} to
  specify that our @code{next-state-key} function should be called when the
  user presses a key.  That looks like this:

@code[#:multi-line #t]{
r = reactor:
  init: middle,
  to-draw: draw-state,
  on-key: next-state-key
end
}

}
@teacher{}
}


@point{
Act out a reactor with key presses
}

@point{Optional: boundaries to keep character onscreen, also num-to-string and display position}

]
}


@lesson/studteach[#:title "Combining Ticks and Keypresses"
        #:duration "45 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students see separate key and tick handlers combine to make a game}
                                        @item{Students get practice with piecewise functions}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students build the interactive parts of a simple game}]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{The @editor-link[#:public-id "" "Pusheen in the City"] file preloaded on students' machines}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{

@points[

@point{
@student{

Now, you've seen how to use functions to compute the next state in a game or
animation for both tick and key events.  We can combine these to make
interesting interactive games from scratch!  This lesson actually doesn't show
any new features of Pyret or reactors, and just puts together things you
already know to build a game.

@activity[]{

Open the @editor-link[#:public-id "" "Pusheen in the City"] file.  Run it, and
use @code{interact(r)} to see the game as usual.  Notice that not much is
happening!  It's going to be your job to write two functions, one to compute
the next state for a tick, and one to compute the next state for a key press.

On a tick, the hunger, sleep, and happiness should all decrease by one.  When
they reach zero, the game is lost and Pusheen is sad.

On a key press, if the user pressed "f" (for "feed"), @code{hunger} should
increase by 2. If the user pressed "p" (for "play"), @code{happy} should
increase by 2.  If the user pressed "s" (for "sleep"), @code{sleep} should
increase by 2.  If the user presses any other keys, nothing should change.

If the game is lost (one of the bars reaches 0), then key presses shouldn't
change anything.

When you've implemented both @code{next-state-key} and @code{next-state-tick},
you can add them to the reactor at the bottom of the file with:

@code[#:multi-line #t]{
r = reactor:
  init: START,
  on-key: next-state-key,
  on-tick: next-state-tick,
  to-draw: draw-state
end
}

and test out your game!
}
}
@teacher{}

}

@point{
@student{
Stop the bars from overflowing some maximum.  Add an x-coordinate so the cat
moves around, either on key press or automatically.
}
}

]

}
}
