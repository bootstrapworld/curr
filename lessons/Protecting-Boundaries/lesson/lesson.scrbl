#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Protecting the Boundaries"
        #:duration "20 minutes"]{
          @itemlist/splicing[
            @item{Just like in Bootstrap 1, we need to write a function that checks whether the dog has gone off the right side of the screen.}
@item{Turn to @worksheet-link[#:page 33 #:name "Boundary Checks"]. @tag[pedagogy]{Let's work through the first function together.} Write a function called @code{off-right?}, which returns true if a coordinate is greater than...what number? 640.}
@item{We're going to go through the design recipe, just like always: what's the first step? Contract and purpose statement. What's the name of the function? Domain? Range? Purpose statement?}
@item{Alright, let's pick a few example coordinates for our examples: What is an x coordinate that would put our dog on the center of the screen? How do we check whether it's off the right hand side? We said that anything greater than 640 is off the right side of the screen.}
@item{@tag[pedagogy]{Excellent! Take two seconds and write}@tag[selftaught]{Write} another example for a coordinate that is off the screen on the right, circle what changes, and write your definition.}
@item{@tag[pedagogy]{Pencils down. Excellent. }We've written a function to check whether an object has run off the right side of the screen! But do we care whether the ruby goes off the right side? It's moving to the left! @tag[pedagogy]{Take two minutes to go through another design recipe for @code{off-left?}.}@tag[pedagogy]{ Finish the next design recipe page, for @code{off-left?}}}
@item{Now we have a way to check whether something has gone off the right or the left of the screen, but we still haven't told our game what to do when it does. Think back to our dog, in Ninja World. Suppose we'd like it to reappear on the left-hand side. In that situation, what would the next @code{dogX} be after 640? ZERO.}
@item{We want to change @code{update-world}, so that it behaves the old way most of the time...but it sets @code{dogX} to zero when @code{dogX} is greater than 640. What can we use that makes a function behavior one way for some inputs, but another way for different inputs? Our old friend: @code{cond}!}
@item{We know that we'll have two conditions right now: when @code{dogX} is greater than 640, and then the rest of the time. Let's work on the code for this:}
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[...test...  ...result...]
		[else  (make-world  (+ (world-dogX w) 10) 
				       (world-rubyX w)
				       (world-catY w))]))}
@item{We still want our original code to be there - it's now going to be used in the else clause, because when @code{dogX} is not off the right side of the screen we want the world to update normally. @pedagogy{Walk the students through the transformation.}}
@item{Now let's look at the first condition. What is the test that tells us if something is greater than 640? }
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
                  
