#lang curr/lib

@title{Unit 6: Key Events}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students return to the subject of partial functions, this time defining a key-event handler that modifies their world when certain keys are pressed.}

@objectives[@item{Extend their understanding of events to cover key-events}
            @item{Deepen their knowledge of conditionals, by combining them with struct accessor and constructor functions.}
          ]

@product-outcomes[
          @item{Students will define keypress, and hook it up to the event handler}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{Signs for kids, entitled "update-world", "draw-world" and "big-bang"}
           @item{Cutout images of the dog and ruby}
           @item{The Ninja World 4 file [NW4.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=VFrG3KV1pW" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@;; include whole lesson in pedagogy:
@lesson/studteach[#:title "Introduction"
        #:duration "15 minutes"]{
          @itemlist/splicing[
           @item{@pedagogy{On the projector, have the code for Ninja World.}}
           @item{@pedagogy{Draw a box on the board with @code{(make-world 0 640)} in it, labelled "world". Ask for a volunteer, and hang the update-world nametag around their neck.}}
           @item{You're going to be @code{update-world}. What is your contract? And what do you do? Excellent. This box is your world. If I were to say @code{(update-world (make-world 0 640))}, what would you change about this world? @pedagogy{The student should erase the 0 and write a 10, and erase the 640 and write a 635. If they are stuck, refer to the code.}}
           @item{Let's practice this a few times: "update-world this world"...20 630..."update-world this world"...30 625. Excellent.}
           @item{Now I need another volunteer. @pedagogy{Take one student, and put the big-bang sign around them.} Your name is @code{big-bang}. You're sort of like the quarterback here: you start the whole animation, and you have a timer. The class will yell "tick!" every five seconds, and you're going to tell @code{update-world} to update the world, just like I did. Let's try it out - every five seconds, I want you to give the current world to @code{update-world}, who will then update it and replace it with the new world. Ready? GO!}
           @item{@pedagogy{Let this go on for a few iterations, so the rest of the class can see the world structure being changed while they count down.}}
           @item{Which other function do we have to use to see an image of the world?}
           @item{I need another volunteer! @pedagogy{Take one student, and put the draw-world sign around them.} You guessed it! Your name is @code{draw-world}. Whenever you are evaluated, you'll be given a World and you'll have to place the image of the dog and the ruby at the appropriate spots.}
           @item{Change the value of the world back to 0 640. "draw-world this world"! @pedagogy{The student should look at the new value, and move the dog and ruby to the right spots. Repeat a few times, with different values for the World.}}
           @item{Okay, now let's put it all together! @pedagogy{Return the World value to 0 640. }@code{big-bang}, I want to call out "update-world this world" and "update-world this world". Try it out! @pedagogy{Make sure the World is updated to 10 595, the dog is drawn at 10, and the ruby at 595. }What's the value of our world now? 10 595! So what do you do? You call out "update-world this world" and "draw-world this world".}
           @item{When I say GO, the class will call out "tick" every five seconds. @code{big-bang}, what will you do every time you hear that? @pedagogy{Let big-bang explain.} Okay - let's do it!}
           @item{Kids see the dog moving across the screen, as a result of the World Structure changing.}
           @item{Excellent! We've made both the dog and the ruby move! But that's old news. We've already done that sort of thing, with the stuff moving on its own, in our games! Let's add to it.}
           @item{Say that I wanted to add a Ninja Cat. The time is nigh: we need to get that ninja onto the screen, so that our game is playable! Ninja cat is going to be able to move up and down. Do we need to change anything to make this work?}
           @item{We need to keep track of our catY, so we need to add it to our world. Where's the part of the code where we defined our struct? @code{define-struct}. @pedagogy{Change it in the code.}}
           @item{Excellent. So what does that mean about our simulation? Do we have to change anything here? Yes! The world in our simulation doesn't match! Let's add another part to our world struct...and what type is it going to need to be? A number.}
           @item{I want Ninja Cat to be right in the center of the screen. What does that make his y-coordinate? 240. @code{update-world}, can you change the world to have another space, starting at 240? @code{draw-world}, where are you going to put the cat? @code{big-bang}, does your job change? Nope! Alright...let's play the game. @pedagogy{Let a few iterations pass...} The cat doesn't move!}
           @item{Okay, now I'm going to hit the "up" key. Wait, why are you moving the cat? Which function are you? Is that your job? No...it's not in the code!}
           @item{Right now, even though we're putting the cat into the game, we don't have a function to take in keypresses and make it work! This is what we're going to write next.}
           @item{@pedagogy{Thank the volunteers, and let them have a seat}}
           @item{Before we figure out how to write the function to move the cat...we need to actually add him into the game! Which functions will we need to change?}
           @item{We need to change our @code{define-struct} statement, to add catY. We need to change every single @code{make-world}. We need to change @code{update-world}, and @code{draw-world}...so just about everything!}]}
                                
@lesson/studteach[#:title "Keypress"
        #:duration "35 minutes"]{
          @itemlist/splicing[
            @item{We're going to use the Design Recipe to write a function @code{keypress} for Ninja World. Take a look at  @worksheet-link[#:page 28 #:name "Keypress"] in your workbook. What's the first step in the Design Recipe?}
            @item{Step 1 - Contract and Purpose Statement  @itemlist/splicing[@item{What's the Name of our function? keypress.}
                @item{What about the Domain? What do we need to know in order to handle a keypress? Well, we need the World - otherwise we wouldn't know what to update! But we also need to know what key was pressed. What are @code{"up"} and @code{"down"}? A number, a string, a boolean or an image? We need a World and a String.}
                @item{The Range? A world.}
                @item{What's a good purpose statement for this function? @pedagogy{Let students discuss.}}]}
            @item{Step 2 - Examples  @itemlist/splicing[ 
                @item{Let's make an example using our @code{START} world, when the user presses @code{"up"}:}
                 @code[#:multi-line #t]{(EXAMPLE (keypress START "up") 
		                                  ...)}
                @item{What should we get back? Well, we know that our Range is a World, so immediately we can write:}
                 @code[#:multi-line #t]{(EXAMPLE (keypress START "up") 
		                                 (make-world ...dogX...rubyX...catY))}
                @item{Does the @code{dogX} change when the user types @code{"up"}? No! So how do we get the old @code{dogX} out of the @code{START} world? @code{(world-dogX START)}. So now we have: }
                 @code[#:multi-line #t]{(EXAMPLE (keypress START "up")
		                                 (make-world (world-dogX START)...rubyX...catY))}
                @item{Does the @code{rubyX} change when the user types @code{"up"}? No! So how do we get the old @code{rubyX} out of the @code{START} world? @code{(world-rubyX START)}. So now we have: }
                 @code[#:multi-line #t]{(EXAMPLE (keypress START "up")
		                                 (make-world (world-dogX START) (world-rubyX START) ...catY...))}
                @item{How does @code{catY} change? We need to add 10 to the old @code{catY}.  }
                 @code[#:multi-line #t]{(EXAMPLE (keypress START "up")
		                                 (make-world (world-dogX START) (world-rubyX START) (+ (world-catY START) 10)))}
                @item{Now how would I make an example using the @code{"down"} key? }
                 @code[#:multi-line #t]{(EXAMPLE (keypress START "down")
		                                 (make-world (world-dogX START) (world-rubyX START) (- (world-catY START) 10)))}]}
            @item{Step 3 - Definition  @itemlist/splicing[
                @item{What goes in our function header? This one is pretty straightforward: }
                 @code[#:multi-line #t]{(define (keypress w key)
	                                         ...)}
                @item{What now? This is a test of your programming intuition...we have two different examples here, where we add 10 in one case but subtract 10 in another. How can a function behave so differently? It has multiple conditions, with a different response to each. You've actually seen this before, back in Bootstrap I....COND!}
                @item{So we start with @code{cond}, and use those square brackets to add a branch. We know that every branch has a test and a result. }
                 @code[#:multi-line #t]{(define (keypress w key)
	                                   (cond
		                                 [...test...  ...result...]))}
                @item{Let's start with the @code{"up"} branch. We need to test if @code{"key"} equals @code{"up"}. How do we check if two strings are equal? }
                 @code[#:multi-line #t]{(define (keypress w key)
	(cond
		[(string=? key "up")  ...result...]))}
                @item{So what's the result, if the key is @code{"up"}? Well, we can look back at our examples for help! Just copy in the example we made for @code{"up"}, and change that @code{START} to a @code{w}: }
                 @code[#:multi-line #t]{(define (keypress w key)
	(cond
		[(string=? key "up")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                       (+ (world-catY w) 10))]))}
                @item{What about the @code{"down"} key? Go ahead and write the down branch yourself.}
                 @code[#:multi-line #t]{(define (keypress w key)
	(cond
                [(string=? key "up")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                       (+ (world-catY w) 10))]
                                                       
		[(string=? key "down")  (make-world (world-dogX w) 
                                                      (world-rubyX w) 
                                                        (- (world-catY w) 10))]))}
                @item{What about any other key? Should the world change if the user hits the spacebar, or the @code{"r"} key? No. So we add add "else" branch, which returns the same world that was passed in. }
                 @code[#:multi-line #t]{(define (keypress w key)
	(cond
                [(string=? key "up")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                      (+ (world-catY w) 10))]
                                                      
		[(string=? key "down")  (make-world (world-dogX w) 
                                                      (world-rubyX w) 
                                                        (- (world-catY w) 10))]
                [else w]))}]}
            @pedagogy{@item{If students finish early, have them add a keypress for "c", which causes the cat to jump to the center, or any other "cheat codes".}}]}

@(include-lesson (lib "curr/lessons/Keys-in-Game/lesson/lesson.scrbl"))


@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Have students show each other their controllable games!}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
