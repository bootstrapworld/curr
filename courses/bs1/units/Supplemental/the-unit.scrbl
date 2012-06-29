#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Supplemental Lessons}



@overview{
          
          Students will deepen their understanding of various concepts, either through continued practice and review, encountering more complicated material (structs), or through an educational field trip.


          @tag[pedagogy]{
                         @materials[@item{Computers w/ DrRacket or WeScheme}
                                     @item{Student folders}
                                     @item{Design Recipe Signs}
                                     @item{"Flags" [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Flags.rkt" "DrRacket file")  + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Teachpacks/function-teachpack.rkt" "teachpack") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=clear-chaps-yearn-brink-gruel" "WeScheme")] file preloaded.}
          ]}



          @(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or})
                 (list "Position" @code{make-position}))
}

@(include-lesson (lib "curr/lessons/Manipulating-Images/lesson/lesson.scrbl"))
@;(include-lesson (lib "curr/lessons/Making-Flags/lesson/lesson.scrbl"))
@;fix image path in making flags lesson if you want this to work!
@(include-lesson (lib "curr/lessons/Function-Example-Red-Shape/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Structs/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Simple-Ideas/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Getting-things-done/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Programming-Olympics/lesson/lesson.scrbl"))

