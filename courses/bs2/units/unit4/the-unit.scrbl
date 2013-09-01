#lang curr/lib

@title{Unit 4: Welcome to the World}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students return to the Ninja World game, and codewalk through the 'update-world' and 'draw-world' functions. Making minimal changes to these functions, they are able to modify the dog's speed, add static clouds, etc. They then modify the world to include the ruby's x-coordinate, and systematically update each function in the source code to accommodate this new world. Additional iterations are possible if time allows, by adding more sets of coordinates to the World.
Students brainstorm their videogames, and derive the structure for their game world.}

@objectives[@item{Deepen their understanding of structures, constructors and accessors by being introduced to a third data structure.}
            @item{Discover the event-based microworld implementation of Racket, which uses events to modify the world.}
          ]

@product-outcomes[
          @item{Students will modify draw-world to add clouds and a ruby}
          @item{Students will modify a simple update-world function to change the dog's speed}
          @item{Students will iteratively expand the World structure, and trace these changes throughout their program}
          @item{Student will define their World structures}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{The Ninja World 2 file [NW2.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=DtoM5S0yyH" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@lesson/studteach[#:title "Review"
        #:duration "5 minutes"]{@item{@pedagogy{You guys have gotten really good at structs over the past few weeks, so now it's time for a challenge.} Turn to @worksheet-link[#:page 19 #:name "Intro-unit4"] in your workbook. You'll have five minutes to complete the page. Do you think you can do it? Ready? Go! @pedagogy{Be sure to count down the minutes.}}}

@lesson/studteach[#:title "Codewalking"
        #:duration "20 minutes"]{
          @itemlist/splicing[
@pedagogy{@item{MONITORS ON!}}
@item{Open up Ninja World and click "Run". What happens?}
@item{Does it do the same thing we did in our simulation last week? No! Let's walk through it and figure out what's wrong.}
@item{At the top of the screen, you see the DATA section. This is where we define what everything we need to keep track of during the animation.}
@item{As you can see, we have used @code{define-struct} to define our World structure here. @tag[pedagogy]{Raise your hand if you can tell me what's in this world struct.}}
@item{Next take a look at the section labelled STARTING WORLD. What is @code{START}? It's a world! How would we get the @code{dogX} out of the @code{START} world?}
@item{If the dog is moving ten to the right each time, what should the world be in the next frame? @tag[pedagogy]{You have ten seconds: }Define another world called @code{NEXT}.}
@item{As you can see, we also defined a bunch of values for images, which we'll use in our game. What are they images of? Type in their names in the interactions window to find out.}
@item{Now that we've got our world structure, we need to know how to draw it. Scroll down to where you see "GRAPHICS". What is the name of this function? @code{draw-world}. What is the Domain of this function? The Range?}
@item{In our @code{draw-world} function, @code{put-image} is placing the @code{DOG} onto the @code{BACKGROUND}. What is it using for the dog's x-coordinate? The dog's y-coordinate?}
@pedagogy{@item{Before we move on, I want you to think for a moment about how our simulation last class worked.} Every time it ran, @code{draw-world} had to check what the current world was, for the @code{dogX}, before it could draw it. Where in @code{draw-world} is it checking the current world? It's not! We're not looking at the world that we're taking in, so we have no way to change the position of the dog!}
@item{How would you get the @code{dogX} out of the world? @code{world-dogX}. Which world are we going to use? @code{w}.}
@item{Now...where are we going to put this @code{(world-dogX w)}? Which number here represents the x-coordinate of the @code{DANGER} on the @code{BACKGROUND}?}
@item{Suppose we want to add the @code{CLOUD}, at the position (500, 400). How could you use @code{put-image} to stick them on the @code{BACKGROUND}?}
@pedagogy{@item{Write the code with the kids, since this is their first time with put-image. They'll have time to practice on their own later!}}
@code[#:multi-line #t]{;; draw-world: world -> Image
;; place DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image CLOUD 
               500 400
               (put-image DANGER
                            (world-dogX w) 200
                            BACKGROUND)))}
@item{Click "Run", and take a look at that cloud!}
@item{Now scroll down to where it says UPDATING FUNCTIONS. This code is responsible for changing the World - and in fact we already wrote it!}
@item{What does @code{update-world} DO to the world? It makes a new world and it adds 10 to the dog's x-coordinate! What does that mean, in terms of how the dog moves? Does it go to the right, left, up, down?}
@item{If the dog is at 100, where will it be next? After that?}
@item{@pedagogy{Take 30 seconds: }Write a second example involving your NEXT world, instead of START. @pedagogy{Count down.}}
@item{How could you make the dog move faster? Slower? Backwards?}]}

@lesson/studteach[#:title "Extending the World"
        #:duration "15 minutes"]{
          @itemlist/splicing[
           @pedagogy{@item{This section requires that you model each one of the changes to the code on a projector, with students following along. Make sure everyone can see what you're doing!}}
           @item{Let's draw our @code{TARGET} in our world, at (500, 300). What will we need to modify? Our world structure? No - if the @code{TARGET} isn't moving, then nothing changes, so we don't need to keep track of it in the world. How about @code{draw-world}? Does that need to change?}
           @item{Yes it does! We need to put the @code{TARGET} image on top of everything we have so far. Add the @code{TARGET} now, so it shows up when you click "Run". @tag[pedagogy]{Go!}}
           @item{Okay, so now suppose the ruby is flying across the screen, moving left slowly at 5 pixels each frame. Now do we need to modify the World? Yes! Why? Because something is changing! Specifically, the x-coordinate of the ruby!}
           @item{What do I need to change in my world struct? }
           @item{How have our contracts changed? @tag[pedagogy]{(Call on kids until you get all three (@code{make-world, world-dogX, world-rubyX}), and write out the contracts for them). }}
           @item{Okay, let's go through the code, line-by-line, and see what changes. Look at our START variable - does that need to change? Yes! It uses make-world, which now requires two inputs in it's Domain. So what should the ruby's x-coordinate be when the simulation starts? How about 600? }
           @item{Now change the definition of @code{NEXT}. Don't forget to think about how the ruby's x-coordinate has changed!}
           @item{Do our image variable definitions need to change? No. Why not?}
           @item{What about @code{draw-world}? Does the contract change? No! The contract says it takes a World as it's Domain, and it still does. All we've changed is what's IN a world. Does @code{draw-world} still produce an Image? Yes.}
           @item{What needs to change about the body of @code{draw-world}? The ruby's x-coordinate should be pulled from our World structure!}
           @item{What about @code{update-world}? Does the contract change? No! Why?}
           @item{Let's get rid of the function body of @code{update-world} completely, because a lot needs to change here. What do you think we should start out with?@tag[pedagogy]{ Let kids discuss.}}
           @item{Once again, the contract saves us! Here's a quick tip: if the range is a World, we know that we have to make a world at some point. How do we make a world? @code{make-world}, of course!}
           @item{And the moment we write @code{make-world}, your instincts should kick in right away. What's in our world? A @code{dogX} and a @code{rubyX}...so you should write them down without even thinking! Don't use your brains yet!!! }
           @item{NOW you can use your brains. What should our @code{dogX} be? Well, we still want to move it to the right by 10. How do we do that? 10 plus whatever the dogX is. How do we get the @code{dogX} out of the world? How would we add ten to that?. And we want to move our @code{rubyX} left by 5... }
           @item{Which world are we pulling the @code{dogX} and @code{rubyX} out of?}
           @item{Do our examples need to change? Oh, yes they do...}
           @item{Look at our first example: }
           @item{What's wrong with it? Well, how many things are being passed into @code{make-world}? Just one: the new x-coordinate. What's missing? The ruby's x-coordinate! }
           @item{Okay, and what do we want to do to the x-coordinate? We want the ruby to go left by 5, so what code do I write? @tag[selftaught]{Go ahead and fix the second example now.}}
           @pedagogy{@item{Take 30 seconds, and fix the second example. GO!}}]}

@lesson/studteach[#:title "Game Brainstorming"
        #:duration "15 minutes"]{
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
            @item{Now think about YOUR game - what will be changing in your world? @pedagogy{Pass out some scratch paper for the students to brainstorm on.  Make sure you force them to think about their world structures, and start simple!}}]}
                  
@lesson/studteach[#:title "Game Design!"
        #:duration "10 minutes"]{
          @itemlist/splicing[
           @item{It's time to start work on your game!}
           @item{Turn to @worksheet-link[#:page 20 #:name "Game Design 1"] in your workbooks. First, you're going to draw a rough sketch of what your game should look like when the user clicks "Run". @tag[pedagogy]{You'll have 5 minutes - GO!}}
           @pedagogy{@item{Make sure kids keep it simple! Limit their world struct to five things, initially.}@tag[selftaught]{Keep your world struct limited to five or fewer things.}}
           @item{Now make a list of all the images you'll need in your game.}
           @item{Now make a list of everything that changes in your game - if something moves, will you need to keep track of it's x-coordinate? y? both?}]}

@lesson/studteach[#:title "Defining the World"
        #:duration "20 minutes"]{
          @itemlist/splicing[
            @item{Now that you've gotten a list of everything that changes, it's time to turn them into a World structure!}
            @item{Turn to @worksheet-link[#:page 21 #:name "Game Design 2"] in your workbooks, and define your world structure. When you're done, write down all of the contracts that you need to work with your structures. @tag[pedagogy]{Take 10 minutes - GO!}}
            @pedagogy{@item{Review each team's structure, and make sure it accurately models their world. Also be sure to check their contracts!}}
            @item{Define an example world called START, which is how your world should look a split-second after the game begins. Write it in on the bottom of @worksheet-link[#:page 21 #:name "Game Design 2"]. @tag[pedagogy]{You'll have two minutes. Go!}}]}

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"]{
 @pedagogy{
 @itemlist[
  @item{Let's go around the class and have you each talk about your game. Once you've explained it, tell the class what you have in your World structure.}
   @item{NOTE TO INSTRUCTORS: 
    @itemlist[
              @item{Make sure student names are on page 20}
                   @item{Take page 20 itself, or take photos of page 20, to prep game images for the next unit.}
                   @item{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds!}
                   @item{TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with.}
           ]}]}
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}}


@copyright[]
