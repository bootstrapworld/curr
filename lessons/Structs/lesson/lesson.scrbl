#lang curr/lib

@declare-tags[management]

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
     @point{@student{Right now, each character in your game moves along only one axis. @code{update-danger} takes in the danger's x-coordinate and produces the next one, but it has no ability to read or update the y-coordinate. As a result, your danger can only move left or right.
                     @code[#:multi-line #t]{; update-danger : Number -> Number
                                            ; takes in object's x-coordinate and returns the next one}
                     @activity{Suppose we wanted to move diagonally. What would have to change about the Domain? The Range? The Purpose Statement?}}
             @teacher{Use a diagram on the board to demonstrate that @code{update-danger} will need to take in both the x- and the y-coordinate, and that it will have to produce both as well.}}
      @point{@student{While you've seen a function take in multiple values, you have never seen a function @italic{produce} more than one thing at a time.
                       @bannerline{All functions must produce one value.}}
              @teacher{}
              }
      @point{@student{However, Racket actually allows us to create new kinds of data that can contain more than one thing. These are called @vocab{data structures}, or "structs" for short. One kind of struct that is useful to us is called a position, which Racket abbreviates @code{posn}.
                     @activity{Open a new program.
                               @itemlist[@item{Enter a Number value in the Interactions window and hit Enter. What did you get back?}
                                          @item{Enter a String value in the Interactions window and hit Enter. What did you get back?}
                                          @item{Enter a Boolean value in the Interactions window and hit Enter. What did you get back?}]
                               As you can see, all values evaluate to @italic{themselves}. To create a @code{posn}, enter the following code in the Interactions window: 
                               @code[#:multi-line #t]{(make-posn 10 40)}
                               What do you get back when you hit Enter? Which number is the x-coordinate? The y-coordinate?
                               }}
              @teacher{Have students make @code{Posn}s for other coordinates, like the corners of the screen or the center.}
              }
      @point{@student{Thinking back to an @code{update-danger} that moves diagonally, we now know that the @vocab{Range} must be a @code{posn}.
                      @activity{Start with a @(resource-link #:path "DesignRecipeWorksheet.pdf" #:label "blank Design Recipe"), and rewrite @code{update-danger} to produce a Posn instead of a Number. Instead of producing @code{(- x 50)}, your function will have to produce a Posn in which the x and y have changed in some way. Here's one example, which moves the danger left by 50 pixels and down by 10:
                               @code[#:multi-line #t]{(EXAMPLE (update-danger 200 300) (make-posn (- 200 50) (- 300 10))}
                               @itemlist[@item{Write a second example.}
                                          @item{Circle and label what changes.}
                                          @item{Define the function on your worksheet, then modify the definition in your program so that your danger moves diagonally!}]}}
              @teacher{}
              }
   @point{@student{@activity{Modify @code{update-target} so that it moves diagonally as well.}}
           @teacher{}
           }
   @point{@student{@code{update-player} will also need to be changed, so that it takes in the x- and y-coordinate @italic{and} the key that was pressed. The @vocab{Range}, predictably, will be a Posn.
                    @activity{@itemlist[@item{Change your EXAMPLEs for "up" and "down" so that they take in both coordinates and produce Posns.}
                                         @item{Add two more EXAMPLEs, this time for "left" and "right".}
                                         @item{Modify each clause of your @code{cond} statement, so that each one produces a Posn. Don't forget to change your @code{else} clause, too!}]}}
           @teacher{}
           }]
   }