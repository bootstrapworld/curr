#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "onscreen? 1.0" 
        #:duration "25 minutes"
        #:prerequisites "Introducing-the-Design-Recipe Coordinate-Planes Intro-to-Booleans"]{
 @itemlist/splicing[
            @item{@pedagogy{Have students open the @hyperlink["http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "Butterfly File"].} @selftaught{In a new window, open the @hyperlink["http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "Butterfly File"].}}
            @item{When you click Run, a window with a butterfly in it will pop up. You can use the arrow keys to move the butterfly around.}
            @item{This butterfly is Sam - he's a happy student like you! He likes to fly around outside and enjoy the fresh air.}
            @item{His yard is 640 pixels wide and 480 pixels tall. If the bottom-left corner is (0, 0), what are the coordinates of the other corners?}
            @item{Sam's mom tells him that he should stay where she can see him - that means he can even step a little outside of the yard...as long as a piece of him is visible, his mom is okay.}
            @item{Try moving him so he's a little off the screen, but still safe. How far can he go?}
            @item{Sometimes, however, Sam sneaks out of the box and just keeps going! He's free! Free as a bird! (well, as a butterfly!) Look at his smile! He's so happy to be free! Why shouldn't he be?}
            @item{Well...there's some bad news.}
            @item{Sam doesn't realize that there's a monster outside his yard, waiting to eat him! As long as ANY part of Sam is still in the yard, he is safe...but the moment he disappears completely his mom won't be able to keep an eye on him!}
            @item{It's up to you to keep him safe!}
            @pedagogy{@item{Draw and label a 640x480 rectangle on the board to represent the screen, and have students help you idenfify the coordinates at the corners. Then turn students' attention to the computers, and have them analyze the last function in the code, called @code{onscreen?}.}}
            @selftaught{@item{On a sheet of paper, draw a rectangle to represent your computer screen. Label its width (640) and height (480). If the bottom left-hand corner has the coordinate (0,0), what are the coordinates of the other corners?}}
            @item{This file contains three function definitions. Can you find all three? What are the names of these functions? @pedagogy{(@code{safe-left?}, @code{safe-right?} and @code{onscreen?})}}
            @pedagogy{@item{@skit{Have a volunteer stand up to be @code{safe-left?}. Ask them about their domain and range, and what they do according to the code (they always return true). Have students practice calling the function with sample values, then have another volunteer repeat the process as @code{safe-right?}. Finally, have a third volunteer do the same as @code{onscreen?}. Note that @code{onscreen?} must use @code{safe-left?} when evaluate an input!}}}
            @item{@bitmap{images/buffer.png}The computer only talks to @code{onscreen?}, when deciding whether or not to let same keep moving. In turn, @code{onscreen?} will need to use both @code{safe-left?} and @code{safe-right?} to figure out if Sam is safe on both sides.}
            @tag[selftaught]{@item{Draw a rectangle in your notes, to represent a computer screen. Now, you will analyze the last function in the code, called @code{onscreen?}.}}
            @item{@think-about[#:question @list{What are the Domain and Range of @code{onscreen?} What does the function do? What will happen when it's given a sample input?} 
                               #:answer "It calls the function 'safe-left?' on the variable x"]}
            @item{We need to fix this code, to keep Sam safe. He can fly left or right and there is nothing to stop him from moving off the screen... yet!}
            @item{@think-about[#:question "How far can Sam go to the left before he disappears completely?"
                               #:answer "-50."] So he is onscreen as long as @italic{x is greater than -50}!}
            @tag[selftaught pedagogy]{@item{Draw another, outer rectangle on the board to represent the 50 pixel buffer zone. Why do we have to go out to -50 put Sam off the screen, when the screen only goes from 0 to 640?}}
            @item{@pedagogy{Take some ideas from the class, then explain if necessary.}   When the butterfly is drawn at some coordinate, it is centered at that coordinate. So if it's drawn at 0, half of the butterfly is actually off the screen. We add the extra 50 pixels on all sides, because a piece of him is still visible as long as he is within 50 pixels of the screen's edge. }
            @item{Turn to @worksheet-link[#:page 17 #:name "Protecting-Sam"]. Take thirty seconds to fill out what we've discovered.}
            @item{Turn to @worksheet-link[#:page 18 #:name "Design-Recipe-Safe-Left"] and read the word problem for the @code{safe-left} function.}
            @pedagogy{@item{Who would like to act out @code{safe-left}? Take a volunteer.}}
            @pedagogy{@item{@exercise{According to the word problem, what's your name? What's your Domain? Your Range? Given Sam's x-coordinate, and tell me if any part of him is still on the screen. Let's try it out. "safe-left forty-five!" "safe-left three!" "safe-left negative sixty-one!" How did you know Sam was not protected at -51? because the number was not greater than -50!.}}}
            @tag[selftaught]{@item{@think-about[#:question "What is safe-left -3?" #:answer "True! The distance from the center of the butterfly to its edge is 50, so there are still 47 pixels of the butterfly on screen."]@think-about[#:question "What is safe-left -47?" #:answer "True! The distance from the center of the butterfly to its edge is 50, so there are still 3 pixels of the butterfly on screen."]@think-about[#:question "What is safe-left -51?" #:answer "False! The distance from the center of the butterfly to its edge is 50, so the butterfly is offscreen by 1 pixel."]}}
            @item{Complete the design recipe for @code{safe-left}. @pedagogy{Raise your hand after you complete each step.}}
            @tag[(pedagogy group)]{@item{When a team has completed the Design Recipe for @code{safe-left}, they must type in the examples and function body onto the computer.}}
            @item{So now we have a function that will tell us whether or not Sam is safe on the left side of the screen.}
            @item{Click "Run", and try to move Sam off the left edge of the screen. Congrats! You've protected Sam on one side!}
            @item{Unfortunately, Sam can still escape on the right hand side. We need a @code{safe-right}! @pedagogy{(act out with another volunteer, if necessary).}}
            @item{Turn to @worksheet-link[#:page 19 #:name "Design-Recipe-Safe-Right"], and write another function called @code{safe-right}. @pedagogy{Call me over when you reach a stopping point!}}
            @item{Notice that even though we've fixed @code{safe-right?}, @code{onscreen?} won't know about it until we change the body of @code{onscreen?} so it calls @code{safe-right?} instead of @code{safe-left?}! Please make this change now, so that Same is safe on the right side instead of the left side.}
            @item{Good job! Now we can keep Sam safe on the left side, or we can keep Sam safe on the right side. However, we don't have a way to keep him safe on both sides! When we call @code{onscreen?} with an x-coordinate, what should it do?}]}