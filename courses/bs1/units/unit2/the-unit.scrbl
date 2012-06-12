#lang curr/lib

@declare-tags[group pedagogy selftaught]
@title{Unit 2: Contracts, Strings and Images}
@overview{



Students are introduced to a set-mapping representation for functions, in which the function object exists as a means of translating points
from a Domain into a Range. Coupled with their understanding of Circles of Evaluation, students generalize their understanding of functions to
include other datatypes, including Strings and Images. 

@agenda[
@item{25 min Introduction} @; LINKY?
@item{15 min Contracts}
@item{10 min Strings}
@item{35 min Creating Images}
@item{5 min Closing}
]

@objectives[@item{Learn Racket syntax and grammar, using the Circle of Evaluation}
        @item{Learn how to define values to be used later, as variables}
        @item{Learn syntax for simple strings and image-composition expressions}]
@product-outcomes[
        @item{Students learn to make and manipulate the basic elements of their games--numbers, strings, and images}]
See @(hyperlink "http://insertlinkhere.com" "Bootstrap Standards Matrix") for State Standards


Length: 90 minutes
@tag[pedagogy]{
@materials[@item{Student workbook folders @tag[group]{- in pairs! - with names on folders}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            
            @;How to make an entire item tagged?
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
             @item{Display class posters and Language Table}
             @item{Seating arrangements: ideally with clusters of desks/tables}
             @item{Optional: demo machine with projector to show the interactions and definitions windows}]}

@(language-table (list "Number" "+ - * / sq sqrt expt"))
}

@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist[@item{Welcome back! Do you remember what we did in the last class?}
           @item{At the end of class, you learned something extremely important: the Circles of Evaluation, and how to write simple programs in Racket.}
           @item{Suppose I have the math expression "2+3." How would I draw a circle of evaluation for this? How would I convert this into code?}
           @;add image
           @item{@think-about[#:question "How about \"2+3 divided by 1-2\"?"
                             #:answer "MAKE A PICTURE!!!!"]}
           @item{Let's do a review challenge:
                 @itemlist[@item{Turn to @(hyperlink "http://page6.com" "Page 6") in your workbooks, where it says "Circles Competition." On each row there is a mathematical expression in the first column,
                                 with room to draw the Circle of Evaluation and the Racket Code on the second and third columns.}
                           @item{Each row will be a round for this activity, so for Round 1 we'll just be looking at the first row. For this first row, we've even helped you out a little.}
                           @item{@tag[group]{You will have one minute to do the following in groups:} Draw the Circle
                                  of Evaluation, and then convert it to Racket code. @tag[group]{Everyone must have the answer
                                                                                                         written down for your group to win points. GO!}}
                           @item{@tag[pedagogy]{During the minute, walk around and see how groups are doing. Comment on good teamwork when you see it. Don't tutor much; let kids fail: they'll get it in review before the next round.
                                                      When time is up (really 1 minute: the idea is to go quickly), give them a countdown: "30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention.}}
                           @item{@tag[pedagogy]{Review and discuss. Assign points.}}
                           @item{Repeat for each additional round}
                           ]}
           @item{@tag[pedagogy]{Have kids complete the competition - give as little help as possible at this point. After the time is up, have students volunteer their answers. Review as necessary.}}
           ]}

@(include-lesson (lib "curr/lessons/Contracts/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Strings/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Creating-Images/lesson/lesson.scrbl"))
                                


@lesson[#:title "Closing"
        #:duration "5 minutes"]{
    @tag[pedagogy]{@itemlist[@item{Who can tell us one thing we learned today?}
                             @item{Who saw someone else in the class do something great?}
                             @item{Cleanup, dismissal.}]}
    @tag[selftaught]{@itemlist[@item{Think about what you learned today.}
                               @item{Remember contracts and how to make them.}
                               @item{Think of strings and what differentiates a string from a different type.}
                               @item{Think about images and what goes into creating an image.}
                               @item{Have an awesome day!}]}}


@copyright[]