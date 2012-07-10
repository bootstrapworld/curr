#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Dissecting a Demo (new)" 
        #:duration "10 minutes"]{

Let's get started by looking at an example of a game created using the
tools you'll be learning in this course.  By the end of the course,
you will create a similar game of your own design.


Run the "NinjaCat" program [ @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/NinjaCat.zip"
           "DrRacket") | @(hyperlink "http://www.wescheme.org/view?publicId=gaffe-tinge-swipe-oscar-diver"
           "WeScheme") ].  You should see a dog running across the
           screen.  The player controls the ninja-cat: every time
           ninja-cat touches the ruby, the player scores points.

The first step in making a game is figuring out what items will be in
the game and how each one should move.  Let's start by writing out
this information for the NinjaCat game.
Turn to @worksheet-link[#:name "How-Does-Ninja-Cat-Work" #:page 1] in
your workbook.  In the first column write down all of the items that
you see in the game (such as "dog").  In the second column, write down how each item
changes when you play the game.  For example, think about the Ruby:
does it get bigger?  Change color?  Spin around?  

In NinjaCat, the
only thing that changes about the Ruby is its position.  Everything
else about it is the same.  So your worksheet for the Ruby should say 

@(build-table/cols (list "Thing in the Game " " What Changes About It? " " More Specifically ")
                   (list (list "Ruby") (list "position") (list " "))
                   (lambda (r c) " ")
                   3 1)

Before you can fill in the third column, you need to know how to describe the 
locations of items on the screen.  If you already know xy-coordinates (from geometry), 
skip the next lesson (Coordinate Planes) and go on to More Dissection (which 
assumes you know xy coordinates and coordinate planes).

}
