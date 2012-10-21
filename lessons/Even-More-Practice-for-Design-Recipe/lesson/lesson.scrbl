#lang curr/lib
@declare-tags[pedagogy group selftaught]
@lesson[#:title "Even More Practice (Yard Area)"
        #:duration "20 minutes"]{
  @itemlist/splicing[
     @item{@pedagogy{If your students seem to be getting the hang of the Design Recipe, you can introduce the WeScheme Design Recipe Widget as described here. If they're still struggling, hold off until they really understand what the Design Recipe is for.} Now that you're getting a feel for the Design Recipe, I'd like to show you a way to fill out the Design Recipe @italic{on the computer}, so you don't need to write anything twice.}
      @item{In the WeScheme toolbar, click on the button that says "Recipe". A form will appear, with boxes for you to enter the function's Name, Domain and Range. Once you've filled these out, the form will unlock the next step in the Design Recipe: EXAMPLEs!}
      @item{Remember that every EXAMPLE has two parts! First, you need to write down an example of that function applied to some inputs. If your friend were acting as one of the functions we've done in the past (green-triangle, blue-circle, etc.), this is what you would say to them to make them do some work. The second part is the code for @italic{the work they would do.}}
      @item{Each of these parts much have it's own set of parenthesis, since they each have to be a valid Racket expression. If you make a mistake typing them in, the computer will tell you by outlining the box in red. Click on a red box for hint about what might be wrong.}
      @item{When you have two EXAMPLEs written out, the computer will unlock the last part of the Design Recipe: defining the function! Just as before, you can look at your examples and copy everything that @italic{has not changed}, and replace what has changed with a variable. }
      @item{When you're all done, you can click the "Insert" button, and WeScheme will take copy your Contract, Examples and Definition right into the editor!}
      @item{Doing things on the computer can be a real time-saver, but it's not as flexible as doing them on paper. For the final round, you can choose which method you'd like to use. In the future, you can also choose which one to use -- some people find they prefer sticking to paper to think things through, and others prefer working straight on the machine.}
     @item{Okay, now it's time for the final round. When I say go, @tag[group]{teams will } turn to @worksheet-link[#:page 13 #:name "Design-Recipe-Yard-Area"], and begin. @tag[group]{This time, each time will have 5 minutes to }Read the @bold{Word Problem}, write the contract, and fill out the examples. @tag[group]{One point for each section. } Any questions? On your mark ... get set ... GO!}
     @pedagogy{@item{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @item{Now @tag[group]{you'll have 5 more minutes to }finish the Design Recipe@tag[group]{, } and @tag[group]{to }type in your function and test cases. On your mark ... get set ... GO!}
     @pedagogy{@item{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @pedagogy{@item{If time allows, pass out extra Design Recipe worksheets [@resource-link[#:path "DesignRecipeWorksheet.pdf" #:label "PDF"] | @resource-link[#:path "DesignRecipeWorksheet.odt" #:label "Ooo"]], and run another round: e.g., one of
                                                                                   
           @code[#:multi-line #t]{
                (define (years-ago year) (- 2012 year))
                (define (plural word) (string-append word "s")) 
                (define (diamond size color) (rotate 45 (rectangle size size "solid" color)))
                 }}}]}