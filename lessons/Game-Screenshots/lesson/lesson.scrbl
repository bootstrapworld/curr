#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Game Screenshots" #:duration "30 minutes"
                #:prerequisites "Defining-Variables" ]{

@itemlist/splicing[
    @item{Suppose we wanted to combine your game images and layer them together to form a screenshot, so you could see what your game will look like. We want to take these images and stack them on top of each other - @think-about[#:question "what image goes on the bottom?" #:answer "The BACKGROUND."]}
    @item{There's also a variable called SCREENSHOT. @think-about[#:question "What is it defined to be?"
    #:answer @code{(define SCREENSHOT (put-image PLAYER 320 240 BACKGROUND))}]}
                     
    @item{@code{put-image} is a function that puts one image on top of another, at whatever coordinates you specify. In our screenshot, what is the image going on the top? @code{PLAYER}. At what coordinates? (320, 240)}
    @item{Try evaluating @code{SCREENSHOT} in the interactions window. You should see the player, right in the middle of the background. @think-about[#:question "How would you change the code so that the player is a little lower down? To the left? The right?" #:hint "Try it out."]}
    @item{Now we want to add another image. How about we add the TARGET? @think-about[#:question "Can you tell me what function will let us place this image on top of our stack?" #:answer @code{(put-image _______ _______ _______ _______)}]}
    @item{@think-about[#:question "What image goes on the top?" #:answer "Yes, TARGET!"] @think-about[#:question @list{"And where should we put it? How about someplace on the right-hand side of the screen?" @tag[pedagogy]{Raise your hand if you can give me some coordinates for that.}} 
#:answer @code{(put-image TARGET 550 100 _______)}]}
    @item{Click "Run", and evaluate @code{SCREENSHOT}. Does it look the way you expected? On your own, mess with the coordinates until the @code{TARGET} is placed where you want it to be.
          @tag[selftaught]{@embedded-wescheme[#:id "Put-image"
                   #:definitions-text "; Please type in your images to see how they look"]}}
    @item{@exercise{Can you add the @code{DANGER} on your own?}}
    
]}