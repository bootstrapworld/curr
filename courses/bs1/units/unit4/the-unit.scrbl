#lang curr/lib
@title{Unit 4: The Design Recipe}

@declare-tags[group pedagogy selftaught]

Unit Overview

Students are introduced to the Design Recipe and apply it to simple problems.

@agenda[
@item{15 min Introduction}
@item{25 min Design Recipe Intro}
@item{20 min Design Recipe Practice}
@item{20 min Even More Practice}
@item{10 min Closing}
]

@objectives[@item{Students will become familiar with the steps of the Design Recipe.}
            @item{Students will practice Racket syntax and the Circles of Evaluation.}]
@product-outcomes[@item{Students@tag[group]{,in pairs,} will write functions to solve simple problems by using the Design Recipe}]

See @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") for state standards.

Length: 90 minutes

@tag[pedagogy]{
@materials[@item{Student workbook folders @tag[group]{- in pairs! - with names on covers}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
              @item{Display Class posters, Language Table, Design Recipe}
              @item{"Rocket" [@(hyperlink "drracketfile" "DrRacket file") + @(hyperlink "teachpack" "teachpack")|@(hyperlink "wescheme" "WeScheme")] preloaded on students' machines}
              @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" "+ - * / sq sqrt expt")
                 (list "String" "string-append string-length")
                 (list "Image" "rectangle circle triangle ellipse radial-star scale rotate put-image"))

@(include-lesson (lib "curr/lessons/Intro-until-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Introducing-the-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Practicing-the-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Even-More-Practice-for-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Closing-Design-Recipe/lesson/lesson.scrbl"))

@copyright[]

                                

                   
                                 
                              
               
                           
   