#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Introduction to Functions" #:duration "10 minutes"]{

@itemlist/splicing[
   @item{Imagine that you really like green triangles.  You want to make lots of
         green triangles in different sizes.  To do this, you might write a bunch of 
         expressions like
         
         @code[#:multi-line]{(triangle 5 "solid" "green")
                             (triangle 100 "solid" "green")
                             (triangle 24 "solid" "green")}
         You can enter these expressions into WeScheme or DrRacket to check what they do.}
    @item{Note that these expressions are all the same except for the length of the side of the triangle.  
          Whenever we need the same expression many times but different in only a couple of places, 
          it's nice to have a shorthand that only requires us to fill in the different parts. 
          That shorthand is called a @emph{function}.  This lesson is about learning to write functions.}
    @item{Let's create a function that draws green triangles.  First, we need a name for our function:
          let's call it "green-tri".  Our goal is to tell green-tri what size triangle we want, and to 
          have green-tri draw that triangle for us. [INSERT VIDEO of GT skit]}
    @item{Next, we need expressions that draw green triangles at different sizes.  We already have those
          from the beginning of this lesson.  Take our three expressions, and draw boxes around the parts
          that are different across them.  For example: [INSERT PICTURE]
          }
    @item{We now have most of the pieces needed to write a function: we have a name for the function and
          an expression with boxes showing what the function always does.  
          @code[#:multi-line #t]{(define (green-tri BOX)
                                (triangle BOX "solid" "green"))}}
    @item{This isn't valid code yet---we are missing a @emph{name} for the box.  If we look back to our
          boxed expressions, the box is always around the length of a side.  Let's name our box "side-len".
          To finish the function, we replace the box with its name in both places:
          @code[#:multi-line #t]{(define (green-tri side-len)
                                (triangle side-len "solid" "green"))}}
    @item{TODO: GET THROUGH CONTRACT}
    @item{TODO: GET THROUGH EXAMPLES}
         
          
    @item{Open your workbooks to @worksheet-link[#:page 8 #:name "Fast-Functions"], where it says "fast functions."}
    @item{On this page, there is space to write four simple functions. @pedagogy{We're going to do the first one together, and then we'll have a competition for the rest.}}
    @item{Let's start with the contract. What are the three parts of a contract?}
    @pedagogy{@item{Hey volunteer, what did I say your name was? "gt!" And what information did you need from me to do your job? just a number - the size!. And what did you produce, once I'd given you that number? An Image.}}
    @tag[selftaught]{@item{@think-about[#:question @list{When you used the @code{gt} command, what information did you need and what did you produce?}
                                                   #:answer "You needed the size of the triangle (a number) and produced the image."]}}
    @item{Fill in the first contract on the page -- it's the one with the shaded, gray bar.}
    @item{Now we have some space to write examples. Let's think about the examples we started from at the beginning of this lesson ...}
    @item{When I wanted him to make a solid green triangle of size fifty, what did I tell him? "gt fifty!". 
          So in the first part of the EXAMPLE, we can write @code{(gt 50)}. So my example so far is
          @code[#:multi-line ""]{; gt : Number -> Image
                                 (EXAMPLE (gt 50) __________________________)}}
    @item{Then what did he draw for me? A solid green triangle of size fifty! How would we write the code to draw that same shape? 
          
          @code[#:multi-line #t]{; gt : Number -> Image
                              (EXAMPLE (gt 50) (triangle 50 "solid" "green"))}}
    @pedagogy{@item{Can someone write another example for me?}}
    @item{Now, on your own, fill out two examples for @code{gt} on your Fast Functions worksheet.}
    @item{If only we had a function like @code{gt}! Well, let's build one!}
    @item{Right now, I'm telling the computer how to deal with a shortcut for @code{(gt 17)} - but what if I wanted the shortcut to work for ALL sizes, not just size 17?}
    @item{That's the final step: replace the stuff that changes between examples with a variable. So let's look at these two lines, and circle everything that changes. What did we circle? Just the numbers 10 and 17! What do those numbers mean? Is it the number of circles we're drawing? No! It's the SIZE. So let's make a little note to ourselves, to remind us that those numbers mean the size of the circle. }
    @item{Now we can write the code -- instead of an EXAMPLE we'll use @code{define}. 
          After that, we're just going to copy everything from our examples except the stuff that we circled. 
          What do you think we'll write instead? We'll use the name we wrote down: size. 
          @pedagogy{Go character-by-character with the students, asking them if both examples have 
                    an open paren, the name "gt", etc...} 
          @tag[selftaught]{@embedded-wescheme[#:id "Fast Functions"                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                              #:definitions-text "; gt : Number -> Image
                                             (EXAMPLE (gt 50) (triangle 50 \"solid\" \"green\"))
                                             (EXAMPLE (gt 95) (triangle 95 \"solid\" \"green\"))
                                             (define (gt size) (triangle size \"solid\" \"green\"))"]}
          @pedagogy{@code[#:multi-line #t]{; gt : Number -> Image
                                          (EXAMPLE (gt 50) (triangle 50 "solid" "green"))
                                          (EXAMPLE (gt 95) (triangle 95 "solid" "green"))
                                          (define (gt size) (triangle size "solid" "green"))}}                                                                             
                                                                                              }]}

