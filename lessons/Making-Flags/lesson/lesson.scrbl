#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Making Flags"
     #:duration "30 minutes"
     #:overview "Students apply their knowledge of Contracts, Syntax and function composition to build flags using built-in image functions."
     #:learning-objectives @itemlist[@item{Learn how to use advanced image operations} 
                                      @item{Practice function composition} 
                                      @item{Practice using contracts to help with composing operations} 
                                      @item{Practice writing and evaluating nested expressions}]
     #:product-outcomes @itemlist[@item{Students create images for various nations' flags}]
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
          @point{@student{@activity{Open this file and read through the code: [@resource-link[#:path "source-files/Flags.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=LVUlaV7Z5J" "WeScheme")] The code is also shown here:
                                     @code[#:multi-line ""]{; a blank flag is a 300x200 rectangle, which is outlined in black
                                                            ; 1) start with a red dot, of radius 50
                                                            (define dot (circle 50 "solid" "red"))
                                                            ; 2) define a variable called "blank", which is a 300x200, outlined black rectangle
                                                            (define blank (rectangle 300 200 "outline" "black"))
                                                            ; 3) define "japan" to be the flag of japan (a red dot, centered on a blank rectangle)
                                                            (define japan (put-image dot
                                                            150 100
                                                            blank))}
                                     @itemlist[@item{There are three values being defined here. What are they?}
                                                @item{Click "Run" and evaluate each of those values in the Interactions window.}
                                                @item{Change the size of the dot and click "Run". Do you expect @code{japan} to look different than it did before? Why or why not?}]}
                           }
                  @teacher{}}
           @point{@student{To make the flag of Japan, we want to put a solid, red circle right in the middle of our @code{flag}. According to the definition for @code{blank}, a flag is 300 wide by 200 high. To put the @code{dot} at the center, we use the coordinates (150, 100).
                          @activity{The function that lets us put one image on top of another is called @code{put-image}:
                                    @code[#:multi-line #t]{; put-image: Image Number Number Image -> Image
                                                           ; places an image, at position (x, y), on an Image}
                                    @itemlist[@item{How many things are in the @vocab{Domain} of this function?}
                                               @item{What is the @vocab{Range} of this function?}
                                               @item{In the definition for @code{japan}, what image is being used as the first argument? What is being used as the second?}]
                                    }}
                   @teacher{This is a good time to remind students about @bold{indenting}. Notice that all of the inputs to @code{put-image} line up with one another!}
          }
           @point{@student{You've seen arithmetic functions nested before, such as @sexp{(+ 4 (+ 99 12))}. The second input to @code{+} is @italic{a number-producing subexpression}, in this case @code{+ 99 12}. @code{put-image} can be nested the same way. 
                   @activity{This Circle of Evaluation will draw a star on top of another image, which itself is a circle drawn inside a square. @sexp{(put-image (star 50 "solid" "black") 75 75 (put-image (circle 50 "solid" "red") 75 75 (square 150 "solid" "black")))} Convert this Circle of Evaluation into code, and try typing it into the computer. What image do you get back? Can you modify the code so that another image is added on top?}}
                   @teacher{Have students practice this once or twice, and point out the natural indenting pattern.}
                   }
           @point{@student{By combining simple shapes together, you can make very sophisticated images!
                           @activity{@bitmap{images/somalia.jpg} Look at this picture of the Somalian flag. 
                                      @itemlist[@item{What shapes will you need to make this flag?}
                                                 @item{Which colors will you need?}
                                                 @item{Define a new value called @code{somalia}, which evaluates to this image.}]}}
                   @teacher{}}
           @point{@student{@activity{Try to define as many of the ollowing flags as possible:
                                     @itemlist[@item{Indonesia @bitmap{images/indonesia.jpg}}
                                                @item{Peru @bitmap{images/peru.jpg}}
                                                @item{France @bitmap{images/france.jpg}}
                                                @item{Switzerland @bitmap{images/switzerland.jpg}}
                                                @item{United Arab Emirates @bitmap{images/UAE.jpg}}
                                                @item{Chile @bitmap{images/chile.jpg}}
                                                @item{Panama @bitmap{images/panama.jpg}}
                                                @item{Try making the flag for your favorite country, or even make up a flag of your own!}]}}
                   @teacher{}}]
    }