#lang curr/lib
@declare-tags[pedagogy group selftaught bootstrap]

@title{Unit 3: The Definitions Window}

@overview{

@unit-descr{Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.}

@objectives[@item{Learn about examples, variables and functions}
       @item{Practice Racket syntax and the Circle of Evaluation}]


@product-outcomes[@item{Students will write functions to solve simple problems in which a number is used to create an image, when given a word problem and a worked example.}
       @item{Students will write examples (unit tests) to check those functions}]

@state-standards

@length-of-lesson[90]

@pedagogy{
@materials[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class poster (List of rules, language table, course calendar)}
           @item{Language Table (see below)}]

@preparation[@item{Create student game files. [See the (teachers-only) @resource-link[#:path "teachers/teachers-guide/teachers-guide.html" #:label "Teachers Guide"]]}
           @item{On student machines: Student Game Files (generated from "Game" template [Game.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=Q1X9Y8ZayX" "WeScheme")])}
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
        @item{You've have done a fantastic job in the last two classes!}
        @item{You've learned how to convert expressions into Circles of Evaluation, and how to convert those circles into Racket code.}
        @item{You've learned how to think about functions in terms of nested circles, and how to think of them as a relation between the Domain and Range.}
        @item{You've extended that knowledge into three data types: Numbers, Strings, and Images.}
        @pedagogy{@item{Let's see how much you remember!}}
        @pedagogy{@item{Review material from the previous class.}}
        @item{You have learned a LOT, and before today's class is over... you will have written your first line of code for YOUR videogame.}
        ]}

@(include-lesson (lib "curr/lessons/Defining-Variables/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Game-Screenshots/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Fast-Functions/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Blue-Circle/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Function-Example-Double/lesson/lesson.scrbl"))
        
@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist/splicing[
        @pedagogy{@item{Who can tell us one thing we learned today? }} 
        @tag[selftaught]{@item{@review{What did you learn from this lesson?}}}
	@item{We learned about how to define variables and functions!} 
        @item{@think-about[
		#:question "Say that we wanted to define a shortcut of a solid, purple star of size 10. Would we define a value or make a function?"
		#:answer "It would be an expression, since it's always the same image, of the same size."]}
	@item{@think-about[
		#:question "Say that we wanted to make a shortcut that would take in a size, and draw a purple stars of that size. Would we define a value or make a function?"
		#:answer "It would be a function, since it takes in a size, and returns a purple star based on the size that you gave it."]}
        @pedagogy{@item{Who saw someone else in the class do something great?}}
        @item{Well done! You have officially started your games! The next step is to make your characters animate, which we'll be doing in our next class. See you then!}
        @pedagogy{@item{Cleanup, dismissal.}}
        ]}
       

@copyright[]
