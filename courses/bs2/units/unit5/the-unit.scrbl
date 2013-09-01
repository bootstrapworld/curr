#lang curr/lib

@title{Unit 5: Building your World}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{After thinking about their World, students practice building, drawing and animating it.}

@objectives[@item{Learn algebraic, World-style programming}
            @item{Understand the concept of "events", such as on-draw and on-tick}
          ]

@product-outcomes[
          @item{Students will define draw-world, and hook it up to an event handler}
          @item{Students will define a simple update-world function, and hook it up to on-tick}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Blank Game Template from @resource-link[#:path "source-files.zip" #:label "source-files.zip"], with student images included. Hint: name image DANGER instead of dog, etc., for ease of reference while writing draw-world}
           @item{Student workbooks}
           @item{Clear plastic sheet protectors: put pages 20 & 21 at the front of the workbook for ease of reference}
           @item{Design Recipe Sign}
           @item{The Ninja World 3 file [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=XfXGclYj1F" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@lesson/studteach[#:title "Introduction"
        #:duration "5 minutes"]{
          @itemlist/splicing[
            @item{@tag[pedagogy]{Monitors on.} @tag[selftaught]{Open Ninja World.}}
            @pedagogy{@item{Students should open Ninja World, to see the dog and ruby flying across the screen}}
            @item{Let's look back at our Ninja world for a moment.}
            @item{How many things are in this world? 2. What are they? @code{dogX} and @code{rubyX}.}
            @item{What does @code{dogX} represent? @code{rubyX}? @bitmap{images/gameimage.png}}
            @item{What function do we use to make a world? @code{make-world}}
            @item{What function updates the world? @code{update-world}}
            @item{What function draws it? @code{draw-world}}
            @item{How fast is the dog moving from left to right? How fast is the ruby moving right to left across the screen?}
            @item{Excellent! Now turn to page 21. @tag[pedagogy]{It's in a sheet protector, so that you can use it as a reference from now on.} What are the things in your world? @tag[pedagogy]{If you can tell me, I'll ask your partner what datatype each thing is.} @pedagogy{Go through the pairs, to make sure that everyone can list the names and types, as well as answer some questions about accessor functions}}
            @item{Go ahead and open your games. @tag[pedagogy]{As you can see, they have your images in them, but nothing else.} I want you to take two minutes to define your world struct at the top, and type in your example world. Name it START. }]}

@lesson/studteach[#:title "Drawing the World"
        #:duration "40 minutes"]{
          @itemlist/splicing[
             @item{Now that we've got our world structure, we need to know how to draw it. Turn to  @worksheet-link[#:page 23 #:name "Drawing START"], and fill in your @code{START} world at the bottom. Once you have that done, do a simple sketch of your @code{START} world. According to your world struct, where should everything be when the game starts? @tag[pedagogy]{Take one minute and sketch that now. @pedagogy{Be sure to count down!}}}
             @item{@pedagogy{5, 4, 3, 2, 1, pencils down. }The next thing we need to decide is what order our images need to go in. We know we have to stack images, so we're going to have to use @code{put-image}. @tag[pedagogy]{Raise your hand if you can tell me:} What is the contract for @code{put-image}? What does the first image represent? The numbers? The last image?}
             @item{In the chart on @worksheet-link[#:page 23 #:name "Drawing START"], figure out which image goes on top, which goes second, and so on. Make a list from top to bottom in the left column, and then write each image's coordinates in the right column.@tag[pedagogy]{ Take two minutes to do so.}}
             @item{@pedagogy{Excellent! }Let's set up one more example, so that when we get into writing our function that draws the world, we're ready to go. On @worksheet-link[#:page 24 #:name "Drawing NEXT"] there's a nearly identical page. You've already written a @code{START} world, which has everything where it will be when the game starts. Now do the same for a world called @code{NEXT}. This world is where everything is ONE SECOND after the game starts. @tag[pedagogy]{Again, you have one minute to fill in a world struct, and sketch the NEXT world. Go!}}
             @item{@pedagogy{As soon as you're done with that,}@tag[selftaught]{Now} put the images in the same order (we don't want them to be switching around in the middle of the game!) and write the NEW coordinates beside them. @tag[pedagogy]{Take another minute: go!}}
             @item{Which function do we use to draw a world? It takes in a world and draws us a picture. What is the name of this function? @code{draw-world}. Just like @code{draw-auto}, and the @code{draw-world} for Ninja World, this function takes in a struct and produces an Image. What is the Domain of this function? The Range?}
             @item{On @worksheet-link[#:page 25 #:name "draw-world"], there's a place for you to write the contract. Below that, we see a sort of staircase pattern using @code{put-image}, just like we did in Ninja World.}
             @item{First, start out on the bottom of this 'staircase' by putting one of our images onto the background. Do you remember how to use @code{put-image}? It needs the coordinates of where to put our image.}
             @item{If we wanted the images to be centered on the scene, what are the x- and y-coordinates I'll need? 320 and 240!}
             @item{But you probably don't want your image to be at the center of the screen. Look back at your @code{START} world picture a couple pages back...you made a note of which coordinates you want that image to be on, above the background!}
             @pedagogy{@item{Show students the 'staircase' pattern that forms when they put the coordinates and each image on their own line. For example:}}
             @tag[selftaught]{@item{Start with something that looks like this:}}
                             @code[#:multi-line #t]{(put-image IMAGE
                                                               320 240
                                                               BACKGROUND)}
             @item{Now try adding another one of the images from your world. Remember, you're placing another image on top of the one that this staircase has already created! Keep adding to it, until you have a stack of all of the images in your game.}
             @pedagogy{@item{Work with small groups to complete this section. When students finish writing draw-world, have them type their NEXT world and draw-world into their games, in the GRAPHICS section.}}
             @pedagogy{@item{If they type (draw-world START) into the interactions window, they can see a screenshot of their game.}}]}

@lesson/studteach[#:title "Updating the World"
        #:duration "40 minutes"]{
          @itemlist/splicing[
            @item{Now scroll down to where it says "UPDATING FUNCTIONS." This code is responsible for changing the World. What function do you see here? @code{update-world}. What's in its Domain? World! Range? World!}
            @item{That's right - @code{update-world} takes a world, and then returns a new one that's been updated. Think of this function as the one that generates the next page of a flipbook.}
            @item{Look back at the difference between your @code{START} and @code{NEXT} worlds - what has changed?}
            @item{On @worksheet-link[#:page 26 #:name "update-world"], make a list of what changed and how it changed as a problem statement for writing @code{update-world}, using the design recipe on the next page.}
            @pedagogy{@item{Work with small groups to complete this section as needed. Upon completion, have students type update-world into their games.}}]}

@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Have students show each other their their animated games!}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
