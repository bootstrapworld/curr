#lang curr/lib

@declare-tags[management group pedagogy selftaught bootstrap]
@title{Supplemental Lessons}



@overview[#:gen-agenda? #f]{
          
          Students will deepen their understanding of various concepts, either through continued practice and review, encountering more complicated material (structs), or through an educational field trip.


          @pedagogy{
                         @materials[@item{Computers w/ DrRacket or WeScheme}
                                     @item{Student folders}
                                     @item{Design Recipe Signs}
          ]}



          @(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or})
                 (list "Position" @code{make-position}))
}

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
     #:standards (list "A-SSE.1-2" "MP.1" "MP.7")
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
           @point{@student{@bitmap{images/simple-spaceship.png}Imagine that we wanted to make an image of a simple satellite that looks like the one shown here. This image contains a blue circle and a red rectangle, with the circle on top of the rectangle.  Racket has a function called @code{overlay}, which lets you put one image on top of another. Here is its contract, and a purpose statement that explains what it does:
                            @code[#:multi-line ""]{; overlay : Image Image -> Image
                                                   ; Draws the first image on top of the second image}}
                   @teacher{Start out by reminding students why contracts matter: they specify @italic{types} instead of @italic{values}, which makes them really flexible! You can demonstrate this by showing them the code for a simple  image, and then replacing the size of the triangle with a sub-expression:
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
                                  #:auto-run? #t
                                  #:interactions-text "(overlay (circle 10 \"solid\" \"blue\")
         (rectangle 30 8 \"solid\" \"red\"))"]}
                   @teacher{Before students type in the code and try it out, ask the class what they think will happen - what will the size be? The color? The text?}}
                              
           @point{@student{@bitmap{images/rotated-spaceship.png}This satellite is flying level in the sky.  What if a strong wind were blowing, causing the satellite to fly slightly on its side, like the image seen here? Then, we would want the Racket @code{rotate} function:
@code{
(rotate 30
        (overlay (circle 10 "solid" "blue")
        (rectangle 30 8 "solid" "red")))
}
            Try copying and pasting this code into the editor, and see what shape you get. What happens if you change the numebr @code{30}?}
                   @teacher{Have the class convert this code into a Circle of Evaluation.}}
                              
           @point{@student{@bitmap{images/circles-with-images.png}Let's look at this code, viewed as a Circle of Evaluation. Our @code{rotate} function is shown here, in the blue circle. @code{30} is the number of degrees we'll be rotating, and the second input is the @code{Image} we want to rotate. That image is @italic{the result of overlaying the circle and the rectangle}, shown here in red. By looking at this Circle of Evaluation, can you guess the contract for the @code{rotate} function?}
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
                   
  ]}

       
