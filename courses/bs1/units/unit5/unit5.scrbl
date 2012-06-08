#lang scribble/base
@(require "lib/all.rkt")

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

@lesson[#:title "Introduction" #:duration "25 min"]{
@itemlist[@item{@tag[pedagogy]{If you have students tackle the bug-hunting activity, be aware that the file contains several bugs! Until students have fixed all of them, they will always get an error message when they attempt to run the file. This is by design, to encourage students to both read the error and to look at it's location.}}
          @item{@tag[selftaught]{If you tackle the bug-hunting activity, be aware that the file contains several bugs! Until you have fixed all of them, you will always get an error message when you attempt to run the file. This is by design, to encourage you to both read the error and to look at it's location.}}]}

@lesson[#:title "Danger Movement" #:duration "20 min"]{
@itemlist[@item{In our last class, you learned how to use the Design Recipe to write functions. Now it's time to write functions to make your game characters move!}
          @item{Who wants to start making their game move?}
          @item{@tag[pedagogy]{Draw a 640x480 "game screen" on the board, and have students help you label the axes and corners.}}
          @item{@tag[selftaught]{
                @think-about[#:question "Draw a 640x480 'game screen' on the board, and label the axes and corners."
                             #:answer @image["PUT IMAGE HERE"]]}}
          @item{Here I've drawn a really boring game: my Danger is the letter "D", my Target is the letter "T", and my Player is just the letter "P". I've also labeled all the coordinates for where they are on the screen. PUT IMAGE}
          @item{@think-about[#:question "What is the Danger's x-coordinate? Its y-coordinate?"
                             #:answer "Danger's x-coordinate is 500 and its y-coordinate is 100"]}
          @item{@think-about[#:question "Suppose my Danger is moving to the left. What is changing, the x- or the y-coordinate?"
                             #:answer "The x-coordinate is changing since you are moving horizontally."]}
          @item{@tag[selftaught]{Draw an arrow to the NEW location, and label the coordinates.}}
          @item{PUT IMAGE WITH NEW COORDINATES}
          @item{@think-about[#:question "Suppose it moved to the right, by 50 pixels. What are the new coordinates?"
                             #:answer "The new coordinates are (550, 100)"]}
          @item{I want my Danger to always move left by 50 pixels, each time the screen is redrawn. So it goes from (550, 100) to (500, 100).}
          @item{@think-about[#:question "What if it starts at (100, 100)? Where will go next? What if it's at (400, 600)? What if it's off the screen, at (650, 50)?"
                             #:answer "(50, 100), (350, 600), (600,50)"]}
          @item{You will need to write a function that takes an x-coordinate and produces the next x-coordinate, to make your danger move.}
          @item{INSERT TABLE HERE}
          @item{Turn to @(hyperlink "page15.com" "Page 15") for update-danger. @tag[pedagogy]{Have a student read the problem statement out loud.} @tag[selftaught]{Read the problem statement.}}
          @item{@think-about[#:question "Can you find the function name in this problem statement? Underline it."
                             #:answer "The function name is 'update-danger'"]}
          @item{@think-about[#:question "Can you find the inputs and outputs? Underline them, too."
                             #:answer "The input is the x-coordinate of DangerCat and the output is the x-coordinate of DangerCat minus 50."]}
          @item{@tag[group]{As a team:} Complete the Design Recipe for update-danger. @tag[pedagogy]{Raise your hand when you're done with each step, so I can check your contracts and examples before you move on to code. Don't forget to circle the things that change between your examples!} @tag[selftaught]{Write the code for update-danger}}]}

@lesson[#:title "Target Movement" #:duration "20 min"]{
@itemlist[@item{We also need to animate our target. Guess what? We need to write another function!}
          @item{How fast should your target move?}
          @item{Which direction?}
          @item{Next on @(hyperlink "page16" "Page 16") is update-target. Using a Design Recipe Worksheet again, complete the design recipe. @tag[pedagogy]{Once again, make sure you come up to the board and write down your example. I will give you the "OK" to start typing.}}]}

@lesson[#:title "Optional: Fun With Movement" #:duration "20 min"]{
@itemlist[@item{Can you make your danger move slower? faster?}
           @item{Can you make your target move the other way? (just to try)}
           @item{It'll break your examples, but there's a function called (random n) that gives you a random number less than n. Can you make your target move with random speed?}]}

@lesson[#:title "Optional: Projectile Movement" #:duration "15 min"]{
@itemlist[@item{@tag[pedagogy]{NOTE FOR INSTRUCTORS: Many teachers find it useful to add projectiles only at the end of the class, as a "treat" for kids. It also tends to help break the "shooting-style" bias that a lot of students have.}}
           @item{@tag[selftaught]{NOTE: You might find it useful to add projectiles only at the end of the class, as it is more of a "treat". It also tends to help break the "shooting-style".}}
           @item{@tag[pedagogy]{If you want to introduce projectiles this early, then go ahead and change mystery and update-mystery near the end of the game to projectile and update-projectile, and move them up to near the danger and target. The space bar triggers projectiles if the updater moves them. Some teachers will want to save this for later in the class, and have students rename the functions themselves.}}
           @item{@tag[selftaught]{If you want to start projectiles this early, then go ahead and change mystery and update-mystery near the end of the game to projectile and update-projectile, and move them up to near the danger and target. The space bar triggers projectiles if the updater moves them. You might want to save this for later in the class. Feel free to rename the functions yourself!}}
           @item{Now we need to animate our projectile. If our dangers are flying in from the left, which way should our projectile fire? To the right!}
           @item{Use another Design Recipe worksheet to animate your projectile! Once again, make sure you write down your examples. @tag[pedagogy]{I will give you the "OK" to start typing.}}
           @item{Scroll to the bottom of the screen, and look for the semicolon before the word "start". Delete that semicolon.}
           @item{If your animation functions are correct, you should see your game start running, and your danger and target will move!}]}

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
