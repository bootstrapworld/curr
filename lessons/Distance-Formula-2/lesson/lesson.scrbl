#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Unfortunately you still haven't written the code to calculate the distance in two dimensions! All you have is something that tells you the length in the x- and y-dimension.}
            @item{Draw normal Cartesian coordinate plane, with a point on each axis. Label the coordinates (4,2) and (0,5).}
            @item{How can we find the distance between these two points? How can we find the length of the dotted line, also called the Hypoteneuse? Well, let's start with what we do know: the dotted line sort of makes a triangle, and we know the line-length of the other two sides. Let's label them "A," "B" and "C." What is the line-length of A? Have students answer. This will typically involve subtraction, but point out that subtraction can sometimes give back negative numbers!}
            @item{To make our lives easier, we can use the function line-length.}
            @item{In our example, (line-length A) is 3 and (line-length B) is 4, but we still don't know C.}
            @item{Pass out Pythagorean Proof materials to each group, and have them review all of their materials:}
            @item{A large, white square with a smaller one drawn inside}
            @item{Four gray triangles, all the same size}
            @item{Everyone has a packet with the same materials, but each group's triangles are a little different. That's okay, though: what we're going to do works with all sizes, so you'll each get to test it out on your own triangles.}
            @item{First, I'd like you all to take ONE of the triangles, and place it on the center of a desk, so that it matches the triangle on the board. Do you see the sides labeled "A," "B" and "C"? Do they match the sides on the board? Good! On YOUR desks, all of the A's are the same size, all of the B's are the same size, and all of the C's are the same size.}
            @item{Now take your triangles, and place them on the big white square so that all of the As, Bs and Cs line up. You can follow along with what I have on the board, too. (See diagram with inscribed square.)}
            @item{Now we have four triangles, each with a side A, B and C. We also have two squares: the inner square, whose sides are a C, and the outer square, whose sides are (A+B).}
            @item{Raise your hand if you know how to find the area of a square. Take a volunteer.}
            @item{What's the area of the white, inner square? C2. On the board, write: }
            @item{white space = C2}
            @item{Move your triangles so they match the drawing on the board (see diagram, or this animation). Now we have two small, white squares. Is there more white on the board now than there was when we had just a single big one? Why or why not?}
            @item{Since we didn't change the size of the outer square, and all we did was move stuff around inside it, we know there is still the same amount of white space as there was before - it's just broken into two parts now. Refer back to the previous board writing: }
            @item{whitespace = C2}
            @item{What is the area of the smaller white square? We know that both of its sides are of length A, so its area must be A2.}
            @item{What about the bigger white square? We know that both of its sides are of length B, so its area must be B2. So now we have two ways of writing the area of the white space: }
            @item{whitespace = C2 = A2 + B2}
            @item{Well, if we know that A and B are 3 and 4, so let's fill that in. }
            @item{whitespace = C2 = 32 + 42}
            @item{What is 3 squared? 4 squared? }
            @item{whitespace = C2 = 9 + 16}
            @item{What's 9+16? }
            @item{whitespace = C2 = 25}
            @item{Okay, so we know that C2 is 25...but remember, we want C by itself. What is the square root of 25? It's five!}
            @item{Pythagoras proved that you can get the square of the hypotenuse by adding the squares of the other two sides. In your games, you're going to use the horizontal and vertical distance as the two sides of your triangle, and use the Pythagorean theorem to find the length of that third side.}
            @item{Turn to page 37 of your workbook - you'll see the formula written out. Let's do this one together, since it's been a long time since we've done Circles of Evaluation as a class.}
            @item{What's the simplest expression inside this giant thing? (line-length 4 0)! Let's draw the circle for that. Walk students through the entire thing...}
            @item{So now we've got code that tells us the distance between those two points. But we want to have it work for any two points! It would be great if we had a function that would just take the x's and y's as input, and do the math for us.}
            @item{Let's think again about the problem statement, and the function header. Turn to page 38, use the Design Recipe to write your distance function. Feel free to use the work from the previous page as your first example, and then come up with a new one of your own. Raise your hand when you are done with the contract, and when you've circled and labeled your two examples.}
            @item{Take a few minutes to type in your line-length and distance into your game and try it.}
            @item{Does anything happen when things run into each other? No! We still haven't written a function to check whether they're colliding!}]}