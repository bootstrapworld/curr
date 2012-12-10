#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Boolean Functions" 
        #:duration "15 minutes"
        #:prerequisites "Intro-to-Booleans Contracts"]{
   @itemlist/splicing[
      @item{You've already learned many functions that allow you to create Booleans. < and >, for example, will all return a boolean when applied to the appropriate input.}
      @item{There are also many functions that work with Booleans, and let you do really complex tests.}
      @item{Tell me if the following statements are true or false:@itemlist/splicing[
             @item{Sugar is sweet. @selftaught{@fill-in-the-blank[#:id "bool1"]}}
             @item{Ice is hot. @selftaught{@fill-in-the-blank[#:id "bool2"]}}
             @item{Sugar is sweet @bold{and} Ice is cold. @selftaught{@fill-in-the-blank[#:id "bool3"]}}
             @item{Sugar is sweet @bold{and} Ice is hot. @selftaught{@fill-in-the-blank[#:id "bool4"]} @tag[(pedagogy selftaught)]{Why is it false? Isn't sugar still sweet?}}
             @item{Sugar is sweet @bold{or} Ice is cold. @selftaught{@fill-in-the-blank[#:id "bool5"]}}
             @item{Sugar is sweet @bold{or} Ice is hot. @selftaught{@fill-in-the-blank[#:id "bool6"]} @tag[(pedagogy selftaught)]{Why is it true? Ice isn't hot!}}]}
      @item{Did you notice how we joined the Boolean statements? What words did we use? (AND, OR).}
      @item{The key concept here is that @code{and} requires that both statements be true, and @code{or} needs @italic{at least one} to be true.}
      @item{@think-about[#:question "What are the contracts for both AND and OR?"
                                    @; MUTLIPLE ANSWERS
                         #:answer @code[#:multi-line #t]{
; and: Boolean Boolean -> Boolean
; Returns true if BOTH inputs are true
                                      
; or: Boolean Boolean -> Boolean  
; Returns true if EITHER of the inputs are true}]}
      @item{Turn to @worksheet-link[#:page 20 #:name "AND-and-OR"] and read the directions}
      @item{Take five minutes @tag[group]{with your team,} to draw the circle for each of the statements. Think about what Boolean functions you'll need for each one! When you're done, convert those circles into Racket code.
                              @tag[selftaught]{@embedded-wescheme[#:id "Booleans"
                   #:definitions-text ";Enter your code here!"]}}]}                                                                                                                