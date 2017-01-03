#lang curr/lib

@title{Unit 5: Key Press Events}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Students return to the subject of piecewise functions, this time defining a key-event handler that modifies a world when certain keys are pressed.}
 }
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
                             @item{The @editor-link[#:public-id "0B9rKDmABYlJVVWk4MGJidEtsRWc" "Moving Character"] file preloaded on students' machines}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
@points[@point{
@student{

  We've already seen one kind of interactivity in our programs: getting
  the next state from the current state on a tick-event. This drives
  animations forward, without any user intervention.  An important kind of behavior
  in @italic{interactive} programs is to respond to keypresses from the
  user.  A keypress, like a tick, is a kind of event, and we'll re-use the idea
  of a function like @code{next-state-tick} (this time called
  @code{next-state-key}) to compute the next state from the current one after a
  key event.  We're going to use this idea to build up a reactor with a character
  moving in two dimensions, where the movement is triggered by keypresses.

@activity[]{
  Open up the @editor-link[#:public-id "0B9rKDmABYlJVVWk4MGJidEtsRWc" "Moving
  Character"] template file.
}

  It contains a data block for representing a character's position
  (@code{CharState}) that has an x and y position.

@activity[]{
  Write an example instance of a @code{char-state} where both the @code{x}
  field and the @code{y} field are between 100 and 500.  Give it the name
  @code{middle}.
}
  
  We've filled in a picture of Sam the Butterfly from Bootstrap:1. There is a
  drawing function called @code{draw-state} provided that simply draws the
  character image on a white background at the x and y coordinate in a
  @code{CharState}.

@activity[]{
  Run the program, and use @code{draw-state} to draw the example instance you
  created above.  Did it appear where you expected?
}

This is a reminder that it's often useful, when working on programs that use
data to represent positions in an image, to make sure we understand what values
in the data structure correspond to which drawing behavior.

@activity[]{
  Write an example instance that represents the butterfly in the top-right corner of
  the window.  Give it a meaningful name of your own choice.  Re-run the
  program, and check using @code{draw-state} that it showed up where you
  expect.
}

  There is also a contract for a function @code{next-state-key}, which looks
  like:

  @code[#:multi-line #t]{
next-state-key :: CharState, String -> CharState
# Moves the character by 5 pixels in the corresponding direction
# if an arrow key ("up", "left", "down", or "right") is pressed,
# and leaves the character in place otherwise
  }

@activity[]{
  How does the contract of @code{next-state-key} differ from the contract of
  @code{next-state-tick} in your previous programs?
}

  It is different from the contract for @code{next-state-tick} (which handles
  tick events) in an important way.  When a key event happens, the next state
  may differ depending on @emph{which} key was pressed.  That means the
  @code{next-state-key} function needs both the current state @italic{and} which key was
  pressed as parts of its domain.  That's why @code{next-state-key} has an
  additional @code{String} input, which represents the key pressed by the
  user.

@activity[]{
Create an example instance that corresponds to the position 5 pixels to the
@emph{right} of the example instance you wrote above.  Use @code{draw-state} to
check it, as before.
}

This gives us a good input and output test for the examples block when working
on @code{next-state-key}.  What call to @code{next-state-key} should connect
these two example instances?


@activity[]{
Use the Design Recipe to fill in examples and an implementation of
@code{next-state-key}.  Use the sample instances you created before to fill in
the examples block.
}

}

@teacher{It's an important point that @code{next-state-key} takes an extra
piece of information in the pressed key.  This makes it much richer in terms of
its purpose statement, which should describe what different keys ought to do to
the state of the reactor.

Students will create something like @editor-link[#:public-id
"0B9rKDmABYlJVTUtoekI2XzE3Znc" "this completed file"] by adding a
next-state-key function}
}

@point{

@student{

@activity[]{
Once you've implemented @code{next-state-key}, experiment with it in the interactions pane:

@itemlist[

  @item{Try @code{draw-state(next-state-key(middle, "left"))}.  How is the
  output different from @code{draw-state(middle)}?}
  
  @item{Try using a few different calls to @code{next-state-key} to move the
  character several times, then draw it.  For example:

    @code[#:multi-line #t]{
draw-state(next-state-key(next-state-key(middle, "left"), "up"))
    }
  }
]
}

  As with ticks-events, we can manually pass key press strings into
  this function, see what the next state would be, and even draw that state
  to see what it looks like.  That's great, but we still want to hook
  this function up to a reactor, so that it actually handles
  keypresses from a user playing the game.  To do this, we need to create a
  reactor use @code{on-key} to specify that our @code{next-state-key} function 
  should be called when the user presses a key (we don't need to specify an
  @code{on-tick} handler, since for now the only movement in our program comes
  from keypresses). Our reactor with a @code{to-draw} and @code{on-key} handler
  looks like this:

@code[#:multi-line #t]{
char-react = reactor:
  init: middle,
  to-draw: draw-state,
  on-key: next-state-key
end
}

@activity[]{

Make your program create a reactor by that uses the @code{on-key} handler with
the @code{next-state-key} function you just implemented.  Run the program and
use @code{interact(char-react)} to start the reactor.  Does it work the way you
expected?  If it doesn't, check:

@itemlist[

@item{Does the program have any typos or syntax errors?}

@item{Do the examples of @code{next-state-key} match what you expect, creating
a new @code{char} instance with appropriate @code{x} and @code{y} values?}

@item{Do the examples pass the implementation of @code{next-state-key}?}

@item{Did you remember to add @code{on-key} to the reactor?}

@item{Did you remember to re-run the program and use @code{interact} to start
the animation?}

]

}

With this working, you can see the behind-the-scenes work that was going on in
Sam the Butterfly from Bootstrap:1.  To get to the same point as in
Bootstrap:1, we'd next implement @code{is-onscreen} to check if Sam has left
the board, and use it in @code{next-state-tick}.

}
@teacher{ Act out a reactor with key-events. You will need four students: one who
acts as the @code{next-state-key} function, one who acts as the keyboard (you
could also have the class act as a keyboard by having students shout out keys),
one who acts as the reactor, and one who acts as the @code{draw-state} function. Give
each student a few sheets of paper and something to write with.

@itemlist[
@item{When a key is "pressed" by the keyboard, the reactor write doesn the current
state and the key that was pressed, then shows their paper to @code{next-state-key}. 
}
@item{@code{next-state-key} produces a new state based on the current state and the key, 
writes it down, and then hands the new state back to the reactor.}
@item{The reactor @italic{discards} their old state, replacing it with the
new one, and shows the new one to @code{draw-state}.}
@item{@code{draw-state} produces an image for the reactor to post, and draws it on paper. 
They hand the image to the reactor, who holds it up as the new frame in the animation.}
]

We recommend @bold{not} having a @code{next-state-tick} function for this activity,
to keep the focus on key events.  You can add a @code{on-tick} handler in
a separate stage when talking through games which have both time- and key-based
events.}

Optional: implement boundaries to keep character onscreen, using the same
ideas as @code{safe-left} and @code{safe-right} from before.  You can also
write @code{safe-top} and @code{safe-bottom}, and use all of them to keep the
character fully on the screen.

Optional: use @code{num-to-string} and @code{text} to display the
position at the top of the window.
}


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
                             @item{The @editor-link[#:public-id "0B9rKDmABYlJVXy00M1VteEZxaHM" "Virtual Pet Starter"] file preloaded on students' machines}]
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
an interactive "digital-pet" from scratch!

@activity[]{

Open the @editor-link[#:public-id "0B9rKDmABYlJVXy00M1VteEZxaHM" "Virtual Pet Starter"] file.
Run it, and use @code{interact(pet-react)} to see the game run.

}

Notice that not much is happening!  It's going to be your job to write two
functions, one to compute the next state for a tick, and one to compute the
next state for a keypress.  You'll also update the drawing function to change
the pet's appearance when the player loses the game.

To do this, you will use the @emph{Animation Design Worksheet} three times to
augment the game.  Note that none of these should require adding any new fields
to the data definition, just adding and editing functions like
@code{next-state-tick}, @code{next-state-key}, and @code{draw-state}.

@activity[]{
The next state on each tick should be a state where the hunger is decreased by 2,
sleep is decreased by 0.5 (or 1/2), and happiness is decreased by 1.
}


Open your workbook to @worksheet-link[#:page 32 #:name "anim-design-pet"], and use the animation design worksheet to work
through this new feature.  For example, we know the image on each frame should
show smaller bars on each tick.  The drawing function already draws the bars by
using the length from the world – how could we check?  We know we should
update the @code{next-state-tick} function to add this behavior, because the
problem description only talks about tick events, not key events.  We also know
we don't need to add any new fields, because the problem description only talks
about existing fields.  Make sure you get a working animation with bars that
decrease before moving on, like this:

@bannerline{@animated-gif{images/cat-decreasing-bars.gif}}

Next, we'll add key events to the game so the player can increase them so they
don't reach zero!

@activity[]{
On a keypress, if the user pressed "f" (for "feed"), @code{hunger} should
increase by 10. If the user pressed "p" (for "play"), @code{happy} should
increase by 3.  If the user pressed "s" (for "sleep"), @code{sleep} should
increase by 5.  If the user presses any other keys, nothing should change.
}

Follow the animation design worksheet, and work through this one on your own.
What function needs to change?  What functions can stay the same?  Are any new
fields needed?  Hint: The problem description mentions all existing fields and
the @code{next-state-key} function.

@activity[]{
When you've implemented @code{next-state-key},
you can add it to the reactor at the bottom of the file with:

@code[#:multi-line #t]{
pet-react = reactor:
  init: FULLPET,
  on-key: next-state-key,
  on-tick: next-state-tick,
  to-draw: draw-state
end}

and test out your game!
}




@activity[]{ When any bar reaches zero, the game is lost and your pet is sad –
make the picture change to show the player this!  In addition, when the game is
lost, the "f", "p", and "s" keys shouldn't do anything.  Instead, the user
should be able to press the "r" key (for "restart"), to reset hunger, sleep,
and happiness to 100, and start playing again.}


}

@teacher{

Some next steps/optional activities if students finish these activities:
@itemlist[@item{Find your own images to create a different virtual pet}
          @item{Stop the bars from overflowing some maximum. (produce something like @editor-link[#:public-id "0B9rKDmABYlJVNTR6ajd4N1hPRm8" "this completed game"])}
          @item{Add an x-coordinate to the PetState so the pet moves around, either on keypress or automatically.}
          @item{Add a costume to the PetState, then change the draw-pet function so that it changes the costume based on the pet's mood (if a-pet.hunger <= 50, show a pic of the pet looking hungry}]

}
}


@point{
@student{

You now know everything you need to build interactive games that react to the
keyboard, draw an image, and change over time!  These are the fundamentals of
building up an interactive program, and there are a lot of games, simulations,
or activities you can build already.  For example, you could build Pong, or the
extended Ninja Cat, a more involved Pet Simulator, a game with levels, and
much, much more.

Some of these ideas are more straightforward than others with what you know.
The rest of the workbook and units are designed to show you different
@emph{features} that you can add to interactive programs.  You can work through
them all if you like, or come up with an idea for your own program, and try the
ones that will help you build your very own program!}
 @teacher{}
}


]

}
}
