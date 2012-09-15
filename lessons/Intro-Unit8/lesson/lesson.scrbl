#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Right now, in your games, what happens when the player collides with another game character? Nothing! We need to write a function change that.}
            @item{This is going to require a little math, but luckily it's exactly the same as it was in Bootstrap 1!}
            @item{Draw a number line, and place the cat and dog upon it.}
            @item{How far apart are the cat and dog? Move them. How about now? Move them. Now? Move them such that the dog and cat have switched positions. How about now?}
            @item{In one dimension, finding the distance is pretty easy. If the characters are on the same line, you just subtract one coordinate from another, and you have your distance. However, if all we did was subtract the second number from the first, the function would only work half the time! When I switched the cat and dog, did you still say "dog minus cat"? No! It turned into "cat minus dog"! How did you know?}]}