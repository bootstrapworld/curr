#lang scribble/base
@(require "../lib/all.rkt")
@declare-tags[group pedagogy selftaught bootstrap]

@title{Unit 6:
       
       Booleans: Teaching Functions to Compare}

@section{Overview} 
Students discover Boolean types, and use them to create programs that test values, and then model scenarios using these programs.

@agenda[
        @item{15min Introduction}
        @item{5min Booleans}
        @item{25min onscreen? 1.0}
        @item{15min Boolean Functions}
        @item{25min onscreen? 2.0}
        @item{5min Closing}
        ]

@objectives[@item{@tag[group]{Learn to work as a team}}
          @item{Understand how to declare Boolean values}
          @item{Learn functions to generate and manipulate Booleans and Strings}
          ]

@product-outcomes[
          @item{Students will write functions that use conditionals and Booleans }
          @item{Students write functions to perform tests on various domains}
          ]
                
State Standards
See @(hyperlink "asdf" "Bootstrap Standards Matrix") provided as part of the Bootstrap curriculum. 
                
Length: 90 min

@tag[pedagogy]{                
@materials[@item{Student  @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "workbook") folders - in pairs! - with names on covers.}
           @item{Computers w/DrRacket or WeScheme}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, language table, course calendar) }
           ]

@preparation[
          @item{Write agenda on board}
          @item{Student games open on their computers}
          @item{"Cage" [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Cage.rkt" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/Teachpack/cage-teachpack.rkt" "teachpack") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=equal-guild-ebony-apply-snore" "WeScheme")] preloaded on students' machines, in front}
          @item{Class posters}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}

Language Table
@(language-table (list "Number" "+ - * / sq sqrt expt")
                 (list "String" "string-append string-length")
                 (list "Image" "radial-star scale rotate put-image"))

@lesson[#:title "Introduction" #:duration "15 minutes"]{
       @exercise{Review the previous material}}

@(include-lesson "../../../../lessons/Booleans/lesson/lesson.scrbl")



@(include-lesson "../../../../lessons/onscreen1/lesson/lesson.scrbl")


@(include-lesson "../../../../lessons/Boolean-Function/lesson/lesson.scrbl")

@(include-lesson "../../../../lessons/onscreen2/lesson/lesson.scrbl")

@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist[
        @item{@tag[pedagogy]{Who can tell us one thing we learned today? }}
        @item{@tag[selftaught]{@review{What did you learn from this lesson?}}}
        @item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
        @item{@tag[pedagogy]{Cleanup, dismissal.}}
        ]}