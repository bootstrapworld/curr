#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Making Flags"
        #:duration "30 minutes"
        ]{
  @itemlist/splicing[
    @item{Here's some code to get you started:
          @embedded-wescheme[#:id "Flags"
            #:definitions-text "(require bootstrap2011/bootstrap-teachpack)

; a blank flag is a 300x200 rectangle, which is outlined in black
(define blank (rectangle 300 200 \"outline\" \"black\")

; the Japanese flag is a red circle...
(define japan (put-image (circle 50 \"solid\" \"red\")
                          150 100                ; put at (150, 100)
                          blank))                ; on top of a blank flag"]}
    @item{Try the first two exercises on your own!}
    @item{@exercise{Make a circle, with radius 50, which is solid and red. The contract is: 
                    @linebreak[]
                    @code[#:contract "; circle : Number String String -> Image"]
                    @linebreak[]
                    where the Number is the radius, the first String is the fill, and the second String is the color.

                    Define @code{red-dot} to be that circle.}}
    @item{@exercise{Define @code{flag} as a 300 x 200 rectangle, just the outline, in black, so you can see it. Hint: fill can be "solid" or "outline".}}
    @tag[pedagogy]{@item{We want to place a red circle right in the middle of our @code{flag}. If our @code{flag} is 300 wide by 200 high, what coordinate will put us right at the center? 150, 100}}
    @tag[selftaught]{@item{@think-about[#:question (list "We want to place a red circle in the middle of our " @code{flag} ". If our " @code{flag} " is 300 wide by 200 high, what coordinate will put us right at the center?")
                                        #:answer "150, 100"]}}
    @tag[pedagogy]{@item{What should the radius of our circle be? What code will generate this circle? @code{(circle 50 "solid" "red")}}}
    @tag[selftaught]{@item{@think-about[#:question "What should the radius of our circle be? What code will generate this circle?" #:answer @code{(circle 50 "solid" "red")}]}}
    @tag[pedagogy]{@item{Let's go through the next exercise together.}}
    @item{@exercise{Place the red circle on top of the flag to make the Japanese flag: @image{images/japan.jpg}}}
    @item{Okay, so I've got my scene, @code{flag}, and I've got the image I want to place on it. Scheme gives us a function called @code{put-image}, which lets us do exactly that! @linebreak[]
          @code[#:contract]{; put-image: Image Number Number Scene -> Scene} @linebreak[]
          @code[#:contract]{; places an image, at position (x, y), on a scene}}
    @item{Let's set up some code, and then fill in the blanks: @linebreak[]
          @code{(put-image ______ ___ ___ _______)}}
    @item{The first thing in @code{put-image}'s domain is the Image we want to place. What is our image? @tag[pedagogy]{A circle!} @linebreak[]
          @code{(put-image (circle 50 "solid" "red") ___ ___ ________)}}
    @item{What are the next two things in the domain? @tag[pedagogy]{Numbers!} They represent the x and y coordinates for where we want to place the image of the circle. What did we determine were the coordinates for the center of the circle? Let's fill them in! @linebreak[]
          @code{(put-image (circle 50 "solid" "red") 150 100 _______)}}
    @item{Finally, we need to give @code{put-image} another image. In our case, that's going to be our rectangle. @linebreak[]
          @code{(put-image (circle 50 "solid" "red") 150 100 (rectangle 300 200 "outline" "black"))}}
    @item{Okay, so let's define this whole expression to be a variable, so we can use it later. What is a good name for this variable? @linebreak[]
          @code{(define japan (put-image (circle 50 "solid" "red") 150 100 (rectangle 300 200 "outline" "black")))}}
    @item{Now let's click Run and evaluate @code{japan}. What do you think we will get back?}
    @item{We can actually make this a little more elegant, by using the power of @code{define}. Since we've already defined our circle as @code{red-spot}, we can replace that code with the variable: @linebreak[]
          @code{(put-image red-spot 150 100 (rectangle 300 200 "outline" "black"))}}
    @item{Click "Run" and see if @code{japan} still does the right thing. How can we use @code{flag} to make the code even prettier?}
    @item{@exercise{@image{images/somalia.jpg} Make the Somalian flag.}}
    @item{@exercise{Make the Polish flag. @image{images/poland.jpg}}}
    @item{If you have time, try these other flags!}
          
    @item{@elem[#:style "NoFloat"]{@image{images/indonesia.jpg}} Indonesia}
    @item{@elem[#:style "NoFloat"]{@image{images/peru.jpg}} Peru}
    @item{@elem[#:style "NoFloat"]{@image{images/switzerland.jpg}} Switzerland}
    @item{@elem[#:style "NoFloat"]{@image{images/france.jpg}} France}
    @item{@elem[#:style "NoFloat"]{@image{images/UAE.jpg}} United Arab Emirates}
    @item{@elem[#:style "NoFloat"]{@image{images/chile.jpg}} Chile}
    @item{@elem[#:style "NoFloat"]{@image{images/panama.jpg}} Panama}
    ]}