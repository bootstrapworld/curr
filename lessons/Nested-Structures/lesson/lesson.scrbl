#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Challenge: Nested Structures"
        #:duration "30 minutes"]{
        @itemlist/splicing[ 
          @item{Now that you know about data structures and how to use them, you can have games that are even more complex. For example, you could make a game with many different characters by making each character their own data structure!}
                @code[#:multi-line #t]{;; A character is an image, speed, x-coordinate, and y-coordinate. 
                                       (define-struct character (image speed x y))
                                       
                                       (define DOG (make-character DANGER 10 -50 400))
                                       (define CAT (make-character PLAYER 20 320 240))
                                       (define RUBY (make-character TARGET 10 690 300))}
          @item{Take a few minutes with your partner and define some characters for your own game. They don't have to follow the same pattern- your characters can have a health property instead of a speed, for example. Just be sure your newly defined characters have the same properties as the character structure you define!}
          @item{If each character is now its own structure, what will our world look like? Something like:}
          @code[#:multi-line #t]{;; The World is three characters: (dog, cat, ruby) and a score
                                 (define-struct world (c1 c2 c3 score))}
          @item{Why is it important to use variable names (c1, c2, and c3) instead of just defining our world struct to include specific characters (DOG, CAT, RUBY)? The same reason why we use variables in functions: we want to be able to change the value of those characters later if need be.}
          @item{When we define our first world, we can then make our predefined character structs part of that world.}     
          @code{(define START (make-world DOG CAT RUBY))}
          @item{We need some way to access parts of a struct, even if it's inside another. This is just like accessing any part of a struct. How do I get the first character out of my starting world? @code{(world-c1 START)}.}
          @item{What does this expression evaluate to? A character struct! How would I get the speed out of this character? @code{(character-speed (world-c1 START))}}
          @item{For even more of a challenge, you can make every level in your game its own structure. A level could have a background image, characters, a boolean value representing wheather the player has collided with another character, or anything you like!}
                ]}
                      
                