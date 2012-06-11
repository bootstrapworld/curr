#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 5: Game Animation}

@agenda[
@item{25min Introduction}
@item{20min Danger Movement}
@item{20min Target Movement}
@item{15min Opt1:Fun With Movement}
@item{15min Opt2:Projectile Movement}
@item{5min  Closing}
]

@bold{Unit Overview}

Students define functions that map position n to position n+1, allowing them to move their dangers, targets, and projectiles

@objectives[@item{Apply algebra and geometry to solve a real world problem.}
            @item{Generalize their understanding of functions to create animation}]

@product-outcomes[
            @item{Students identify and fix bugs in Racket expressions}
            @item{Students write simple, linear functions}
            @item{Students write update-target and update-danger}]

State Standards
See @(hyperlink "asdf" "Bootstrap Standards Matrix") provided as part of the Bootstrap curriculum. 

Length: 90 min
@tag[pedagogy]{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "workbook") folders - in pairs! - with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, basic skills, course calendar)}
           @item{Language Table (see below)}]}

@tag[pedagogy]{
@preparation[@item{Write agenda on board}
             @item{Student games open on their computers}
             @item{OPTIONAL: Bug Hunting [@(hyperlink "racketfile" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/Teachpack/cage-teachpack.rkt" "teachpack")  @(hyperlink "wescheme file" "WeScheme")] preloaded on students' machines, in front}
             @item{Class posters}
             @item{Seating arrangements: ideally clusters of desks/tables}]}

@(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangel ellipse radial-star scale rotate put-image}))

@(include-lesson "../../../../lessons/Chapter-5-Intro/lesson/lesson.scrbl")

@(include-lesson "../../../../lessons/Danger-Movement/lesson/lesson.scrbl")

@(include-lesson "../../../../lessons/Target-Movement/lesson/lesson.scrbl")

@(include-lesson "../../../../lessons/Fun-With-Movement/lesson/lesson.scrbl")

@(include-lesson "../../../../lessons/Projectile-Movement/lesson/lesson.scrbl")
                                



@lesson[#:title "Closing" #:duration "15 min"]{
@itemlist[@item{Congratulations - you've got the beginnings of a working game!}
           @item{What's still missing? @itemlist[@item{The Player doesn't move}
                                                 @item{When the Target and Danger move offscreen, they never come back}
                                                 @item{Nothing happens when the Player collides with the Danger or Target}]}
           @item{We're going to fix these over the next few lessons, and also work on the artwork and story for our games, so stay tuned!}
           @item{@tag[pedagogy]{Who can tell us one thing we learned today?}}                     
           @item{@tag[selftaught]{Write down a few things you learned today}}
           @item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
           @item{@tag[pedagogy]{Cleanup, dismissal.}}]}


@copyright[]
