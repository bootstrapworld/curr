#lang curr/lib
@declare-tags[pedagogy group selftaught]
@lesson[#:title "Practicing the Design Recipe"
        #:duration "20 minutes"]{@itemlist/splicing[
                  @tag[pedagogy]{@item{Note: if space allows, this section can also be done on the board with multiple, simultaneous challenges. See the video links for an example.}}
                   @tag[pedagogy]{@item{@skit{I need another volunteer, to act out a new function called @code{red-square}
                                                                                                         
     When I say "red-square fifty", I want you to make a solid, red square where each side is 50 pixels long. "red-square fifty!" "red-square ninety!" etc..}}}
                   @item{Turn to @worksheet-link[#:page 12 #:name "Design-Recipe-Red-Square"] in your workbooks. You'll have 2 minutes to read the problem statement and to underline the function's name, domain and range. GO!}
                   @tag[pedagogy]{@item{Count down the last 10 seconds, and then collect answers from teams.}}
                   @item{Now you'll have another minute to fill in the contract for your function. GO!}
                   @tag[pedagogy]{@item{Count down the last 10 seconds then collect answers from teams. Keep score!}}
                   @item{@bold{Step 1: Contract}}
                   @item{@think-about[#:question "What's the name of the function we're trying to write? What kind of Domain did we say it expects? Range? Fill these in under as the three parts of your contract."
                                      #:answer "Name: red-square; Domain: Number; Range: Image"]}
                                                                                                 
                   @tag[pedagogy]{@item{Count down the last 10 seconds, and then collect answers from teams.}}
                   @item{Now you have to give two example. Again, you'll have one minute. GO!}
                   @item{@bold{Step 2: Give Examples}}
                   @item{When given the number 20, what should red-square draw? A solid, red square of size 20.
                         @itemlist[@item{@think-about[#:question "How do I write the Racket code for that?"
                                                      #:answer @code{(rectangle 20 20 "solid" "red")}]}
                                  @item{Fill in the boxes with the Racket code for the other examples, including the generalized pattern.            }
                                  @item{Now circle everything that changes between the examples, and label it.}]}
                   @tag[pedagogy]{@item{Count down the last 10 seconds then collect answers from teams. Don't forget to keep score!}}
                   @item{Now for the final step! @tag[(pedagogy group)]{This one is worth two points: one for filling in everything on the "define" line and one for filling in the body of the function.} You'll need to fill in the name of your function and a name for the variable. Then you'll need to figure out what goes on the next line for the function's body. You will have two minutes for this. GO!}
                   @item{@bold{Step 3: Code} @itemlist[
                   @item{As always, we start with the function header: "define", then the name of the function and the names of the inputs from our Domain. @think-about[#:question "What is the name of our function here? What is the name of our input?" #:answer "Name: red-square; Input: size (number is the type)"]}
                   @item{Now you need to fill in the function body. Which pattern can we use for this? The general one.}
                   ]}
                   @item{@tag[pedagogy]{Have kids turn their monitors on, and type in the code. Do their tests work?}
                          @tag[selftaught]{Now you should try typing in the code and running some tests to see if it works.} @embedded-wescheme[#:id "example4"
                                                          #:interactions-text ""]}]}