#lang curr/lib

@title{Unit 5: Key Events}


@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image} "circle(25, \"solid\", \"red\")"))]{
@unit-descr{Students are introduced to another type of event, called on-key. They define a key-event handler that modifies a reactor
            state to move a character when certain keys are pressed. To handle multiple possible keys, students return to the subject 
            of piecewise functions, giving them more practice with Pyret's if expressions.}
 }
@unit-lessons{
@lesson/studteach[#:title "2d Character Movement"
        #:duration "45 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students learn how to connect keypress events with their functions}
                                        @item{Students get practice with piecewise functions}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students implement the entire Sam the Butterfly activity from Bootstrap:Algebra with a character of their choice}]
        #:standards (list "BS-DS.1" "BS-DS.2" "BS-R")
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVVWk4MGJidEtsRWc" "Moving Character"] file preloaded on students' machines}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
@points[@point{
@student{

  We've already seen one kind of interactivity in our programs: getting
  the next state from the current state on a tick-event. This is perfect for
  animations that happen on their own, without any user intervention. In a game,
  that might be clouds moving across the sky or a ball bouncing on its own.
  An important kind of behavior in @italic{interactive} programs is to respond 
  user input, such as keypresses. A keypress, like the @code{tick} of a clock, 
  is a kind of @vocab{event}, and we'll re-use the idea of an event @vocab{handler}
  like @code{on-tick} and a function like @code{next-state-tick}. For key-events,
  the event handler is called @code{on-key}, and our function
  @code{next-state-key} will compute the next state from the current one after a
  key event.  We're going to use this idea to build up a @vocab{reactor} with a character
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
  
  We've filled in a picture of Sam the Butterfly from Bootstrap:Algebra. There is a
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
# next-state-key :: CharState, String -> CharState
# Moves the character by 5 pixels 
# in the corresponding direction
# if an arrow key ("up", "left", "down", or "right") 
# is pressed, & leaves the character in place otherwise
  }

@activity[]{
  How does the contract of @code{next-state-key} differ from the contract of
  @code{next-state-tick} in your previous programs?
}

  It is different from the contract for @code{next-state-tick} (which handles
  tick events) in an important way.  When a key event happens, the next state
  may differ depending on @italic{which} key was pressed.  That means the
  @code{next-state-key} function needs both the current state @italic{and} which key was
  pressed as parts of its domain.  That's why @code{next-state-key} has an
  additional @code{String} input, which represents the key pressed by the
  user.

@activity[]{
Create an example instance that corresponds to the position 5 pixels to the
@italic{right} of the example instance you wrote above.  Use @code{draw-state} to
check it, as before.
}

This gives us a good input and output test for the examples block when working
on @code{next-state-key}.  What call to @code{next-state-key} should connect
these two example instances?


@activity[]{
Use the Design Recipe to fill in your examples and definition of
@code{next-state-key}.  Use the sample instances you created before in
the examples block.
}

}

@teacher{It's an important point that @code{next-state-key} takes in an extra
piece of information: the pressed key.  This makes it much richer in terms of
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

  As with ticks-events, we can manually pass keypress strings into
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
Sam the Butterfly from Bootstrap:Algebra.  To get to the same point as in
Bootstrap:Algebra, we'd next implement @code{is-onscreen} to check if Sam has left
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
events.}}

@point{@student{Optional: implement boundaries to keep character onscreen, using the same
ideas as @code{safe-left} and @code{safe-right} from before.  You can also
write @code{safe-top} and @code{safe-bottom}, and use all of them to keep the
character fully on the screen.

Optional: use @code{num-to-string} and @code{text} to display the
position at the top of the window.
}
        @teacher{}
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
     #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVXy00M1VteEZxaHM" "Virtual Pet Starter"] file preloaded on students' machines}]
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
Run it. You will see a frame come up, showing a cat face and green status bars for the cat's sleep and hunger.
}

Notice that not much is happening! To make this game more interesting, we want to
add three behaviors to it:

@itemlist[@item{as time passes, the hunger and sleep values should decrease}
          @item{a human player should be able to increase hunger and sleep through keypresses}
	  @item{the image of the cat should change when hunger and sleep both reach 0 (and the player
	        loses the game)}]

In this lesson, you will extend the animation three times, once for each of these behaviors, by
adding or changing the functions that make up an animation.  
To do this, you will use the @italic{Animation Extension Worksheet} three times.
Note that none of these should require adding any new fields
to the data definition, just adding and editing functions like
@code{next-state-tick}, @code{next-state-key}, and @code{draw-state}.
We will walk you through the first use of the animation extension worksheet,
then let you try the other two on your own. }
@teacher{}
}

