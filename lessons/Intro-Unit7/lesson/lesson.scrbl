#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Students should have Ninja World (with dogX, rubyX and catY defined) open on the computer, such that pressing "Run" will show the plane flying across the screen.}
            @item{Okay, let's return to our Ninja World...it's slowly turning into a finished game!}
            @item{Look at the code for update-world. Raise your hand if you can tell me - in English - what this function does. Take a volunteer or two.}
            @item{What is dogX when the dog is in the center of the screen? 320. According to the code, what will the next dogX be?}
            @item{What is dogX when the dog is on the right-hand edge? 640. What will the next dogX be? And the next? And the next? It never comes back!}]}