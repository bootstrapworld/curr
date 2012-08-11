#lang curr/lib
@(require 2htdp/image)

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Creating Images"
        #:duration "35 minutes"
        #:prerequisites "Introducing-the-Design-Recipe"]{
@itemlist/splicing[
          @item{Let's talk about graphics. Take a look at this Circle of Evaluation. How would we convert this into Racket code?}
          @bitmap{images/CircleCirclesm.png}
          @tag[selftaught]{@item{@think-about[#:question "How would you convert this to racket code? Check your answer below."
                                                                     #:answer @code{(circle 50 "solid" "red")}]}}
          @item{This uses a new function, which you've never seen before! What is its name?}
          @item{Every contract has three parts! 
                       @tag[selftaught]{@think-about[#:question "What are they?"
                                                    #:answer "Name, domain, and range"]}}
           @item{Can you figure out the contract for circle? Based on the example, can you tell me what's in its Domain?                                           
                 @tag[selftaught]{@think-about[#:question "What is the domain?"
                                                    #:answer @code[#:multi-line ""]{; circle: Number String String -> ...
                                       (circle 50 "solid" "red")}]}
          What's the Range? What do you think this thing is going to give us back? A Number? A String? Type it in and try it out!}
          @embedded-wescheme[#:id "Images1"
                   #:interactions-text "; Try out the images!"
                   #:hide-definitions? #t]

           
           @item{What it gives back is a new Type: Image!}
           @item{@exercise{The following is the contract for another function. It will be very helpful going forward to copy this contract into your contract table, along with the contract for circle. Once you've done that, move back to your keyboard and try to draw a rectangle!} @code{; rectangle: Number Number String String -> Image}}
           @item{@exercise{I'm going to show you a few more contracts. Once again, you it will be useful to have them written down before touching the keys. Afterwards, use each of these functions to make a shape in WeScheme!} 
                  @code[#:multi-line ""]{; ellipse: Number Number String String -> Image
                        ; triangle: Number String String -> Image
                        ; star: Number String String -> Image
                        ; radial-star: Number Number Number String String -> Image
                        ; text: String Number String -> Image}}
           @item{For more practice creating images, you can go further into @lesson-link[#:name "Manipulating-Images" #:label "Manipulating Images"] or @lesson-link[#:name "Making-Flags" #:label "Making Flags"]!}
           ]}

                                                        


                                                        
