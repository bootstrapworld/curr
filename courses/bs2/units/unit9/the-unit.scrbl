#lang curr/lib

@title{Unit 9: Completing Games}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < string=? and or}))]{  
@unit-descr{This unit includes instructions for adding frequently-requested elements to students' games, such as extra levels 
            and a scoring system. Students comfortable with structures are encouraged to use nested structures in their games
            for more complexity.}
 }

@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}
                            @item{Student workbooks}
                            @item{Language Table}
                            ]
        #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Congratulations! You've worked very hard throughout the last 8 lessons, and now your games
                                are almost completed. Your player can move any way you want, you've written the code to 
                                detect how far characters are from each other, and you've defined a whole bunch of 
                                conditional cases for different actions in your game. Have you brainstormed some 
                                extra things you want to add to your game?} 
                       @teacher{At this point in the course, students will have very different games, and will probably 
                                need individual help adding the finishing touches or extra elements. This unit includes 
                                ideas and instructions for frequently requested game elements (Using Ninja World as a 
                                template), but feel free to have your students get creative with their additions. For 
                                more practice with algebra, try challenging students to some 
                                @lesson-link[#:name "Harder-Problems-Algebra" #:label "harder problems"].}}
           ]
         }
                               
@lesson/studteach[#:title "Randomizing Ninja World" 
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use the random function to make their game characters 
                                           appear at different loations on the screen}]
        #:standards (list)
        #:materials @itemlist[@item{The Ninja World 6 file [NW6.rkt from 
                                    @resource-link[#:path "source-files.zip" #:label "source-files.zip"] |
                                    @(hyperlink "http://www.wescheme.org/view?publicId=LPpLz5AKHd" "WeScheme")] preloaded on students' machines}]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{If you open up the @(hyperlink "http://www.wescheme.org/view?publicId=LPpLz5AKHd" "Ninja World")
                                file, you'll see the (almost) completed game. However, right now the ruby and
                                dog appear at the same part of the screen every time, making this a pretty 
                                easy game. 
                                @activity{What will the y-coordinate of the dog always be? What about the ruby?}
                                Instead of appearing at the top of the screen every time, what if you could
                                make the dog show up at a random y-coordinate whenever it goes off the screen?
                                Racket already has a function to give you a random number, which could represent 
                                a character's y-coordinate: @code{random}. @code{random} takes 
                                in one number as it's domain, and returns a random number between 0 and that number. 
                                So if a game contains @code{(random 480)} in the code, it will return any number 
                                between 1 and 480.}
                        @teacher{}}
                 @point{@student{If you want the y-coordinate of the dog to change, you'll have to add it to the
                                 world structure.
                                 @activity{Go back to the top of the page where the World is defined and add in 
                                           a @code{dogY}. Don't forget to redefine your START and NEXT worlds, 
                                           to account for the extra item in the world struct.}
           @code[#:multi-line #t]{;; The World is the x and y positions of the dog, x position of the ruby, and y position of the cat
                                  (define-struct world (dogX dogY rubyX catY))}
                                 Right now the @code{draw-world} function draws the dog at it's current 
                                 x-coordinate, and a pre-set y-coordinate. 
                                 @activity{@itemlist[@item{At what y-coordinate is the dog drawn right now?}
                                                      @item{Now that @code{dogY} has been added to the world
                                                            structure, how do you get the @code{dogY} out of the world?}
                                                      @item{Change the @code{draw-world} function so that it 
                                                           draws the dog at the current y-coordinate instead of 400.}]}

                                 The dog's y-coordinate should change when it leaves the screen. 
                                 @activity{@itemlist[@item{What function changes the game state depending on 
                                                           the game's conditions?}
                                                      @item{What does the first @code{cond} branch in 
                                                            @code{update-world} test?}
                                                      @item{If this test returns @code{true}, what happens?}
                                                      @item{Change the first @code{cond} branch in @code{update-world}
                                                            so that if the cat collides with the dog, the dog's 
                                                            y-coordinate is resent to a random number between 0 and 480. }]}
          @code[#:multi-line #t]{[(collide? 320 (world-catY w) (world-dogX w) (world-dogY w)) (make-world -50
                                                                                              (random 480)
                                                                                              (world-rubyX w)
                                                                                              (world-catY w))]}

                                 Further down in @code{update-world}, you check to see if the dog has gone 
                                 off the right side of the screen.
                                 @activity{@itemlist[@item{If this test evaluates to @code{true}, to what x-coordinate 
                                                           does the dog return?}
                                                      @item{Change this @code{cond} branch so that the dog's 
                                                            y-coordinate is added to the world, as a random number 
                                                            between 0 and 480.}]}

                                 Be sure to go through your code carefully- since you changed the world structure to 
                                 include a @code{dogY}, you'll need to make sure it's included every time you call 
                                 @code{make-world}, @bold{and} every time a function takes in the y-coordinate of 
                                 the dog. Once the dog is reappearing randomly when it leaves the screen, you can 
                                 make the same changes to the ruby's y-coordinate to make it appear randomly, or
                                 add this concept to your own game.}
                         @teacher{Pay particular attention to the @code{distance} and @code{collide?} functions: 
                                  They take in the dog's y-coordinate, but it's currently hard-coded to always be 
                                  @code{400)}. Make sure students realize that every function that uses the dog's 
                                  y-coordinate must now get that value from the world structure, using 
                                  @code{(world-dogY w)}.}
                         }
                          ]
         }
                                
