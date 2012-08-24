#lang curr/lib
@(require 2htdp/image)
@declare-tags[pedagogy selftaught group]

@lesson[#:title "Player Movement" #:duration "25 min" #:prerequisites "Cond-Example-With-Pizza-Toppings"]{
@itemlist/splicing[
     @item{Great! Now that we know @code{cond} we can write @code{update-player}.}
     @pedagogy{@item{Draw a screen on the board, and label the coordinates for a player, target and danger. Circle all the data associated with the Player.}}
     @item{@bitmap{images/6.1.png}@think-about[#:question "What is the player's starting x-coordinate?"
                        #:answer "The player's starting x-coordinate is 200"]}
     @item{@think-about[#:question "It's starting y-coordinate?"
                        #:answer "The player's starting y-coordinate is 220"]}
     @item{@think-about[#:question "What about after it moves? What's the new x and y? What has changed? And by how much? What happens when we press the down key? What should the new coordinates be then?"
                        #:answer "After it moves, its x-coordinate is 200 while its y-coordinate is 240. The x-coordinate has not changed, but its y-coordinate has increased by 20. If you press the down key, the player moves down by 20, so its new coordinate would be (200, 220)."]}
    @pedagogy{@item{Get students to tell you what update player should do...}}
    @tag[selftaught]{@item{@think-about[#:question "What should update-player do?"
                                         #:answer "update-player should change the position of the player by 20 pixels"]}}
     @item{We want a function that will move up the screen 20 pixels when the user presses the up arrow and down 20 pixels when the user presses the down arrow.}
     @item{We've set up the computer to call @code{update-player}, passing in the player's y-coordinate and the name of the key pressed. The keypress will either be the string @code{"down"} or the string @code{"up"} (for now). 
           @think-about[#:question "What kind of data is the y-coordinate? What kind of data is the keypress?"
                        #:answer "The y-coordinate is a number and the keypress is a string"]}
     @pedagogy{@item{Make a table showing possibilities and results, walking students through it.}}
     @tag[selftaught]{@item{Here's an example of what possible keypresses and their results
                            @build-table/cols['("Keypress" "Result")
                                         '(("\"up\"" "\"down\"")
                                           ("player-y increases by 20" "player-y decreases by 20"))
                                          (lambda (r c) (para ""))
                                          2 2]
                            }}
     @item{With our pizza example, we had to deal with toppings that weren't on the menu. Now we need to deal with keys that aren't "up" or "down". 
           @think-about[#:question "How do we do that?"
                        #:answer "Do nothing! (Or have an else statement that returns the same position)"]}
     @item{On @worksheet-link[#:page 24 #:name "Design-Recipe-Update-Player"], you'll find the word problem for @code{update-player}. Grab a Design Recipe Worksheet, fill it out, and then write this function @tag[group]{with your team}.}
     @;Here students should open their files, review, and possibly add cheats.
     @item{If you don't like using the arrow keys to make the player move up and down, you can just as easily change them to work with "w" and "x".}
     @item{You can also add more advanced movement, by using what you learned about boolean functions. Here's are some ideas..
           @itemlist/splicing[@item{Warping: instead of having the player's y-coordinate change by adding or subtracting, replace it with a Number to have the player suddenly appear at that location. (For example, hitting the "c" key causes the player to warp back to the center of the screen, at y=240.)}
                               @item{Wrapping: Add a condition (before any of the keys) that check to see if the player's y-coordinate is above the screen (y > 480). If it is, have the player warp to the bottom (y=0). Add another condition so that the player warps back up to the top of the screen if it moves below the bottom.}
                               @item{Challenge: Have the player hide when the "h" key is pressed, only to re-appear when it is pressed again!}
                               ]}
                                 ]}