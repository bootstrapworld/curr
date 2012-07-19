#lang curr/lib
@declare-tags[group pedagogy selftaught]

@title{Unit 4: The Design Recipe}

@overview{

Students are introduced to the Design Recipe and apply it to simple problems.

@objectives[@item{Students will become familiar with the steps of the Design Recipe.}
            @item{Students will practice Racket syntax and the Circles of Evaluation.}]
@product-outcomes[@item{Students@tag[group]{,in pairs,} will write functions to solve simple problems by using the Design Recipe}]

@state-standards

@length-of-lesson[90]

@pedagogy{
@materials[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders @tag[group]{- in pairs! - with names on covers}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
              @item{Display Class posters, Language Table, Design Recipe}
              @item{"Rocket" [ @resource-link[#:path "source-files/Rocket.rkt.pdf" #:label "Dr. Racket"] + @resource-link[#:path "teachers-guide/teachpacks/function-teachpack.rkt" #:label "TeachPack"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=drawl-youth-fifty-voter-shake" "WeScheme")] preloaded on students' machines}
              @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))
}

@lesson[#:title "Introduction"
        #:duration "15 minutes"]{@itemlist[@item{Review material from previous lessons: Coordinate Planes, Circles of Evaluation, Contracts, Strings, Images, and Functions. @tag[selftaught]{If you are having trouble remembering any of these, look back to previous lessons to refresh your memory.}}]}

@(include-lesson (lib "curr/lessons/Introducing-the-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Practicing-the-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Even-More-Practice-for-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Closing-Design-Recipe/lesson/lesson.scrbl"))

@copyright[]

                                

                   
                                 
                              
               
                           
   