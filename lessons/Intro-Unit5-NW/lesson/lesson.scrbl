#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "5 minutes"]{
          @itemlist/splicing[
            @item{@tag[pedagogy]{Monitors on.} @tag[selftaught]{Open Ninja World.}}
            @pedagogy{@item{Students should open Ninja World, to see the dog and ruby flying across the screen}}
            @item{Let's look back at our Ninja world for a moment.}
            @item{How many things are in this world? 2. What are they? @code{dogX} and @code{rubyX}.}
            @item{What does @code{dogX} represent? @code{rubyX}?}
            @item{What function do we use to make a world? @code{make-world}}
            @item{What function updates the world? @code{update-world}}
            @item{What function draws it? @code{draw-world}}
            @item{How fast is the dog moving from left to right? How fast is the ruby moving right to left across the screen?}
            @item{Excellent! Now turn to page 21. @tag[pedagogy]{It's in a sheet protector, so that you can use it as a reference from now on.} What are the things in your world. @tag[pedagogy]{If you can tell me, I'll ask your partner what datatype each thing is. Go through the pairs, to make sure that everyone can list the names and types, as well as answer some questions about accessor functions}}
            @item{Go ahead and open your games. @tag[pedagogy]{As you can see, they have your images in them, but nothing else.} I want you to take two minutes to define your world struct at the top, and type in your example world, START. }]}