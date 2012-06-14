#lang curr/lib
@title{Unit 8: Collision Detection}

@declare-tags[group pedagogy selftaught]

@overview{

Students discuss and then prove the Pythagorean theorem, and use this theorem - in conjunction with Booleans - in their games to detect when a collision has occurred.

@agenda[]

@objectives[@item{Understand the challenge of the distance formula in two dimensions.}
            @item{Be familiar with the Pythagorean theorem.}
            @item{Draw connections between geometry and real-world problems.}]
@product-outcomes[@item{Students write @code{distance} and @code{collide?}}]

@state-standards

@length-of-lesson[90]

@tag[selftaught]{@materials[@item{Cutouts of Pythagorean Theorem packets [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.5.png" "1"), @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.6.png" "2")] - 1 per cluster}
                        @item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbooks")}]}  
   
@tag[pedagogy]{
@materials[@item{Cutouts of Pythagorean Theorem packets [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.5.png" "1"), @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.6.png" "2")] - 1 per cluster}
            @item{Computers w/DrRacket or WeScheme}
           @item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbooks")}
            @item{Pens/pencils for the students, fresh whiteboard markers for the teachers}
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            ]
@preparation[@item{Write agenda on board}
              @item{All student computers should have their game templates pre-loaded, with their image files linked in}
              @item{Class posters}
              @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" "+ - * / sq sqrt expt")
                 (list "String" "string-append string-length")
                 (list "Image" "rectangle circle triangle ellipse radial-star scale rotate put-image")
                 (list "Boolean" "= > < string=? and or"))
}

@(include-lesson (lib "curr/lessons/Collision-Introduction/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/1D-Distance/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Distance-Formula/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Collision-Detection/lesson/lesson.scrbl"))







@lesson[#:title "Closing Time:" #:duration "10 minutes"]{

@itemlist/splicing[

@tag[group]{@item{It's time for everyone to walk around and play each other's games!}}
@item{CONGRATULATIONS! You have finished the code for your videogame@tag[group]{s}!!!}
@tag[pedagogy]{@item{Who can tell us one thing we learned today?}}
@tag[selftaught]{@item{@review{What did you learn today?}}}
@tag[pedagogy]{@item{Who saw someone else in the class do something great?}}
@tag[pedagogy]{@item{Cleanup, dismissal}}]}

@copyright[]