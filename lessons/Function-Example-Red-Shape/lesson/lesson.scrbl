#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "red-shape" #:duration "20 minutes"]{

@itemlist/splicing[
     @item{Now let's get a little closer to what we'll want in our games. Instead of returning a number, you're going to return an image. The steps are going to be ALMOST the same as the ones we took for Luigi's Pizza, but the output values aren't going to be as simple as writing a number. Instead, you'll have to write the code to create an image.}     
      @tag[group]{@item{We're going to give you 10min to figure this out, and it will be a team competition. Each team is allowed to ask the staff three questions, so be sure to think carefully before you ask.}}
      @tag[group]{@item{When I say go, you're going to turn to @worksheet-link[#:page 36 #:name "red-shape"], and start working on "red-shape".}}
      @tag[group]{@item{GO!}}
      @tag[selftaught]{@item{Now, go to @worksheet-link[#:page 24 #:name "Red-Shape"] and start working on "red-shape"!}}
      @tag[pedagogy]{@item{Be sure to review and the end! (note: the sizes used below are arbitrary)
          @code[#:multi-line #t]{
             (define (red-shape shape)           
                  (cond
                    [(string=? topping "circle")    (circle 50 "solid" "red")]
                    [(string=? topping "triangle")  (triangle 200 "solid" "red")]
                    [(string=? topping "star")      (star 70 "solid" "red")5]
                    [(string=? topping "rectangle") (rectangle 100 50 "solid" "red")])) }
                     }}
     @item{Where do you think conditions might be used in a videogame? 
           @tag[pedagogy]{@itemlist[
             @item{Have the player drawn differently when they get a power boost}                                                                    
             @item{Open doors when the player is holding a key}
             @item{Move differently depending on keyboard input}
           ]}}                                                                      
     @item{You'll be using conditions in your game to move the player up or down, depending on what the user does.}]}