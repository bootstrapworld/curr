#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Updating the World"
        #:duration "40 minutes"]{
          @itemlist/splicing[
            @item{Now scroll down to where it says "UPDATING FUNCTIONS." This code is responsible for changing the World. What function do you see here? @code{update-world}. What's in its Domain? World! Range? World!}
            @item{That's right - @code{update-world} takes a world, and then returns a new one that's been updated. Think of this function as the one that generates the next page of a flipbook.}
            @item{Look back at the difference between your @code{START} and @code{NEXT} worlds - what has changed?}
            @item{On @worksheet-link[#:page 26 #:name "update-world"], make a list of what changed and how it changed as a problem statement for writing @code{update-world}, using the design recipe on the next page.}
            @pedagogy{@item{Work with small groups to complete this section as needed. Upon completion, have students type update-world into their games.}}]}
