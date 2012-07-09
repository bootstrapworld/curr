#lang curr/lib
@declare-tags[pedagogy group selftaught bootstrap]

@title{Creating Game Screenshots}

@overview{

Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.

@objectives[@item{Learn about examples, variables and functions}
       @item{Practice Racket syntax and the Circle of Evaluation}]

@product-outcomes[@item{Students@tag[group]{, in pairs,} will write functions to solve simple problems}
       @item{Students@tag[group]{, in pairs,} will write examples (unit tests) to check those functions}]
               
@(language-table
                 (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{radial-star scale rotate put-image}))
}

@(include-lesson (lib "curr/lessons/Defining-Variables/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Game-Screenshots/lesson/lesson.scrbl"))

@copyright[]