@lesson/studteach[#:title "Scoring and Levels"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will add a scoring system to their games}
                                         @item{Students will add levels to their games}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{New background image for Ninja World level two [bg2.jpg from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] or your own 640 x 480 image}]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Ninja World is looking good, but right now there's not a lot of variety.
                                The player avoids the dog and gets the ruby over and over again. We should
                                mix things up a bit: how about adding new levels? Typically a game would 
                                progress to a new level if the player has reached a certain goal: Collected
                                a certain number of rubies, destroyed a certain number of zombies, or reached
                                a certain score. Let's start by adding a scoring system to the Ninja World game.}
                        @teacher{Both the scoring system and randomizing the y-coordinates of the target and danger
                                 were part of the included teachpack in Bootstrap 1, code which ran "under the hood"
                                 in students' first Bootstrap game. Let them know that in Bootstrap 2, they no longer 
                                 @italic{need} this hidden code, because they've learned enough to program the entire 
                                 game (and more!) themselves.}}
                 
                 @point{@student{The score is something that will be changing in the game, so you can be 
                                 sure that it has to be added to the world structure.
                                 @activity{@itemlist[@item{What data type is the score? Number, String, 
                                                           Image, or Boolean?}
                                                      @item{What will be the score in the @code{START} world?}
                                                      @item{Change the world structure so it includes a 
                                                            @code{score}.}]}
@code[#:multi-line #t]{;; The World is the x and y positions of the dog, x position of the ruby,
                       ;; y position of the cat, and the player's score
                       (define-struct world (dogX dogY rubyX catY score))}
                                 Remember: Since the world structure is changing, you now have to go through 
                                 your game code- every time you make a world, the score must be included in 
                                 that world. @activity{How do you get the @code{score} out of the world?}}
                         @teacher{}}
                 
                 @point{@student{Now that the game has a score, it needs to be able to increase or decrease. 
                                 In Ninja World, the score should go up by 30 points when Ninja Cat collides 
                                 with the target, and down by 20 points when colliding with the danger.
                                 @activity{@itemlist[@item{Which of the @code{cond} branches in 
                                                                        @code{update-world} checks these conditions?}
                                                      @item{How would you decrease the @code{score} by 20 if
                                                            the player collides with the danger?}]}

@code[#:multi-line #t]{(define (update-world w)
                       (cond 
                       [(collide? 320 (world-catY w) (world-dogX w) (world-dogY w)) (make-world -50 
                                                                                              (random 480)
                                                                                              (world-rubyX w)
                                                                                              (world-catY w)
                                                                                            (-(world-score w) 20))]))}

                                 @activity{On the next cond branch, make the score increase by 30 points 
                                           when the cat collides with the ruby.}}
                         @teacher{Many students will want to display the score on their game screens. In order to do this 
                                  they will need to place an @italic{Image} of the score onto their scene in 
                                  @code{draw-world}. The function @code{number->string} takes in a Number for its domain and 
                                  returns a String representation of that number. This string can be passed to the @code{text}
                                  function to return an Image that can then be used in @code{draw-world}. For example, the
                                  expression:
                                  (@code{; text: String Number String String -> Image}) to return an Image. The expression:
                                  @code{(put-image (text (number->string (world-score w)) 50 "solid" "purple")
                                                    320 240
                                                    BACKGROUND)}
                                  will place the score (drawn in size 50, solid purple text) onto the center of the BACKGROUND.}}
                 
                 @point{@student{Ninja World has a scoring system: Now it's time to add some levels. For 
                                 this example, you'll make the game have a different background image when
                                 the player progresses to the next level. The player will reach level two 
                                 when his or her score is greater than 500.
                                 @activity{Where do you define the @code{BACKGROUND} image? Keep the original 
                                           background for the first level, but define a new variable, 
                                           @code{BACKGROUND2}, that will be used for level 2.} 
                                 Now that you have another background image, it needs to be drawn into the 
                                 game- but @bold{only} when a certain condition is met. 
                                 @activity{@itemlist[@item{What must be true for the player to progress to
                                                           level 2 in the game?}
                                                      @item{Which function handles the way the game looks?}
                                                      @item{What is the only thing different in level 2 of Ninja World?}]}
                                 The only thing that changes at level 2 is the way the game @italic{looks}: 
                                 specifically, the background image. Because the background only changes when 
                                 a certain condition is met, you'll need to change the @code{draw-world} 
                                 function so that it uses @code{cond}. Leave the current code alone for now
                                 and start right under @code{(define (draw-world w))}. 
                                 @activity{@itemlist[@item{What is the first thing to write, to let the computer 
                                                           know that this will be a function with different 
                                                           conditions?}
                                                      @item{What is the first condition to check? (Hint: is 
                                                            the sore large enough to progress to level 2?)}]}
@code[#:multi-line #t]{(define (draw-world w)
                                  (cond
                                  [(> (world-score w) 500) (.....)]))}

                                 If this test evaluates to @code{true}, the result will look similar to the 
                                 code you already have for draw-world, starting with @code{put-image}. 
                                 @activity{What is the one thing that needs to change?}
                                 Instead of putting all your images on top of @code{BACKGROUND}, you'll put 
                                 them over @code{BACKGROUND2}, your new background image:
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
                                 @activity{Don't forget to add an @code{else} clause before your original code, 
                                           right underneath what you just wrote. If the score is @bold{not} 
                                           greater than 500, the world will be drawn with the images on the 
                                           original background.}
                      @code[#:multi-line #t]{[else 
                                             (put-image PLAYER 
                                              320 (world-catY w)  
                                                     (put-image TARGET
                                                     (world-rubyX w) 300
                                                           (put-image CLOUD
                                                            500 400  
                                                                (put-image DANGER 
                                                                (world-dogX w) (world-dogY w)
                                                                       BACKGROUND))))]}
                
                                   Now Ninja World has a level 2! You can use the same process to add more levels 
                                   when the score gets even higher. Maybe instead of the background changing, you 
                                   can have the player transform, or make the game more difficult by making the 
                                   danger move faster.}
                         @teacher{@management{You can use the provided background image for level 2 of Ninja World, 
                                              or walk students through finding and adding their own image to the game.}

                                   Some more options for students who finish early: 
                                   @itemlist/splicing[@item{Change the update-world function so that the danger and
                                                            target move faster if the score is greater than 500.}
                                                       @item{Use the text function to display a game over message 
                                                             on the screen when the score drops below 0.}
                                                       @item{Change the images of all the game characters when the 
                                                             player progresses to the next level.}]}}
                 ]
         }
       
