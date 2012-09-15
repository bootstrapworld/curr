#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{We're going to use the Design Recipe to write a function "keypress" for Ninja World. Take a look at page 28. What's the first step in the Design Recipe?}
            @item{Step 1 - Contract and Purpose Statement  @itemlist/splicing[@item{What's the Name? keypress}
                @item{What about the Domain? What do we need to know in order to handle a keypress? Well, we need the World - otherwise we wouldn't know what to update! But we also need to know what key was pressed. What are "up" and "down"? A number, a string, a boolean or an image? We need a World and a String}
                @item{The Range? A world.}
                @item{What's a good purpose statement for this function? Let students discuss.}]}
            @item{Step 2 - Examples  @itemlist/splicing[ 
                @item{Let's make an example using our START world, when the user presses "up":}
                @item{What should we get back? Well, we know that our Range is a World, so immediately we can write:}
                @item{Does the dogX change when the user types "up"? No! So how do we get the old dogX out of the START world? (world-dogX START). So now we have: }
                @item{Does the rubyX change when the user types "up"? No! So how do we get the old rubyX out of the START world? (world-rubyX START). So now we have: }
                @item{How does catY change? We need to add 10 to the old catY.  }
                @item{Now how would I make an example using the "down" key? }]}
            @item{Step 3 - Definition  @itemlist/splicing[
                @item{What goes in our function header? This one is pretty straightforward: }
                @item{What now? This is a test of your programming intuition...we have two different examples here, where we add 10 in one case but subtract 10 in another. How can a function behave so differently? It has multiple conditions, with a different response to each. You've actually seen this before, back in Bootstrap I....COND!}
                @item{So we start with cond, and use those square brackets to add a branch. We know that every branch has a test and a result. }
                @item{Let's start with the "up" branch. We need to test if "key" equals "up". How do we check if two strings are equal? }
                @item{So what's the result, if the key is "up"? Well, we can look back at our examples for help! Just copy in the example we made for "up", and change that START to a w: }
                @item{What about the down key? Take thirty seconds and write the down branch yourself. }
                @item{What about any other key? Should the world change if the user hits the spacebar, or the "r" key? No. So we add add "else" branch, which returns the same world that was passed in. }]}
            @item{If students finish early, have them add a keypress for "c", which causes the plane to jump to the center, or any other "cheat codes".}]}