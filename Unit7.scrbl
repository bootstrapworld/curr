#lang scribble/base
@(require "lib/all.rkt")

@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 7: Conditional Branching}

@agenda[
@item{10min Introduction}
@item{30min Pizza Toppings}
@item{25min Player Movement}
@item{5min  Closing}
]

@section{Overview}

Students use geometry and knowledge of basic image functions to design characters for their games, this time using conditional branching to accomodate different key-events.

@objectives[@item{Reason about the relative positioning of objects using mathematics}
            @item{Discover Partial Functions, and how to implement them using @code{Cond}}
            @item{Use Booleans with @code{cond} to change control flow}
            @item{Adapt Design Recipe to add @code{cond}}]

@product-outcomes[
            @item{Students will write functions that use conditionals and Booleans}
            @item{Students will write @code{update-player}}]

State Standards
See @(hyperlink "asdf" "Bootstrap Standards Matrix") provided as part of the Bootstrap curriculum. 

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
                 (list "Image" @code{rectangle circle triangel ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or}))


@lesson[#:title "Introduction" #:duration "10 min"]{
@itemlist[
     @item{Review the previous material}]}

@lesson[#:title "Pizza Toppings" #:duration "30 min"]{
   @(hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "Intro to Cond Part 1")
   @(hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY" "Intro to Cond Part 2")
   @itemlist[
        @item{Turn to the Design Recipe on Page 23 and grab a Design Recipe Worksheet.}
        @item{Suppose we've been hired by Luigi's Pizza to write a function that tells us the cost of different pizza pies. Let's use the design recipe to write this function. @tag[pedagogy]{Have a student read the problem statement.}}
        @item{@tag[pedagogy]{I need a volunteer to be our function. Pick someone, and copy the contract as they answer. What is your name? cost Your Domain? String Your Range? Number. @code{; cost: String -> Number}}
              @tag[selftaught]{@think-about[#:question "What is the name of this function? the domain? the range?"
                                             #:answer @code{; cost: String -> Number}]}}
        @item{@tag[pedagogy]{Can someone from the class tell me how we should call this function? For example, "cost' cheese'!" What will cost produce? Let's try this with other toppings...}
             @tag[selftaught]{@think-about[#:question "How do we call this function and what does it produce?"
                                           #:answer "We call this function through \"cost cheese\" and it produces the price"]}}
        @item{Now it's time to write down some examples. @tag[pedagogy]{Can anyone raise their hands and tell me what I'd write?} @code{(EXAMPLE (cost "cheese") 9.00)}}
        @item{@think-about[#:question "What are some other examples for cost? What changes between them? "
                           #:answer "The topping and the price returned! Make sure you label those."]}
        @item{Do you notice something odd here? This is the first time that we've ever circled something in the second of the examples, which wasn't also circled in the first part. The price that's being produced changes, but the function never takes in the price!}
        @item{That's a hint that something special is going on, but let's see how much father the Design Recipe can take us...}
        @item{@think-about[#:question "Now for the Function Header. What do I write here?"
                           #:answer @code{(define (cost topping)}]}
        @item{The Function Body is next. But now we don't know what to write! We know that our examples behave differently from one another -- sometimes we want to return 9.00, other times it's 10.50, etc. So what do we do? Well, we could fill in all off those results. Let's do that...  @tag[pedagogy]{Make a large, 2-column table on under the Function Header.}
             
              TABLE GOES HERE}
       @item{@think-about[#:question "But how do we know when we want to produce 9.00? 10.50?"
                          #:answer "When the toppings are cheese and pepperoni"]}
       @item{What we want is a way to go down each line, checking to see if the topping is the right one. If it is, we go on to finish the line. If not, we go on to the next one.
             @itemlist[
                  @item{@think-about[#:question "What's Domain of our function?(according to the contract)"
                                     #:answer "String"]}
                   @item{@think-about[#:question "What's the type of \"pepperoni\"?"
                                      #:answer "String"]}
                   @item{@think-about[#:question "What function compares two strings, and gives back a Boolean?"
                                      #:answer @code{string=?}]}
                   @item{@think-about[#:question "What's the Racket code that compares the input topping to the string \"pepperoni\"?"
                                      #:answer @code{(string=? topping "pepperoni")}]}
                   @item{Now we can write that on our first line, as our first topping check. Can you do the rest?}]}
       @item{@tag[pedagogy]{Have students fill out the rest of the table} @tag[selftaught]{Fill out the rest of the table}
              
              TABLE GOES HERE}
       @item{Each of these rows is called a condition. A condition has a test and a result. The computer goes down the code, one condition at a time, and will evaluate the first result for which the condition is true.}
       @item{Racket has a special function that lets us tell the computer to do this: cond. To use cond,you put square brackets around each of the branches, and write "cond" at the top:
             @code{(define (cost topping)
  (cond
    [(string=? topping "pepperoni") 10.50]
    [(string=? topping "cheese")     9.00]
    [(string=? topping "chicken")   11.25]
    [(string=? topping "broccoli")  10.25]
  )
)}}
      @item{@tag[pedagogy]{Remind students that computers are very specific and can't make up new answers; we need to tell it what to do in case the user inputs an item that is not in our list. Let's add else. If it's not on the menu, we might still make that pizza for you, but it'll cost you! @code{[else    10000000]}} @tag[selftaught]{What happens if the topping is not on our list?  Let's add an else statement.  If it's not on our menu, we might still make that pizza for you but it'll cost you!@code{[else    10000000]}}}
      @item{@tag[pedagogy]{Have students try it on the computers, adding new items on their own}@tag[selftaught]{Try it out for yourself and add your own new items}}
      @item{@tag[(pedagogy selftaught)]{If you have additional time, and would like to try another Cond challenge, check out the @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/SupplementalLessons.html#redshape" "supplemental activity.")}}
       
             ]}

@lesson[#:title "Player Movement" #:duration "25 min"]{
@itemlist[
     @item{Great! Now that we know @code{cond} we can write @code{update-player}.}
     @item{@tag[pedagogy]{Draw a screen on the board, and label the coordinates for a player, target and danger. Circle all the data associated with the Player.}
           image["PUT IMAGE HERE"]}
     @item{@think-about[#:question "What is the player's starting x-coordinate?"
                        #:answer "The player's starting x-coordinate is 200"]}
     @item{@think-about[#:question "It's starting y-coordinate?"
                        #:answer "The player's starting y-coordinate is 220"]}
     @item{@think-about[#:question "What about after it moves? What's the new x and y? What has changed? And by how much? What happens when we press the down key? What should the new coordinates be then?"
                        #:answer "After it moves, its x-coordinate is 200 while its y-coordinate is 240. The x-coordinate has not changed, but its y-coordinate has increased by 20. If you press the down key, the player moves down by 20, so its new coordinate would be (200, 220). DOUBLE CHECK THIS ANSEWR!"]}
     @item{@tag[pedagogy]{Get students to tell you what update player should do...}
           @tag[selftaught]{@think-about[#:question "What should update-player do?"
                                         #:answer "update-player should change the position of the player"]}}
     @item{We want a function that will move up the screen when the user presses the up arrow and down when the user presses the down arrow.}
     @item{We've set up the computer to call update-player, passing in the player's y-coordinate and the name of the key pressed. The keypress will either be the string "down" or the string "up" (for now). 
           @think-about[#:question "What kind of data is the y-coordinate? What kind of data is the keypress?"
                        #:answer "The y-coordinate is a number and the keypress is a string"]}
     @item{@tag[pedagogy]{Make a table showing possibilities and results, walking students through it.}
           @tag[selftaught]{image["PUT IMAGE HERE"]}}
     @item{With our pizza example, we had to deal with toppings that weren't on the menu. Now we need to deal with keys that aren't "up" or "down". 
           @think-about[#:question "How do we do that?"
                        #:answer "Do nothing! (Or have an else statement that returns the same position)"]}
     @item{On @(hyperlink "page24.com" "page 24"), you'll find the problem statement for update-player. Grab a Design Recipe Worksheet, fill it out, and then write this function @tag[group]{with your team.}}
     @item{@tag[pedagogy]{Students can also add "cheat codes", by adding Cond branches for other keys. For example, a student might add [(string=? key "c") 240], which causes the player to jump to the center of the screen if the c key is pressed.}
           @tag[selftaught]{You can also add "cheat codes", by adding Cond branches for other keys. For example, you might add [(string=? key "c") 240], which causes the player to jump to the center of the screen if the c key is pressed.}}]}

@lesson[#:title "Closing" #:duration "5 min"]{
@itemlist[
     @item{Congratulations - you've got the beginnings of a working game!}
     @item{What's still missing? Nothing happens when the player collides with the object or target!}
     @item{We're going to fix these over the next few lessons, and also work on the artwork and story for our games, so stay tuned!}
     @item{@tag[pedagogy]{Who can tell us one thing we learned today? Call on 2-3 volunteers.}
           @tag[selftaught]{@review{Write a few things you've learned today.}}}
     @item{@tag[pedagogy]{Who saw someone else in the class do something great? Call on 2-3 volunteers.}}
     @item{@tag[pedagogy]{Cleanup, dismissal.}}]}