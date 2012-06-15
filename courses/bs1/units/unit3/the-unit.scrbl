#lang curr/lib
@declare-tags[pedagogy group selftaught bootstrap]

@title{Unit 3: The Definitions Window}

@overview{

Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.

@objectives[@item{Learn about examples, variables and functions}
       @item{Practice Racket syntax and the Circle of Evaluation}]


@product-outcomes[@item{Students@tag[group]{, in pairs,} will write functions to solve simple problems}
       @item{Students@tag[group]{, in pairs,} will write examples (unit tests) to check those functions}]

@state-standards

@length-of-lesson[90]

@tag[pedagogy]{
@materials[@item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbook") folders @tag[group]{-in pairs!-} with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class poster (List of rules, language table, course calendar)}
           @item{Language Table (see below)}]

@preparation[@item{Create student game files. [See @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html" "Instructions")]}
           @item{On student machines: Student Game Files (generated from blank templates [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Game.rkt" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Teachpack/Teachpacks.zip" "teachpacks") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=cross-drawn-serve-annex-crumb" "WeScheme")])}
           @item{Write agenda on board, and post along with class posters and the Language Table}
           @item{Seating arrangements: ideally clusters of desks/tables}
           @item{Optional: demo machine with projector to show the interations and definitions windows}]}



@(language-table
                 (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{radial-star scale rotate put-image}))
}

@lesson[#:title "Introduction" #:duration "15 minutes"]{
        @itemlist/splicing[
        @item{You @tag[group]{guys }have done a fantastic job in the last two classes!}
        @item{You've learned how to convert expressions into Circles of Evaluation, and how to convert those circles into Racket code.}
        @item{You've learned how to think about functions in terms of nested circles, and how to think of them as a relation between the Domain and Range.}
        @item{You've extended that knowledge into three data types: Numbers, Strings, and Images.}
        @tag[pedagogy]{@item{Let's see how much you remember!}}
        @tag[pedagogy]{@item{Review material from the previous class.}}
        @item{You have learned a LOT, and before today's class is over... you will have written your first line of code for YOUR videogame.}
        ]}

@(include-lesson (lib "curr/lessons/Defining-Variables/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Game-Screenshots/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Fast-Functions/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Blue-Circle/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Double/lesson/lesson.scrbl"))
        
@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist/splicing[
        @tag[pedagogy]{@item{Who can tell us one thing we learned today? }}
        @tag[selftaught]{@item{@review{What did you learn from this lesson?}}}
        @tag[pedagogy]{@item{Who saw someone else in the class do something great?}}
        @item{Well done! You guys have officially started your games! The next step is to make your characters animate, which we'll be doing in our next class. See you then!}
        @tag[pedagogy]{@item{Cleanup, dismissal.}}
        ]}
       

@copyright[]