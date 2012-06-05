#lang planet dyoo/scribble-bootstrap:5
@declare-tags[pedagogy group selftaught bootstrap]


@title{Unit 3
       
The Definitions Window}

Unit Overview

Students are introduced to the Definitions window, and learn the syntax for defining values of various types.  They are also introduced to the syntax of defining functions and creating examples.

Learning Objectives

Students will have the following
@objectives[@item{Learn about examples, variables and functions}
       @item{Practice Racket syntax and the Circle of Evaluation}]

Product Outcome
@product-outcomes[@item{Students@tag[group]{, in pairs,} will write functions to solve simple problems}
       @item{Students@tag[group]{, in pairs,} will write examples (unit tests) to check those functions}]

State Standards

See @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") provided as a part of the Bootstrap curriculum

Length: 90 minutes

@tag[pedagogy]{
Materials and Equipment
@materials[@item{Student @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/materials/StudentWorkbook.pdf" "workbook") folders @tag[group]{-in pairs!-} with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class poster (List of rules, language table, course calendar)}
           @item{Language Table (see below)}]


Preparations
@preparation[@item{Create student game files. [See @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html" "Instructions")]}
           @item{On student machines: Student Game Files (generated from blank templates [@(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Game.rkt" "DrRacket file") + @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/Teachpack/Teachpacks.zip" "teachpacks") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=cross-drawn-serve-annex-crumb" "WeScheme")])}
           @item{Write agenda on board, and post along with class posters and the Language Table}
           @item{Seating arrangements: ideally clusters of desks/tables}
           @item{Optional: demo machine with projector to show the interations and definitions windows}]}


Language Table


@lesson[#:title "Introduction" #:duration "15 minutes"]{
        @itemlist[
        @item{You guys have done a fantastic job in the last two classes}
        @item{You've learned how to convert expressions into Circles of Evaluation, and how to convert those circles into Racket code}
        @item{You've learned how to think about functions in terms of nested circles, and how to think of them as a mapping between the Domain and Range}
        @item{You've extended that knowledge into three data types: Numbers, Strings, and Images}
        @item{Let's see how much you remember!}
        @item{Review material from previous class}
        @item{You have learned a LOT, and before today's class is over... you will have written your first line of code for YOUR videogames}
        ]}

@lesson[#:title "Defining Variables" #:duration "10 minutes"]{
        @itemlist[
        @item{@tag[(pedagogy selftaught)]{Note: this section and the one that follows ("Game Screenshots") teach the same concepts as the supplemental @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/SupplementalLessons.html#flags" "Flags") and @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/SupplementalLessons.html#changing" "Changing Images") activities.  Some students will find the flags activity more engaging and creative, while others are itching to see their games take shape. Choose whichever activity is best-suiited to your needs}}
        @item{@demo{Have students open their game files, and click Run. They should see a frozen screenshot of their game, using the images they requested. @tag[pedagogy]{(By now, you should have students' graphics already created, and @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html#addingimages" "added to the file"))}}} 
        @item{So far, everything that you've been doing has been down in the Interactions window. What happens when you click Run at the top? All the work you did disappears!}
        @item{That's because the Interactions window is mean just for trying things out. If you want to define something permanently, you need to use the Definitions window}
        @item{This is a bare-bones, totally broken game. It doesn't DO anything...YET!}
        @item{Look below Step 0, near the top of the screen. @tag[pedagogy]{Raise your hand if you can read the line of code just below that (Have a volunteer read it aloud).} @think-about[#:question "What will happen if I type TITLE into the Interactions window down at the bottom?" #:hint "Try it out!"]}
        @item{@think-about[#:question "What will happen if you type TITLE into the Interactions window down at the bottom?" #:answer "This code tells the computer that the name TITLE is a shortcut for the string \"MY Game\". When you click Run, the computer learns that name, that shortcut, along with any other definitions"]}
        @item{When you click Run, you'll see the title "My Game" at the top left hand corner of your new game}
        @item{This kind of name, that's just a shortcut for some value, like a Number, String, or Image, is also called a variable. You've seen other names too, like + and string-length that are the names of functions. You'll name your own functions soon.}
        @item{Change the value of this variable form "My Game" to YOUR title. Then click Run, and see if the game is updated to reflect the change}
        @item{@think-about[#:question "What is the name of the NEXT variable defined in this file? What is its value?" #:answer "TITLE-COLOR"]  Try changing this value and clicking Run, until your title looks the way you want it to.}
        @item{For practice, try defining a new variable called "author", and set its value to be the string containing your names. Don't forget - all strings are in quotes! (this won't do anything in the game, but when you close the game window, you can type author
author and see its value. Then you can ask @code{(string-length "author"), etc.}}
        @item{@think-about[#:question "What other variables do you see defined in this file? What is its name? What is its value?"] @tag[pedagogy]{Take a volunteer.}}
        @item{Variables can be more than just strings. They can be numbers, or images! These definitions are where we define the images for your background, player, target, and danger.}]
}
@lesson[#:title "Game Screenshots" #:duration "30 minutes"]{

@itemlist[
    @item{Suppose we wanted to combine your game images and layer them together to form a screenshot, so you could see what your game will look like. We want to take these images and stack them on top of each other - @think-about[#:question "What image goes on the bottom?" #:answer "The BACKGROUND."]}
    @item{There's also a variable called SCREENSHOT. @think-about[#:question "What is it defined to be?"
                                                     #:answer "@code{(define SCREENSHOT (put-image PLAYER 320 240 BACKGROUND))}"]}
    @item{@code{put-image} is a function that puts one image on top of another, at whatever coordinates you specify. In our screenshot, what is the image going on the top? PLAYER. At what coordinates? (320, 240)}
    @item{Try evaluating SCREENSHOT in the interactions window. You should see the player, right in the middle of the background. @think-about[#:question "How would you change the code so the player is a little lower down? To the left? The right?" #:hint "Try it out."]}
    @item{Now we want to add another image. How about we add the TARGET? @think-about[#:question "Can you tell me what function will let us place this image on top of our stack?" #:answer "It's the one we just used... @code{(put-image _______
_______
_______
_______)}"]}
    @item{@think-about[#:question "What image goes on the top?" #:answer "Yes, TARGET!"] @think-about[#:question "And where should we put it? How about someplace on the right-hand side of the screen? @tag[pedagogy]{Raise your hand if you can give me some coordinates for that.}" 
#:answer "@code{(put-image TARGET
550
100
_______)}"]}
    @item{Click "Run", and evaluate SCREENSHOT. Does it look the way you expected? On your own, mess with the coordinates until the TARGET is placed where you want it to be.}
    @item{@exercise{Can you add the DANGER on your own?}}
    
]}

@lesson[#:title "Fast Functions" #:duration "10 minutes"]{

@itemlist[
          @item{You've learned how to write complex expressions, and define shortcuts so you can use them later. That's terrific...but we need more.}
          @item{The problem is that all of these expressions always return the same thing - your screenshot, for example, will always look the same, every single time you evaluate it. What you want is a shortcut to a pattern. Then we just fill in the blanks later for the stuff that's changed, and get the whole expression back. Up to now, you've been defining values. Now you're going to learn how to define functions.}
          @item{My favorite shape in the whole world is a triangle, and my favorite color is green. I LOVE making solid green triangles! But right now, I have to type out so much code to do that! I need to write the triangle
 function, then a size, then tell the computer that I want it solid and green. I wish there was a shorter way, another function called gt
gt that would just take in the size and draw me my triangle.}
          @item{@skit{Who can help me, by acting out gt? @tag[pedagogy]{Take a volunteer}}}
          @item{@skit{Okay, your name is now gt. All I need to do is call out your name, give you a number, and you will draw me that beautiful triangle. Let's do a test: "gt fifty!". @tag[pedagogy]{The student should draw a solid green triangle on the board.} "gt one hundred!" @tag[pedagogy]{The student should draw a solid green triangle, roughly twice as big..} Can anyone else in the class call this function, passing in a different size?}}
          @item{Open your workbooks to page 8, where it says "fast functions."}
          @item{On this page, there is space to write four simple functions. @tag[pedagogy]{We're going to do the first one together, and then we'll have a competition for the rest.}}
          @item{@exercise{On this page, there is space to write four simple functions. We're going to do the first one together, and then we'll have a competition for the rest.}}
          @item{Let's start with the contract. What are the three parts of a contract?}
          @item{@tag[pedagogy]{Hey volunteer, what did I say your name was? gt! And what information did you need from me to do your job? just a number - the size!. And what did you produce, once I'd given you that number? An Image.}}
          @item{@tag[selftaught]{@think-about{#:question "When you used the @code{gt} command, what information did you need and what did you produce?" #:answer "You needed the size of the triangle (a number) and produced the image"}}}
          @item{Fill in the first contract on the page -- it's the one with the shaded, gray bar.}
          @item{Now we have some space to write examples. @tag[pedagogy]{Let's think about the examples we saw our volunteer act out...}}
          @item{When I wanted him to make a solid green triangle of size fifty, what did I tell him? "gt fifty!". So in the first part of the EXAMPLE, we can write (gt 50). So my example so far is @code{; gt : Number -> Image
(EXAMPLE (gt 50) __________________________)}}
          @item{Then what did he draw for me? A solid green triangle of size fifty! How would we write the code to draw that same shape? @code{; gt : Number -> Image
(EXAMPLE (gt 50) (triangle 50 "solid" "green"))}}
          @item{@tag[pedagogy]{Can someone write another example for me?}}
          @item{Now, on your own, fill out two examples for gt on your Fast Functions worksheet.}
          @item{If only we had a function like gt! Well, let's build one!}
          @item{Right now, I'm telling the computer how to deal with a shortcut for "gt 17" - but what if I wanted the shortcut to work for ALL sizes, not just size 17?}
          @item{That's the final step: replace the stuff that changes between examples with a variable. So let's look at these two lines, and circle everything that changes. What did we circle? Just the numbers 10 and 17! What do those numbers mean? Is it the number of circles we're drawing? No! It's the SIZE. So let's make a little note to ourselves, to remind us that those numbers mean the size of the circle. }
          @item{Now we can write the code -- instead of an EXAMPLE we'll use define. After that, we're just going to copy everything from our examples except the stuff that we circled. What do you think we'll write instead? We'll use the name we wrote down: size. @tag[pedagogy]{Go character-by-character with the students, asking them if both examples have an open paren, the name "gt", etc...} @code{; gt : Number -> Image
(EXAMPLE (gt 50) (triangle 50 "solid" "green"))
(EXAMPLE (gt 95) (triangle 95 "solid" "green"))
(define (gt size) (triangle size "solid" "green"))}}]}

@lesson[#:title "Blue Circle" #:duration "10 minutes"]{

@itemlist[
          @item{Now it's your turn!}
          @item{@tag[pedagogy]{Raise your hand if you want to help me act out this next function. We'll come up with some examples together, and your group will have to write two more on paper!}}
          @item{@tag[pedagogy]{Hand the student the sign that says "bc" and ask them to come to the whiteboard}}
          @item{@skit{When I say "bc 50", you'll draw a solid blue circle of size 50. Let's try it out. "bc fifty!". @tag[pedagogy]{Wait for student to draw a circle. Then have several other students give examples to your function, by calling out "bc" and a number. Make sure that the student answering gives an appropriately sized circle return every time.} }}
          @item{I want to write a function called "bc", which takes in a number and draws me a solid, blue circle that is whatever size the number was. @tag[pedagogy]{Just like our volunteer here.}}
          @item{@tag[group]{First, you need to write down the CONTRACT for this function. Once again, everyone in your group needs to have the correct answer! You'll have 2 minutes. GO!}}
          @item{Now it's time to write some examples. Let's look at the first example "bc" drew on the board, for (bc 50). @think-about[#:question "What shape did they draw? What color? What size? How would you write the code to draw that shape?" #:answer "@tag[pedagogy]{(write on the board):} @code{ (EXAMPLE (bc 50) (circle 50 \"solid\" \"blue\"))"]}
          @item{@tag[group]{You have 2 minutes for EVERYONE in your group to write out 2 examples of your own. ALL OF THEM have to be correct for your team to get this point. GO!}}
          @item{@tag[pedagogy]{Countdown: 30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES ON ME. (Don't forget to wait for total silence, attention.)}}
          @item{@tag[pedagogy]{Give points, praise kids for neat handwriting and good teamwork.}}
          @item{@tag[pedagogy]{Give the countdown, then review answers with the class and assign points. }}
          @item{Time for the last part: writing the function header and body. @tag[group]{Your team will have 2 minutes to complete this. GO!}}
          @item{@tag[pedagogy]{Give the countdown, then review answers with the class and assign points. }}
          ]}

@lesson[#:title "Double" #:duration "10 minutes"]{

@itemlist[
         @item{@think-about[#:question "I want a volunteer to be a function called \"double\", which takes in a number and multiplies it by two. @tag[pedagogy]{Hand the sign to the student.} So if I say \"double 3\", what will I get back?"]}
         @item{@tag[pedagogy]{Have a couple of students try out the function by giving examples}}
         @item{@tag[pedagogy]{You will have TWO minutes to write down that contract and two examples-once you've got your examples, RAISE YOUR HAND and call me over, so I can check them. Two minutes, ready - go!}}
         @item{@tag[pedagogy]{Give the countdown, then review answers with the class and assign points.}}
         @item{@tag[group]{Raise your hand if you think you know how you could write an example for "double".} @tag[pedagogy]{(If you get blank stares, give them ONE example on the board. Otherwise, smile and move on.)}}
         @item{@tag[group]{Your groups will now have FIVE minutes to write two examples, and then circle and label what has changed. Then you can fill out the function header and body. Once you've got your examples, RAISE YOUR HAND and call me over, so I can check them. Do NOT go on to the function header and body until I have checked your examples! Any questions? GO!}}
         @item{@tag[pedagogy]{Give the countdown, then review answers with the class and assign points. If time allows, do another example, preferably one where the domain is something besides numbers.}}
          ]}
        
@lesson[#:title "Closing" #:duration "5 minutes"]{

@itemlist[
        @item{@tag[pedagogy]{Who can tell us one thing we learned today? }}
        @item{@tag[selftaught]{@review{What did you learn from this lesson?}}}
        @item{@tag[pedagogy]{Who saw someone else in the class do something great?}}
        @item{Well done! You guys have officially started your games! The next step is to make your characters animate, which we'll be doing in our next class. See you then!}
        @item{@tag[pedagogy]{Cleanup, dismissal.}}
        ]}
       