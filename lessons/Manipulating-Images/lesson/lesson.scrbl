#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Manipulating Images"
     #:duration "20 minutes"
     #:overview "Introduces additional operations on images.  As students use these operations to create more interesting images, they can practice function composition, fitting contracts together, and writing nested expressions."
     #:learning-objectives @itemlist[@item{Learn how to use advanced image operations} 
                                      @item{Practice function composition} 
                                      @item{Practice using contracts to help with composing operations} 
                                      @item{Practice writing and evaluating nested expressions} 
                                      @item{Learn how to import gif, png, and other images from file}]
     #:product-outcomes @itemlist[@item{Students create scaled, rotated, flipped, and layered images}]
     #:standards @itemlist[@item{A-SSE.1-2: Interpret the structure of expressions} 
                            @item{MP.1: Make sense of problems and persevere in solving them}
                            @item{MP.7: Look for and make use of structure}]
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Images.rkt file is loaded)} @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Spend more time reviewing the simpler image functions, making sure students have a chance to type them in and try them out.} 
                                                @item{Have them convert each expression to a Circle of Evaluation, before typing it in.} 
                                                @item{If a student isn't sure about the order of the inputs, or what type of input they'll need -- don't give them the answer! This is a great time to remind them why contracts come in handy, so have them look up the answer in their own notes.}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Even students who are good at nested expressions of numbers can get stuck when it comes to images. Make sure you have students practice the Circle of Evaluation the first time they use a new function, reminding them to start simple and build out:
                @code[#:multi-line ""]{; start with a shape they already know
                                       (triangle 50 "solid" "red")
                                       ; then add the extra function around it
                                       (rotate 45 (triangle 40 "solid" "red"))}}]}
                @pacing[#:type "challenge"]{@itemlist[@item{A good challenge, if your students have seen <tt>string-length</tt>, is to use the text function to make an image, using the string <tt>"purple"</tt> for all three inputs:
                @code[#:multi-line ""]{; with a sub-expression
                                       (text "purple"
                                       (string-length "purple")
                                       "purple")}]}]}
                )
      ]{
        @points[
          @point{@student{Earlier, you learned how to create simple images using operators such as @code{circle}, @code{rectangle}, and @code{triangle}.  We can combine or manipulate these basic shapes to make more interesting ones, the same way we can combine and manipulate numbers.  In this lesson, you'll learn Racket functions for manipulating and combining images.}
                 @teacher{@management{Use of the board is critical in this activity - you'll want to have lots of room to write, and lots of visuals for students to see.} Have students review some of the Image-producing functions they already know (@code{triangle}, @code{circle}, etc.). Quiz them on the contracts for these functions.}
                 }
           @point{@student{@bitmap{images/image1.png}Imagine that we wanted to make an image of a simple satellite that looks like the one shown here. This image contains a blue circle and a red rectangle, with the circle on top of the rectangle.  Racket has a function called @code{overlay}, which lets you put one image on top of another. Here is its contract, and a purpose statement that explains what it does:
                            @code[#:multi-line ""]{; overlay : Image Image -> Image
                                                   ; Draws the first image on top of the second image}}
                   @teacher{Start out by reminding students why contracts matter: they specify @italic{types} instead of @italic{values<}, which makes them really flexible! You can demonstrate this by showing them the code for a simple  image, and then replacing the size of the triangle with a sub-expression:
                            @code[#:multi-line ""]{; simple image expression
                                  (star 50
                                  "solid"
                                  "red")
                                  ; with a sub-expression
                                  (star (* 10 10)
                                  "solid"
                                  "red")}
                            This sets students up to see @code{overlay} as a logical extension - instead of image-producing Circles of Evaluation with number-producing subexpressions, there can be image-producing Circles with @italic{image-producing} subexpressions.}
                   }
           @point{@student{Using @code{overlay}, we could make a picture of a satellite. Take a look at the code below, then hit "enter" and see what shape it makes! Can you change the color of the circle? The size of the rectangle? Can you use @code{overlay} to put a star on top of both the star @italic{and} the rectangle? If you want to reset the editor, hit the refresh button (&#x27F3) below.
          @embedded-wescheme[#:id "manipulating-images1"
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:autorun? #t
                                  #:interactions-text "(overlay (circle 10 \"solid\" \"blue\")
         (rectangle 30 8 \"solid\" \"red\"))"]}
                   @teacher{Before students type in the code and try it out, ask the class what they think will happen - what will the size be? The color? The text?}}
                              
           @point{@student{@bitmap{images/image2.png}This satellite is flying level in the sky.  What if a strong wind were blowing, causing the satellite to fly slightly on its side, like the image seen here? Then, we would want the Racket @code{rotate} function:
@code{
(rotate 30
        (overlay (circle 10 "solid" "blue")
        (rectangle 30 8 "solid" "red")))
}
            Try copying and pasting this code into the editor, and see what shape you get. What happens if you change the numebr @code{30}?}
                   @teacher{Have the class convert this code into a Circle of Evaluation.}}
                              
           @point{@student{@bitmap{images/image5.png}Let's look at this code, viewed as a Circle of Evaluation. Our @code{rotate} function is shown here, in the blue circle. @code{30} is the number of degrees we'll be rotating, and the second input is the @code{Image} we want to rotate. That image is @italic{the result of overlaying the circle and the rectangle}, shown here in red. By looking at this Circle of Evaluation, can you guess the contract for the @code{rotate} function?}
                   @teacher{Can students write the code or draw the Circle of Evaluation for rotating a difference shape by a different amount? Try using a subexpression like @code{(* 2 75)} for the rotation, instead of a simple number.}}
                              
           @point{@student{Here are the contract and purpose for rotate:
                           @code[#:multi-line ""]{; rotate : Number Image -> Image
                                                  ; Rotates the image by the given number of degrees}}
                   @teacher{@management{When it's time to introduce the new functions, start out by showing them the contract and then an example, as it does in the student guide. Make sure to ask lots of "how do you know?" questions during the code, to remind them that the contract has all the necessary information.}}}
                              
           @point{@student{Suppose you wanted to make the satellite bigger, by scaling it up to 2x or 3x it's original size. Racket has a function that will do just that, called @code{scale}. Here is the contract and purpose statement for scale:
                           @code[#:multi-line ""]{; scale : Number Image -> Image
                                                  ; Reproduce the given image with both dimensions multiplied
                                                  ;     by the given number}
          Below is some code that will scale a star to make it one-half the original size. What would you change to make it bigger instead of smaller? What would you need to change to scale a different-color star? What if you wanted to scale a circle instead? @italic{Can you figure out how to scale the entire spaceship}?
          @embedded-wescheme[#:id "manipulating-images2"
                                  #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(scale 0.5 (star 50 \"solid\" \"purple\"))"]}
                   @teacher{}}
                              
           @point{@student{There are also functions for flipping an image horizontally or vertically, and for scaling images so they get bigger or smaler.  Here are contracts and purpose statements for those functions:
                           @code[#:multi-line ""]{; flip-horizontal : Image -> Image
                                                  ; Flip the given image on the horizontal (x) axis
                                                  
                                                  ; flip-vertical : Image -> Image
                                                  ; Flip the given image on the vertical (y) axis
                                                  
                                                  ; scale/xy : Number Number Image -> Image
                                                  ; Reproduce the given image with the horizontal (x)
                                                  ; dimension multiplied by the first number and the vertical
                                                  ; (y) dimension multiplied by the second number}}
                   @teacher{After a few of these, try mixing it up! Show students the Racket code or Circle of Evaluation for some of the new functions @italic{first}, and have them guess the contract based on how they is used.}}
                   
  ]
  @exercises[
             @item{fill in an exercise}
                 ]
  }
                                  

 
