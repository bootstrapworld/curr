#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "onscreen? 1.0" 
        #:duration "25 minutes"
        #:prerequisites "Introducing-the-Design-Recipe Coordinate-Planes Intro-to-Booleans"]{
 @itemlist/splicing[
           @tag[pedagogy]{@item{Draw a rectangle on the board, to represent the screen. Then turn students' attention to the computers, and have them analyze the last function in the code, called onscreen?.}}
            @tag[selftaught]{@item{Draw a rectangle in your notes, to represent a computer screen. Now, you will analyze the last function in the code, called onscreen?.}}
            @item{@think-about[#:question "What are the Domain and Range of onscreen? What does the function do? What will happen when it's given a sample input?" 
                               #:answer "It always returns true, no matter what!"]}
            @item{When Run is clicked, a window with a butterfly in it will pop up. You can use the arrow keys to move the butterfly around.}
            @item{This butterfly is Sam - he's a happy student like you! He likes to fly around outside and enjoy the fresh air.}
            @item{Just like our rectangle here, his yard is 640 pixels wide and 480 pixels tall. If the bottom-left corner is (0, 0), what are the coordinates of the other corners?}
            @item{It's safe to play there, but it's not as big as he'd like. So sometimes, Sam flies out of the box. He's free! Free as a bird! (well, as a butterfly!) Look at his smile! He's so happy to be free! Why shouldn't he be?}
            @item{Well...there's some bad news.}
            @item{Sam doesn't realize that there's a monster outside his yard, waiting to eat him! As long as ANY part of Sam is still in the yard, he is safe...but the moment he disappears completely he might get eaten!}
            @item{It's up to you to protect him!}
            @item{We want to Sam inside the box. He can fly left or right and there is nothing to stop him from moving off the screen... yet!}
            @item{@think-about[#:question "How far can Sam go to the left before NONE of him is onscreen?"
                               #:answer "-50. So he is onscreen as long as x > -50!"]}
            @tag[pedagogy]{@item{Draw another, outer rectangle on the board to represent the 50 pixel buffer zone. Raise your hand if you can tell is why we have to go out to -50 put Sam off the screen, when the screen only goes from 0 to 640.}}
            @tag[selftaught]{@item{Draw another, outer rectangle on the board to represent the 50 pixel buffer zone. Why do we have to go out to -50 put Sam off the screen, when the screen only goes from 0 to 640.}}
            @item{@tag[pedagogy]{Take some ideas from the class, then explain if necessary.}   When the butterfly is drawn at some coordinate, it is centered at that coordinate. So if it's drawn at 0, half of the butterfly is actually off the screen. We add the extra 50 pixels on all sides, because a piece of him is still visible as long as he is within 100 pixels of the screen's edge. }
            @item{Turn to @worksheet-link[#:page 17 #:name "Protecting-Sam"]. Take thirty seconds to fill out what we've discovered.}
            @item{Turn to @worksheet-link[#:page 18 #:name "Design-Recipe-Protect-Left"] and read the problem statement for the protect-left function.}
            @tag[pedagogy]{@item{Who would like to act out protect-left? Take a volunteer.}}
            @tag[pedagogy]{@item{@exercise{According to the problem statement, what's your name? What's your Domain? Your Range? Given Sam's x-coordinate, and tell me if any part of him is still on the screen. Let's try it out. "protect-left forty-five!" "protect-left three!" "protect-left negative fifty-one!" How did you know Sam wasn't protected at -51? because the number was less than -50!.}}}
            @tag[selftaught]{@item{@think-about[#:question "What is protect-left -3?" #:answer "True! The distance from the center of the butterfly to its edge is 50, so there are still 47 pixels of the butterfly on screen."]@think-about[#:question "What is protect-left -47?" #:answer "True! The distance from the center of the butterfly to its edge is 100, so there are still 3 pixels of the butterfly on screen."]@think-about[#:question "What is protect-left -51?" #:answer "False! The distance from the center of the butterfly to its edge is 50, so the butterfly is offscreen by 1 pixel."]}}
            @item{Complete the design recipe for protect-left. @tag[pedagogy]{Raise your hand after you complete each step.}}
            @tag[(pedagogy group)]{@item{When a team has completed the Design Recipe for protect-left, they must type in the examples and function body onto the computer.}}
            @item{So now we have a function that will protect Sam on the left side of the screen. But at the moment, onscreen? doesn't know how to use that function. We need to change the body of onscreen? so that it can talk to protect-left:
                  @code{(define (onscreen? x)}
                  @code{ (protect-left x))}}
            @item{Click "Run", and try to move Sam off the left edge of the screen. Congrats! You've protected Sam on one side!}
            @item{Unfortunately, Sam can still escape on the right hand side. We need a protect-right! @tag[pedagogy]{(act out with another volunteer, if necessary).}}
            @item{Turn to @worksheet-link[#:page 19 #:name "Design-Recipe-Protect-Right"], and write another function called protect-right. @tag[pedagogy]{Call me over when you reach a stopping point!}}
            @item{Good job! Now we can protect Sam on the left side, or we can protect Sam on the right side. However, we don't have a way to protect him from going off from both sides at the same time! We need to learn something new to save him in both directions. }]}