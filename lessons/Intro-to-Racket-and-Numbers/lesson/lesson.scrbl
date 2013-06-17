#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Intro to Racket and Numbers"
     #:duration "15 minutes"
     #:overview "Students are introduced to the programming environment"
     #:learning-objectives @itemlist[@item{Students become familiar with the editing environment}]
     #:product-outcomes @itemlist[@item{}]
     #:standards @itemlist[@item{}]
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Open the programming tool of your choice: If you've installed, DrRacket, double-click the application to launch it. If you are using @(hyperlink "http://www.wescheme.org" "WeScheme.org"), enter your username and password to log in, then click "Start a New Program".}
                        @teacher{@management{Have the students look at the editor on their computers. Refer to overhead projector as necessary.}}
                        }
                 
                @point{@student{@bitmap{images/1.5.png}The next screen is called the @italic{editor}, and it looks something like the diagram you see here. There are a few buttons at the top, but most of the screen is taken up by two large boxes: the Definitions window at the top and the Interactions window at the bottom. For now, we're going to just focus on the Interactions window.}
                        @teacher{}
                        }
                 
                @point{@student{The Interactions window is like scrap paper, where you can write short programs and try them out by hitting "Return." You'll be using the Definitions window soon, but for now let's focus on the Interactions window.}
                        @teacher{@management{}}
                        }
                
                @point{@student{@bitmap{images/1.4.png} Whenever you run a program, the computer evaluates the program you've written. A program can be very complicated, but it doesn't have to be: the simplest programs of all are just Numbers. What do you think @code{4} will evaluate to when we run it? Try typing in other numbers and see what happens.
                                @embedded-wescheme[#:id "Intro to Racket and Numbers"                                               #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "4"]}
                                
                        @teacher{@management{Draw students' attention to the Language Table (see Lesson Overview for Unit 1), which currently sits empty. Add "Numbers" to the Types section of the language table.}}
                        }
                
                @point{@student{@activity{Try big numbers, like @code{10345017}, or negative numbers, like @code{-2}. Is there a limit to how big a number can be? What happens if you write a decimal? What happens when you click on a decimal, like @code{1.5}? You get a new type of number, a fraction, like @code{3/4}.}}
                        @teacher{The editing environment evaluates all fractions and returns them as decimals by default. This can be surprising to students at first, so you may want to take a moment to explain what's going on, and show them that these decimals can be converted back to fractions just by clicking on them.}
                        }
                
                @point{@student{@activity{The computer obviously knows about Numbers, but what happens if you type in something that it @italic{doesn't} know about? Will it complain? Crash? Guess? Try typing @code{dog} into the Interactions window.
                                                                                                                              @embedded-wescheme[#:id "Exploring bugs"                                                                                            #:height 100
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "dog"]}
                                 }
                        @teacher{Have students read the error message aloud, and discuss what it means.}
                        }
                
                @point{@student{These error messages are really useful for programmers. Rather than saying "this program doesn't work", the computer does the best it can to tell you what went wrong, and to give you as much information as possible to help you fix the problem. Make sure you always read these messages carefully!}
                        @teacher{@management{}}
                        }
                ]}