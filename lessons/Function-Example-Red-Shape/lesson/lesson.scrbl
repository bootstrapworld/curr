#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "red-shape" 
     #:duration "10 min"
     #:overview "Students define a piecewise function"
     #:learning-objectives @itemlist[@item{Students learn the concept of piecewise functions}
                                     @item{Students learn about conditionals (how to write piecewise functions in code)}
                                    ]
     #:evidence-statements @itemlist[@item{Students will understand that functions can perform different computations based on characteristics of their inputs}
                                     @item{Students will begin to see how Examples indicate the need for piecewise functions}
                                     @item{Students will understand that @code{cond} statements capture pairs of questions and answers when coding a piecewise function}
                                    ]
     #:product-outcomes @itemlist[@item{Students complete @code{red-shape}, which produces different shapes based on the input string}]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "F-IF.7-9" "F-LE.5")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{Conditionals allow functions to have very different behavior, based on their input. A function that produces red circles of various sizes doesn't need conditionals (since the code will always draw a circle), but a function that produces @italic{different shapes entirely} would need to evaluate the appropriate expression for a given shape.}
             @teacher{You may want to show students the code for simpler functions (@code{red-circle}, @code{green-triangle}, etc), pointing out that those functions evaluate the same expression no matter what - they merely fill in the variable with a given value.}}
      @point{@student{@activity{Turn to @worksheet-link[#:page 36 #:name "red-shape"], and use the Design Recipe to complete the word problem for @code{red-shape}.}}
              @teacher{Pause and debrief after each section, if necessary.}}

     @point{@student{Conditions can be used in many places inside a videogame:
                     @itemlist[@item{Have the player drawn differently when they get a power boost}                                                         @item{Open doors when the player is holding a key}
                                @item{Move differently depending on keyboard input}]}
             @teacher{}
           }]
   }
                                                                                                                    
                                                                                                                    
