#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Collide?" #:duration "20 minutes"]{

@itemlist[

@item{ So now we have a function called @code{distance}: two coordinates go in and one value comes out, representing the distance between those coordinates}
@item{If we write @code{(update-danger 10)}, we get back the location of the danger after it's at position 10.  If we write @code{(distance 100 200 95 65)} we get back the distance between the coordinates (100, 200) and (95, 65).}
@item{But what do we want to do with this distance?}
@item{@tag[pedagogy]{Using visual examples, ask students to guess the distance between a danger and a player at different positions.  How far apart do they need to be before one has hit the other?}}
@item{@tag[selftaught]{@think-about[#:question "How far apart do the danger and the player need to be before one has hit the other?"]}}
@item{@tag[pedagogy]{Make sure students understand what is going on by asking questions: If the collision distance is small, does that mean the game is hard or easy? What would make it easier?} @tag[selftaught]{@thinkabout[#:question "If the collision distance is small, does that mean the game is hard or easy? what would make it easier?" #:answer "A small collision distance is easier because the player can be closer to the danger without hitting"]}}
@item{At the bottom of page 29 you'll find the Problem Statement for collide?.  Fill in a Design Recipe Worksheet, and write the code.  Remember: you WILL need to make use of the distance function you just wrote!}
]}