#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "The Distance Formula"
        #:duration "20 minutes"]{
          @itemlist/splicing[
            @item{Unfortunately you still haven't written the code to calculate the distance in two dimensions! All you have is something that tells you the length in the x- and y-dimension.}
            @pedagogy{@item{Draw normal Cartesian coordinate plane, with two points on it, of the coordinates (4,2) and (0,5).}}
            ;put in a picture of the plot, so selftaught are happy.
            @item{How can we find the distance between these two points? How can we find the length of the dotted line, also called the Hypoteneuse? Let's start with what we do know: the dotted line sort of makes a triangle, and we know the line-length of the other two sides. Let's label them "A," "B" and "C." What is the line-length of A? @tag[pedagogy]{Have students answer. This will typically involve subtraction, but point out that subtraction can sometimes give back negative numbers!}}
            @item{To make our lives easier, we can use the function @code{line-length}.}
            @item{In our example, (line-length A) is 3 and (line-length B) is 4, but we still don't know C.}
            
            ;figure out how to rewrite this for selftaught students.
            
            @pedagogy{@item{Pass out Pythagorean Proof materials to each group, and have them review all of their materials:@itemlist/splicing[
            @item{A large, white square with a smaller one drawn inside}
            @item{Four gray triangles, all the same size}]}
            @item{Everyone has a packet with the same materials, but each group's triangles are a little different. That's okay, though: what we're going to do works with all sizes, so you'll each get to test it out on your own triangles.}}
            @item{First, take ONE of the triangles, and place it on the center of a desk, so that it matches the triangle on the board. Do you see the sides labeled "A," "B" and "C"? Do they match the sides on the board? Good! On YOUR desks, all of the A's are the same size, all of the B's are the same size, and all of the C's are the same size.}
            @item{Now take your triangles, and place them on the big white square so that all of the As, Bs and Cs line up. @tag[pedagogy]{You can follow along with what I have on the board, too.}@tag[selftaught]{Lay them out like the diagram shows.}}
            @item{Now we have four triangles, each with a side A, B and C. We also have two squares: the inner square, whose sides are a C, and the outer square, whose sides are (A+B).}
            @pedagogy{@item{Raise your hand if you know how to find the area of a square. Take a volunteer.}}
            @item{What's the area of the white, inner square? C2.}
            @pedagogy{@item{On the board, write: white space = C2}}
            @item{Move your triangles so they match the drawing on the board (see diagram, or this animation). Now we have two small, white squares. Is there more white on the board now than there was when we had just a single big one? Why or why not?}
            @item{Since we didn't change the size of the outer square, and all we did was move stuff around inside it, we know there is still the same amount of white space as there was before - it's just broken into two parts now.}
            @pedagogy{@item{Refer back to the previous board writing: whitespace = C2}}
            @item{What is the area of the smaller white square? We know that both of its sides are of length A, so its area must be A2.}
            @item{What about the bigger white square? We know that both of its sides are of length B, so its area must be B2.} 
            @item{So now we have two ways of writing the area of the white space: whitespace = C2 = A2 + B2}
            @item{Well, if we know that A and B are 3 and 4, so let's fill that in. }
            @item{whitespace = C2 = 3^2 + 4^2}
            @item{What is 3 squared? 4 squared? }
            @item{whitespace = C2 = 9 + 16}
            @pedagogy{@item{What's 9+16? }}
            @item{whitespace = C2 = 25}
            @item{Okay, so we know that C2 is 25...but remember, we want C by itself. What is the square root of 25? It's five!}
            @item{Pythagoras proved that you can get the square of the hypotenuse by adding the squares of the other two sides. In your game, you're going to use the horizontal and vertical distance as the two sides of your triangle, and use the Pythagorean theorem to find the length of that third side.}
            @item{Turn to @worksheet-link[#:page 37 #:name "Distance-Formula-With-Numbers"] of your workbook - you'll see the formula written out. @tag[pedagogy]{Let's do this one together, since it's been a long time since we've done Circles of Evaluation as a class.}}
            @tag[selftaught]{Draw out the circle of evaluation, starting with the simplest expression first.}
            @item{What is the simplest expression inside this giant thing? @code{(line-length 4 0)}! Start with the circle for that. @tag[pedagogy]{Walk students through the entire thing...}}
            @item{So now we've got code that tells us the distance between those two points. But we want to have it work for any two points! It would be great if we had a function that would just take the x's and y's as input, and do the math for us.}
            @item{Think again about the problem statement, and the function header. Turn to @worksheet-link[#:page 38 #:name "Distance"], use the Design Recipe to write your distance function. Feel free to use the work from the previous page as your first example, and then come up with a new one of your own. @tag[pedagogy]{Raise your hand when you are done with the contract, and when you've circled and labeled your two examples.}}
            @item{When you're done, type your @code{line-length} and @code{distance} functions into your game, and see what happens.}
            @item{Does anything happen when things run into each other? No! We still haven't written a function to check whether they're colliding!}]}
