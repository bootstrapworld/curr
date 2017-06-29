#lang curr/lib

@title{Build Your Own Animation}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
				       )]{

@unit-descr{Students create a game of their own design using what they have learned so far.}
}
@unit-lessons{
@lesson/studteach[#:title "Build Your Own Animation"
        #:duration "55 minutes"
        #:overview "Students practice what they have learned to make a new game from scratch"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students make a game or animation of their own design}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{Make sure students have completed units 1 through 5 before starting this lesson.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[
        @point{@student{You've now learned the core tasks that go into building an animation:
			@itemlist[@item{Draw some sketches to illustrate your animation}
			          @item{Analyze the game elements to identify the information that changes across frames}
				  @item{Create a data structure to capture those elements}
				  @item{Write @code{draw-state} and one or both of @code{next-state-tick} and
				        @code{next-state-key}}
				  @item{Create a reactor to pull it all together}
				 ]
		        In this lesson, we show you how to use our @italic{Animation Design Worksheet} to keep
			track of these steps as you build your own animation.
	                }
	       @teacher{This lesson is entirely optional.  If your students do want to make their own game,
	       		this walks them through the worksheet on how to do it.}}
			
        @point{@student{Let's get started!

			@activity{Brainstorm an animation or game that you would like to build.  Don't make it too
			complicated.  Start with no more than 4 pieces of changing information.}

			As we saw in
			the previous unit, we can always go back and add more elements or details to an
			existing animation.  So keep it simple to get a basic game running, then you can add more later.}
	       @teacher{}}
	       
        @point{@student{Turn the Animation Design Worksheet on @worksheet-link[#:name "build-own-design"] in your workbook.
			@activity{Fill in three sketches from your animation.  Discuss with your partner
			          whether the sketches you chose have highlighted interesting aspects of your game.}
		        }
	       @teacher{}}
	       
        @point{@student{The tables below the animation sketches ask you to identify the elements in your game.
			@activity{Fill in the first table, noting the elements that are changing and how they
			          are changing.  If you have more things changing than there are rows, consider
				  making a simpler animation first then extending (at the end of the lesson).}
	                Have your partner or a classmate check your work -- make sure you both agree that you've identified
			everything that is changing.
			@activity{Fill in the second table, figuring out datatypes that capture each piece of
			          information that is changing in your animation.  Talk with someone to check
				  your work (and help check the work of others).}
			}
	       @teacher{}}
	       
        @point{@student{The table at the bottom of the worksheet asks you to make a to-do list of which functions
			and components you will need to write to build your animation.

			@activity{Mark off which components and functions you expect to need. Think about whether
			          your animation updates on ticks, key presses, or both.}
		        }
	       @teacher{Students should have ended up checking "sample instances", @code{draw-state}, and "reactor", plus
	       	        one or both of @code{next-state-tick} and @code{next-state-key}.  Sample instances get
			created anytime you have to create a data structure, and every animation or game
			has an underlying data structure.}}
	       
        @point{@student{Go to the top of the second page of the worksheet.
			@activity{Define a data structure for your
	                game state, with one field for each piece of changing information that you identified
			in the table of the middle of page 1 of the worksheet. The name of your data structure
			is up to you, but should reflect the theme of your game (like "RocketState", "SoccerState",
			"OceanState", etc)}
			}
	       @teacher{}}

        @point{@student{Is your data structure defined?
			@activity{Write down the sample @vocab{instances} of your
			data structure for each sketch that you drew at the top of the first page of the worksheet.}
			At this point, you could open a new Pyret file and type in your data structure and
			your sample instances. This would help you check whether your instances and data block
			are consistent with each other.  If you don't have access to the computer right now,
			you can come back and do this step later.}
	       @teacher{As a general rule, sanity checking each bit of code and example as you go helps
	                students catch errors early.  So typing their work so far in now makes sense,
			if your class set up allows it.}}

        @point{@student{Now you have to develop whichever functions you marked off on the todo-list on the bottom
	                of page 1 of the worksheet.
			
			@activity{Pick one of the functions you need to develop.  Follow the design recipe, including
			working out examples, as you develop each function.  Finish and test each function before
			moving onto the next one.}

			There are extra design-recipe worksheets in the back of the workbook if you need them to
			help you remember the steps (domain and range, examples, function, and typing and testing
			your function).

			}
	       @teacher{You need to decide how much scaffolding and help your students need at this point. You
	                can feel free to let them work on their own, or you can encourage them to work through
			design-recipe worksheets if they still need the structure that those provide.  The main
			goal is to have students tackle only one function at a time, and to make sure it is
			working before they go on to the other functions.}}

        @point{@student{Finally, we can build and run the animation by defining a reactor.
		        @activity{Add a reactor to your file, then interact with it to run your animation!}

			Remember that a reactor looks like:
@code[#:multi-line #t]{
??? = reactor:
  init: ???,
  on-key: next-state-key,
  on-tick: next-state-tick,
  to-draw: draw-state
end}
                        where you replace the @code{???} with names and instances that correspond to your game.
			}
	      @teacher{}} 

	@point{@student{Congratulations!  You have created your own animation from scratch.
			If there are features you want to add, use the extra Animation Extension Worksheets from the
	                back of the workbook to help plan and manage your changes.  If you build up an animation
			one piece at a time, you can get to a fairly complex game in a manageable way.}
	       @teacher{}}
       ]}}