@lesson[#:title "Making Flags"
        #:duration "30 minutes"]{
  @itemlist/splicing[
    @item{Here's some code to get you started: [@resource-link[#:path "source-files/Flags.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=LVUlaV7Z5J" "WeScheme")]
          @tag[selftaught]{@embedded-wescheme[#:id "Flags"
            #:definitions-text "(require bootstrap2012/bootstrap-teachpack)

; a blank flag is a 300x200 rectangle, which is outlined in black
(define blank (rectangle 300 200 \"outline\" \"black\"))

; the Japanese flag is a red circle...
(define japan (put-image (circle 50 \"solid\" \"red\")
                          150 100                ; put at (150, 100)
                          blank))                ; on top of a blank flag"]}}
    @item{Let's look at the code that's in this file...}
    @item{First, you'll see that there's a definition called @code{red-dot}, which is a solid red circle of radius 50.}
    @item{There's also a definition for @code{blank}, which is a 300 x 200 rectangle that is outlined in black".}
    @pedagogy{@item{To make the flag of Japan, we want to place a red circle right in the middle of our @code{flag}. If our @code{flag} is 300 wide by 200 high, what coordinate will put us right at the center? 150, 100}}
    @tag[selftaught]{@item{@think-about[#:question (list "To make the flag of Japan, we want to place a red circle in the middle of our " @code{flag} ". If our " @code{flag} " is 300 wide by 200 high, what coordinate will put us right at the center?")
                                        #:answer "150, 100"]}}
    @pedagogy{@item{What should the radius of our circle be? What code will generate this circle? @code{(circle 50 "solid" "red")}}}
    @tag[selftaught]{@item{@think-about[#:question "What should the radius of our circle be? What code will generate this circle?" #:answer @code{(circle 50 "solid" "red")}]}}
    @pedagogy{@item{Let's go through the next exercise together.}}
    @item{@exercise{Place the red circle on top of the flag to make the Japanese flag.}}
    @item{@bitmap{images/japan.jpg} Okay, so I've got my background image, @code{flag}, and I've got the image I want to place on it. Scheme gives us a function called @code{put-image}, which lets us do exactly that!
           
          @code[#:multi-line #t]{; put-image: Image Number Number Image -> Image
                                 ; places an image, at position (x, y), on an Image}}
    @item{Let's set up some code, and then fill in the blanks:
          
          @code{(put-image ______ ___ ___ _______)}}
    @item{The first thing in @code{put-image}'s domain is the Image we want to place. What is our image? @pedagogy{A circle!}
                             
          @code{(put-image (circle 50 "solid" "red") ___ ___ ________)}}
    @item{What are the next two things in the domain? @pedagogy{Numbers!} They represent the x and y coordinates for where we want to place the image of the circle. What did we determine were the coordinates for the center of the circle? Let's fill them in!
                                                      
          @code{(put-image (circle 50 "solid" "red") 150 100 _______)}}
    @item{Finally, we need to give @code{put-image} another image. In our case, that's going to be our rectangle.
                                   
          @code[#:multi-line #t]{(put-image (circle 50 "solid" "red")
                                            150 100
                                            (rectangle 300 200 "outline" "black"))}}
    @item{Okay, so let's define this whole expression to be a variable, so we can use it later. What is a good name for this variable? 
          
          @code[#:multi-line #t]{(define japan (put-image (circle 50 "solid" "red") 
                                               150 
                                               100
                                               (rectangle 300 200 "outline" "black")))}}
    @item{Now let's click Run and evaluate @code{japan}. What do you think we will get back?}
    @item{We can actually make this a little more elegant, by using the power of @code{define}. Since we've already defined our circle as @code{red-dot} and our rectangle as @code{blank}, we can replace that code with the variable:
                                                                                 
          @code[#:multi-line #t]{(put-image red-dot 
                                            150 100 
                                            blank)}}
    @item{Click "Run" and see if @code{japan} still does the right thing. How can we use @code{flag} to make the code even prettier?}
    @item{@exercise{@bitmap{images/somalia.jpg} Look at the picture of the Somalian flag. Think about what shapes will you need to make this flag. Which colors will you need? Try making the flag.}}
    @item{@exercise{@bitmap{images/poland.jpg} Look at the picture of the Polish flag. Think about what shapes will you need to make this flag. Which colors will you need? Try making the flag.}}
    @item{If you have time, try these other flags!}
    @item{@elem[#:style "NoFloat"]{@bitmap{images/indonesia.jpg}}
    @elem[#:style "NoFloat"]{@bitmap{images/peru.jpg}}
    @elem[#:style "NoFloat"]{@bitmap{images/switzerland.jpg}}
    
    @elem[#:style "NoFloat"]{@bitmap{images/france.jpg}}
    @elem[#:style "NoFloat"]{@bitmap{images/UAE.jpg}}
    @elem[#:style "NoFloat"]{@bitmap{images/chile.jpg}}
    @elem[#:style "NoFloat"]{@bitmap{images/panama.jpg}}}
    ]}


@itemlist/splicing[
     @item{Now let's get a little closer to what we'll want in our games. Instead of returning a number, you're going to return an image. The steps are going to be ALMOST the same as the ones we took for Luigi's Pizza, but the output values aren't going to be as simple as writing a number. Instead, you'll have to write the code to create an image.}     
      @tag[group]{@item{We're going to give you 10min to figure this out, and it will be a team competition. Each team is allowed to ask the staff three questions, so be sure to think carefully before you ask.}}
      @tag[group]{@item{When I say go, you're going to turn to @worksheet-link[#:page 36 #:name "red-shape"], and start working on "red-shape".}}
      @tag[group]{@item{GO!}}
      @tag[selftaught]{@item{Now, go to @worksheet-link[#:page 24 #:name "Red-Shape"] and start working on "red-shape"!}}
      @pedagogy{@item{Be sure to review and the end! (note: the sizes used below are arbitrary)
          @code[#:multi-line #t]{
             (define (red-shape shape)           
                  (cond
                    [(string=? topping "circle")    (circle 50 "solid" "red")]
                    [(string=? topping "triangle")  (triangle 200 "solid" "red")]
                    [(string=? topping "star")      (star 70 "solid" "red")5]
                    [(string=? topping "rectangle") (rectangle 100 50 "solid" "red")])) }
                     }}
     @item{Where do you think conditions might be used in a videogame? 
           @pedagogy{@itemlist[
             @item{Have the player drawn differently when they get a power boost}                                                                    
             @item{Open doors when the player is holding a key}
             @item{Move differently depending on keyboard input}
           ]}}                                                                      
     @item{You'll be using conditions in your game to move the player up or down, depending on what the user does.}]}
                                                                                                                    
                                                                                                                    
@lesson[#:title "Structs" #:duration "20 minutes"]{

@itemlist/splicing[
   @pedagogy{@item{Display one student's code on the projector, and draw the class's attention to the update-danger function.}}
   @pedagogy{@item{Write the contract for update-danger on the board. 
                        @code[#:multi-line #t]{; update-danger : Number -> Number
                                               ; takes in object's x-coordinate and returns the next one}}}
   @tag[selftaught]{@item{Remember update-danger ? Here is its contract. @code[#:multi-line #t]{; update-danger : Number -> Number
                                                                                             ; takes in object's x-coordinate and returns the next one}}}
   @item{Right now, update-danger takes in the object's x-coordinate and produces the next x-coordinate for the object. This allows our object to move left or right, but does not allow it to move up and down or along the diagonal.}
   @item{What if I wanted the object to move on the diagonal instead. For example...
       @itemlist/splicing[
         @pedagogy{@item{Draw a screen, add and label a point for the object}}
         @tag[selftaught]{@item{Look at the following picture. INSERT SELFTAUGHT PICTURE}} 
         @item{Suppose my object is sitting in the center of our screen at (320, 240). I want it to move diagonally so both the x and y increase by 10. What would the new coordinates be?}        
         @pedagogy{@item{Have students discuss this and then write in the new coordinate.}}
         ]}
   @pedagogy{@item{What would have to change about our function?}}
   @tag[selftaught]{@item{@think-about[#:question "What would have to change about our function?" #:answer "We would have to find some way to return both the x and y values."]}}
   @pedagogy{@item{Allow students to discuss this and try to guide the discussion towards the importance of returning both an x- and a y-coordinate.}}
   @item{The problem is, a function can only return one value. What is that value, according to our contract? A number! So we have to choose whether that number stands for a new x-coordinate or a new y-coordinate, but it can't stand for both.}
   @item{However, Racket actually allows us to create new kinds of data that can contain more than one thing. These kinds of data are called structs, and a struct can be made up of any combination of data you can imagine!}
   @pedagogy{@item{Monitors off!}}
   @pedagogy{@item{Open a new blank program on the projector.}}
   @item{One kind of struct that is useful to us is called a position, which Racket abbreviates posn.}
   @item{A position contains two numbers: an x- and a y-coordinate.}
   @item{Suppose I wanted to make a position with the coordinates 10, 40. In the Interactions window: I can make this position by typing @code{(make-posn 10 40)}. 
                                                                               @pedagogy{How do you think I would make a position at 400, -50?} 
          @tag[selftaught]{@think-about[#:question "How do you think I would make a position at 400, -50?" #:answer @code{(make-posn 400 -50)}]}}
   @item{Let's return to simple values for a moment. If I type the number 4, what will happen when I hit Enter? @pedagogy{Students guess that you will get 4 back. That's right! }I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{What if I type the string @code{"hello"}, and hit Enter? What will I get back? @pedagogy{Students guess that you will get @code{"hello"} back. That's right! } I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{What about the Boolean @code{true}? What will I get back my hit Enter? @pedagogy{Students guess that you will get @code{true} back. That's right! } I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{Now, what do you think will happen if I type in @code{(make-posn 400 -50)}
 and hit enter?}
   @item{@pedagogy{Allow students to brainstorm. Hit enter, and then remind them: }I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{The moral of the story is, Structs are Values, just like Numbers, Strings, Booleans and Images.}
  @pedagogy{@item{Have students turn their monitors on and practice making posns for different coordinates. Can they make a posn for each of the four corners of their game screen?}}
  @tag[selftaught]{@item{@think-about[#:question "Can you make a posn for each of the four corners of your game screen?" #:answer @code{(make-posn 0 0)
                                     (make-posn 640 0)
                                     (make-posn 640 480)
                                     (make-posn 0 480)}]}}
   @item{Let's look back at our example - can you make a posn for the original position of the object? @think-about[#:question "What about the new position?" #:answer @code{(make-posn 330 250)}]}
   @item{Everything we know about Racket still applies, so I could also write this as:
@code{(make-posn (+ 320 10) (+ 240 10))}}
   @pedagogy{@item{Grab a Design Recipe Worksheet}}
   @tag[selftaught]{@item{Get a Design Recipe worksheet @worksheet-link[#:page 34 #:name "design-recipe"]}}
   @item{The problem with returning a number is that we could only update the X or Y coordinate. But if we return a Posn instead, we can update BOTH.}
   @item{How should our contract change? The Domain is two numbers, and the Range should be a Posn, instead of a number.}
   @item{What about our examples? Well, we've already got one of them on the board. @code{(update-danger 320 240)} should give us back a @code{(make-posn (+ 320 10) (+ 240 10))}.}
   @item{Can you write another example, using a different starting x and y?}
   @item{What should our function header be, so it matches our new contract? And what about the function body?}
   @pedagogy{@item{Have students click 'run' - the game should run as normal, except for their object moving in two dimensions! Then once students have gotten their objects to move in two dimensions, ask them how they might modify the @code{update-target} and @code{update-projectile} functions to do the same.}}
   @tag[selftaught]{@item{Click run- the game should run as normal, except your object will move in two dimensions!}}
   @item{What about @code{update-player}? How does the contract need to change to allow the player to move in two dimensions? The function header?}
   @item{Right now, both branches of the cond statement return numbers. We need to fix that so they return posns instead. Remember that the x-coordinate isn't changing at all, so these posns should only be adding to or subtracting from the y-coordinate.}
   @item{But suppose we would like the player to also move left and right. How could we add branches for the "left" and "right" keys?}
   @pedagogy{@item{Allow students to fiddle with this code. When they are done, they should have solid, two-dimensional movement for all of their game characters.}}
   @tag[selftaught]{@item{Fiddle around with your code until all of your objects have two-dimensional movement!}}
   @item{If you want your other characters to move in 2-dimensions, you can look to @worksheet-link[#:page 34 #:name "design-recipe"] and @worksheet-link[#:page 35 #:name "design-recipe"] to think about how to convert the rest of your game to use Posns.}]}

@lesson[#:title "Simple Ideas, Easter Eggs, and Advanced Challenges" #:duration "variable"]{

@itemlist/splicing[
                   @item{Diagonal movement keys, second set of faster movement keys, etc.}
                    @item{Player disappears and reappears using some key with @code{(- 10000 y)} in @code{update-player}, or a real @code{cond} to be safer.}
                    @item{Bounding-box collide for oblong characters: if your characters are nowhere near circular, you may want to change to a bounding box version of @code{collide?}
, where line-length in x isn't too big and line length in y isn't too big, separately, with different definitions of too-big for the two dimensions.}
                    @item{You can make multiple Dangers or Targets by defining a list of them. Introduce students to Racket's @code{(list ...)}
 by making a list of two copies of the current target for them. Two will appear onscreen!}
                    @item{The @code{(random upper-bound)}
 function can be used for random speeds, random delta-y with constant delta-x (or vice versa), for "t" meaning "teleport to a random spot on screen" in update-player, etc.}
                    @item{Get the target or danger to slow down as it comes across the screen by making its speed depend on x.}
                    ;@item{There is a global Number @code{*score*} -- make the speed or the collision radius or something depend on that.}
                    ;@item{There are global Numbers @code{*player-x*} and @code{*player-y*}. Heat seeking Danger. Avoiding Target. Best to use with random or the game gets too hard.}
;                    @item{Make update-player check onscreen?-ness of the new position -- wants @code{let} to avoid calling update-player-helper twice, but can't have it because of student language, interacts badly with some random stuff for that reason}
                    @item{Black holes: put black spots on the background image and use distance inside onscreen to check that you're not too close to one of these.}
                    @item{Walls: put walls on the background and make @code{update-player} respect them.}
                    @item{Safe Zone: put a green box or green shading somewhere on the background. Change @code{collide?}
 so that if you're in it, you never collide.}
                    @item{Make the player move diagonally towards or away from center: hard!}
                    @item{Get the target or danger to move in a sine wave pattern (hard! have to play with amplitude and keep track of the y offset -- sine is in degrees (though sin is in radians) so the phase should be okay.)}
                ]}


@lesson[#:title "Programming Olympics!" #:duration "20 minutes"]{
                                  @itemlist/splicing[
                                         @item{Divide the class into groups of roughly six students each. This can be done by gender, by grade, at random, or by any other criteria you see fit. However, it is important that both teams have similar mixes of strong and struggling students.}
                                         @item{Explain that these teams will be entering in the Scheme Olympics, a veritable programming decathlon where teams must submit entries for various events. The rules are as follows:
                                               @itemlist/splicing[@item{Every student on a team must participate in at least one event.}
                                                                   @item{Once a student has signed up for an event, they may not switch.}
                                                                   @item{All correct answers are worth one point, and points will only be deducted for violations of the rules.}
                                                                   @item{Any notes taken during the semester may be used by the student who took those notes.}]}
                                         @item{Display a visual, which outlines the major events of the Scheme Olympics. These events can be decided by the instructor, but a number of ideas are listed below:
                                               @itemlist/splicing[
                                                                  @item{Guess that Contract: students are given a function, and asked to guess the contract for that function. (Stresses the importance of naming, note-taking, and reviews basic data types.)}
                                                                  @item{Find the Bug: students are given examples of buggy code, which can be drawn from the exercises in earlier lessons or from real examples of mistakes your students have made during the semester. Students must identify the bug and fix it for an additional point.} 
                                                                  @item{Design Recipe Relay: a true team event, in which students are given a word problem, and the first competitors must successfully deduce the contract. The students then have a contract and purpose statement over to the next competitors on their team, who must devise two test cases to be written for the function. Finally, this information is headed to the last set of competitors, who must write a function that satisfies the contract and passes all tests cases.}
                                                                  @item{Code Whispering: students are shown a strange function, with no contract or purpose statement and gibberish for both the function name and variable names. Students must figure out first what the name of the function is, then how many inputs it takes, then what types of those inputs are based on how they are used in the body of the function. Each one of these answers can be valued at one point. Finally, students must explain what the function does, suggest a new name, and use the function in an example to demonstrate their correctness.}
                                                                  @item{Fill in the blank: students are given functions and their contracts, but some part of the function is missing. Compete, Jeopardy-style, for who can fill in the parts fastest.}]}]}
                                               
                                               
                                
@copyright[]