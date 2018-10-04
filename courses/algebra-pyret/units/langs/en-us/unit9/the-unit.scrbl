#lang curr/lib


@title{Unit 9: Prepping for Launch}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6")
                                       (list "String" @code{string-append string-length} " \"hello\" ")
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image} "circle(25, \"solid\", \"red\")")
                                       (list "Boolean" @code{= > < string=? and or} "true ,false"))]{

@unit-descr{Students edit game details, practice talking about their code, and prepare for their Launch Party!}
 }

@unit-lessons{
@lesson/studteach[
     #:title "Presentation Preparation" 
     #:duration "60 min"
     #:overview "Students create posters and draft presentations for their videogames."
     #:learning-objectives @itemlist[@item{Students practice explaining programming artifacts and concepts to others}]
     #:evidence-statements @itemlist[@item{Students will be able to explain the Circles of Evaluation to others}
                                     @item{Students will be able to explain the purpose of a Contract}
                                     @item{Students will be able to walk an audience through a simple use of the Design Recipe}
                                     @item{Students will be able to explain how the Distance Formula is used in their game}
                                     @item{Students will be able to explain how Piecewise Functions are used in their game}]
     #:product-outcomes @itemlist[@item{A poster illustrating a key component of a game program}]
     #:standards (list)
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                           @item{Printouts of game code for each team.}
                           @item{Camera - take pictures today!}
                          ]
     #:preparation @itemlist[@item{Sample poster or tri-fold poster for a fictional game, to use as a model for students.}]
     #:prerequisites (list)
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Once you have a working game (will all your Contracts and EXAMPLEs included, of course!), it's time to think about how to present your work to others. Programmers spend a lot of time designing and writing their code, but they also spend time explaining their work to others. These might be other programmers on their team, other engineers within the company, or even non-technical people. Do you think you can explain your code to someone else?}
                       @teacher{Got time for a challenge? Try introducing them to @lesson-link[#:name "Structs" #:label "Data Structures"], to allow for 2-dimensional motion and more player control.}
                       }
                @point{@student{@activity{Create a sample poster for your game! Every poster should have the following:
                                          @itemlist[@item{Your name(s), and the title of your game}
                                                     @item{A picture to catch people's eyes}
                                                     @item{The story behind your game}
                                                     @item{A written description of ONE function from your code. This description should include the Name, Domain and Range of the function, with an explanation of what it does and how it is used in your game.  Instead of describing a function, you could describe some concept you learned (Circles of Evaluation, Design Recipe, Piecewise Functions, Pythagorean Theorem) and how you used it in creating your game.}]}}
                       @teacher{Make sure that each group of students gets a different function to talk about, so that a classwide presentation will review the entire game. You may also want to have groups assigned to explain the Circles of Evaluation, Contracts, the purpose behind the Design Recipe, Piecewise Functions, and the Pythagorean Theorem.}
                       }
                @point{@student{After you've made the poster, think about how you will use it during your presentation. What will you say to the audience? How can you use what you've written on the poster or in your code to help with the presentation?}
                       @teacher{Demonstrate a terrible presentation, modeling bad posture, low volume, and mumbling. When it's time for the code-walk, stop. Ask kids to critique, pointing out what they liked and didn't like. What did they think of the speed of the presentation? Could they hear you? Then model a much better presentation! Demonstrate positive energy, clear speech, etc. }
                       }
                @point{@student{@activity{Write or practice a 5 minute presentation, in which you introduce yourself and explain your game, then walk the audience through an explanation of the function or concept you were assigned.}}
                       @teacher{Have students walk through their presentations, and get feedback from their peers. You may also want to model the explanation of a few lines of code, so they see what you're looking for. Don't allow students to just recite the code! They should be able to explain each line in plain english - don't be afraid to push students to really explain what's going on.}
                       }]
        }
      
@lesson/studteach[
     #:title "Celebration" 
     #:duration "15 min"
     #:overview "Students are awarded certificates for their presentation"
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                           @item{Printouts of game code for each team.}
                           @item{Camera - take pictures today!}
                          ]
     #:preparation @itemlist[@item{(Optional) Game Design Certificates: 
                                   @itemlist[@item{Most creative story}
                                              @item{Most creative visuals}
                                              @item{Best Note-Takers}
                                              @item{Best Focus}
                                              @item{Most Positive Energy}
                                              @item{Design Recipe Masters}]
                                   }]
     #:prerequisites (list)
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Congratulations: you've done something really incredible! You've learned a new programming language, learned about the Circles of Evaluation, Numbers, Strings, Booleans, Images, Functions, Values, Conditional Branching, the Design Recipe, Contracts, and more. You made a rocket fly, you learned how to generate computer graphics, and you put all of that together to build a videogame!}  
                       @teacher{Have the class give each other a round of applause. Give out awards, talk about student achievement, etc.}
                       }]
        }

}
