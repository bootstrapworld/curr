#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]

@title{Unit 5: Game Animation}


@overview{

@unit-descr{Students define functions that map position n to position n+1, allowing them to move their dangers, targets, and projectiles.}

@objectives[@item{Apply algebra and geometry to solve a real world problem.}
            @item{Generalize their understanding of functions to create animation}]

@product-outcomes[
            @item{Students identify and fix bugs in Racket expressions}
            @item{Students write simple, linear functions}
            @item{Students write update-target and update-danger}]

@state-standards 

@length-of-lesson[90]

@pedagogy{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders - in pairs! - with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, basic skills, course calendar)}
           @item{Language Table (see below)}]}

@pedagogy{
@preparation[@item{Write agenda on board}
             @item{Student games open on their computers}
             @item{OPTIONAL: Bug Hunting [Bugs.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "WeScheme")] preloaded on students' machines, in front}
             @item{Class posters}
             @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))
}

@lesson[#:title "Introduction" #:duration "25 min"]{
                               @;Here, students should open their files.
@itemlist/splicing[@item{When tackling the bug-hunting activity, be aware that the file contains several bugs! Running the file will always return an error until each bug is fixed. }
                    @item{This is by design, to encourage both reading the error message and using it to debug.}
                    ]}

@(include-lesson (lib "curr/lessons/Danger-Movement/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Target-Movement/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Fun-With-Movement/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Projectile-Movement/lesson/lesson.scrbl"))
                                



@lesson[#:title "Closing" #:duration "15 min"]{
@itemlist/splicing[@item{Congratulations - you've got the beginnings of a working game!}
           @item{What's still missing? @itemlist[@item{The Player doesn't move}
                                                 @item{When the Target and Danger move offscreen, they never come back}
                                                 @item{Nothing happens when the Player collides with the Danger or Target}]}
           @item{We're going to fix these over the next few lessons, and also work on the artwork and story for our games, so stay tuned!}
           @pedagogy{@item{Who can tell us one thing we learned today?}}                     
           @pedagogy{@item{Write down a few things you learned today}}
           @pedagogy{@item{Who saw someone else in the class do something great?}}
           @pedagogy{@item{Cleanup, dismissal.}}]}


@copyright[]
