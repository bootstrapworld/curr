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
             @item{OPTIONAL: Bug Hunting [Bugs.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=lQUC6RJArG" "WeScheme")] preloaded on students' machines, in front}
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

@lesson[#:title "Danger Movement" #:duration "20 min" #:prerequisites "Coordinate-Planes, Introducing-the-Design-Recipe"]{
@;The students should probably have their game code files open. 
@itemlist/splicing[@item{In our last class, you learned how to use the Design Recipe to solve word problems. In this lesson, all of the word problems will be about making your videogame characters move!}
          @pedagogy{@item{Draw a 640x480 "game screen" on the board, and have students help you label the axes and corners.}}
          @tag[selftaught]{@item{@think-about[#:question "Draw a 640x480 'game screen' on the board, and label the axes and corners."]}}
          @item{Here I've drawn a really boring game: my Danger is the letter "D", my Target is the letter "T", and my Player is just the letter "P". I've also labeled all the coordinates for where they are on the screen. @graph-image}
          @item{@think-about[#:question "What is the Danger's x-coordinate? Its y-coordinate?"
                             #:answer "Danger's x-coordinate is 500 and its y-coordinate is 100"]}
          @item{@think-about[#:question "Suppose my Danger is moving to the left. What is changing, the x- or the y-coordinate?"
                             #:answer "The x-coordinate is changing since you are moving horizontally."]}
          @tag[selftaught]{@item{Draw an arrow to the NEW location, and label the coordinates.}}
          @item{@think-about[#:question "Suppose it moved to the right, by 50 pixels. What are the new coordinates?"
                             #:answer "The new coordinates are (550, 100)"]}
          @item{I want my Danger to always move @italic{left by 50 pixels}, each time the screen is redrawn. So it goes from (550, 100) to (500, 100).}
          @item{@think-about[#:question "What if it starts at (100, 100)? Where will go next? What if it's at (400, 600)? What if it's off the screen, at (650, 50)?"
                             #:answer "(50, 100), (350, 600), (600,50)"]}
          @item{What we have here is a @bold{word problem}, which describes how the danger should move! Given any x-coordinate, @code{update-danger} should produce the next x-coordinate, which is fifty pixels to the left.}
          @item{Turn to @worksheet-link[#:page 15 #:name "Design-Recipe-Update-Danger"] for @code{update-danger}. @pedagogy{Have a student read the Word Problem out loud.} @tag[selftaught]{Read the Word Problem.}}
          @item{@think-about[#:question "Can you find the function name in this word problem? Underline it."
                             #:answer @list{"The function name is " @code{update-danger}}]}
          @item{@think-about[#:question "Can you find the Domain and Range? Underline them, too."
                             #:answer "The input is the x-coordinate of Danger and the output is the x-coordinate of Danger minus 50. Both of these are Numbers, which means the Domain and Range are both @code{Number}."]}
            @pedagogy{@item{Who would like to act out @code{update-danger}? Take a volunteer.}
                      @item{@exercise{According to the word problem, what's your name? What's your Domain? Your Range? Given an x-coordinate for the danger, you'll need to tell me what work gets done in order to calculate the new x-coordinate. For example, if I say "update-danger 75", you'll need to say "minus 75 50", because that's the work you'll do to move the danger to 25. Let's try it out: "update-danger 200!" }}
                      @item{Have the class do some practice call-and-response with the volunteer.}}
          @item{@tag[group]{As a team:} Complete the Design Recipe for @code{update-danger}. @pedagogy{Raise your hand when you're done with each step, so I can check your contracts and examples before you move on to code. Don't forget to circle the things that change between your examples!} @tag[selftaught]{Write the code for @code{update-danger}}}]}

@lesson[#:title "Target Movement" #:duration "20 min"]{
@itemlist/splicing[@item{We also need to animate our target. Guess what? It's just another @bold{Word Problem}!}
          @item{How fast should your target move?}
          @item{Which direction?}
          @item{Next on @worksheet-link[#:page 16 #:name "Design-Recipe-Update-Target"] is @code{update-target}. Using a Design Recipe Worksheet again, solve this word problem. @pedagogy{Once again, make sure you come up to the board and write down your example. I will give you the "OK" to start typing.}}]}


@lesson[#:title "Optional: Fun With Movement" #:duration "20 min" #:prerequisites "Target-Movement"]{
@itemlist/splicing[@item{Can you make your danger move slower? faster?}
           @item{Can you make your target move the other way? (just to try)}
           @item{It'll break your examples, but there's a function called @code{(random n)} that gives you a random number less than n. Can you make your target move with random speed?}]}

@lesson[#:title "Projectile Movement (OPTIONAL)" #:duration "15 min" #:prerequisites "Target-Movement"]{
@itemlist/splicing[@pedagogy{@item{NOTE FOR INSTRUCTORS: Many teachers find it useful to add projectiles only at the end of the class, as a "treat" for kids. It also tends to help break the "shooting-style" bias that a lot of students have.}}
           @pedagogy{@item{If you want to introduce projectiles this early, then go ahead and change @code{mystery} and @code{update-mystery} near the end of the game to @code{projectile} and @code{update-projectile}, and move them up to near the danger and target. The space bar causes the projectile to "fire".}}
           @tag[selftaught]{@item{If you want to start projectiles this early, then go ahead and change @code{mystery} and @code{update-mystery} near the end of the game to @code{projectile} and @code{update-projectile}, and move them up to near the danger and target. The space bar triggers projectiles if the updater moves them. You might want to save this for later in the class. Feel free to rename the functions yourself!}}
           @item{Now we need to animate our projectile. If our dangers are flying in from the left, which way should our projectile fire? To the right!}
           @item{Use another Design Recipe worksheet to animate your projectile! Once again, make sure you write down your examples. @pedagogy{I will give you the "OK" to start typing.}}
           @item{Scroll to the bottom of the screen, and look for the semicolon before the word "start". Delete that semicolon.}
           @item{If your animation functions are correct, you should see your game start running, and your danger and target will move!}]}
                                

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
