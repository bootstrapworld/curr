#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 7: Conditional Branching}



@overview{

@unit-descr{Students use geometry and knowledge of basic image functions to design characters for their games, this time using conditional branching to accommodate different key-events.}

@objectives[@item{Reason about the relative positioning of objects using mathematics}
            @item{Discover Partial Functions, and how to implement them using @code{Cond}}
            @item{Use Booleans with @code{cond} to change control flow}
            @item{Adapt Design Recipe to add @code{cond}}]

@product-outcomes[
            @item{Students will write functions that use conditionals and Booleans}
            @item{Students will write @code{update-player}}]


@state-standards

@length-of-lesson[90]
@tag[pedagogy]{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
          @item{"Luigi's Pizza" [LuigisPizza.rkt from @(resource-link #:path "source-files.zip" #:label "source-files.zip") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=WKfq9xjiPY" "WeScheme")] preloaded on students' machines, in front}
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

@lesson[#:title "Introduction" #:duration "20 min"]{
@itemlist/splicing[
     @item{Have students complete the @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" "Warmup activity") for Luigi's Pizza, and review their answers.}
     @item{So what's special about this code, that makes it different from every other function you've defined?}
     @item{Up to now, every function you've defined has done the @italic{same thing} to all of it's inputs. @code{green-triangle} always made green triangles, no matter what the size was. @code{safe-left?} always compared the input coordinate to -50, @code{update-danger} always added or subtracted the same amount, and so on.}
     @item{@code{cost} is special, because different toppings can result in totally different values being returned. That's because @code{cost} makes use of a special language feature called @italic{conditionals}, which is abbreviated in the code as @code{cond}.}
     @item{Each conditional has at least one @italic{clause}. In Luigi's function, there is a clause for cheese, another for pepperoni, and so on. Every clause has a Boolean question and a result. If the question evaluates to @code{true}, the expression gets evaluated and returned. If the question is @code{false}, the computer will skip to the next clause.}
     @item{What is the question in the first clause? The second?}
     @item{Finally, a conditional can also have an @code{else} clause, which gets evaluated if all the questions are @code{false}. In this function, what gets returned if all the questions are false?}
     @item{Functions that use conditions are called @italic{piecewise functions}, because each condition defines a separate piece of the function.}
     @item{Why do people want piecewise functions? Well, think about the player in your game...you'd like the player to move one way if you hit the "up" key, and another way if you hit the "down" key. Those are two different expressions! Without @code{cond}, you could only write a function that always moves the player up, or always moves it down - but not both.}]}

@(include-lesson (lib "curr/lessons/Cond-Example-With-Pizza-Toppings/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Player-Movement/lesson/lesson.scrbl"))

@lesson[#:title "Closing" #:duration "5 min"]{
@itemlist/splicing[
     @item{Congratulations - you've got the beginnings of a working game!}
     @item{What's still missing? Nothing happens when the player collides with the object or target!}
     @item{We're going to fix these over the next few lessons, and also work on the artwork and story for our games, so stay tuned!}
     @pedagogy{@item{Who can tell us one thing we learned today? Call on 2-3 volunteers.}}
     @tag[selftaught]{@item{@review{Write a few things you've learned today.}}}
     @pedagogy{@item{Who saw someone else in the class do something great? Call on 2-3 volunteers.}}
     @pedagogy{@item{Cleanup, dismissal.}}]}

@copyright[]