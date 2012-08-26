#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 10: Bridging to Algebra}

@overview{
@unit-descr{
Students translate from Racket into Algebra, and back. They then apply the Design Recipe to solve common word 
problems from Algebra texts.}

@objectives[@item{Take what they've learned in the programming domain, and apply it to the algebraic domain.}
            ]

@product-outcomes[
            @item{Students rewrite their games in Algebraic notation and solve algebra problems.}]

@state-standards

@length-of-lesson[90]
@tag[pedagogy]{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "workbooks")}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, basic skills, course calendar)}
           @item{Language Table (see below)}
           @item{Open the Algebra Translation [] file on students' computers, but turn the monitors off.}
           ]}

@preparation[@item{Write agenda on board}
             @item{"Algebra Translation" [@resource-link[#:path "source-files/Algebra.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=s2s0tkTgeF" "WeScheme")] preloaded on students' machines, with monitors off.}]
            

@(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or}))
}
@(include-lesson (lib "curr/lessons/Intro-Algebra/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Defining-Values-Algebra/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Defining-Functions-Algebra/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Design-Recipe-Algebra/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Harder-Problems-Algebra/lesson/lesson.scrbl"))
@copyright[]