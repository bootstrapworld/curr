#lang curr/lib

@title{Unit 7: Complex update-world}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))]{
@unit-descr{Students continue to combine their use of Cond and Data Structures, this time identifying ways in which the World structure might change without any user input.}
}     
@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}
                            @item{Student workbooks}
                            @item{Language Table}
                            @item{The Ninja World 5 file [NW5.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=z01JR1UpNu" "WeScheme")] preloaded on students' machines}]
        #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                                @item{Write the Ninja World version of update-world towards the bottom of the board, with room to transform it into a cond branch under the function header.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{@itemlist[@item{Open the @(hyperlink "http://www.wescheme.org/view?publicId=z01JR1UpNu" "Ninja World 5") file. It's slowly turning into a finished game!}
                                          @item{What is in the world structure?}
                                          @item{What does the @code{update-world} function do?}
                                          @item{What is @code{dogX} when the dog is in the center of the screen? According to the code, what will the next @code{dogX} be?}
                                          @item{What is @code{dogX} when the dog is on the right-hand edge? What will the next @code{dogX} be? And the next? And the next?}
                                          @item{What happens when the dog reaches the edge of the screen? What SHOULD happen?}]}
Right now the dog disappears off the side of the screen and never comes back! It's time to fix that. }
                        @teacher{}}
                 ]
         }                               
@lesson/studteach[#:title "Protecting the Boundaries"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Add detail to their undertsanding of the update-world function}
            @item{Identify possible sub-domains which require different behavior of the function}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Just like in Bootstrap 1, we need to write a function that checks whether the dog has gone off the right side of the screen. First, let's review a few things:
@activity{@itemlist[@item{@code{true} and @code{false} are examples of what datatype?}
                    @item{What function takes two numbers, and checks if the first number is @italic{greater than} the second?}
                    @item{What function checks if a number is @italic{less than} another?}
                    @item{What function checks if two numbers are @italic{equal}?}]}
Here is the contract for the greater than function:
@code[#:multi-line #t]{; > : Number Number -> Boolean
                     ; Checks whether the first number is greater than the second}
@activity{Copy this into your Contracts page, and write down the contracts for the other two Boolean functions.}}
                        @teacher{@management{Review Booleans and Boolean functions.}}}
                 
                 @point{@student{@activity{@itemlist[@item{Turn to @worksheet-link[#:page 33 #:name "Boundary Checks"] in your workbook.}
                    @item{What is the name of the first function on this page?}
                    @item{@code{off-right?} will return @code{true} if a character goes off the right side of the screen. So, it will need to check if their x-coordinate is greater than what number? (Hint: How large is the game screen?)}
                    @item{Write the @vocab{Contract} for this function.}]}
@code[#:multi-line #true]{; off-right? : Number -> Boolean
                     ; returns true if the given number is greater than 640}
Now to pick a few example coordinates to write our EXAMPLEs: 
@activity{@itemlist[@item{What is an x-coordinate that would put a character at the center of the screen?}
                    @item{How do you check whether it's off the right hand side?}
                    @item{Any x-coordinate greater than 640 is off the right side of the screen, so how would you check if the example number is @italic{greater than} 640?}]}
@code{(EXAMPLE (off-right? 320) (> 320 640))}
@activity{Write another EXAMPLE for a coordinate that is off the screen on the right side, circle what changes, and write your function definition.}}
                         @teacher{ }}
                 @point{@student{You now have a function to check whether an object has run off the right side of the screen! But think about Ninja World: do you care whether the ruby goes off the right side? It's moving to the left! @activity{@itemlist[@item{Complete the design recipe for @code{off-left?} on @worksheet-link[#:page 33 #:name "Boundary Checks"]. Instead of checking if a number is greater than 640, what will you need to check?}
                    @item{When finished, copy your functions into your @(hyperlink "http://www.wescheme.org/view?publicId=z01JR1UpNu" "Ninja World 5") file, where it says @code{;; TESTS FOR COND}.}]}                                   
Now we have a way to check whether something has gone off the right OR the left of the screen, but we still haven't told the game what to do when it does. In Ninja World, after the dog goes off the right side of the screen, he should reappear on the left-hand side. @activity{In this situation, what would the next @code{dogX} be after 640?}
We want to change @code{update-world}, so that it behaves the old way most of the time, but it sets @code{dogX} to zero when @code{dogX} is greater than 640. @activity{What can we use that makes a function behave one way for some inputs, but another way for different inputs?}
For now there are two different @italic{conditions}: when @code{dogX} is greater than 640, and then the rest of the time. Let's work on the code for this:
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[...test...  ...result...]
		[else  (make-world  (+ (world-dogX w) 10) 
				    (- (world-rubyX w) 5)
				       (world-catY w))]))}
We still want our original code to be there - it's now going to be used in the @code{else} clause, because when @code{dogX} is not off the right side of the screen we want the world to update normally.
@activity{Think about the first condition. What is the test that tells you if a number is greater than 640?}
You could use the greater than function(@code{>}) and compare two numbers, but you've already written a function that takes in only one number, and tells you whether or not it is greater than 640. @code{off-right?} does the work for you!
But how would you check if the dog is off the right? You'll need to pull the dog's x-coordinate out of the world! @activity{@itemlist[@item{What function do we use for that?}
                    @item{So what will the input to @code{off-right?} be?}
                    @item{Add this to your @code{update-world} function:}]}
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) ...result...]
		[else  (make-world  (+ (world-dogX w) 10) 
				    (- (world-rubyX w) 5)
				       (world-catY w))]))}
