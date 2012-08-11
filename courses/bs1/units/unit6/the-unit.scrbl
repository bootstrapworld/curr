#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]

@title{Unit 6: Booleans: Teaching Functions to Compare}

@overview{
@unit-descr{Students discover Boolean types, and use them to create programs that test values, and then model scenarios using these programs.}

@objectives[@item{@tag[group]{Learn to work as a team}}
          @item{Understand how to declare Boolean values}
          @item{Learn functions to generate and manipulate Booleans and Strings}
          ]

@product-outcomes[
          @item{Students will write functions that use conditionals and Booleans }
          @item{Students write functions to perform tests on various domains}
          ]
                
@state-standards
                
@length-of-lesson[90]

@tag[pedagogy]{                
@materials[@item{Student  @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook") folders - in pairs! - with names on covers.}
           @item{Computers w/DrRacket or WeScheme}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, language table, course calendar) }
           ]

@preparation[
          @item{Write agenda on board}
          @item{Student games open on their computers}
          @item{"Cage" [@(resource-link #:path "source-files/Cage.rkt" #:label "DrRacket file") + @(resource-link #:path "teachers-guide/teachpacks/cage-teachpack.rkt" #:label "teachpack") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=equal-guild-ebony-apply-snore" "WeScheme")] preloaded on students' machines, in front}
          @item{Class posters}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}

Language Table
@(language-table (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{radial-star scale rotate put-image}))
}
@lesson[#:title "Introduction" #:duration "15 minutes"]{
       @itemlist/splicing[
       @item{Review the previous material}]}

@(include-lesson (lib "curr/lessons/Intro-to-Booleans/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/onscreen1/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Boolean-Function/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/onscreen2/lesson/lesson.scrbl"))

@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist/splicing[
        @pedagogy{@item{Who can tell us one thing we learned today? }}
        @tag[selftaught]{@item{@review{What did you learn from this lesson?}}}
        @pedagogy{@item{Who saw someone else in the class do something great?}}
        @pedagogy{@item{Cleanup, dismissal.}}
        ]}

@copyright[]