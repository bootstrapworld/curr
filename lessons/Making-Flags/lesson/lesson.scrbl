#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Making Flags"
        #:duration "30 minutes"
        ]{
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