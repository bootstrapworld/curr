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
                                         #:answer "update-player should change the position of the player"]}}
     @item{We want a function that will move up the screen when the user presses the up arrow and down when the user presses the down arrow.}
     @item{We've set up the computer to call update-player, passing in the player's y-coordinate and the name of the key pressed. The keypress will either be the string @code{"down"} or the string @code{"up"} (for now). 
           @think-about[#:question "What kind of data is the y-coordinate? What kind of data is the keypress?"
                        #:answer "The y-coordinate is a number and the keypress is a string"]}
     @tag[pedagogy]{@item{Make a table showing possibilities and results, walking students through it.}}
     @tag[selftaught]{@item{Here's an example of what possible keypresses and their results
                            @build-table/cols['("Keypress" "Result")
                                         '(("\"up\"" "\"down\"")
                                           ("player-y increases by 30" "player-y decreases by 30"))
                                          (lambda (r c) (para ""))
                                          2 2]
                            }}
     @item{With our pizza example, we had to deal with toppings that weren't on the menu. Now we need to deal with keys that aren't "up" or "down". 
           @think-about[#:question "How do we do that?"
                        #:answer "Do nothing! (Or have an else statement that returns the same position)"]}
     @item{On @worksheet-link[#:page 24 #:name "Design-Recipe-Update-Player"], you'll find the problem statement for update-player. Grab a Design Recipe Worksheet, fill it out, and then write this function @tag[group]{with your team}.}
     @;Here students should open their files, review, and possibly add cheats.
     @pedagogy{@item{Students can also add "cheat codes", by adding Cond branches for other keys. For example, a student might add @code{[(string=? key "c") 240]}, which causes the player to jump to the center of the screen if the c key is pressed.}}
     @tag[selftaught]{@item{You can also add "cheat codes", by adding Cond branches for other keys. For example, you might add @code{[(string=? key "c") 240]}, which causes the player to jump to the center of the screen if the c key is pressed.}}]}