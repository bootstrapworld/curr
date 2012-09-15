#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
             @item{Now that we've got our world structure, we need to know how to draw it. Turn to page 23, and fill in your START world at the bottom. Once you have that done, do a simple sketch of your START world. According to your world struct, where should everything be when the game starts? Take one minute and do that now. Be sure to count down!}
             @item{5 4 3 2 1 pencils down. The next thing we need to decide is what order our images need to go in. We know we have to stack images, so we're going to have to use put-image. Raise your hand if you can tell me the contract for put-image. What does the first image represent? The numbers? The last image?}
             @item{In the chart on page 23, I want you to figure out which image goes on top, which goes second, and so on. Make a list from top to bottom in the left column, and then write each image's coordinates in the right column. Take two minutes to do so.}
             @item{Excellent! Let's set up one more example, so that when we get into writing our function that draws the world, we're ready to go. On page 24 there's a nearly identical page. You've already written a START world, which has everything where it will be when the game starts. Now do the same for a world called NEXT. This world is where everything is ONE SECOND after the game starts. Again, you have one minute to fill in a world struct, sketch the NEXT world. Go!}
             @item{As soon as you're done with that, put the images in the same order (we don't want them to be switching around in the middle of the game!) and write the NEW coordinates beside them. Take another minute: go!}
             @item{Which function do we use to draw a world? draw-world. It takes in a world and draws us a picture. What is the name of this function? draw-world. Just like draw-auto, and the draw-world for Ninja World, this function takes in a struct and produces an Image. What is the Domain of this function? The Range?}
             @item{On page 25, there's a place for you to write the contract. Below that, we see a sort of staircase pattern using put-image, just like we did in Ninja World.}
             @item{First, let's start out by putting one of our images onto the background. Do you remember how to use put-image? It needs the coordinates of where to put our image.}
             @item{If we wanted the images to be centered on the scene, what are the x- and y-coordinates I'll need? 320 and 240!}
             @item{But you don't want your image to be at the center of the screen. Look back at your START world picture a couple pages back...you made a note of which coordinates you want that image to be on, above the background!}
             @item{Show students the 'staircase' pattern that forms when they put the coordinates and each image on their own line. For example:}
             @item{Now try adding another one of the images from your world. Remember, you're placing another image on top of the one that this staircase has already created! Work with your partner to keep adding, until you have a stack of all of the images in your game.}
             @item{Work with small groups to complete this section. When students finish writing draw-world, have them type their NEXT world and draw-world into their games, in the GRAPHICS section.}
             @item{If they type (draw-world START) into the interactions window, they can see a screenshot of their game.}]}