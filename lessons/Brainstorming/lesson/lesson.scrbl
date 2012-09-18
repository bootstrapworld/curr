#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Game Brainstorming"
        #:duration "20 minutes"]{
          @itemlist/splicing[
            @item{@tag[pedagogy]{All of you have been working with structures for the last three lessons, and you've gotten really good at defining, making and accessing them.} Today, you're going to define the World structure for YOUR GAMES!}
            @item{Suppose I have a racing game, where my player is at the bottom of the screen, sitting in their car. In front of them, I have two lanes, with cars coming at me as I catch up to them. To move out of the way, I need to change into the left or right lane of the road. What are all the things I need to keep track of in my game? @itemlist/splicing[
                    @item{PlayerX - a number}
                    @item{CarY - a number}
                    @item{Car2Y (if I want another car) - a number}
                    @item{Score - a number}]}
            @item{How would I define this world? }
            @item{How do I get the playerX out of my word? My CarY? My Car2Y? The score?}
            @item{What if I wanted the player's car to change color as the score goes up? How would my world structure need to change?}
            @item{Now think about YOUR game - what will be changing in your world? @tag[pedagogy]{Pass out some scratch paper for the students to brainstorm on.  Make sure you force them to think about their world structures, and start simple!}}]}
                  