#lang planet dyoo/scribble-bootstrap:5
@declare-tags[group pedagogy selftaught bootstrap]

@title{Unit 6:
       
       Booleans: Teaching Functions to Compare}

@section{Overview} 
Students discover Boolean types, and use them to create programs that test values, and then model scenarios using these programs.


@objectives[@item{Learn to work as a team}
          @item{Understand how to declare Boolean values}
          @item{Learn functions to generate and manipulate Booleans and Strings}
          ]

@product-outcomes[
          @item{Students will write functions that use conditionals and Booleans }
          @item{Students write functions to perform tests on various domains}
          ]
                
State Standards
See @(hyperlink "asdf" "Bootstrap Standards Matrix") provided as part of the Bootstrap curriculum. 
                
Length: 90 min

@tag[pedagogy]{                
@materials[@item{Student  @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "workbook") folders - in pairs! - with names on covers.}
           @item{Computers w/DrRacket or WeScheme}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, language table, course calendar) }
           ]

@preparation[
          @item{Write agenda on board}
          @item{Student games open on their computers}
          @item{"Cage" [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Cage.rkt" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/Teachpack/cage-teachpack.rkt" "teachpack") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=equal-guild-ebony-apply-snore" "WeScheme")] preloaded on students' machines, in front}
          @item{Class posters}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}

Language Table


@lesson[#:title "Introduction" #:duration "15 minutes"]{
       @exercise{Review the previous material}}

@lesson[#:title "Booleans" #:duration "5 minutes"]{
   @(hyperlink "http://www.youtube.com/watch?v=X7gAXxpBhUo" "Intro to Booleans")  @(hyperlink "http://www.youtube.com/watch?v=kcBfXGziAQA" "Boolean Contracts")
   @itemlist[
       @item{We're going to play a quick game, called "True or False."}
       @item{When I say a lie, I want you to @tag[(pedagogy group)]{yell out } @tag[selftaught]{type in } "true" and when it is not a lie, you  @tag[(pedagogy group)]{yell out } @tag[selftaught]{type in } "True"}
       @item{@tag[pedagogy]{Give some simple boolean statements such as "I am holding a red pen", "I am a boy" etc.}}
       @item{@tag[selftaught]{
                              You are a boy. @fill-in-the-blank[#:id "T/F"]
                              You are using a computer. @fill-in-the-blank[#:id "T/F"]
                              You have red hair. @fill-in-the-blank[#:id "T/F"]
                              }}
      @item{So far, our language can only add, subtract, multiply and divide numbers. It can't compare them or decide whether something is true or false! We'll be adding the power of comparison to our language today.}
      @item{What would DrRacket say is the value of the following pieces of code? @code{(+ 1 4), (/ 4 2), (- 0 9), (< 3 4)}}
      @item{With the exception of the last one, all the above are Numbers. We can solve any of those expressions using our language. Why isn't the last one a number? What is it?}
      @item{The expression @code{(< 3 4)} is a test. It is either true or false that 3 is less than 4. @code{<} is another function, just like + and string-length. There are several more tests we can do}
      @item{@exercise{Try using them to compare numbers. What values do you get back? (Use Circle of Evaluation)
             @code{(> 0 5)
(= 1 9)
(<= 2 2)
(string=? "dog" "cat")}}}
      @item{@tag[pedagogy]{Have students explain what each of these tests does.}}
      @item{As you have found, there are only two values that can be returned from a test: true or false. These values are a very special category, called "Booleans". Let there be Booleans}
      @item{@tag[pedagogy]{Model one of the contracts for a Boolean function, then have them guess the rest.}}
      @item{@tag[selftaught]{Try filling out all of the contracts for these in your notes.}}
      @item{Booleans are really important in videogames - you can use them to test if someone's health is down to zero, or if they've bumped into a wall. Without booleans, there are no tests, and the game can't ever react to changes.}
      @item{Let's try making a function that uses booleans.}
        ]}
@lesson[#:title "onscreen? 1.0" #:duration "25 minutes"]{
 @itemlist[
           @item{@tag[pedagogy]{Draw a rectangle on the board, to represent the screen. Then turn students' attention to the computers, and have them analyze the last function in the code, called onscreen?
onscreen?.}}
            @item{@tag[selftaught]{Draw a rectangle in your notes, to represent a computer screen. Now, you will analyze the last function in the code, called onscreen?.}}
            @item{@think-about[#:question "What are the Domain and Range of onscreen? What does the function do? What will happen when it's given a sample input?" 
                               #:answer "It always returns true, no matter what!"]}
            @item{When Run is clicked, a window with a butterfly in it will pop up. You can use the arrow keys to move the butterfly around.}
            @item{This butterfly is Sam - he's a happy student like you! He likes to fly around outside, enjoy the fresh air, etc.}
            @item{Just like our rectangle here, his yard is 640 pixels wide and 480 pixels tall. If the bottom-left corner is (0, 0), what are the coordinates of the other corners?}
            @item{It's safe to play there, but it's not as big as he'd like. So sometimes, Sam flies out of the box. He's free! Free as a bird! (well, as a butterfly!) Look at his smile! He's so happy to be free! Why shouldn't he be?}
            @item{Well...there's some bad news.}
            @item{Sam doesn't realize that there's a monster outside his yard, waiting to eat him! As long as ANY part of Sam is still in the yard, he is safe...but the moment he disappears completely he might get eaten!}
            @item{It's up to you to protect him!}
            @item{We want to Sam inside the box. He can fly left or right and there is nothing to stop him from moving off the screen... yet!}
            @item{@think-about[#:question "How far can Sam go to the left before NONE of him is onscreen?"
                               #:answer "-50. So he is onscreen as long as x > -50!"]}
            @item{@tag[pedagogy]{Draw another, outer rectangle on the board to represent the 50 pixel buffer zone. Raise your hand if you can tell is why we have to go out to -50 put Sam off the screen, when the screen only goes from 0 to 640.}}
            @item{@tag[selftaught]{Draw another, outer rectangle on the board to represent the 50 pixel buffer zone. Why do we have to go out to -50 put Sam off the screen, when the screen only goes from 0 to 640.}}
            @item{@tag[pedagogy]{Take some ideas from the class, then explain if necessary.}   When the butterfly is drawn at some coordinate, it is centered at that coordinate. So if it's drawn at 0, half of the butterfly is actually off the screen. We add the extra 50 pixels on all sides, because a piece of him is still visible as long as he is within 100 pixels of the screen's edge. }
            @item{Turn to Page 17. Take thirty seconds to fill out what we've discovered.}
            @item{Turn to Page 18 and read the problem statement for the protect-left function.}
            @item{@tag[pedagogy]{Who would like to act out protect-left? Take a volunteer.}}
            @item{@exercise{According to the problem statement, what's your name? What's your Domain? Your Range? Given Sam's x-coordinate, and tell me if any part of him is still on the screen. Let's try it out. "protect-left forty-five!" "protect-left three!" "protect-left negative one hundred and one!" How did you know Sam wasn't protected at -101? because the number was less than -100!.}}
            @item{Complete the design recipe for protect-left. @tag[pedagogy]{Raise your hand after you complete each step.}}
            @item{@tag[(pedagogy group)]{When a team has completed the Design Recipe for protect-left, they must type in the examples and function body onto the computer.}}
            @item{So now we have a function that will protect Sam on the left side of the screen. But at the moment, onscreen?
 doesn't know how to use that function. We need to change the body of onscreen? so that it can talk to protect-left:
 @code{(define (onscreen? x)}
 @code{ (protect-left x))}}
            @item{Click "Run", and try to move Sam off the left edge of the screen. Congrats! You've protected Sam on one side!}
            @item{Unfortunately, Sam can still escape on the right hand side. We need a protect-right! @tag[pedagogy]{(act out with another volunteer, if necessary).}}
            @item{Turn to Page 19, and write another function called protect-right. @tag[pedagogy]{Call me over when you reach a stopping point!}}
            @item{Good job! Now we can protect Sam on the left side, or we can protect Sam on the right side. However, we don't have a way to protect him from going off from both sides at the same time! We need to learn something new to save him in both directions. }
            ]}
@lesson[#:title "Boolean Function" #:duration "15 minutes"]{
   @itemlist[
      @item{You've already learned many functions that allow you to create Booleans. < and >, for example, will all return a boolean when applied to the appropriate input.}
      @item{There are also many functions that work with Booleans, and let you do really complex tests.}
      @item{@tag[pedagogy]{Pick up two, easily-distinguishable objects (a pen and an eraser, for example).} @tag[selftaught]{Pretend you are holding a pen and an eraser}  Tell me if the following statements are true or false
             I am holding a pen @fill-in-the-blank[#:id "T/F"]
             I am holding an eraser @fill-in-the-blank[#:id "T/F"]
             I am holding a pen AND an eraser @fill-in-the-blank[#:id "T/F"]
             @tag[pedagogy]{Drop the pen}@tag[selftaught]{Now the pen is dropped}
             I am holding a pen AND an eraser @fill-in-the-blank[#:id "T/F"]
             I am holding a pen OR an eraser @fill-in-the-blank[#:id "T/F"]
             @tag[pedagogy]{Drop the eraser}@tag[selftaught]{Now the eraser is dropped}
             I am holding a pen OR an eraser @fill-in-the-blank[#:id "T/F"]}
      @item{Did you notice how we joined the Boolean statements? What words did we use? (AND, OR).}
      @item{@think-about[#:question "What are the contracts for both AND and OR?"
                         #:hint "; and: Boolean Boolean -> Boolean
; Returns true if BOTH inputs are true."
                         #:answer "; or: Boolean Boolean -> Boolean
; Returns true if EITHER of the inputs are true."]}
      @item{Turn to Page 20 and read the directions}
      @item{Take five minutes @tag[group]{with your team,} to draw the circle for each of the statements. Think about what Boolean functions you'll need for each one! When you're done, convert those circles into Racket code.}]}

@lesson[#:title "onscreen? 2.0" #:duration "25 minutes"]{
     @itemlist[
         @item{@exercise{Now it's time to put it all together. Right now, you know how to protect Sam on the left side of the screen, and how to protect him on the right side. But how do we protect him on BOTH sides at the same time?}}
         @item{Turn to Page 21 and read the problem statement.}
         @item{@tag[pedagogy]{I need a volunteer to be the onscreen? function. (take a volunteer)} @tag[selftaught]{Pretend you are the onscreen? function"}}
         @item{What is your name? What is your domain? What is your Range?}
         @item{Sam is onscreen only when he is protected on the left AND the right. How can we use one of those functions we just learned to do this? @tag[pedagogy]{'d like my volunteers protect-left and protect-right to stand up.}}
         @item{@tag[pedagogy]{When I yell out "onscreen? fifty", onscreen? is going to call protect-left and protect-right with that number. Depending on what they give back, onscreen? will tell me true or false}}
         @item{@tag[pedagogy]{Try this out, making sure that students are actually talking to one another, calling the functions properly by name. When you call out "onscreen eighty!", the onscreen? volunteer should call out "protect-left eighty" and "protect-right eighty", and listen their answers before giving back an answer of their own. Run through a bunch of examples here, to make sure it's clear.}}
         @item{It's time to write the contract and examples!  Don't forget what we just went over! @tag[pedagogy]{Raise your gands so I can check your work at each step}}
         @item{@tag[pedagogy]{Guide students as necessary, and eventually have them write the code on the computer.}}
         @item{@tag[selftaught]{Write the contract here -> @fill-in-the-blank[#:id "contract"]}}
         @item{Guess what? This function can be dropped into your game file, and used to have your characters come back once they've gone off the screen!}
         @item{Copy and paste the three functions into your game files.}]}

@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist[
        @item{@tag[pedagogy]{Who can tell us one thing we learned today? }}
        @item{@tag[selftaught]{@review{What did you learn from this lesson?}}}
        @item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
        @item{@tag[pedagogy]{Cleanup, dismissal.}}
        ]}