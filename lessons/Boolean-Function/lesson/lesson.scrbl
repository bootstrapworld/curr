#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Boolean Function" 
        #:duration "15 minutes"
        #:prerequisites "Intro-to-Booleans Contracts"]{
   @itemlist/splicing[
      @item{You've already learned many functions that allow you to create Booleans. < and >, for example, will all return a boolean when applied to the appropriate input.}
      @item{There are also many functions that work with Booleans, and let you do really complex tests.}
      @item{@tag[pedagogy]{Pick up two, easily-distinguishable objects (a pen and an eraser, for example).} @tag[selftaught]{Pretend you are holding a pen and an eraser}  Tell me if the following statements are true or false:
             I am holding a pen: @fill-in-the-blank[#:id "T/F"].
             I am holding an eraser: @fill-in-the-blank[#:id "T/F"]
             I am holding a pen AND an eraser: @fill-in-the-blank[#:id "T/F"]
             @tag[pedagogy]{Drop the pen}@tag[selftaught]{Now the pen is dropped}.
             I am holding a pen AND an eraser: @fill-in-the-blank[#:id "T/F"].
             I am holding a pen OR an eraser: @fill-in-the-blank[#:id "T/F"].
             @tag[pedagogy]{Drop the eraser}@tag[selftaught]{Now the eraser is dropped}.
             I am holding a pen OR an eraser: @fill-in-the-blank[#:id "T/F"].}
      @item{Did you notice how we joined the Boolean statements? What words did we use? (AND, OR).}
      @item{@think-about[#:question "What are the contracts for both AND and OR?"
                                    @; MUTLIPLE ANSWERS
                         #:hint @code[#:contract "and: Boolean Boolean -> Boolean" #:purpose "Returns true if BOTH inputs are true."]
                         #:answer @code[#:contract "or: Boolean Boolean -> Boolean" #:purpose "Returns true if EITHER of the inputs are true."]]}
      @item{Turn to @worksheet-link[#:page 20 #:name "AND-and-OR"] and read the directions}
      @item{Take five minutes @tag[group]{with your team,} to draw the circle for each of the statements. Think about what Boolean functions you'll need for each one! When you're done, convert those circles into Racket code.
                              @tag[selftaught]{@embedded-wescheme[#:id "Booleans"
                   #:definitions-text ";Enter your code here!"]}}]}                                                                                                                