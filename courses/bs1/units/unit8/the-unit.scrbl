#lang curr/lib
@title{Unit 8: Collision Detection}

@declare-tags[group pedagogy selftaught]

Unit Overview

Students discuss and then prove the Pythagorean theorem, and use this theorem - in conjunction with Booleans - in their games to detect when a collision has occurred.

@agenda[
@item{20 min Introduction} @; LINKY?
@item{10 min 1D Distance}
@item{30 min The Distance Formula}
@item{20 min Collide?}
@item{10 min Closing}
]

@objectives[@item{Understand the challenge of the distance formula in two dimensions.}
            @item{Be familiar with the Pythagorean theorem.}
            @item{Draw connections between geometry and real-world problems.}]
@product-outcomes[@item{Students write @code{distance} and @code{collide?}}]

See @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") for state standards.

Length: 90 minutes
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


@(include-lesson "../../../../lessons/Collision-Introduction/lesson/lesson.scrbl")
@(include-lesson "../../../../lessons/1D-Distance/lesson/lesson.scrbl")
@(include-lesson "../../../../lessons/Distance-Formula/lesson/lesson.scrbl")
@(include-lesson "../../../../lessons/Collide/lesson/lesson.scrbl")







@lesson[#:title "Closing Time:" #:duration "10 minutes"]{

@itemlist[

@item{@tag[pedagogy]{@tag[group]{Have everyone walk around and play each other's games}}}
@item{CONGRATULATIONS! You have finished the code for your videogame@tag[group]{s}!!!}
@item{@tag[pedagogy]{Who can tell us one thing we learned today?}@tag[selftaught]{@review{What did you learn today?}}}
@item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
@item{@tag[pedagogy]{Cleanup, dismissal}}
]
}