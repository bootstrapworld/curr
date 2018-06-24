#lang curr/lib


@lesson/studteach[
     #:title "2D Movement using Structs" 
     #:duration "20 min"
     #:overview "Students are introducted to the @code{Posn} struct, and use it to add 2-dimensional movement to their game"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list )
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "collide?")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{Right now, each character in your game moves along only
     one axis. @code{update-danger} takes in the danger's coordinates and
     produces the next one, but it has no ability to update the y-coordinate.
     As a result, the danger can only move left or right.

                     @code[#:multi-line #t]{update-danger :: Number, Number -> Number
                                            # takes in object's coordinates and returns the next x coordinate}

                     @activity{Suppose we wanted to move diagonally. What would have to change about the Domain? The Range? The Purpose Statement?}}
             @teacher{Use a diagram on the board to demonstrate that @code{update-danger} will need to take in both the x- and the y-coordinate, and that it will have to produce both as well.}}
      @point{@student{While you've seen a function take in multiple values, you have never seen a function @italic{produce} more than one thing at a time.
                       @bannerline{All functions must produce one value.}}
              @teacher{}
              }
      @point{@student{However, Pyret actually allows us to create new kinds of
      data that can contain more than one thing. These are called @vocab{data
      structures}, or "structs" for short. One kind of struct that is useful to
      us is called a position, which Pyret abbreviates @code{posn}.

                     @activity{Open @hyperlink["https://code.pyret.org/editor#share=16MQzrj2WbZQwb1uSpGN3n0svws8eK8R8&v=f9e4ffe" "the posn starter file"] and click "Run"
                               @itemlist[@item{Enter a Number value in the Interactions window and hit Enter. What did you get back?}
                                          @item{Enter a String value in the Interactions window and hit Enter. What did you get back?}
                                          @item{Enter a Boolean value in the Interactions window and hit Enter. What did you get back?}]
                               As you can see, all values evaluate to @italic{themselves}. To create a @code{posn}, enter the following code in the Interactions window: 
                               @code[#:multi-line #t]{posn(10, 40)}
                               What do you get back when you hit Enter? Which number is the x-coordinate? The y-coordinate?
                               }}
              @teacher{Have students make @code{Posn}s for other coordinates, like the corners of the screen or the center.}
              }
      @point{@student{Thinking back to an @code{update-danger} that moves diagonally, we now know that the @vocab{Range} must be a @code{posn}.

                      @activity{Start with a blank design recipe worksheet, and
                      rewrite @code{update-danger} to produce a Posn instead of
                      a Number. Instead of producing @code{(x - 10)}, your
                      function will have to produce a Posn in which the x and y
                      have changed in some way. Here's one example, which moves
                      the danger left by 10 pixels and down by 5

                               @code[#:multi-line #t]{
                               examples:
                                update-danger(200, 300) is posn((200 - 10), (300 - 5)
                               end
                               @itemlist[@item{Write a second example.}
                                          @item{Circle and label what changes.}
                                          @item{Define the function on your worksheet, then modify the definition in your program so that your danger moves diagonally!}]}}
              @teacher{}
              }
   @point{@student{Open the starter file for the game with Posns in [@hyperlink["https://code.pyret.org/editor#share=1P0IoXXTEaDgWueDPNqpgZG7Go2Fnoc7E&v=f9e4ffe" "code.pyret.org"]], and add your definition of @code{update-danger}. Make sure your definition's examples pass, and that you see the target moving diagonally before moving on!}}
   @point{@student{@activity{Modify @code{update-target} so that it moves diagonally as well.}}
           @teacher{}
           }
   @point{@student{@code{update-player} will also need to be changed, so that it produces a Posn.
                    @activity{@itemlist[@item{Change your EXAMPLEs for "up" and "down" so that they take in both coordinates and produce Posns.}
                                         @item{Add two more EXAMPLEs, this time for "left" and "right".}
                                         @item{Modify each clause of your @code{if} statement, so that each one produces a Posn. Don't forget to change your @code{else} clause, too!}]}}
           @teacher{}
           }]
   }
