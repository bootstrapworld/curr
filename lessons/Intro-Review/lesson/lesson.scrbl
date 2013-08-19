#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Review"
        #:duration "20 minutes"]{
          @itemlist/splicing[@pedagogy{@item{Welcome back! You guys did a great job on the review in our last session, and I think you're starting to get good at the design recipe again.}}
           @item{@tag[pedagogy]{Let's quickly walk through one example as a class, and then we'll have a competition. }Turn to  @worksheet-link[#:page 7 #:name "double-radius"] in your workbook. @pedagogy{Use a projector, so kids can see the function being written on the computer: }}
           @item{Write a function called @code{double-radius}, which takes in a radius and a color. It produces an outlined circle of whatever color was passed in, whose radius is twice as big as the input.}
           @item{Step 1: Contract and Purpose Statement @itemlist/splicing[
                 @item{Okay, what's the name of the function? double-radius! We know it takes in a radius and a color, so what is double-radius's domain? A number and a string! And what do you think the range is? Image! And what does it do? Can you tell me in English?}
@code[#:multi-line #t]{; double-radius: Number String -> Image
; makes an outlined circle that's twice the radius}]}
           @item{Step 2: Examples @itemlist/splicing[
                 @item{In your workbook, you will need to write at least two examples of how someone would use this function, and then what those expressions should become.} 
                 @item{How would someone else use @code{double-radius}?}
                 @item{We can look at the contract we just wrote to figure it out! We know that the name is @code{double-radius}, so we can call it using that name. If I write @code{(double-radius 50 "pink")}, describe the circle I should get back.}
           @item{Outline, 100, pink. And how would I make that circle, using Racket code?}
           @item{Can you give another example, and tell me what circle I'd get back?}
           @item{What is changing?? Circle everything that's different between the second part of these two examples: the size! @pedagogy{(write the name, to label it)}}
@code[#:multi-line #t]{(EXAMPLE (double-radius 50 "pink")
(circle (* 50 2) "outline" "pink"))

(EXAMPLE (double-radius 918 "orange")
(circle (* 918 2) "outline" "orange"))}]}
           
           @item{Step 3: Definition @itemlist/splicing[
           @item{How do we start our definition? @code{define}! Then we look back at our examples for help.}
           @item{What's the name of the function? How many variables do we have? How do you know? It's in the contract!}
           @item{The variables are circled, because they change from example to example; now we need to name them. What did this variable represent? Right, the size! We already labeled it.}
           @item{Now we can just copy one of our examples, and replace the changing thing with our variable! We didn't really have to do any work at all! }
           @code[#:multi-line #t]{(define (double-radius radius color)
(circle (* radius 2) "solid" color))}]}
           @item{@tag[pedagogy]{Okay, are you ready to try one on your own?} Turn to @worksheet-link[#:page 8 #:name "double-width"] in your workbooks.}
           @pedagogy{@item{I'm going to read the problem statement, and as soon as I'm done I'm going to start the timer. You'll have 5 minutes to finish this. Do not skip a step!! Once you're done, ask one of us to check your work. If they give you the OK, you can turn your monitors on and type in the code. Any questions?}
           @item{Here's the problem: }}
           @item{Write a function called @code{double-width}, which takes in a height and a color. The function produces a solid rectangle, which is whatever height and color were passed in. And its width? Its width is twice the height.}
           @pedagogy{@item{Review the solution as a class.}}]}
