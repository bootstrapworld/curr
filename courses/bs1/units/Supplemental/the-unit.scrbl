#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Supplemental Lessons}



@overview[#:gen-agenda? #f]{
          
          Students will deepen their understanding of various concepts, either through continued practice and review, encountering more complicated material (structs), or through an educational field trip.


          @pedagogy{
                         @materials[@item{Computers w/ DrRacket or WeScheme}
                                     @item{Student folders}
                                     @item{Design Recipe Signs}
          ]}



          @(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or})
                 (list "Position" @code{make-position}))
}

@(include-lesson (lib "curr/lessons/Manipulating-Images/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Making-Flags/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Red-Shape/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Structs/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Simple-Ideas/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Getting-things-done/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Programming-Olympics/lesson/lesson.scrbl"))
@copyright[]