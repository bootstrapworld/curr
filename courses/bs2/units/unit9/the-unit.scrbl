#lang curr/lib

@title{Unit 9: Completing Games}

@declare-tags[group pedagogy selftaught]

@overview{
    
@unit-descr{This unit includes instructions for adding frequently-requested elements to students' games, such as extra levels and a scoring system. Students comfortable with structures are encouraged to use nested structures in their games for more complexity.}
            
@objectives[@item{Reinforce understanding of structures as they are used in their games}
          ]

@product-outcomes[
          @item{Students will use the random function to make their game characters appear at different loations on the screen}
          @item{Students will add a scoring system to their games}
          @item{Students will add levels to their games}
          @item{Students will use nested structures to add complexity to their games}
          ] 
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Language Table}
           @item{The Completed Ninja World file [NWComplete.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=SSJ5S3gDRD" "WeScheme")] preloaded on students' machines}
           @item{New background image for Ninja World level two [bg2.jpg from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] or your own 640 x 480 image}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}
}

@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"]{
          @itemlist/splicing[
           @item{Congratulations! You've worked very hard throughout the last 8 lessons, and now your games are almost completed!}
           @item{Your player can move any way you want, you've written the code to detect how far characters are from each other, and you've defined a whole bunch of conditional cases for different actions in your game.}
           @item{Have you brainstormed some things you want to add to your game? You have 5 minutes to discuss your ideas with your partner, and talk about how you could add them.}
           @pedagogy{@item{At this point in the course, students will have very different games, and will probably need individual help adding the finishing touches or extra elements. This unit includes ideas and instructions for frequently requested game elements (Using Ninja World as a template), but feel free to have your students get creative with their additions!}
                      @item{For more practice with algebra, try challenging students to some @lesson-link[#:name "Harder-Problems-Algebra" #:label "harder problems"].}}
           ]}
                               
@lesson/studteach[#:title "Randomizing Ninja World" 
        #:duration "15 minutes"]{
          @itemlist/splicing[ 
          @item{If you open up your Ninja World file, you'll see our (almost) completed game! However, right now the ruby and dog appear at the same part of the screen every time, making this a pretty easy game. What will the y-coordinate of the dog always be? What about the ruby?}
          @item{Instead of appearing at the top of the screen every time, what if we could make the dog show up at a random y-coordinate every time it goes off the screen?}
          @item{Racket already has a function to give us a random number, which could represent a character's y-coordinate. @code{random}! random takes in one number as it's domain, and returns a random number between 0 and that number. So if I write @code{(random 480)} in my code, it could give me back any number between 1 and 480.}
          @item{If we want the y-coordinates of our dog to change, we'll have to add it to our world structure. Go back to the top of the page where we defined our world and add in a @code{dogY}. Don't forget to redefine your START and NEXT worlds, to account for the extra item in your world struct!}
           @code[#:multi-line #t]{;; The World is the x and y positions of the dog, x position of the ruby,
                                  ;; and y position of the cat
                                  (define-struct world (dogX dogY rubyX catY))}
          @item{What function draws the dog on the screen with the rest of the game characters? @code{draw-world}. Right now this function draws the dog at it's current x-coordinate, and a pre-set y coordinate. How do we get the dog's y-coordinate out of the world? @code{(world-dogY w)}. Change the @code{draw-world} function so that it draws the dog at the current y-coordinate instead of 400.}
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
                                
@lesson/studteach[#:title "Scoring and Levels"
        #:duration "35 minutes"]{
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
          

@lesson/studteach[#:title "Challenge: Nested Structures"
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


@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Congratulations! You've completed every lesson, and your games look fantastic! You’ve all been really impressive, and it’s a pleasure working with you. We hope you’ll take these games home and keep hacking! Keep learning!}
  @item{Have students show each other their completed games!} 
   ]
          }

 @tag[selftaught]{Congratulations! You finished everything in the lessons! Now it's up to you to make your game even better. Can you think of anything else you want to add?
                        
                        @free-response[#:id "response"]}
}


@copyright[]
