#lang curr/lib
@declare-tags[group pedagogy selftaught]
@lesson[#:title "Creating Images"
        #:duration "35 minutes"]{
@itemlist[@item{Let's talk about graphics.}
           @item{@tag[pedagogy]{On the board, draw the Circle of Evaluation for 
                                  @code{(circle 100 "solid" "red")}}}
           @item{@tag[selftaught]{"insert image here for selfies"}}
           @item{@tag[pedagogy]{Can someone tell me how to convert this into Racket code? Copy their answer on the board.}
                                         @tag[selftaught]{@think-about[#:question "How would you convert this to racket code? Check your answer below."
                                                                     #:answer @code{(circle 100 "solid" "red")}]}}
           @item{This uses a new function, which you've never seen before! What is its name?}
           @item{Every contract has three parts! @tag[pedagogy]{Raise your hand if you can tell me what they are! (Name, domain, and range)}
                       @tag[selftaught]{@think-about[#:question "What are they?"
                                                    #:answer "Name, domain, and range"]}}
           @item{Can you figure out the contract for circle? Based on the example, can you tell me what's in its Domain?@tag[pedagogy]{ Follow along on the board...
                                                                                           @code{; circle: Number String String -> ...
                                                                                                 (circle 100 "solid" "red")}}}
           @item{So what's the Range? What do you think this thing is going to give us back? A Number? A String? Type it in and try it out!}
           @item{What it gives back is a new Type: Image!}
           @item{@tag[group]{Now we're going to do the next step as a group.}}
           @item{@exercise{I'm going to show you the contract for another function. This time around, you're not allowed to touch the keyboard until you have copied the contract into your contract table, along with the contract for circle
. Once you've done that, @tag[pedagogy]{"I want to see you "}try to draw a rectangle! GO!} @code{; rectangle: Number Number String String -> Image}}
           @item{@exercise{I'm going to show you a few more contracts. Once again, you have to have them written down before touching the keys. You'll have five minutes to figure out how to use each of these functions to make a shape! GO!}
                  @code{; ellipse: Number Number String String -> Image
                        ; triangle: Number String String -> Image
                        ; star: Number String String -> Image
                        ; radial-star: Number Number Number String String -> Image
                        ; text: String Number String -> Image
                        }} 
           @item{@tag[pedagogy]{Let kids experiment with these functions and point out interesting results to the class.}}
           @item{Going Further - If time allows, you can go further into @(hyperlink "http://manipulatingimages.com" "Manipulating Images") or @(hyperlink "http://makingflags.com" "Making Flags")!}
           ]}