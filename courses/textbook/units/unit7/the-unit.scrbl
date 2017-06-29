#lang curr/lib

@title{Unit 7: Booleans and Conditionals}

@overview{
Students discover Boolean types, and use them to create programs that test values, and then model scenarios using these programs.

@objectives[
          @item{Understand how to declare Boolean values}
          @item{Learn functions to generate and manipulate Booleans and Strings}
          @item{Reason about the relative positioning of objects using mathematics}
          @item{Discover Partial Functions, and how to implement them using @code{Cond}}
          @item{Use Booleans with @code{cond} to change control flow}
          @item{Adapt Design Recipe to add @code{cond}}          
          ]

@product-outcomes[
          @item{Students will write functions that use conditionals and Booleans }
          @item{Students write functions to perform tests on various domains}
          @item{Students will write @code{update-player}}
          ]
                
@preparation[
          @item{"Cage" [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Cage.rkt" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/Teachpack/cage-teachpack.rkt" "teachpack") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=equal-guild-ebony-apply-snore" "WeScheme")] preloaded on students' machines, in front}
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

@(include-lesson (lib "curr/lessons/Intro-to-Booleans/lesson/lesson-long.scrbl"))

@(include-lesson (lib "curr/lessons/onscreen1/lesson/lesson-long.scrbl"))

@(include-lesson (lib "curr/lessons/Boolean-Function/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/onscreen2/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Cond-Example-With-Pizza-Toppings/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Player-Movement/lesson/lesson.scrbl"))

@copyright[]
