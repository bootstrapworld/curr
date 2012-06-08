#lang scribble/base
@(require "lib/all.rkt")
@title{Unit 8: Collision Detection}

@declare-tags[group pedagogy selftaught]

Unit Overview

Students discuss and then prove the Pythagorean theorem, and use this theorem - in conjunction with Booleans - in their games to detect when a collision has occurred.

@agenda[
@item{20 min Introduction} @; LINKY?
@item{10 min 1D Distance}
@item{30 min The Distance Formula}
@item{20 min Collide?}
@item{10 min Closing}
]

@objectives[@item{Understand the challenge of the distance formula in two dimensions.}
            @item{Be familiar with the Pythagorean theorem.}
            @item{Draw connections between geometry and real-world problems.}]
@product-outcomes[@item{Students write @code{distance} and @code{collide?}}]

See @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") for state standards.

Length: 90 minutes
@tag[selftaught]{@materials[@item{Cutouts of Pythagorean Theorem packets [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.5.png" "1"), @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.6.png" "2")] - 1 per cluster}
                        @item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbooks")}]}  
   
@tag[pedagogy]{
@materials[@item{Cutouts of Pythagorean Theorem packets [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.5.png" "1"), @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.6.png" "2")] - 1 per cluster}
            @item{Computers w/DrRacket or WeScheme}
           @item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbooks")}
            @item{Pens/pencils for the students, fresh whiteboard markers for the teachers}
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            ]
@preparation[@item{Write agenda on board}
              @item{All student computers should have their game templates pre-loaded, with their image files linked in}
              @item{Class posters}
              @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" "+ - * / sq sqrt expt")
                 (list "String" "string-append string-length")
                 (list "Image" "rectangle circle triangle ellipse radial-star scale rotate put-image")
                 (list "Boolean" "= > < string=? and or"))


@lesson[#:title "Introduction" #:duration "20 minutes"]{
        @itemlist[@item{Review previous material.}
                  @item{Right now, in your games, what happens when the player collides with another game character? Nothing! We need to write a function change that.}
                  @item{This is going to require a little math.}
                  @; VIDEO FOR SELFTAUGHT?
                  @item{Scroll to the @code{line-length} and @code{collide?} functions in your game files.}
                  @item{@tag[pedagogy]{Suppose I'm the player, moving around up here at the front of the class. Can I have a volunteer come up here and be the Target?}}
                  @item{@tag[pedagogy]{Have a volunteer stand up in front of the class, swinging their arms around, helicopter-style.}}
                  @item{@tag[pedagogy]{I need to know how far apart I am from the danger, so I'll know when we've collided. Can anyone tell me how far apart we are? Have we collided?}}
                  @item{@tag[pedagogy]{Take a step forward. How far are we now? Have we collided? Repeat until you collide.}@tag[selftaught]{Imagine you have two objects, and they are flying about the room. These objects are pretty glass shapes, and if they collide, they will shatter completely. You are quite worried about your glass toys, and really don't want them to collide. If you know when they will collide, you can put your hand in the way and stop them, but only if you know exactly when they will collide.}}
                  @item{As you can see, it's important to be able to calculate how far apart to characters are, in order to know when they've hit one another.}
                  @item{In one dimension, this is pretty easy. If the characters are on the same line, you just subtract one coordinate from another, and you have your distance. }
                  @item{@tag[pedagogy]{Demonstrate this on the board, using a number line. Ask the following questions, filling in the blanks for contract as students give answers:}}
                  @item{@think-about[#:question "How many inputs does @code{line-length} take? What is the name of the input? What is the Domain? What is the Range?"
                                     #:answer "Input: two numbers, Domain: numbers, Range: number representing difference between the two numbers"]}
                  @item{@tag[pedagogy]{@skit{I'd like to have one volunteer stand up and be our function. Raise your hand if you'd like to volunteer!
                                             
Your name is now "line-length". Whenever I call your name, I will also give you two numbers, and your job is to tell me the difference between them - just like the code on the board! Let's try one example "line-length twenty ten!" your volunteer should reply with "ten"

Raise your hand if you'd like to try! Take some volunteers, and make sure line-length is doing the right thing (including bugs if the first number is smaller than the second!).}}}
                  @item{@think-about[#:question "What is the name of the second function? How many inputs does it take? What is the name of the input? What's the Domain? What's the Range? "
                                     #:answer "Name: collide?, Input: two numbers, Domain: numbers, Range: boolean"]}
                 @item{@think-about[#:question "What does this function do? @tag[pedgogy]{Raise your hand if you have an idea.}"
                                    #:answer "Takes in two numbers and passes it in to line-length to calculate the difference and returns a boolean determining whether the two objects have collided (whether the difference is greater than 5)."]}
                 @item{@tag[pedagogy]{@skit{I'd like to have one volunteer stand up and be collide? Raise your hand if you'd like to volunteer!
                                            
Your name is now "collide?". Whenever I call your name, I will also give you two numbers, and your job is to say "true" if the difference between them is greater than five. What will you say if the difference is smaller than five?

Let's try an example: "collide? ten twenty"! Make sure collide? calls on line-length!. Let's have some more examples...

So what's the problem, if the second number is bigger? we keep getting negative numbers!

Thank you! You can both have a seat now. A round of applause for our brave volunteers!
}}}
                @item{@tag[selftaught]{@think-about[#:question "So what's the problem, if the second number is bigger?"
                                                    #:answer "We keep getting negative numbers!"]}}
                ]}
@lesson[#:title "1D Distance" #:duration "10 minutes"]{
        @itemlist[@item{If all we did was subtract the second number from the first, the function would only work half the time! Suppose your target is standing at 20, and the player is at 10. What is 20 minus 10? What if their positions were reversed?}
                   @item{We have to make sure we are always subtracting the bigger number from the smaller one!}
                   @item{So actually there are two conditions: one is if the first number is bigger, and the other is if the second is bigger. What do we do, when we have multiple conditions?}
                   @item{Turn to @(hyperlink "page26.com" "Page 26"), and see if you can write this function so that it always subtracts the smaller number from the bigger one. We've already done the examples for you, but you'll need to first fill out the contract, and then move on to the code.}
                   @item{What should we do if a is less than or equal to b? Figure it out, and write the code. We've put in two EXAMPLES for you, but you'll need to uncomment them (delete the semicolons at the front). Make sure both EXAMPLEs work!}
                   @item{Now look at the definition of @code{*distances-color*} Currently it's just the empty string: "". Try changing it to a real color, like "black" or "white" or "magenta".}
                   @item{When you click Run, you will now see lines representing the x-length, y-length, and distance between the target, danger and player. These numbers come from your line-length function! Make sure there are no negative numbers!}
                   
                   ]}
@lesson[#:title "The Distance Formula" #:duration "30 minutes"]{
        @itemlist[@item{Unfortunately, the 2d distance looks like 0. Is that right? NO! That's because you haven't written the code to calculate the distance in two dimensions! All you have is something that tells you the length in the x- and y-dimension.} 
                   @item{Ancient civilizations had the same problem: they also struggled with distance in two dimensions. An ancient Greek named Pythagoras finally figured it out.}
                   @item{@tag[pedagogy]{Draw normal Cartesian coordinate plane, with a point on each axis. Label the coordinates (3,0) and (0,4).} @tag[selftaught]{Draw a coordinate plane. Label the coordinates (3,0) and (0,4).}}
                   @item{@;PICTURE OF GRAPH with letter labels
                         How can we find the distance between these two points? How can we find the length of the dotted line, also called the Hypoteneuse? Well, let's start with what we do know: the dotted line sort of makes a triangle, and we know the @code{line-length} of the other two sides. Let's label them "A," "B" and "C." What is the line-length of A? @tag[pedagogy]{Have students answer. This will typically involve subtraction, but point out that subtraction can sometimes give back negative numbers!}}
                   @item{To make our lives easier, we can use the function @code{line-length}. Just like we did with the butterfly example, we can write functions that call each other for help!}
                   @item{In our example, @code{(line-length A)} is 3 and
is 3 and @code{(line-length B)} is 4, but we still don't know C. What is the length of C?}
                   @item{@tag[pedagogy]{Pass out Pythagorean Proof materials to each group, and have them review all of their materials:@itemlist[@item{A large, white square with a smaller one drawn inside}@item{Four gray triangles, all the same size}]}}
                   @item{@tag[(pedagogy group)]{Everyone has a packet with the same materials, but each group's triangles are a little different. That's okay, though: what we're going to do works with all sizes, so you'll each get to test it out on your own triangles.} @tag[selftaught]{Please print out the cutouts found by following the links labelled 1 and 2 on the first page in the Materials section.}}
                   @item{First, I'd like you to take ONE of the triangles, and place it on the center of a desk, so that it matches the triangle on the board or computer screen. Do you see the sides labeled "A," B" and "C"? Do they match the sides on the board? Good! On YOUR desks, all of the A's are the same size, all of the B's are the same size, and all of the C's are the same size.}
                   @item{Now take your triangles, and place them on the big white square so that all of the As, Bs and Cs line up. You can follow along with what I have on the board, too. (See diagram with inscribed square.)}
                   @item{Now we have four triangles, each with a side A, B and C. We also have two squares: the inner square, whose sides are a C, and the outer square, whose sides are (A+B).}
                   @item{@tag[pedagogy]{Raise your hand if you know how to find the area of a square. Take a volunteer.}}
                   @item{@think-about[#:question "What's the area of the white, inner square?" #:answer "white space = C^2"]}
                   @;IMAGEEEEE
                   @item{@tag[(selftaught pedagogy)]{Watch this @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/Pythag_anim.gif" "animation")} @tag[pedagogy]{Teacher's, draw this on the board} Now move your triangles so they match the end scene of the animation. Now we have two small, white squares. @think-about[#:question "Is there more white on the board now than there was when we had just a single big one? Why or why not?" #:answer "NO! We just moved the squares around, but there is neither more nor less white now."]}
                   
                   @; INSERT IMAGE WITH TWO WHITE SQUARES
                   @item{Since we didn't change the size of the outer square, and all we did was move stuff around inside it, we know there is still the same amount of white space as there was before - it's just broken into two parts now. So the area of the whitespace is still C^2.}
                   @item{What is the area of the smaller white square? We know that both of its sides are of length A, so its area must be A^2.}
                   @item{What about the bigger white square? We know that both of its sides are of length B, so its area must be B^2. So now we have two ways of writing the area of the white space:}
                   @item{So whitespace = C^2 = A^2 + B^2}
                   @item{We know what A and B are, so let's fill that in.}
                   @item{whitespace = C^2 = 3^2 + 4^2}
                   @item{@think-about[#:question "What is 3*3? What is 4*4?" #:answer "9 and 16"]}
                   @item{whitespace = C^2 = 9 + 16}
                   @item{whitespace = C^2 = 25}
                   @item{Okay, so we know that C^2 is 25...but remember, we want C by itself. What is the square root of 25? It's five!}
                   @item{Pythagoras proved that you can get the square of the hypotenuse by adding the squares of the other two sides. In your games, you're going to use the horizontal and vertical distance as the two sides of your triangle, and use the Pythagorean theorem to find the length of that third side.}
                   @item{Turn to @(hyperlink "Page27.com" "Page 27") of your workbook - you'll see the formula written out. @tag[(pedagogy group)]{Let's do this one together, since it's been a long time since we've done Circles of Evaluation as a class.}}
                   @item{What's the simplest expression inside this giant thing?
@code{(line-length 4 0)}! Let's draw the circle for that. }
                   @item{So now we've got code that tells us the distance between those two points. But we want to have it work for any two points! It would be great if we had a function that would just take the x's and y's as input, and do the math for us.}
                   @item{Let's think again about the problem statement, and the function header. Turn to @(hyperlink "page28.com" "Page 28"), use the Design Recipe to write your distance function. Feel free to use the work from the previous page as your first example, and then come up with a new one of your own. @tag[(group pedagogy)]{Raise your hand when you are done with the contract, and when you've circled and labeled your two examples.}}
                   @item{Take a few minutes to type in your examples and your code and try it.}
                   @item{Do the distances look right? The shortest distance between any two points is a straight line. @think-about[#:question "So can either of the legs a or b be longer than c? Can c be longer than a+b?" #:answer "C is the hypotenuse, so it is the longest side; the other two sides of the triangle cannot be longer than the hypotenuse! No! The shortest path between two points is a straight line, and C is a straight line between the two points, so C must be the shortest of the three."]}]}
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


@lesson[#:title "Closing Time:" #:duration "10 minutes"]{

@itemlist[

@item{@tag[pedagogy]{@tag[group]{Have everyone walk around and play each other's games}}}
@item{CONGRATULATIONS! You have finished the code for your videogame@tag[group]{s}!!!}
@item{@tag[pedagogy]{Who can tell us one thing we learned today?}@tag[selftaught]{@review{What did you learn today?}}}
@item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
@item{@tag[pedagogy]{Cleanup, dismissal}}
]
}