#lang curr/lib
@declare-tags[pedagogy group selftaught bootstrap]


@title{Unit 3
       
The Definitions Window}

@overview{

Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.

@agenda[
        @item{15min Introduction}
        @item{10min Defining Variables}
        @item{30min Screenshots}
        @item{10min Fast Functions}
        @item{10min Blue Circle}
        @item{10min Double}
        @item{5min Closing}
        ]

Learning Objectives

Students will have the following
@objectives[@item{Learn about examples, variables and functions}
       @item{Practice Racket syntax and the Circle of Evaluation}]

Product Outcome
@product-outcomes[@item{Students@tag[group]{, in pairs,} will write functions to solve simple problems}
       @item{Students@tag[group]{, in pairs,} will write examples (unit tests) to check those functions}]

State Standards

See @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") provided as a part of the Bootstrap curriculum

Length: 90 minutes

@tag[pedagogy]{
Materials and Equipment
@materials[@item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbook") folders @tag[group]{-in pairs!-} with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class poster (List of rules, language table, course calendar)}
           @item{Language Table (see below)}]


Preparations
@preparation[@item{Create student game files. [See @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html" "Instructions")]}
           @item{On student machines: Student Game Files (generated from blank templates [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Game.rkt" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Teachpack/Teachpacks.zip" "teachpacks") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=cross-drawn-serve-annex-crumb" "WeScheme")])}
           @item{Write agenda on board, and post along with class posters and the Language Table}
           @item{Seating arrangements: ideally clusters of desks/tables}
           @item{Optional: demo machine with projector to show the interations and definitions windows}]}



@(language-table
                 (list "Number" "+ - * / sq sqrt expt")
                 (list "String" "string-append string-length")
                 (list "Image" "radial-star scale rotate put-image"))
}

@lesson[#:title "Introduction" #:duration "15 minutes"]{
        @itemlist[
        @item{You guys have done a fantastic job in the last two classes}
        @item{You've learned how to convert expressions into Circles of Evaluation, and how to convert those circles into Racket code}
        @item{You've learned how to think about functions in terms of nested circles, and how to think of them as a mapping between the Domain and Range}
        @item{You've extended that knowledge into three data types: Numbers, Strings, and Images}
        @item{Let's see how much you remember!}
        @item{Review material from previous class}
        @item{You have learned a LOT, and before today's class is over... you will have written your first line of code for YOUR videogames}
        ]}

@(include-lesson (lib "curr/lessons/Defining-Variables/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Game-Screenshots/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Fast-Functions/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Blue-Circle/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Double/lesson/lesson.scrbl"))
        
@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist[
        @item{@tag[pedagogy]{Who can tell us one thing we learned today? }}
        @item{@tag[selftaught]{@review{What did you learn from this lesson?}}}
        @item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
        @item{Well done! You guys have officially started your games! The next step is to make your characters animate, which we'll be doing in our next class. See you then!}
        @item{@tag[pedagogy]{Cleanup, dismissal.}}
        ]}
       

@copyright[]