@lesson/studteach[#:title "Challenge: Nested Structures"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Reinforce understanding of structures as they are used in their games}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use nested structures to add complexity to their games}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that you know about data structures and how to use them, you can have games
                                that are even more complex. For example, you could make a game with many different
                                characters by making each character their own data structure.
                @code[#:multi-line #t]{;; A character is an image, speed, x-coordinate, and y-coordinate. 
                                       (define-struct character (image speed x y))
                                       
                                       (define DOG (make-character DANGER 10 -50 400))
                                       (define CAT (make-character PLAYER 20 320 240))
                                       (define RUBY (make-character TARGET 10 690 300))}
                                @activity{Define a character struct and some example characters for your own game. 
                                          They don't have to follow the same pattern- your characters can have a 
                                          health property instead of a speed, for example. Just be sure your newly 
                                          defined characters have the same properties as the character structure 
                                          you define.}
                                If each character is now its own structure, what will the world look like? Something like:
          @code[#:multi-line #t]{;; The World is three characters: (dog, cat, ruby) and a score
                                 (define-struct world (c1 c2 c3 score))}
                                @activity{Why is it important to use variable names (@code{c1}, @code{c2}, 
                                          and @code{c3}) instead of just defining the world struct to include 
                                          specific characters (@code{DOG}, @code{CAT}, @code{RUBY})?}
                                Variables are used in structs for the same reason variables are used in functions: 
                                we want to be able to change the value of those characters later. When 
                                you define the first world, you can then make your predefined character structs 
                                part of that world:
                                @code{(define START (make-world DOG CAT RUBY))}
                                Of course, you need some way to access parts of each character struct, even if 
                                it's inside another struct. This is just like accessing any part of a struct. 
                                @activity{@itemlist[@item{How do you get the first character out of the starting world?}
                                                     @item{What will that expression evaluate to?}
                                                     @item{How would you get the speed out of the resulting character?}
                                                     @item{@code{(character-speed (world-c1 START))}}]}
                                For even more of a challenge, every level in the game can be its own structure. A level 
                                could have a background image, characters, a boolean value representing wheather the 
                                player has collided with another character, or anything you like!}
                        @teacher{Using many nested structures can get tricky: if a student is struggling, have them draw
                                 the circles of evaluation for their expressions.}}
                ]
         }

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Congratulations! You started from scratch, and now have a working videogame!
                                We hope you’ll continue worlding on these games, keep hacking, and keep learning!}
                        @teacher{Have students show each other their completed games!}}
                 ]
         }
       }
       
   
          