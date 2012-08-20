#lang curr/lib
@declare-tags[group pedagogy selftaught]

@title{Functions}

@overview{

Students learn where functions come from and how to define them.

@objectives[@item{Students will practice Racket syntax and the Circles of Evaluation.}]

@product-outcomes[@item{Students@tag[group]{,in pairs,} will write functions to solve simple problems by using the Design Recipe}]

@(language-table (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))
}

@(include-lesson (lib "curr/lessons/Fast-Functions/lesson/lesson-long.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Blue-Circle/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Double/lesson/lesson.scrbl"))

@copyright[]

                                

                   
                                 
                              
               
                           
   