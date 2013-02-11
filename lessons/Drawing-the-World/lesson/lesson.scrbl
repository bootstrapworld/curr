#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Drawing the World"
        #:duration "40 minutes"]{
          @itemlist/splicing[
             @item{Now that we've got our world structure, we need to know how to draw it. Turn to  @worksheet-link[#:page 23 #:name "Drawing START"], and fill in your @code{START} world at the bottom. Once you have that done, do a simple sketch of your @code{START} world. According to your world struct, where should everything be when the game starts? @tag[pedagogy]{Take one minute and sketch that now. @pedagogy{Be sure to count down!}}}
             @item{@tag[pedagogy]{5 4 3 2 1 pencils down. }The next thing we need to decide is what order our images need to go in. We know we have to stack images, so we're going to have to use @code{put-image}. @tag[pedagogy]{Raise your hand if you can tell me:} What is the contract for @code{put-image}? What does the first image represent? The numbers? The last image?}
             @item{In the chart on @worksheet-link[#:page 23 #:name "Drawing START"], figure out which image goes on top, which goes second, and so on. Make a list from top to bottom in the left column, and then write each image's coordinates in the right column.@tag[pedagogy]{ Take two minutes to do so.}}
             @item{@tag[pedagogy]{Excellent! }Let's set up one more example, so that when we get into writing our function that draws the world, we're ready to go. On @worksheet-link[#:page 24 #:name "Drawing NEXT"] there's a nearly identical page. You've already written a @code{START} world, which has everything where it will be when the game starts. Now do the same for a world called @code{NEXT}. This world is where everything is ONE SECOND after the game starts. @tag[pedagogy]{Again, you have one minute to fill in a world struct, and sketch the NEXT world. Go!}}
             @item{@tag[pedagogy]{As soon as you're done with that,}@tag[selftaught]{Now} put the images in the same order (we don't want them to be switching around in the middle of the game!) and write the NEW coordinates beside them. @tag[pedagogy]{Take another minute: go!}}
             @item{Which function do we use to draw a world? It takes in a world and draws us a picture. What is the name of this function? @code{draw-world}. Just like @code{draw-auto}, and the @code{draw-world} for Ninja World, this function takes in a struct and produces an Image. What is the Domain of this function? The Range?}
             @item{On @worksheet-link[#:page 25 #:name "draw-world"], there's a place for you to write the contract. Below that, we see a sort of staircase pattern using @code{put-image}, just like we did in Ninja World.}
             @item{First, start out on the bottom of this 'staircase' by putting one of our images onto the background. Do you remember how to use @code{put-image}? It needs the coordinates of where to put our image.}
             @item{If we wanted the images to be centered on the scene, what are the x- and y-coordinates I'll need? 320 and 240!}
             @item{But you don't want your image to be at the center of the screen. Look back at your @code{START} world picture a couple pages back...you made a note of which coordinates you want that image to be on, above the background!}
             @pedagogy{@item{Show students the 'staircase' pattern that forms when they put the coordinates and each image on their own line. For example:}}
             @tag[selftaught]{@item{Start with something that looks like this:}}
                             @code[#:multi-line #t]{(place-image IMAGE
                                                                 320 240
                                                                 BACKGROUND)}
             @item{Now try adding another one of the images from your world. Remember, you're placing another image on top of the one that this staircase has already created! Keep adding to it, until you have a stack of all of the images in your game.}
             @pedagogy{@item{Work with small groups to complete this section. When students finish writing draw-world, have them type their NEXT world and draw-world into their games, in the GRAPHICS section.}}
             @pedagogy{@item{If they type (draw-world START) into the interactions window, they can see a screenshot of their game.}}]}
