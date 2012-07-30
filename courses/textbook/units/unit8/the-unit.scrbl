#lang curr/lib
@title{Unit 8: Collision Detection}

@declare-tags[group pedagogy selftaught]

@overview{

Students discuss and then prove the Pythagorean theorem, and use this theorem - in conjunction with Booleans - in their games to detect when a collision has occurred.


@objectives[@item{Understand the challenge of the distance formula in two dimensions.}
            @item{Be familiar with the Pythagorean theorem.}
            @item{Draw connections between geometry and real-world problems.}]
@product-outcomes[@item{Students write @code{distance} and @code{collide?}}]

@tag[selftaught]{@materials[@item{Cutouts of Pythagorean Theorem packets [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.5.png" "1"), @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/7.6.png" "2")] - 1 per cluster}]}

   @(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or}))
}

@(include-lesson (lib "curr/lessons/Collision-Introduction/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/1D-Distance/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Distance-Formula/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Collision-Detection/lesson/lesson.scrbl"))

@copyright[]
