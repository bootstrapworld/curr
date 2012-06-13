#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 7: Conditional Branching}

@agenda[
@item{10min Introduction}
@item{30min Pizza Toppings}
@item{25min Player Movement}
@item{5min  Closing}
]

@overview{

Students use geometry and knowledge of basic image functions to design characters for their games, this time using conditional branching to accomodate different key-events.

@objectives[@item{Reason about the relative positioning of objects using mathematics}
            @item{Discover Partial Functions, and how to implement them using @code{Cond}}
            @item{Use Booleans with @code{cond} to change control flow}
            @item{Adapt Design Recipe to add @code{cond}}]

@product-outcomes[
            @item{Students will write functions that use conditionals and Booleans}
            @item{Students will write @code{update-player}}]


@state-standards

Length: 90 min
@tag[pedagogy]{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "workbook")}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, basic skills, course calendar)}
           @item{Language Table (see below)}]}

@tag[pedagogy]{
@preparation[@item{Write agenda on board}
             @item{All student computers should have their game templates pre-loaded, with their image files linked ins}
             @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or}))
}

@lesson[#:title "Introduction" #:duration "10 min"]{
@itemlist/splicing[
     @item{Review the previous material}]}

@(include-lesson (lib "curr/lessons/Cond-Example-With-Pizza-Toppings/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Player-Movement/lesson/lesson.scrbl"))

@lesson[#:title "Closing" #:duration "5 min"]{
@itemlist/splicing[
     @item{Congratulations - you've got the beginnings of a working game!}
     @item{What's still missing? Nothing happens when the player collides with the object or target!}
     @item{We're going to fix these over the next few lessons, and also work on the artwork and story for our games, so stay tuned!}
     @tag[pedagogy]{@item{Who can tell us one thing we learned today? Call on 2-3 volunteers.}}
     @tag[selftaught]{@item{@review{Write a few things you've learned today.}}}
     @tag[pedagogy]{@item{Who saw someone else in the class do something great? Call on 2-3 volunteers.}}
     @tag[pedagogy]{@item{Cleanup, dismissal.}}]}

@copyright[]