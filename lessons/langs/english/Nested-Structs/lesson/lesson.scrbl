#lang curr/lib


@lesson/studteach[#:title "Nested Structures"
        #:duration "30 minutes"
        #:overview "Students reinforce their understanding of structures as they are used in their games"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use nested structures to add complexity to their games}]
        #:standards (list "N-Q" "BS-M" "BS-PL.3" "BS-DS.1" "BS-DS.2" "BS-W")
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that you know about data structures and how to use them, you can make video games that are even more complex. For example, you could make a game with many different characters by making each character their own data structure. For example:
                @code[#:multi-line #t]{data Character:
                                         # A character is an image, speed, x-coordinate, and y-coordinate. 
                                         | character(image :: Image, speed :: Number, x :: Number, y :: Number)
                                       end

                                       DOG = character(DOG-IMG, 10, -50, 400)
                                       CAT = character(NINJA-IMG, 20, 320, 240)
                                       COIN = character(COIN-IMG, 10, 690, 300)}
                                @activity[#:forevidence (list "N-Q&1&1" "BS-M&1&1" "BS-PL.3&1&1" "BS-DS.2&1&2" "BS-W&1&5")]{Define a character struct and some example characters for your own game. They don't have to follow the same pattern- your characters can have a health property instead of a speed, for example. Just be sure your newly defined characters have the same properties as the character structure you define.}}
                        @teacher{}}
                 @point{@student{If each character is now its own structure, what would your world look like? Something like:
          @code[#:multi-line #t]{data World:
                                   # The World is three characters: (dog, cat, coin) and a score
                                   | world(c1 :: Character, c2 :: Character, c3 :: Character, score :: Number)
                                 end}
                                @activity[#:forevidence (list "BS-M&1&3")]{Why is it important to use variable names (@code{c1}, @code{c2}, and @code{c3}) instead of just defining the World struct to include specific characters (@code{DOG}, @code{CAT}, @code{COIN})?}
                                Variables are used in structs for the same reason variables are used in functions: we want to be able to change the value of those characters later. When you define the first world, you can then make your predefined character structs part of that world:
                                @code{worldA = world(DOG, CAT, COIN)}
                                Of course, you need some way to access parts of each character structure, even if it's inside another structure. This is just like accessing any part of a structure: with dot-accessors. 
                                @activity[#:forevidence (list "BS-DS.1&1&5")]{@itemlist[@item{How do you get the first character out of the starting world?}
                                                     @item{What will that expression evaluate to?}
                                                     @item{How would you get the speed out of the resulting character?}
                                                     @item{@code{worldA.c1.speed}}]}
                                For even more of a challenge, every level in the game can be its own structure. A level could have a background image, characters, a boolean value representing wheather the player has collided with another character, or anything you like!}
                        @teacher{Using many nested structures can get tricky: if a student is struggling, have them draw the circles of evaluation for their expressions.}}
                ]
         }