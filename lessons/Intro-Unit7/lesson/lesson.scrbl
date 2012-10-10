#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "5 minutes"]{
          @itemlist/splicing[
            @pedagogy{@item{Students should have Ninja World (with dogX, rubyX and catY defined) open on the computer.}}
            @tag[selftaught]{@item{Open Ninja World [WeScheme | DrRacket.}}
            @item{Let's return to our Ninja World...it's slowly turning into a finished game!}
            @item{Look at the code for @code{update-world}. @tag[pedagogy]{Raise your hand if you can tell me - in English - what this function does. Take a volunteer or two.}@tag[selftaught]{What does this function do?}}
            @item{What is @code{dogX} when the dog is in the center of the screen? 320. According to the code, what will the next @code{dogX} be?}
            @item{What is @code{dogX} when the dog is on the right-hand edge? 640. What will the next @code{dogX} be? And the next? And the next? It disappears and never comes back!}]}