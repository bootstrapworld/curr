#lang curr/lib

@declare-tags[group pedagogy selftaught]               
@lesson[#:title "Randomizing Ninja World" 
        #:duration "30 minutes"]{
          @itemlist/splicing[ 
          @item{If you open up your Ninja World file, you'll see our (almost) completed game! However, right now the ruby and dog appear at the same part of the screen every time, making this a pretty easy game. What will the y-coordinate of the dog always be? What about the ruby?}
          @item{Instead of appearing at the top of the screen every time, what if we could make the dog show up at a random y-coordinate every time it goes off the screen?}
          @item{Racket already has a function to give us a random number, which could represent a character's y-coordinate. @code{random}! random takes in one number as it's domain, and returns a random number between 0 and that number. So if I write @code{(random 480)} in my code, it could give me back any number between 1 and 480.}
          @item{If we want the y-coordinates of our dog to change, we'll have to add it to our world structure. Go back to the top of the page where we defined our world and add in a @code{dogY}. Don't forget to redefine your START and NEXT worlds, to account for the extra item in your world struct!}
           @code[#:multi-line #t]{;; The World is the x and y positions of the dog, x position of the ruby,
                                  ;; and y position of the cat
                                  (define-struct world (dogX dogY rubyX catY))}
          @item{What function draws the dog on the screen with the rest of the game characters? @code{draw-world}. Right now this function draws the dog at it's current x-coordinate, and a pre-set y coordinate. How do we get the dog's y-coordinate out of the world? @code{(world-dogY w)}. Change the @code{draw-world} function so that it draws the dog at the current y-coordinate instead of 400.}}
          @item{We said we want our dog's y-coordinate to change when it leaves the screen. What function changes the game state depending on the game's conditions? @code{update-world}!}
          @item{Our first cond branch in update-world checks whether the cat collides with the dog. If this happens, we don't want the dog to stay at its current y-coordinate. We already have the dog reappearing on the left side of the screen (by setting its x-coordinate to -50). Let's reset its y-coordinate to a random number between 0 and 480. Do you remember how to do this?} 
          @code[#:multi-line #t]{[(collide? 320 (world-catY w) (world-dogX w) (world-dogY w)) (make-world -50
                                                                                              (random 480)
                                                                                              (world-rubyX w)
                                                                                              (world-catY w))]}
          @item{Further down in @code{update-world}, we check to see if the dog has gone off the right side of the screen. Once again, we want to make the dog reappear at a random y-coordinate!}
          @item{Carefully go through your code- since we changed our world structure to include a @code{dogY}, we'll need to make sure we're including it every time we call @code{make-world}!}      
          @item{Once the dog is reappearing randomly when it leaves the screen, you can make the same changes to the ruby's y-coordinate to make it appear randomly, or add this concept to your own game.}
          ]}