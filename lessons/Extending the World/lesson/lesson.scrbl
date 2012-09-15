#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
           @item{This section requires that you model each one of the changes to the code on a projector, with students following along. Make sure everyone can see what you're doing!}
           @item{Let's draw our TARGET in our world, at (500, 300). What will we need to modify? Our world structure? No - if the TARGET isn't moving, then nothing changes, so we don't need to keep track of it in the world. How about draw-world? Does that need to change?}
           @item{Yes it does! We need to put the TARGET image on top of everything we have so far. Take two minutes and add the TARGET now, so it shows up when you click "Run". Go!}
           @item{Okay, so now suppose the ruby is flying across the screen, moving left slowly at 5 pixels each frame. Now do we need to modify the World? Yes! Why? Because something is changing! Specifically, the x-coordinate of the ruby!}
           @item{What do I need to change in my world struct? }
           @item{How have our contracts changed? (Call on kids until you get all three, and write out the contracts for them) }
           @item{Okay, so let's go through the code, line-by-line, and see what changes. Look at our START variable - does that need to change? Yes! It uses make-world, which now requires two inputs in it's Domain. So what should the ruby's x-coordinate be when the simulation starts? How about 600? }
           @item{Take 10 seconds, and change the definition of NEX. Don't forget to think about how the ruby's x-coordinate has changed!}
           @item{Do our variable definitions need to change? No. Why not?}
           @item{What about draw-world? Does the contract change? No! The contract says it takes a World as it's Domain, and it still does. All we've changed is what's IN a world. Does draw-world still produce an Image? Yes.}
           @item{What needs to change about the body of draw-world? The ruby's x-coordinate should be pulled from our World structure!}
           @item{What about update-world? Does the contract change? No! Why?}
           @item{Let's get rid of the body completely, because a lot needs to change here. What do you think we should start out with? Let kids discuss.}
           @item{Once again, the contract saves us! Here's a quick tip: if the range is a World, we know that we have to make a world at some point. How do we make a world? make-world, of course!}
           @item{And the moment we write make-world, your instincts should kick in right away. What's in our world? A dogX and a rubyX...so you should write them down without even thinking! Don't use your brains yet!!! }
           @item{NOW you can use your brains. What should our dogX be? Well, we still want to move it to the right by 10. How do we do that? 10 plus whatever the dogX is. How do we get the dogX out of the world? How would we add ten to that?. And we want to move our rubyX left by 5... }
           @item{Which world are we pulling the dogX and rubyX out of?}
           @item{Do our examples need to change? Oh yes they do...}
           @item{Look at our first example: }
           @item{What's wrong with it? Well, how many things are being passed into make-world? Just one: the new x-coordinate. What's missing? The ruby's x-coordinate! }
           @item{Okay, and what do we want to do to the x-coordinate? We want the ruby to go left by 5, so what code do I write? }
@item{Take 30 seconds, and fix the second example. GO!}]}