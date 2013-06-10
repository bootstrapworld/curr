#lang curr/lib

@declare-tags[group pedagogy selftaught] 

@lesson[#:title "Scoring and Levels"
        #:duration "50 minutes"]{
          @itemlist/splicing[ 
          @item{We've got Ninja World looking great! But right now there's not a lot of variety. The player avoids the dog and gets the ruby over and over again. We should mix things up a bit: how about adding new levels?}
          @item{Typically a game would progress if the player has reached a certain goal. (Collected a certain number of rubies, destroyed a certain number of zombies, or reached a certain score). Let's start by adding a scoring system to our Ninja World game.}
          @item{The score is something that will be changing in the game, So we know it has to be added to our world structure. What data type is the score? What will the score in our START world be?}
          @code[#:multi-line #t]{;; The World is the x and y positions of the dog, x position of the ruby,
                                 ;; y position of the cat, and the player's score
                                  (define-struct world (dogX dogY rubyX catY score))}
          @item{Remember! Since we're changing the world structure, we now have to go through our game code- every time we make a world, we need to include the world's score.}
          @item{How to we get the score out of our world? @code{(world-score w)}. Take 5 minutes and add a score to your game, every time @code{make-world} is used.}
          @item{Now that we have a score, when should it increase or decrease? In Ninja World, I want the score to go up by 30 points when Ninja Cat collides with the target, and down by 20 points when colliding with the danger. Which of our cond branches in @code{update-world} checks these conditions?}
          @item{If the player collides with the danger, we want to make a new world with a lower score. All we have to do is subtract 20 from the score when we call @code{make-world}.}
          @code[#:multi-line #t]{(define (update-world w)
                                 (cond [(collide? 320 (world-catY w) (world-dogX w) (world-dogY w)) (make-world -50 
                                                                                                    (random 480)
                                                                                                    (world-rubyX w)
                                                                                                    (world-catY w)
                                                                                                    (-(world-score w) 20))]))}
          @item{On the next cond branch, make the score increase by 30 points when the cat collides with the ruby.}
          @item{Our game has a scoring system! Now let's add some levels.}
          @item{When the player progresses to level two I want the game to have a different background image. The player reaches level two when his or her score is greater than 500.}
          @item{Let's think about the first part- where do we define our BACKGROUND image? We want to keep our original background for the first level, but let's define a new variable, BACKGROUND2, that will be used for level 2. @pedagogy{You can use the provided background image, or walk students through finding and adding their own image to the game.}} 
          @item{Now that we have another background image, we need to draw it in our game- but we only want to see this new background when a certain condition is met. When will the player reach level 2? When their score is greater than 500.}
          @item{We'll need to change our draw-world function so that it uses cond! Leave the current code alone for now and start right under @code{(define (draw-world w))}. What's the first thing we write? cond! And what's the first condition that we're checking? Whether the world's score is greater than 500!}
           
           @code[#:multi-line #t]{(define (draw-world w)
                                  (cond
                                  [(> (world-score w) 500) (.....)]))}
          @item{If the world's score is greater than 500, the player progresses to the next level. For now, the only thing that I want to change in level two is the background image. The second part of this cond statement will look similar to the code you already have for draw-world, starting with @code{put-image}. What needs to change? Instead of putting all your images on top of BACKGROUND, you'll put them over BACKGROUND2, your new background image.}
                @code[#:multi-line #t]{(define (draw-world w)
                                       (cond 
                                       [(> (world-score w) 500) (put-image PLAYER 
                                                                  320 (world-catY w)  
                                                                      (put-image TARGET
                                                                      (world-rubyX w) 300
                                                                            (put-image CLOUD
                                                                             500 400  
                                                                                (put-image DANGER 
                                                                                (world-dogX w) (world-dogY w)
                                                                                      BACKGROUND2))))]))}
          @item{Don't forget to add an 'else' case before your original code, right underneath what you just wrote. If the score is @bold{not} greater than 500, the world will be drawn with the images on the original background:
                      @code[#:multi-line #t]{[else 
                                             (put-image PLAYER 
                                              320 (world-catY w)  
                                                     (put-image TARGET
                                                     (world-rubyX w) 300
                                                           (put-image CLOUD
                                                            500 400  
                                                                (put-image DANGER 
                                                                (world-dogX w) (world-dogY w)
                                                                       BACKGROUND))))]
                }}
          @item{Great! Now our game has a level 2! You can use the same process to add more levels when the score gets even higher.}
          @pedagogy{@item{Some more options for students who finish early:}
                     @itemlist/splicing[
                     @item{Change the update-world function so that the danger and target move faster if the score is greater than 500.}
                     @item{Use the text function to display a game over message on the screen when the score drops below 0.}
                     @item{}]}
        ]}
          