The first clause tests whether the dog's x-coordinate is off the right side of the screen. If the test returns @code{true}, what should the result be? We know that we need to return a World, since the Range of @code{update-world} is a World. That means we can immediately write @code{(make-world...)}: 
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) 
			(make-world ...dogX...
				    ...rubyX...
				    ...catY...)]
		[else  (make-world  (+ (world-dogX w) 10) 
				    (- (world-rubyX w) 5)
				       (world-catY w))]))}
How should @code{dogX} change in this condition? We said we want to move the dog back to the left side of the screen.
@activity{@itemlist[@item{What will the new value of @code{dogX} be, if it it moves back to the left side of the screen?}
                    @item{Does @code{rubyX} change if the dog goes off the screen? How about @code{catY}?}]}
 @code[#:multi-line #t]{(define (update-world w)
	(cond
		[(off-right? (world-dogX w)) 
			(make-world 0
				    (world-rubyX w)
				    (world-catY w))]
		[else  (make-world  (+ (world-dogX w) 10) 
				    (- (world-rubyX w) 5)
				    (world-catY w))]))}
Now it's time to think about the ruby! 
@activity{@itemlist[@item{Instead of checking if @code{rubyX} was off the @bold{right} side of the screen, what do we need to check?}
                    @item{What function have you already written that checks if a number is less than 0?}
                    @item{How does @code{update-world} need to change? What will the second @code{cond} branch look like?}
                    @item{Finish the code for @code{update-world}, so that it also checks whether the ruby has gone off the left-hand side of the screen.}]}
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
				    (- (world-rubyX w) 5)
				    (world-catY w))]))}}
                         @teacher{This can be an opportunity to discuss abstraction, and the usefullness of reusing code, with your students. The @code{cond} tests in @code{update-world} could be written as: @code{(> (world-dogX w) 640)}, or @code{(< (world-rubyX w) 0)}, but this is more work than neccessary if the @code{off-right} and @code{off-left} functions have been written, and could be confusing for someone else looking at the code, who doesn't know why @code{dogX} is being compared to 640. Additionally, from a programming perspective, it makes sense to use the specific screen boundaries in as few functions as possible: If in the future, a programmer wants their game to be playable on a larger screen (such as a tablet), they must then go through their code and change every function that tests boundaries based on the old screen size, 640x480. If only the @code{off-right} and @code{off-left} functions use the screen size, the programmer can make a few quick changes to the numbers, instead of searching through @code{cond} branches such as in the second example.}}
                 ]
         }
       
@lesson/studteach[#:title "Tests and Results"
        #:duration "45 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use Cond in their update-world functions}
                                     @item{Students will identify circumstances in which the functions in their game should behave differently}
          @item{Students will define these circumstances - and the desired behavior - in code, as different Cond branches}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now to use what you know about boundary detection, and apply it to your own game. @activity{@itemlist[@item{Open your game file.}
                    @item{The first thing to do is to reformat your @code{update-world} function so that it uses @code{cond}, with your current code inside the @code{else} clause.}
                    @item{Next, copy and paste your @code{off-left?} and @code{off-right?} functions from Ninja World into your game.}
                    @item{Think about the things in your game that fly offscreen. Do they fly off the left? The right? The top or bottom? Do you need to write an @code{off-top?} function or @code{off-bottom?}}
                    @item{On @worksheet-link[#:page 34 #:name "Test and Result"], make a list of the tests that you need to do in the left hand column, to decide whether each thing flies offscreen. For example, with the dog we said @code{(off-right? (world-dogX w))}. On the right, figure out which world you need to make, so that the thing you're testing re-appears on screen once it's flown off.}]}}
                        @teacher{Work in small groups to complete the workbook page.}}
                 ]
         }

@lesson/studteach[#:title "Branches in update-world"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Look at the @code{cond} branches for Ninja World's @code{update-world} function. Notice that for each branch, we need a test and a result. This is exactly what you've written in your workbook for your game. All you need to do now is surround each row of your table with square brackets, and type it into your game!
@activity{Adapt @code{update-world} so that that each thing re-appears on screen once it's flown off.}}
                        @teacher{Work in pairs or small groups to assist students with their own @code{update-world} functions.}}
                 ]
       }

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Take a minute and admire your handiwork: You've put a lot of time and effort into your game during this course, and it's coming together nicely, with complex data structures and advanced movement. It's already much more sophisticated than your Bootstrap 1 game! But something is still missing: in the Ninja Cat game, nothing happens when the cat collides with the dog, or ruby! In the next unit we'll change that, and you'll be able to handle collisions with the characters in your game. Start thinking about what should happen when your player reaches some treasure, shoots a zombie, or some other condition in your game.}
                        @teacher{@management{Remind students how far they have come since Bootstrap 1, and the beginning of Bootstrap 2. They've expanded their knowledge of Racket and programming, learned about a brand new data type, and created their own advanced videogame!}
Have the students show each other their games!}}
                 ]
         }
       }