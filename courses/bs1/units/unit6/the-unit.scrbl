#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]

@title{Unit 6: Booleans: Teaching Functions to Compare}

@overview{
@unit-descr{Students discover Boolean types, and use them to create programs that test values, and then model scenarios using these programs.}

@objectives[@item{@tag[group]{Learn to work as a team}}
          @item{Understand how to declare Boolean values}
          @item{Learn functions to generate and manipulate Booleans and Strings}
          ]

@product-outcomes[
          @item{Students will write functions that use conditionals and Booleans }
          @item{Students write functions to perform tests on various domains}
          ]
                
@state-standards
                
@length-of-lesson[90]

@tag[pedagogy]{                
@materials[@item{Student  @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook") folders - in pairs! - with names on covers.}
           @item{Computers w/DrRacket or WeScheme}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, language table, course calendar) }
           ]

@preparation[
          @item{Write agenda on board}
          @item{Student games open on their computers}
          @item{"Cage" [Cage.rkt from @(resource-link #:path "source-files.zip" #:label "source-files.zip") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "WeScheme")] preloaded on students' machines, in front}
          @item{Class posters}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}

Language Table
@(language-table (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{radial-star scale rotate put-image}))
}
@lesson[#:title "Introduction" #:duration "15 minutes"]{
       @itemlist/splicing[
       @item{Review the previous material}]}

@lesson[#:title "Booleans" 
        #:duration "5 minutes"]{
      
   @itemlist/splicing[
       @item{@(video-link (hyperlink "http://www.youtube.com/watch?v=X7gAXxpBhUo" "Video Lesson: Intro to Booleans"))}
       @item{We're going to play a quick game, called "True or False." @selftaught{When I say a lie, I want you to type in "False" and when it is not a lie, you type in "True".} @pedagogy{I'm going to make some statements, and I want you to call out "True" or "False", depending on whether or not I'm lying.}}
       @pedagogy{@item{Give some simple boolean statements such as "I am holding a red pen", "I am a boy" etc.}}
       @selftaught{@item{
                         You are a boy. @fill-in-the-blank[#:id "introbool1"]
                                        You are using a computer. @fill-in-the-blank[#:id "introbool2"]
                                        You have red hair. @fill-in-the-blank[#:id "introbool3"]
                                        }}
      @item{So far, our language can only add, subtract, multiply and divide numbers. It can't compare them or decide whether something is true or false! We'll be adding the power of comparison to our language today.}
      @item{What would DrRacket say is the value of the following pieces of code? 
            @code{(+ 1 4), (/ 4 2), (- 0 9), (< 3 4)}}
      @item{With the exception of the last one, all the above are Numbers. We can solve any of those expressions using our language. Why isn't the last one a number? What is it?}
      @item{The expression @code{(< 3 4)} is a test. It is either true or false that 3 is less than 4. @code{<} is another function, just like + and string-length. Can you guess what other tests are available?}
      @item{@exercise{Try using them to compare numbers. What values do you get back? (Use Circle of Evaluation)
             @code[#:multi-line #t]{(> 0 5)
                                    (= 1 9)
                                    (<= 2 2)
                                    (string=? "dog" "cat")}}
             @selftaught{embedded-wescheme[#:id "bool"
                               #:interactions-text ""]}}
      @pedagogy{@item{Have students explain what each of these tests does.}}
      @item{As you have found, there are only two values that can be returned from a test: true or false. These values are a very special category, called "Booleans". Let there be Booleans!}
      @pedagogy{@item{Model one of the contracts for a Boolean function, then have them guess the rest.}}
      @item{Try filling out all of the contracts for these in your notes. For example: @code{; Number Number -> Boolean}}
      @item{Booleans are really important in videogames - you can use them to test if someone's health is down to zero, or if they've bumped into a wall. Without booleans, there are no tests, and the game can't ever react to changes.}
      @item{Let's try making a function that uses booleans.}]}
                               
                               
@lesson[#:title "onscreen? 1.0" 
        #:duration "25 minutes"
        #:prerequisites "Introducing-the-Design-Recipe Coordinate-Planes Intro-to-Booleans"]{
 @itemlist/splicing[
            @item{@pedagogy{Have students open the @hyperlink["http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "Butterfly File"].} @selftaught{In a new window, open the @hyperlink["http://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "Butterfly File"].}}
            @item{When you click Run, a window with a butterfly in it will pop up. You can use the arrow keys to move the butterfly around.}
            @item{This butterfly is Sam - he's a happy student like you! He likes to fly around outside and enjoy the fresh air.}
            @item{His yard is 640 pixels wide and 480 pixels tall. If the bottom-left corner is (0, 0), what are the coordinates of the other corners?}
            @item{Sam's mom tells him that he should stay where she can see him - that means he can even step a little outside of the yard...as long as a piece of him is visible, his mom is okay.}
            @item{Try moving him so he's a little off the screen, but still safe. How far can he go?}
            @item{Sometimes, however, Sam sneaks out of the box and just keeps going! He's free! Free as a bird! (well, as a butterfly!) Look at his smile! He's so happy to be free! Why shouldn't he be?}
            @item{Well...there's some bad news.}
            @item{Sam doesn't realize that there's a monster outside his yard, waiting to eat him! As long as ANY part of Sam is still in the yard, he is safe...but the moment he disappears completely his mom won't be able to keep an eye on him!}
            @item{It's up to you to keep him safe!}
            @pedagogy{@item{Draw and label a 640x480 rectangle on the board to represent the screen, and have students help you idenfify the coordinates at the corners. Then turn students' attention to the computers, and have them analyze the last function in the code, called @code{onscreen?}.}}
            @selftaught{@item{On a sheet of paper, draw a rectangle to represent your computer screen. Label its width (640) and height (480). If the bottom left-hand corner has the coordinate (0,0), what are the coordinates of the other corners?}}
            @item{This file contains three function definitions. Can you find all three? What are the names of these functions? @pedagogy{(@code{safe-left?}, @code{safe-right?} and @code{onscreen?})}}
            @pedagogy{@item{@skit{Have a volunteer stand up to be @code{safe-left?}. Ask them about their domain and range, and what they do according to the code (they always return true). Have students practice calling the function with sample values, then have another volunteer repeat the process as @code{safe-right?}. Finally, have a third volunteer do the same as @code{onscreen?}. Note that @code{onscreen?} must use @code{safe-left?} when evaluate an input!}}}
            @item{@bitmap{images/buffer.png}The computer only talks to @code{onscreen?}, when deciding whether or not to let Sam keep moving. In turn, @code{onscreen?} will need to use both @code{safe-left?} and @code{safe-right?} to figure out if Sam is safe on both sides.}
            @tag[selftaught]{@item{Draw a rectangle in your notes, to represent a computer screen. Now, you will analyze the last function in the code, called @code{onscreen?}.}}
            @item{@think-about[#:question @list{What are the Domain and Range of @code{onscreen?} What does the function do? What will happen when it's given a sample input?} 
                               #:answer "It calls the function 'safe-left?' on the variable x"]}
            @item{We need to fix this code, to keep Sam safe. He can fly left or right and there is nothing to stop him from moving off the screen... yet!}
            @item{@think-about[#:question "How far can Sam go to the left before he disappears completely?"
                               #:answer "-50."] So he is onscreen as long as @italic{x is greater than -50}!}
            @tag[selftaught pedagogy]{@item{Draw another, outer rectangle on the board to represent the 50 pixel buffer zone. Why do we have to go out to -50 put Sam off the screen, when the screen only goes from 0 to 640?}}
            @item{@pedagogy{Take some ideas from the class, then explain if necessary.}   When the butterfly is drawn at some coordinate, it is centered at that coordinate. So if it's drawn at 0, half of the butterfly is actually off the screen. We add the extra 50 pixels on all sides, because a piece of him is still visible as long as he is within 50 pixels of the screen's edge. }
            @item{Turn to @worksheet-link[#:page 17 #:name "Protecting-Sam"]. Take thirty seconds to fill out what we've discovered.}
            @item{Turn to @worksheet-link[#:page 18 #:name "Design-Recipe-Safe-Left"] and read the word problem for the @code{safe-left} function.}
            @pedagogy{@item{Who would like to act out @code{safe-left}? Take a volunteer.}}
            @pedagogy{@item{@exercise{According to the word problem, what's your name? What's your Domain? Your Range? Given Sam's x-coordinate, you need to tell me if any part of him is still on the screen. Let's try it out. "safe-left forty-five!" "safe-left three!" "safe-left negative sixty-one!" How did you know Sam was not protected at -51? because the number was not greater than -50!.}}}
            @tag[selftaught]{@item{@think-about[#:question "What is safe-left -3?" #:answer "True! The distance from the center of the butterfly to its edge is 50, so there are still 47 pixels of the butterfly on screen."]@think-about[#:question "What is safe-left -47?" #:answer "True! The distance from the center of the butterfly to its edge is 50, so there are still 3 pixels of the butterfly on screen."]@think-about[#:question "What is safe-left -51?" #:answer "False! The distance from the center of the butterfly to its edge is 50, so the butterfly is offscreen by 1 pixel."]}}
            @item{Complete the design recipe for @code{safe-left}. @pedagogy{Raise your hand after you complete each step.}}
            @tag[(pedagogy group)]{@item{When a team has completed the Design Recipe for @code{safe-left}, they must type in the examples and function body onto the computer.}}
            @item{So now we have a function that will tell us whether or not Sam is safe on the left side of the screen.}
            @item{Click "Run", and try to move Sam off the left edge of the screen. Congrats! You've protected Sam on one side!}
            @item{Unfortunately, Sam can still escape on the right hand side. We need a @code{safe-right}! @pedagogy{(act out with another volunteer, if necessary).}}
            @item{Turn to @worksheet-link[#:page 19 #:name "Design-Recipe-Safe-Right"], and write another function called @code{safe-right}. @pedagogy{Call me over when you reach a stopping point!}}
            @item{Notice that even though we've fixed @code{safe-right?}, @code{onscreen?} won't know about it until we change the body of @code{onscreen?} so it calls @code{safe-right?} instead of @code{safe-left?}! Please make this change now, so that Same is safe on the right side instead of the left side.}
            @item{Good job! Now we can keep Sam safe on the left side, or we can keep Sam safe on the right side. However, we don't have a way to keep him safe on both sides! When we call @code{onscreen?} with an x-coordinate, what should it do?}]}

@lesson[#:title "Boolean Functions" 
        #:duration "15 minutes"
        #:prerequisites "Intro-to-Booleans Contracts"]{
   @itemlist/splicing[
      @item{You've already learned many functions that allow you to create Booleans. < and >, for example, will all return a boolean when applied to the appropriate input.}
      @item{There are also many functions that work with Booleans, and let you do really complex tests.}
      @item{Tell me if the following statements are true or false:@itemlist/splicing[
             @item{Sugar is sweet. @selftaught{@fill-in-the-blank[#:id "bool1"]}}
             @item{Ice is hot. @selftaught{@fill-in-the-blank[#:id "bool2"]}}
             @item{Sugar is sweet @bold{and} Ice is cold. @selftaught{@fill-in-the-blank[#:id "bool3"]}}
             @item{Sugar is sweet @bold{and} Ice is hot. @selftaught{@fill-in-the-blank[#:id "bool4"]} @tag[(pedagogy selftaught)]{Why is it false? Isn't sugar still sweet?}}
             @item{Sugar is sweet @bold{or} Ice is cold. @selftaught{@fill-in-the-blank[#:id "bool5"]}}
             @item{Sugar is sweet @bold{or} Ice is hot. @selftaught{@fill-in-the-blank[#:id "bool6"]} @tag[(pedagogy selftaught)]{Why is it true? Ice isn't hot!}}]}
      @item{Did you notice how we joined the Boolean statements? What words did we use? (AND, OR).}
      @item{The key concept here is that @code{and} requires that both statements be true, and @code{or} needs @italic{at least one} to be true.}
      @item{@think-about[#:question "What are the contracts for both AND and OR?"
                                    @; MUTLIPLE ANSWERS
                         #:answer @code[#:multi-line #t]{
; and: Boolean Boolean -> Boolean
; Returns true if BOTH inputs are true
                                      
; or: Boolean Boolean -> Boolean  
; Returns true if EITHER of the inputs are true}]}
      @item{Turn to @worksheet-link[#:page 20 #:name "AND-and-OR"] and read the directions}
      @item{Take five minutes @tag[group]{with your team,} to draw the circle for each of the statements. Think about what Boolean functions you'll need for each one! When you're done, convert those circles into Racket code.
                              @tag[selftaught]{@embedded-wescheme[#:id "Booleans"
                   #:definitions-text ";Enter your code here!"]}}]}                                                                                                                

@lesson[#:title "onscreen? 2.0" 
        #:duration "25 minutes"
        #:prerequisites "onscreen1 Boolean-Function"]{
     @itemlist/splicing[
         @item{Now it's time to put it all together. Right now, you know how to keep Sam safe on the left side of the screen, and how to keep him safe on the right side. But how do we keep him safe on BOTH sides at the same time?}
         @item{Turn to @worksheet-link[#:page 21 #:name "Design-Recipe-Onscreen"] and read the word problem.}
         @pedagogy{@item{Have the @code{onscreen?} volunteer stand again.}}
         @tag[selftaught]{@item{Pretend you are the @code{onscreen?} function.}}
         @item{What is your name? What is your domain? What is your Range?}
         @item{Sam is onscreen only when he is safe on the left AND the right. How can we use one of those functions we just learned to do this? @pedagogy{'d like my volunteers @code{safe-left?} and @code{safe-right?} to stand up again.}}
         @pedagogy{@item{When I yell out "onscreen? fifty", @code{onscreen?} is going to call @code{safe-left?} and @code{safe-right?} with that number. Depending on what they give back, @code{onscreen?} will tell me true or false}}
         @pedagogy{@item{Try this out, making sure that students are actually talking to one another, calling the functions properly by name. When you call out "onscreen? eighty!", the @code{onscreen?} volunteer should call out "safe-left? eighty" and "safe-right? eighty", and listen their answers before giving back an answer of their own. Run through a bunch of examples here, to make sure it's clear.}}
         @tag[selftaught]{@item{When @code{onscreen?} is given a number, it will call @code{safe-left?} and @code{safe-right?} with that number. Depending on what they give back, @code{onscreen?} will tell me true or false}}                        
         @item{It's time to write the contract and examples!  Don't forget what we just went over! @pedagogy{Raise your hands so I can check your work at each step}}
         @pedagogy{@item{Guide students as necessary, and eventually have them write the code on the computer.}}
         @tag[selftaught]{@item Once you have your contract and examples written, fill in the rest of the worksheet with the code for @code{onscreen?}.}
         @item{Guess what? These functions are exactly what we need in our game file, and to have your characters come back once they've gone off the screen!
               @;FILEALTERNATIVE
               }
         @item{Copy and paste the three functions @code{safe-left?}, @code{safe-right?}, and @code{onscreen?} into your game files.}
                  @item{There are two ways to go about solving this word problem: 
               @code[#:multi-line #t]{(define (onscreen? x)
                     (and (> x -50) (< x 690)))}
               and...
               @code[#:multi-line #t]{(define (onscreen? x)
                     (and (safe-left? x) (safe-right? x)))}}
         @item{Does it matter? Both will work just fine when you type them in...so why care?}
         @item{There's more to being a writer than putting down grammatically-correct sentences. There's more to being an architect or an artist than building a bridge or coloring in a canvas. All of these disciplines involved an element of @italic{design}.}
         @item{Likewise, there is more to being a Programmer than just writing code. You've gotten decent at writing code, and now you're able to write sophisticated programs that include multiple functions - congratulations! But that also means you're ready to consider what it means to @italic{design} the code that you write.}
         @item{The first solution puts all of the logic into one function: the left boundary and the right boundary are both tested by @code{onscreen?}. In the second solution, @code{onscreen?} uses both helper functions, each of which only tests one boundary at a time. Can you think of a reason why one might be better than another? Is it better to have a single, complex function that does all the work, or to have multiple simple functions that only do one thing apiece?}
         @item{Suppose you just built a car, but it's not working right. What would you do? Ideally, you'd like to test each part of the car (the engine, the transmission, etc) @italic{one at a time}, to see which one was broken. The same is true for code! If you have a bug, it's much easier to find when every function is simple and easy to test, and the only complex functions are just built out of simpler ones.}
         @item{Another reason to like the second example is the fact that it lets programmers be lazy. Suppose you have a few characters in a videogame, all of which need to be kept on the screen.  Some of them might only need @code{safe-left?}, others might only need @code{safe-right?}, and only a few might need @code{onscreen?}. What happens if the game suddenly needs to run on computers with differently-sized monitors, where the boundary is 1000 instead of 690? If you have simple and complex functions spread throughout your code, you'll need to change them all. If your complex functions just use the simpler ones, you'd only need to change them in one place!}
         @item{Badly designed programs can work just fine, but they are hard to read, hard to test, and easy to screw up if things change. As you grow and develop as a programmer, you'll need to think beyond just "making code work". It's not good enough if it just works - as artists, we should care about whether or not code is @italic{well designed}, too.}
         @item{This is what functions allow us to do! Everyone from programmers to mathematicians uses functions to carve up complex problems into simpler pieces, which make it possible to design elegant solutions to difficult problems.}
         @item{So the next time you sit down to solve a problem, think about algebraic abstraction, and how you might design a beautiful solution out of simple functions, rather than a huge, complex one.}]}

@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist/splicing[
        @pedagogy{@item{Who can tell us one thing we learned today? }}
        @tag[selftaught]{@item{@review{What did you learn from this lesson?}}}
        @pedagogy{@item{Who saw someone else in the class do something great?}}
        @pedagogy{@item{Cleanup, dismissal.}}
        ]}

@copyright[]