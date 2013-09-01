#lang curr/lib

@title{Unit 7: Complex update-world}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students continue to combine their use of Cond and Data Structures, this time identifying ways in which the World structure might change without any user input.}

@objectives[@item{Add detail to their undertsanding of the update-world function}
            @item{Identify possible sub-domains which require different behavior of the function}
          ]

@product-outcomes[
          @item{Students will use Cond in their update-world functions}
          @item{Students will identify circumstances in which the functions should behave differently}
          @item{Students will define these circumstances - and the desired behavior - in code, as different Cond branches}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{The Ninja World 5 file [NW5.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=z01JR1UpNu" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
	  @item{Write the Ninja World version of update-world towards the bottom of the board, with room to transform it into a cond branch under the function header.}
          ]
}


}

@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"]{
          @itemlist/splicing[
            @pedagogy{@item{Students should have Ninja World (with dogX, rubyX and catY defined) open on the computer.}}
            @tag[selftaught]{@item{Open Ninja World [WeScheme | DrRacket.}}
            @item{Let's return to our Ninja World...it's slowly turning into a finished game!}
            @item{Look at the code for @code{update-world}. @tag[pedagogy]{Raise your hand if you can tell me - in English - what this function does. @pedagogy{Take a volunteer or two.}}@tag[selftaught]{What does this function do?}}
            @item{What is @code{dogX} when the dog is in the center of the screen? 320. According to the code, what will the next @code{dogX} be?}
            @item{What is @code{dogX} when the dog is on the right-hand edge? 640. What will the next @code{dogX} be? And the next? And the next? It disappears and never comes back!}]}
                               
                               
@lesson/studteach[#:title "Protecting the Boundaries"
        #:duration "20 minutes"]{
          @itemlist/splicing[
            @item{Just like in Bootstrap 1, we need to write a function that checks whether the dog has gone off the right side of the screen.}
@item{Turn to @worksheet-link[#:page 33 #:name "Boundary Checks"]. @tag[pedagogy]{Let's work through the first function together.} Write a function called @code{off-right?}, which returns true if a coordinate is greater than...what number? 640.}
@item{We're going to go through the design recipe, just like always: what's the first step? Contract and purpose statement. What's the name of the function? Domain? Range? Purpose statement?}
@item{Alright, let's pick a few example coordinates for our examples: What is an x coordinate that would put our dog on the center of the screen? How do we check whether it's off the right hand side? We said that anything greater than 640 is off the right side of the screen.}
@item{@tag[pedagogy]{Excellent! Take two seconds and write}@tag[selftaught]{Write} another example for a coordinate that is off the screen on the right, circle what changes, and write your definition.}
@item{@pedagogy{Pencils down. Excellent. }We've written a function to check whether an object has run off the right side of the screen! But do we care whether the ruby goes off the right side? It's moving to the left! Take two minutes to finish the next design recipe page for @code{off-left?}}
@item{Now we have a way to check whether something has gone off the right or the left of the screen, but we still haven't told our game what to do when it does. Think back to our dog, in Ninja World. Suppose we'd like it to reappear on the left-hand side. In that situation, what would the next @code{dogX} be after 640? ZERO.}
@item{We want to change @code{update-world}, so that it behaves the old way most of the time...but it sets @code{dogX} to zero when @code{dogX} is greater than 640. What can we use that makes a function behaves one way for some inputs, but another way for different inputs? Our old friend: @code{cond}!}
@item{We know that we'll have two conditions right now: when @code{dogX} is greater than 640, and then the rest of the time. Let's work on the code for this:}
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[...test...  ...result...]
		[else  (make-world  (+ (world-dogX w) 10) 
				       (world-rubyX w)
				       (world-catY w))]))}
@item{We still want our original code to be there - it's now going to be used in the else clause, because when @code{dogX} is not off the right side of the screen we want the world to update normally. @pedagogy{Walk the students through the transformation.}}
@item{Now let's look at the first condition. What is the test that tells us if a number is greater than 640? }
@item{@code{(off-right (....))}}
@item{But how do we check if the dog is off the right? We'll need to pull the dog out of the world! What function do we use for that? @code{world-dogX}. So what will our input to @code{off-right?} be? @code{(world-dogX w)}}
@item{Let's add this to the definition.}
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) ...result...]
		[else  (make-world  (+ (world-dogX w) 10) 
				       (world-rubyX w)
				       (world-catY w))]))}
@item{What should we have for our result?}
@item{Well, we know that we need to return a World, since the range of the function is World. That means we can immediately write @code{(make-world...)}: }
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) 
			(make-world ...dogX...
				    ...rubyX...
				    ...catY...)]
		[else  (make-world  (+ (world-dogX w) 10) 
				       (world-rubyX w)
				       (world-catY w))]))}
@item{How should @code{dogX} change in this condition? We want it to be zero! Since we want to move the dog back to the left side of the screen, we'll just replace it with zero!}
@item{Does @code{rubyX} change? No. Does @code{catY} change? No. }
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) 
			(make-world 0
				    (world-rubyX w)
				    (world-catY w))]
		[else  (make-world  (+ (world-dogX w) 10) 
				    (world-rubyX w)
				    (world-catY w))]))}
@item{Now let's think about the ruby. Instead of checking if @code{rubyX} was off the right side of the screen, what would I be checking?}
@item{How do I need to start changing @code{update-world}? By making a new @code{cond} branch! @tag[pedagogy]{Can you walk me through it? }}
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) 
			(make-world 0
				    (world-rubyX w)
				    (world-catY w))]
		[(off-left? (world-rubyX w)) 
			(make-world (world-dogX w)
				    640
				    (world-catY w))]
		[else  (make-world  (+ (world-dogX w) 10) 
				    (world-rubyX w)
				    (world-catY w))]))}
]}
       
@lesson/studteach[#:title "Tests and Results"
        #:duration "45 minutes"]{
          @itemlist/splicing[
            @item{Now open your own game file.}
@item{The first thing to do is to reformat your @code{update-world} function so that it uses @code{cond}, with your current code inside the @code{else} clause. @tag[pedagogy]{You have 5 minutes - GO!}}
@item{Next copy and paste your @code{off-left?} and @code{off-right?} functions from Ninja World into your game. @tag[pedagogy]{Take one more minute - GO!}}
@pedagogy{@item{5, 4, 3, 2, 1...MONITORS OFF!}}
@item{Think about the things in your game that fly offscreen. Do they fly off the left? The right? The top or bottom? Do you need to write @code{off-top?} or @code{off-bottom?}}
@item{On @worksheet-link[#:page 34 #:name "Test and Result"], make a list of the tests that you need to do in the left hand column, to decide whether each thing flies offscreen. For example, with the dog we said @code{(off-right? (world-dogX w))}. On the right, figure out which world you need to make, so that the thing you're testing re-appears on screen once it's flown off.}
@pedagogy{@item{Work in small groups to complete the workbook page.}}]}

@lesson/studteach[#:title "Branches in update-world"
        #:duration "15 minutes"]{
          @itemlist/splicing[
            @item{Look at our @code{cond} example @tag[pedagogy]{on the board, }for Ninja World. Notice that for each branch, we need a test and a result. This is exactly what you've written in your workbook. All you need to do now is surround each row of your table with square brackets, and type it into your game.}
@item{@pedagogy{Adapt @code{update-world} so that that each thing re-appears on screen once it's flown off.}}]}

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Have the students show each other their games!}
  @item{Cleanup, dismissal.}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
