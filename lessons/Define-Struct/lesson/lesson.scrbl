#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Have students keep their Autobody file open, and look at the top line.}
            @item{Raise your hand if you can read the line beginning with "an auto is...". Have one student read the line aloud.}
            @item{Raise your hand if you can read the line beginning with define-struct.}
            @item{I told you last time that we were skipping over the part of the code that defines the auto struct, or tells the computer what an auto is and what goes into it. Just like we would expect, from having worked with autos, the define-struct says that an auto has five things....a model, hp, rim, color, and value.}
            @item{How do we know which number is which? Why can't the horsepower number be the size of the rims? Because order matters! Look at the order of the fields in our define-struct line. The first number is the horsepower, the second is the rim size, and so on.}
            @item{When we define a struct using define-struct, we tell the computer what order and type each thing is. In return, we get new functions to use. Until we write this define-struct line, we didn't have make-auto, to make an auto, auto-model, to get the model out of the auto, auto-hp, or any of the other accessor functions.}
            @item{To make sure I'm telling the truth, I want you to type a semi-colon before the line which begins with define-struct. This comments it out, so that the computer ignores it. Hit run, and see what happens.}
            @item{You get an error! Racket says that you're trying to use an identifier before its definition. That means that it doesn't know what make-auto is, since we took that line out!}
            @item{Turn to page 13 in your workbook, and copy down the define-struct line.}]}