@point{@student{@bannerline{Extension 1: Decrease Hunger and Sleep on Ticks}
                For this extension, we want to decrease
		the hunger by 2 and the sleep by 1 each time the animation ticks to a new frame.

       @activity{Open your workbook to @worksheet-link[#:name "cat-hunger"], which
       		 shows you the extension worksheet filled in for this extension.}

In this filled-in worksheet, the description from the problem is written down into the "goal" part
of the worksheet.  This is like the "purpose statement" for the feature.

       @activity{Think about what sketches you would draw to illustrate the animation
                 with this new behavior.  Then check out the ones we drew on the example
		 worksheet.  Notice that they focus on the bars having different lengths.}
}
      @teacher{}}

@point{@student{Next, we consider the tables that summarize what now changes in the
                animation.
		@activity{What changes between frames now that didn't in the starter file
		          for the virtual pet?}
		The worksheet identifies that both hunger and sleep are changing in new ways.  Since
		they @italic{aren't} new fields, this feature is completely dependent on existing
		data, and we don't need to add any new fields. We therefore leave the second table
		empty (since we aren't adding new fields).
		}
       @teacher{}}

@point{@student{Next, we identify the components that we need to write or update. We don't
		need to change the data definition at all, because no new fields were added. We
		@italic{may} need to update @code{draw-state} function, since the size of the
		bars changes.  We definitely need to write the @code{next-state-tick} function,
		which doesn't yet exist.  We do not need to address anything about keypresses
		with this feature, so @code{next-state-key} is untouched  Since
		@code{next-state-tick} has been added for this feature, we need to add a
		@code{on-tick} handler to the reactor.}
       @teacher{}}

@point{@student{Now that we've planned what work needs to be done (on paper), we can start
                thinking about the code. As always, we write examples before we write functions,
		so we are clear on what we are trying to do.
		
		@activity{Come up with two example instances of @code{PetState} that
		          illustrate what should happen as we change the sleep and hunger fields.
			  You can see the ones we chose on the worksheet.  What's another good
			  example for us to use in coding and testing?}

	        In our samples, we estimate a bit from looking at the pictures, but note
		that we pick numbers that would work with the desired behavior – @code{MIDPET}
		represents the state after 25 ticks, because hunger is 50 less (decreased by 2
		each tick), and sleep is 25 less (decreased by 1 on each tick).  The @code{LOSEPET}
		sample instance corresponds to the state when both hunger and sleep values are 0.

		@activity{Use your sample instances to write examples of the @code{next-state-tick}
			  function, which we marked as a to-do item on the first page of the worksheet.}
		}
       @teacher{}}


@point{@student{Now we need to use this information to edit the current code,
		checking off the boxes we identified as we go.

		@activity{Look at the @code{draw-state} function: how will it need to change to draw
		          boxes for the sleep and hunger values?}

                The @code{draw-state} function already does this, so we can check the @code{draw-state}
		changes off as being done (without doing additional work).

		@activity{Develop @code{next-state-tick}, using the contract in the starter file
		          and the examples from the worksheet.}

		Once we've finished using the design recipe to implement @code{next-state-tick}, we can
		check off its box.  Finally, we need to add the handler to the @code{reactor}
		so the reactor calls the function we just wrote on tick events.

		@activity{Edit the @code{pet-react} reactor to include @code{next-state-tick} alongside the
		          @code{on-tick} handler.}

                 You should have ended up with something like this:

@code[#:multi-line #t]{
pet-react = reactor:
  init: FULLPET,
  on-tick: next-state-tick,
  to-draw: draw-state
end}

		Make sure you get a working animation with bars that decrease before moving on,
		like this:

		@bannerline{@animated-gif{images/cat-decreasing-bars.gif}}
          }
	  @teacher{}}

@point{@student{@bannerline{Modification 2: Key Events}
                Next, we'll add key events to the game so the player can increase them so they
		don't reach zero! 

		@activity[]{Turn to @worksheet-link[#:name "animation-extension-pet-key"] in your workbook.
		            Fill in the first page to plan out the following extension:
	    		    On a keypress, if the user pressed "f" (for "feed"), @code{hunger} should
			    increase by 10. If the user pressed "s" (for "sleep"), @code{sleep} should
	    		    increase by 5.  If the user presses any other keys, nothing should change.
            		    }

		As you fill in the worksheet, think about useful sketches that capture this new feature,
		whether you need new fields, and which functions are effected.

		@activity[]{When you've implemented @code{next-state-key},
		            you can add it to the reactor at the bottom of the file with:

@code[#:multi-line #t]{
pet-react = reactor:
  init: FULLPET,
  on-key: next-state-key,
  on-tick: next-state-tick,
  to-draw: draw-state
end}

and test out your game!
}}
         @teacher{}}

@point{@student{@bannerline{Modification 3: Change Pet Image When Game is Lost}

		@activity[]{ When any bar reaches zero, the game is lost and your pet is sad –
		             make the picture change to show the player this!  In addition, when the game is
			     lost, the "f" and "s" keys shouldn't do anything.  Instead, the user should be
			     able to press the "r" key (for "restart"), to reset hunger and sleep
			     100, and start playing again. Use the animation-extension worksheet on
			     @worksheet-link[#:name "animation-extension-pet-sad"] to plan out your changes.}
	         }

        @teacher{}}


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
@italic{features} that you can add to interactive programs.  You can work through
them all if you like, or come up with an idea for your own program, and try the
ones that will help you build your very own program!}

 @teacher{Some next steps/optional activities if students finish these activities:
@itemlist[@item{Find your own images to create a different virtual pet}
          @item{Stop the bars from overflowing some maximum. (produce something like @editor-link[#:public-id "0B9rKDmABYlJVNTR6ajd4N1hPRm8" "this completed game"])}
          @item{Add an x-coordinate to the PetState so the pet moves around, either on keypress or based on clock ticks.}
          @item{Add a costume to the PetState, then change the draw-pet function so that it changes the costume based on the pet's mood (if a-pet.hunger <= 50, show a pic of the pet looking hungry)}]

}}


]

}
}
