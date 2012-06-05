#lang planet dyoo/scribble-bootstrap:5

@title{Unit 1: Videogames and Coordinate Planes}

@section{Overview} 
Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.

@declare-tags[group pedagogy selftaught]

@objectives[@item{Learn to work as a team}
          @item{Learn the basic expectations and goals of the class}
          @item{Learn the Cartesian coordinate system}
          ]

@product-outcomes[
          @item{Students - in teams - will successfully reverse-engineer a simple side-scrolling game.}
          @item{Teams will brainstorm their own games and generate the geometry for their games at different points in time.}
          ]
                
State Standards
See @(hyperlink "asdf" "Bootstrap Standards Matrix") provided as part of the Bootstrap curriculum. 
                
Length: 90 min
                
@materials[@item{Student  @(hyperlink "asdf" "workbook") folders - in pairs! - with names on covers.}
           @item{Computer, connected to a projector, with "NinjaCat" preloaded [ @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/NinjaCat.zip" "DrRacket") "|" @(hyperlink "http://www.wescheme.org/view?publicId=gaffe-tinge-swipe-oscar-diver" "WeScheme")]}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Cutouts of  @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/1.7.png" "NinjaCat") and the  @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/images/1.8.png" "Ruby")}
           @item{Class posters (List of rules, language table, course calendar) }
           @item{Language Table (see below)}
           ]

@preparation[
          @item{Distribute workbooks, pens, arrange chairs so students are in pairs}
          @item{Set up student machines and projector, and check to make sure it all works!}
          @item{Post the agenda, rules, calendar, basic skills, language table, etc}
          ]

@lesson[#:title "Introduction and Expectations"
        #:duration "5 minutes"
        ]{
  @itemlist[
            @item{Welcome to your first day of Bootstrap!}
            @item{@tag[pedagogy]{Introduce the teaching staff. Give some background: age, where you're from, something surprising about yourself, favorite food, etc. Anything to allow kids to connect. Ask kids for their names!}}
            @item{@tag[pedagogy]{I want to set some expectations here, to make sure we're all on the same page.}}
            @item{In this class, you're going to be working on some very difficult material - you'll be using a language that is taught to college kids, and they're a lot older than you.}
            @item{You're going to need to be very focused, and disciplined about solving the problems we'll be throwing at you.}
            @item{Because this is the same material that they teach in college, we're going to expect you to be able to act like college students. @tag[pedagogy]{What do you think that means?}}
            @item{@exercise{@tag[pedagogy]{Take 2-3 suggestions.} @tag[selftaught]{MAKE A FILL IN THE BANK}}}
            @item{@tag[pedagogy]{Okay, so here are the rules: (point to a visual while going over this) 
                  @itemlist[@item{Unless we say otherwise, raise your hand to speak}
                            @item{The computers are for programming, not for Facebook, chatting, email or playing around}
                            @item{If you're not programming, the computer monitors need to be OFF. When we say "monitors off," everyone should shut off the monitors, stop talking, and give their attention to the teachers. Let's try this one out - everyone make sure the monitors are on ... now start talking ... louder! ... MONITORS OFF! Repeat as necessary.}
                            @item{No one in this class is allowed to put each other down. I don't ever want to hear anyone call somebody else "stupid," "idiot", or anything else. Don't tell each other to shut up, and be respectful to everyone. Is that clear?}]}}
            
            @item{@tag[pedagogy]{@tag[group]{When it comes time to program your games, you'll be working in pairs - you and a friend. But during class, there are a lot of activities and games we'll be playing where you and your partner will be part of a group.}}}
            @item{@tag[pedagogy]{@tag[group]{Right now, all of you are sitting with your group, clustered together around the classroom. When it comes time for team competitions or group activities, you'll be working with the people sitting nearby.}}}
            @item{@tag[pedagogy]{@tag[group]{These are just your groups for today! Depending on how well you work together, we'll be able to make some adjustments from class to class.}}}
            @item{@tag[pedagogy]{@tag[group]{@exercise{Assign group names (tip: use names that have something to do with computer science, or college, etc)}}}}
            ]
}

@lesson[#:title "Dissecting a Demo"
        #:duration "10 minutes"
        ]{
                   
 @itemlist[
   @item{Soon you're going to be designing your own games, but it's important to know how a simple game is built before you start designing your own.}
   @item{Let's take a look at a real game, which I've made using the same language and tools that you guys will be learning. When you're done with this class, you'll be able to make something similar.}
   @item{@tag[pedagogy]{@demo{Show the kids Ninjacat.}Be sure to end on a frozen frame of the game, so the whole class can see the same image.}@tag[selftaught]{Look at the demo of Ninjacat.}}
   @item{Turn to @(hyperlink "page1.com" "page 1") in your workbooks. Here we have a table, which we'll use to reverse-engineer, NinjaCat and see how it works. @tag[pedagogy]{Raise your hand if you can tell me one thing that you saw in the game. Wait until a few hands are up, then call one. Excellent! So we can write that down in our first column.} @tag[selftaught]{What do you see in the game? Write it down.}}
   @item{@exercise{@tag[group]{@tag[pedagogy]{In your groups, take one minute to come up with a complete list of all things in the game. Your group will get a point for each thing they can find. Everyone in your group should have this list written down - not just one person! If even one person in your group hasn't written it down, the group doesn't get the point! GO!}}@tag[selftaught]{Take one minute to come up with a complete list of all things in the game. GO!}}}
   @item{@tag[pedagogy]{During the minute, walk around and see how groups are doing. This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }}
   @item{@tag[pedagogy]{Have groups volunteer some of their answers and write them on the board. When they start listing items in the background, explain that you'll be grouping them all together into "background." Assign scores to the board: "team MIT is tied with team Northeastern!"}}
   @item{Okay, so we've got our list. Now we need to think about what is changing when we play the game. What about the Ruby? Does it get bigger? Does it change color? Does it spin around?}
   @item{The only thing that changes about the Ruby is its position! Everything else about it is the same.}
   @item{@exercise{@tag[group]{In your groups:} Take one minute to fill in the second column, for each thing in your game. GO!}}
   @item{@tag[pedagogy]{Again, give a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence, and complete attention.}}
   @item{@tag[pedagogy]{Quickly fill in the second column on the board. Assign scores.}}
        ]
 }

@lesson[#:title "Coordinate Planes"
        #:duration "15 minutes"
        ]{
 
@itemlist[
  @item{What is a position? Suppose you were telling your friend about this picture on the phone. How would you tell her exactly where the Dog is? @tag[pedagogy]{(Have students discuss.)}}
  @item{Just like your friend on the phone, computers need to know exactly where something is in order to draw it on the screen. To do this, they use a coordinate system.}
  @item{@tag[pedagogy]{(Draw a number line, with 10 tick marks).}}
  @item{You've all seen number lines before, right? There are a bunch of evenly spaced markings on the line, and each one represents a number. A number line is actually a really simple coordinate system, which lets you find points in one dimension! For example, we can take our little cutout of NinjaCat, stick him anywhere on the line, and now we can all agree that he's sitting at 5, 6, or any other number on our line. Number lines can also have negative numbers, so we can put NinjaCat at -2, -8, or even 0.}
  @item{Our game has two dimensions, and we'll need a number line for both. Let's call our first line, which runs from left to right the x-axis, and the new line, which runs up and down the y-axis. Now we have a grid, and we can stick NinjaCat anywhere on the grid. Let's do a quick example: 
            @itemlist[@item{@tag[pedagogy]{Draw a second number line and add NinjaCat at (4,6)}}
                      @item{@exercise{What is NinjaCat's position on the x-axis? To find out, we just drop a line down from where NinjaCat is, and read the position on the number line. He's at 4.}}
                      @item{@exercise{What is his position on the y-axis?}}
                      @item{@tag[pedagogy]{If time allows, invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations.}}
                      ]}
  @item{When we write down these coordinates, we always put the x before the y (just like in the alphabet!). Most of the time, you'll see coordinates written like this: (200, 50) meaning that the x-coordinate is 200 and the y-coordinate is 50.}
  @item{On the computer, the screen is all the parts of the grid from 0 to 640 on the x-axis, and 0 to 480 on the y-axis. @tag[pedagogy]{Superimpose the screen over your coordinate plane.}}
  @item{@think-about[#:question "What is the coordinate for the lower left-hand corner of the screen? What about the lower right-hand corner? The center?"
                     #:answer "Lower left: (0,0), lower right:(640,0), center:(320,240)" ]}
  @item{@think-about[#:question "Can you think of a coordinate that puts NinjaCat on the left-hand side of the screen? The top?"
                     #:answer "Many possible answers: for example, (0,100) puts NinjaCat on the left, and (120,480) puts NinjaCat on the top."]}
  @item{@think-about[#:question "Can you think of a coordinate that puts him off the screen?"
                     #:answer "Many possible answers: for example, (1000,1000). If the x coordinate is above 640 or below 0, or if the y coordinate is above 480 or below 0, NinjaCat will be off the screen." ]}
  
          ]
                   }

@lesson[#:title "More dissection"
        #:duration "10 minutes"
        ]{  
              
 @itemlist[
    @item{So let's look back at our table @(hyperlink "page1.com" "(page 1)"). Now that we know what a position is, let's be more specific about what is changing during the game.}
    @item{@think-about[#:question "Can NinjaCat move up and down in the game? Can he move left and right? So what's changing: his x-coordinate, his y-coordinate, or both?"
                       #:answer "NinjaCat can move both up and down and left and right. So both his x and y-coordinate are changing."]}
    @item{@think-about[#:question "What about the clouds? Do they move up and down? Left and right? Fill in the rest of the table @tag[group]{with your team.}"
                       #:answer "The clouds only move left and right."]}
    @item{@tag[pedagogy]{Terrific! Great job, all of you. }Now, turn to @(hyperlink "page2.com" "page 2") in your game planning workbooks and look at the project sheet that has a picture of the NinjaCat game you just saw.}
    @item{@tag[pedagogy]{Raise your hand if you can tell me what the coordinates are of the upper-left-hand corner. Take volunteer. What about the bottom-right-hand corner? What about the coordinates of the point right in the center of the screen?} @tag[selftaught]{@think-about[
          #:question "What are the coordinates of the upper-left-hand corner?  What about the bottom-right-hand corner? What about the coordinates of the point right in the center of the screen?"
          #:answer "The coordinate for the upper-left-hand corner is (0,480). Bottom-right-hand corner: (640, 0). Center: (320, 240)."]}}
    @item{@exercise{@tag[group]{In your groups:} Take a minute to find and label all of the midpoints - the points in the middle of each side of the screen: top, bottom, left and right. @tag[pedagogy]{(You may want to point to these points on the board). @tag[group]{ Once again, your group only gets a point if everyone writes and labels these coordinates correctly. GO! }}}}
    @item{@tag[pedagogy]{Give a countdown, demand attention, then take volunteers. Assign scores, discuss.}}
    @item{@tag[group]{@tag[pedagogy]{In the next round, your groups will have five minutes to fill in the coordinates for all the characters at the bottom of the page.}} @tag[selftaught]{Now fill in the coordinates for all the characters at the bottom of the page.}}
    @item{@tag[pedagogy]{Give a countdown, demand attention, then take volunteers. Assign scores, discuss.}}

           ]
 }

@lesson[#:title "Brainstorming!"
        #:duration "15 minutes"
        ]{
        
@itemlist[
  @item{@tag[pedagogy]{Okay, teams - great job. Now it's time to just work as pairs, with you and your partner}}
  @item{It's your chance to get creative!}
  @item{Just like we made a list of everything in the NinjaCat game, we're going to start with a list of everything in your game@tag[pedagogy]{s}. }
  @item{To start, your game will have with four things in it: @itemlist[
        @item{A Background, such as a forest, a city, space, etc.}
        @item{A Player, who can move when the user hits a key.}
        @item{A Target, which flies from the right to the left, and gives the player points for hitting it.}
        @item{A Danger, which flies from the right to the left, which the player must avoid.}
                                                                        ]}
  @item{@exercise{Suppose this was a sports game, like football. What might the player be? @tag[pedagogy]{(A football player.)} How about the goal? @tag[pedagogy]{(A football.)} The Danger? @tag[pedagogy]{(Player from a rival team.)}}}
  @item{@exercise{Maybe your game is about a puppy out for a walk. If the player is the puppy, what gives him points? What should he stay away from?}}
  @item{On @(hyperlink "page3.com" "page 3"), you'll find a planning template for you to make your own game.}
  @item{Put your name@tag[pedagogy]{s} at the top of your proposal.}
  @item{@tag[group]{Each pair needs to pick a setting for their game, and briefly sketch their characters. You don't need to make it perfect, but these drawings should be good enough to give other designers at your company a good idea of what you had in mind. You will have 5 minutes. GO!}@tag[selftaught]{Pick a setting for your game, and briefly sketch your characters. You don't need to make it perfect, but these drawings should be good enough to give other designers at your company a good idea of what you had in mind. You will have 5 minutes. GO!}}
  @item{@tag[pedagogy]{Walk around and make sure to consult with every team. A lot of students will have trouble fitting their ideas into this format, or they'll struggle with coordinates. Be clear about what can and cannot be done! (e.g. - no 3d games, joysticks, multiplayer games, etc)}}
          ]
        }

@lesson[#:title "Introduction to Racket and Numbers"
        #:duration "15 minutes"
        ]{ 
  @itemlist[
   @item{@tag[pedagogy]{Draw a big Circle on the board.}}
   @item{This circle is going to be our computer! We need to program it to do things, but once we do, we can use it to try out all of our programs.}
   @item{Look at our language table: right now we can't put anything in our circle, because our language has nothing in it. Let's add some values.}
   @item{@tag[pedagogy]{On three, Let there be numbers! "1... 2... 3... Let there be numbers!"}}
   @item{Add "numbers" to the Types section of the language table.}
   @item{Now we have numbers, which we can put in our Circle of Evaluation. (Put in the number 4.) What is the value of everything in this circle? Are you sure? @tag[pedagogy]{(Try other numbers, including decimals and negative numbers.)} @tag[selftaught]{Try other numbers, like 1.5, 10345017, and -2.}}
   @item{Let's ask a real computer...}
   @item{@tag[pedagogy]{Have students open the editor on their computers. Refer to overhead projector as necessary.}@tag[selftaught]{Open the editor on your computer.}}
   @item{This is a tool that allows you to write Racket programs. On your screens you'll notice two large boxes: the Definitions window at the top and the Interactions window at the bottom. For now, we're going to just focus on the Interactions window.}
   @item{The Interactions window is like scrap paper, where you can write short programs and try them out by hitting "Return." When you know what you want to keep as part of your finished product, you write that code up in the Definitions window. Look on the top of the window: you'll see a button with a green man running. What do you think happens when you click "Run"?}
   @item{Whenever you run a Racket program, it computes the program you've written - just like our circle. }
   @item{Type in the number 4, hit Run to see if the computer agrees with you. Congratulations: you just wrote your very first Racket program, and it came out to be the same value as what you'd expected! Try typing in other numbers and see what happens. What happens if you write a decimal?}
   @item{In English we have things like nouns and verbs. What's the difference between them? In Racket, anything that is a value is like a noun. I can give Racket the number 5 and it will give it right back, unchanged. All of the numbers you've entered are examples of values.}
   @item{Racket also has things that are like verbs, called Functions. I can throw a marker, the same way I can add two numbers. }
   @item{You already wrote programs that were just values. Now you're going to write programs that apply functions to those values.}
   
            ]
        }

@lesson[#:title "Circles of Evaluation"
        #:duration "20 minutes"
        ]{
 @itemlist[
   @item{Write 4 + 5 (jumbled, in no order in particular) in the Circle of Evaluation. @image["circle-of-evaluation-4-5.png"]}
   @item{@exercise{What is the value of the stuff in the circle? Let's figure out the math first. (Write the equation.) We know we're adding, so we start with the plus sign. ("+" in the middle.) Then we add 5 and 4 on either side. ("5 + 4".) Does it matter if I write (4 + 5)?}}
   @item{@tag[pedagogy]{Let there be subtraction!}}
   @item{@exercise{@tag[pedagogy]{Write a subtraction example in the Circle of Evaluation (again, jumbled), and ask students to evaluate it. Typically, students will realize that there are two possible answers! The lesson here is that the order of inputs matters. If necessary, have them type examples into the Interactions window to see that swapping the inputs gives different results!} @tag[selftaught]{Write a subtraction example in the Circle of Evaluation and evaluate it. @think-about[
         #:question "How many possible answers are there?"
         #:answer "There are two possible answers. For an example, if you put a 3, 5, and '-' sign in the Circle of Evaluation, you can either have 3 - 5, which is -2, or you can have 5-3, which is 2."]}}}
   @item{@exercise{@tag[pedagogy]{Write 4 + 5 * 6 in a Circle of Evaluation, and ask students what they think the value is. As with subtraction, have them discover that order of operations matters, and use the actual formulas to demonstrate: ("5*6 + 4", "4*5 + 6")} @tag[selftaught]{Write 4 + 5 * 6 in a Circle of Evaluation. What do you think the value is?}}}
   @item{We need to improve our Circle of Evaluation, so we don't run into this problem. Let's use the two solutions we came up with: @itemlist[
      @item{all circles have one function}
      @item{it matters in what order the arguments are written.}                                                                     
      ]}
   @item{We'll separate the function from the inputs by drawing a line between them: the function is above the line, the inputs are below.}
   @item{@exercise{How do we compute this program? Well, our new rule tells us to look at the left first: what is the value of 6? }}
   @item{@exercise{Now we look at the right: that's a new circle, so we have to evaluate that first. What is the left-hand side? A 4! And the right? A 5! What are we doing to the 4 and 5? That's right, we're adding. What do we get when we add 4 and 5? (Replace rightmost circle with 9.)}}
   @item{Now we have two numbers. @tag[pedagogy]{What are we doing to 6 and 9? (Replace circle contents with 54.)} 
         @tag[selftaught]{@think-about[
         #:question "What are we doing to 6 and 9?"
         #:answer "Multiply them to get 54."]}}
   @item{We write this in Racket the same way. We always put parens before a function and after its inputs (Write the parens and the "*"). In order to apply this function, we need to compute the left side and then the right. The left side is the number 6, so we can just write that in. (* 6 ____)}
   @item{The right side happens to be another Circle of Evaluation (more parens), so we apply the same rules there: write the function and then look at the left and the right. These are numbers, so we can write them in directly. (* 6 (+ 4 5) )}
   @item{@exercise{Try writing this in the Interactions window, and hit "enter". What did you end up with? Now try writing in the complex example we used. Did you get the same answer?}}
   @item{@think-about[#:question "@tag[group]{With your partner:} Try to come up with more examples - can you figure out how to subtract three numbers?"
                      #:answer "One example would be to subtract 1, 2, and 3. There are multiple ways to do this. You can do 1 - (2 - 3) which yields 0 or 3- (2 - 1) which yields 2."]}
   @item{@tag[pedagogy]{Let students discuss briefly, but usher them along to the solution using nested circles. They'll have plenty of practice soon!}}
   @item{I can't put three numbers in the circle, because there's no way to tell the computer which two numbers should be subtracted first. Is it (2-3)-5, or 2-(3-5)?}
   @item{Well, if a complete circle evaluates to a number, and numbers go inside circles, why not try putting circles inside circles?}
   @item{@tag[pedagogy]{Have students practice circles - make it into a game!} There are several excercises provided on @(hyperlink "page4.com" "page 4") of the student workbook.}
        
           ]
}

@review{ 
 @tag[pedagogy]{
 @itemlist[
  @item{Who can tell us one thing we learned today?}       
  @item{Who saw someone else in the class do something great?}
  @item{Cleanup, dismissal}
  @item{NOTE TO INSTRUCTORS: 
    @itemlist[
              @item{Make sure student names are on page 3}
                   @item{Take page 3 itself, or take photos of page 3, to prep game images for Unit 3.}
                   @item{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds!}
                   @item{TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with.}
                   @item{For more instructions on setting up the game files, read the @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html#addingimages" "Coding Instructions") document.}
              ]
    }
  ]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

         
         
       