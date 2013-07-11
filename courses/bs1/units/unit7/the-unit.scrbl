#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap management]
@title{Unit 7: Conditional Branching}

@unit-overview/auto{
  @unit-descr{Students use geometry and knowledge of basic image functions to design characters for their games, this time using conditional branching to accommodate different key-events.}
@;@(language-table(list "Number" @code{+ - * / sq sqrt expt}) 
@;                                 (list "String" @code{string-append string-length})
@;                                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
@;                                 (list "Boolean" @code{= > < string=? and or}))
   }


@;@objectives[@item{Reason about the relative positioning of objects using mathematics}
@;            @item{Discover Partial Functions, and how to implement them using @code{Cond}}
@;            @item{Use Booleans with @code{cond} to change control flow}
@;            @item{Adapt Design Recipe to add @code{cond}}]

@;@product-outcomes[
@;            @item{Students will write functions that use conditionals and Booleans}
@;            @item{Students will write @code{update-player}}]

@;@materials[@item{Computers w/ DrRacket or WeScheme}
@;           @item{Student  @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
@;           @item{"Luigi's Pizza" [LuigisPizza.rkt from @(resource-link #:path "source-files.zip" #:label "source-files.zip") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=Qzjz5xbQ8h" "WeScheme")] preloaded on students' machines, in front}
@;           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
@;           @item{Class posters (List of rules, basic skills, course calendar)}
@;           @item{Language Table (see below)}]}

@;@preparation[@item{Write agenda on board}
@;             @item{All student computers should have their game templates pre-loaded, with their image files linked ins}
@;             @item{Seating arrangements: ideally clusters of desks/tables}]}

@lesson/studteach[
     #:title "Introduction" 
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{Let's begin by experimenting with a program used in a pizzaria.  
                     Open @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" 
                                      "Luigi's Pizza Worksheet") and work on the problems.}
            @teacher{Review students' answers to the exercise.}
           }
     @point{@student{There is something different about this function compared to the others you've written.  Do you see what it is?}
            @teacher{}
           }
     @point{@student{Up to now, every function you've defined has done the @italic{same thing} to all of its inputs. 
                     @code{green-triangle} always made green triangles, no matter what the size was. 
                     @code{safe-left?} always compared the input coordinate to -50, @code{update-danger} 
                     always added or subtracted the same amount, and so on.}
            @teacher{}
           }
     @point{@student{@code{cost} is special, because different toppings can result in totally different values being returned. 
                      That's because @code{cost} makes use of a special language feature called @vocab{conditionals}, 
                      which is abbreviated in the code as @code{cond}.}
            @teacher{}
           }
     @point{@student{Each conditional has at least one @vocab{clause}. In Luigi's function, there is a clause for cheese, 
                     another for pepperoni, and so on. Every clause has a Boolean question and a result. If the question 
                     evaluates to @code{true}, the expression gets evaluated and returned. If the question is @code{false}, 
                     the computer will skip to the next clause. 
                     @activity{Identify the question in the first clause.  Identify the question in the second clause.}}
            @teacher{}
           }
     @point{@student{Finally, a conditional can also have an @code{else} clause, which gets evaluated if all the questions are @code{false}. 
                                                             In this function, what gets returned if all the questions are false?}
            @teacher{}
           }
     @point{@student{Functions that use conditions are called @vocab{piecewise functions}, because each condition defines a 
                                                              separate piece of the function.}
            @teacher{}
           }
     @point{@student{Why do people want piecewise functions? Well, think about the player in your game...you'd like the player 
                     to move one way if you hit the "up" key, and another way if you hit the "down" key. 
                     Those are two different expressions! Without @code{cond}, you could only write a function 
                     that always moves the player up, or always moves it down - but not both.}
            @teacher{}
           }
   ]}


@;@(include-lesson (lib "curr/lessons/Cond-Example-With-Pizza-Toppings/lesson/lesson.scrbl"))
      
@lesson/studteach[
     #:title "Pizza Toppings" 
     #:duration "20 min"
     #:prerequisites "Intro-to-Booleans"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @;@item{@(video-link (hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "Intro to Cond Part 1"))}
       @;@item{@(video-link (hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY" "Intro to Cond Part 2"))}
       @points[
          @point{@student{Let's take a look at how you might use the Design Recipe to define a piecewise function using Conditionals.
                          Once you know how to use it, you'll be able to write other piecewise functions in your game.}
                 @teacher{}}
          @point{@student{Turn to the Design Recipe on @worksheet-link[#:page 23 #:name "Design-Recipe-Cost"] and 
                          grab a Design Recipe Worksheet.}
                 @teacher{}}
          @point{@student{Suppose we've been hired by Luigi's Pizza to write a function that tells us the 
                          cost of different pizzas. Let's use the design recipe to write this function.
                          @activity{@itemlist[@item{What is the name of this function?}
                                              @item{What is the domain?}
                                              @item{What is the range?}]}
                          }
                 @teacher{@itemlist[@item{Have a student read the problem statement.}
                                    @item{Ask for a volunteer to be our function. Pick someone, and copy the 
                                          contract as they answer. What is your name? cost Your Domain? String 
                                          Your Range? Number. 
                                          @code{; cost: String -> Number}}]}}
          @point{@student{Let's agree to name the function @code{cost}.  The contract for @code{cost} is @code{; cost: String -> Number}.
                          Now, we should write down some examples of @code{cost}.
                          @activity{@itemlist[@item{Write an example of computing the cost of a cheese pizza.}
                                              @item{Write an example of computing the cost of a pepperoni pizza.}
                                              @item{Circle the changes between your examples.  Be sure to label the changes.]}]}}
                 @teacher{}}
          @point{@student{Do you notice something odd here?  This is the first time that we've ever circled 
                          something in the second part of the examples which wasn't also circled in the first part. 
                          The price that's being produced changes, but the function never takes in the price!}
                 @teacher{}}
          @point{@student{That's a hint that something special is going on, but let's see how much father the 
                          Design Recipe can take us...}
                 @teacher{}}
          @;@item{@think-about[#:question "Now for the Function Header. What do I write here?"
          @;                              #:answer @code{(define (cost topping))}]}
          @point{@student{The Function Body is next. But now we don't know what to write! We know that our examples 
                          behave differently from one another -- sometimes we want to return 9.00, other times it's 10.50, 
                          etc. So what do we do? Well, we could fill in all off those results. Let's do that...}
                 @teacher{Make a large, 2-column table under the Function Header.
                          @tt{(}@code{define (cost topping)}
                          @build-table/cols['() 
                                            '(()
                                              ("10.50" "9.00" "11.25" "10.25"))
                                            (lambda (r c) (para (fill-in-the-blank #:id (format "~a" r)))) 2 4]
                          @tt{)}}}
          @;@item{@think-about[#:question "But how do we know when we want to produce 9.00? 10.50?"
          @;                              #:answer "When the toppings are cheese and pepperoni"]}      
          @point{@student{We want a way to go down each line, checking to see if the topping is the right one. 
                          If it is, we go on to finish the line. If not, we go on to the next one.}
                 @teacher{}}
          @;      @itemlist/splicing[
          @;                         @item{@think-about[#:question "What's Domain of our function? (according to the contract)"
          @;                                                       #:answer "String"]}
          @;                          @item{@think-about[#:question "What's the type of \"pepperoni\"?"
          @;                                                        #:answer "String"]}
          @;                          @item{@think-about[#:question "What function compares two strings, and gives back a Boolean?"
          @;                                                        #:answer @code{string=?}]}
          @;                          @item{@think-about[#:question "What's the Racket code that compares the input topping to the string \"pepperoni\"?"
          @;                                                        #:answer @code{(string=? topping "pepperoni")}]}
          @;                          @item{Now we can write that on our first line, as our first topping check. Can you do the rest?}]}
          @;@pedagogy{@item{Have students fill out the rest of the table
          @;                @build-table/cols['()
          @;                                  '(("(string=? topping \"pepperoni\")" 
          @;                                     "(string=? topping \"cheese\")" 
          @;                                     "(string=? topping \"chicken\")" 
          @;                                     "(string=? topping \"broccoli\")") 
          @;                                    ("10.50" "9.00" "11.25" "10.25")) 
          @;                                  (lambda (r c) ("")) 2 4]}}
          @point{@student{Fill out the rest of the table
                          @build-table/cols['()
                                            '(()
                                              ("10.50" "9.00" "11.25" "10.25"))
                                            (lambda (r c) (if (= c 0) (para (fill-in-the-blank #:id "cond")) (para ""))) 2 4]}
                 @teacher{}}
          @point{@student{Each of these rows is called a @vocab{condition}. A condition has a test and a result. 
                          The computer goes down the code, one condition at a time, and will evaluate the first 
                          result for which the condition is true.}
                 @teacher{}}
          @point{@student{Racket has a special function that lets us tell the computer to do this: cond. 
                          To use cond, you put square brackets around each of the branches, and write "cond" at the top:
                          @code[#:multi-line ""]{(define (cost topping)
                                                   (cond
                                                     [(string=? topping "pepperoni") 10.50]
                                                     [(string=? topping "cheese")     9.00]
                                                     [(string=? topping "chicken")   11.25]
                                                     [(string=? topping "broccoli")  10.25]))}}
                 @teacher{Remind students that computers are very specific and can't make up new answers; 
                          we need to tell it what to do in case the user inputs an item that is not in our list. 
                          Let's add else. If it's not on the menu, we might still make that pizza for you, but 
                          it'll cost you! @code{[else 10000000]}}}
          @point{@student{What happens if the topping is not on our list?  Let's add an else statement.  
                          If it's not on our menu, we might still make that pizza for 
                          you but it'll cost you!@code{[else 10000000]}.
                          @activity{Try it out for yourself and add your own new items.
                                    @embedded-wescheme[#:id "Strings"
                                                       #:definitions-text "; Try out the pizza example above!"]}
                          }
                 @teacher{@itemlist[@item{Students must open their files here.}
                                    @item{Have students try it on the computers, adding new items on their own.}
                                   ]}}
          @point{@student{If you have additional time, and would like to try another @code{cond} challenge, 
                          check out the @(lesson-link #:name "Function-Example-Red-Shape" #:label "supplemental activity.")}
                 @teacher{}}      
      ]}
          
@;@(include-lesson (lib "curr/lessons/Player-Movement/lesson/lesson.scrbl"))
      
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Congratulations - you've got the beginnings of a working game!  
                                What's still missing? Nothing happens when the player collides with the object or target!
                                We're going to fix these over the next few lessons, and also work on the artwork and story 
                                for our games, so stay tuned!}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                       @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                       @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
}

@copyright[]