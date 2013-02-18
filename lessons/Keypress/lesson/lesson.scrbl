#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Keypress"
        #:duration "30 minutes"]{
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
		                                 (make-world (world-dogX START) (world-rubyX START) (+ (world-catY START) 10)))}]}
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
