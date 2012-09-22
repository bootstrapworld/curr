#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Collide?"
        #:duration "10 minutes"]{
          @itemlist/splicing[
            @item{So what do we want to do with this distance?}
            @tag[pedagogy]{@item{Using visual examples, ask students to guess the distance between an danger and a player at different positions. How far apart do they need to be before one has hit the other?}}
            @tag[selftaught]{@item{How close should your danger and your player be, before they "hit each other"?}}
            @item{@tag[pedagogy]{Make sure students understand what is going on by asking questions: }If the collision distance is small, does that mean the game is hard or easy? What would make it easier?}
            @item{At the top of @worksheet-link[#:page 39 #:name "collide"] you'll find the Problem Statement for @code{collide?}. Fill in the Design Recipe, and then write the code. Remember: you WILL need to make use of the @code{distance} function you just wrote!}
            @item{When you're done, @tag[pedagogy]{take two minutes to }type it into your game, under @code{distance}.}]}
