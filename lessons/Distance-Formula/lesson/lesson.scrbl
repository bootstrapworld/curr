#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "The Distance Formula"
        #:duration "30 minutes"
        #:prerequisites "Coordinate-Planes Introducing-the-Design-Recipe"]{
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