#lang curr/lib

@declare-tags[group pedagogy selftaught]
@title{Unit 2: Contracts, Strings and Images}
@overview{

@unit-descr{Students are introduced to a set-mapping representation for functions, in which the function object exists as a means of translating points
from a Domain into a Range. Coupled with their understanding of Circles of Evaluation, students generalize their understanding of functions to
include other datatypes, including Strings and Images.}

@objectives[
        @item{Students will be able to write contracts for functions of Numbers, Strings and Images.}
        @item{Given an example of a function, students will be able to identify the Name, Domain and Range of that function.}]
@product-outcomes[
        @item{Students learn to make and manipulate the basic elements of their games--numbers, strings, and images}]

@state-standards

@length-of-lesson[90]

@pedagogy{
@materials[@item{Student workbook folders @tag[group]{- in pairs! - with names on folders}}
            @item{Pens/pencils for the students, fresh whiteboard markers for the teachers}
            @item{On student machines: "Images.rkt" from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | A blank @(hyperlink "http://www.wescheme.org/openEditor" "WeScheme") file])}
            @item{Class posters (List of rules, language table, course calendar)}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
             @item{Display class posters and Language Table}
             @item{Seating arrangements: ideally with clusters of desks/tables}
             @item{Optional: demo machine with projector to show the interactions and definitions windows}]}

@(language-table (list "Number" @code{+ - * / sq sqrt expt}))
}



@lesson[#:title "Introduction"
        #:duration "30 minutes"]{
          @itemlist/splicing[@item{Welcome back! Do you remember what we did in the last class?}
           @item{At the end of class, you learned something extremely important: the Circles of Evaluation, and how to write simple programs in Racket.}
           @item{Suppose I have the math expression "2 + 3." How would I draw a circle of evaluation for this? How would I convert this into code?}
           @;add image
           @item{Remember that the parentheses are like our circles; they help us put our functions and inputs into the right order.}
           @item{@think-about[#:question "How about \"2 + 3 divided by 1 - 2\"?"
                             #:answer "MAKE A PICTURE!!!!"]}
           @item{Let's do a review challenge:
                 @itemlist/splicing[@item{Turn to @worksheet-link[#:page 3 #:name "Circles-of-Evaluation-Practice-2"] in your workbooks, where it says "Circles Competition." On each row there is a mathematical expression in the first column,
                                 with room to draw the Circle of Evaluation and the Racket Code on the second and third columns.}
                           @item{Each row will be a round for this activity, so for Round 1 we'll just be looking at the first row. For this first row, we've even helped you out a little.}
                           @item{@tag[group]{You will have one minute to do the following in groups:} Draw the Circle
                                  of Evaluation, and then convert it to Racket code. @tag[group]{Everyone must have the answer written down for your group to win points. GO!}}
                           @pedagogy{@item{During the minute, walk around and see how groups are doing. Comment on good teamwork when you see it. Don't tutor much; let kids fail: they'll get it in review before the next round.
                                                      When time is up (really 1 minute: the idea is to go quickly), give them a countdown: "30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention.}}
                           @pedagogy{@item{Review and discuss. Assign points.}}
                           @item{Repeat for each additional round}
                           ]}
           @pedagogy{@item{Have kids complete the competition - give as little help as possible at this point. After the time is up, have students volunteer their answers. Review as necessary.}}]}
                                
@lesson[#:title "Creating Images"
        #:duration "35 minutes"
        #:prerequisites "Introducing-the-Design-Recipe"]{
@itemlist/splicing[
          @item{Let's talk about graphics.}
          @pedagogy{@item{On the board, draw the Circle of Evaluation for 
                                 @code{(circle 50 "solid" "red")}}}
          @item{Take a look at this Circle of Evaluation.@bitmap{images/2.2.png}}
          @pedagogy{@item{Can someone tell me how to convert this into Racket code? Copy their answer on the board.}}
          @tag[selftaught]{@item{@think-about[#:question "How would you convert this to racket code? Check your answer below."
                                                                     #:answer @code{(circle 50 "solid" "red")}]}}
          @item{This uses a new function, which you've never seen before! What is its name?}
          @item{Every contract has three parts! @pedagogy{Raise your hand if you can tell me what they are! (Name, domain, and range)}
                       @tag[selftaught]{@think-about[#:question "What are they?"
                                                    #:answer "Name, domain, and range"]}}
           @item{Can you figure out the contract for circle? Based on the example, can you tell me what's in its Domain?@pedagogy{ Follow along on the board...
                                                                                      
                @code[#:multi-line ""]{; circle: Number String String -> ...
                                       (circle 50 "solid" "red")}}}
          @item{So what's the Range? What do you think this thing is going to give us back? A Number? A String? Type it in and try it out! @tag[selftaught]{@embedded-wescheme[#:id "Images1"
                   #:interactions-text "; Try out the images!"
                   #:hide-definitions? #t]}}

           @item{What it gives back is a new Type: Image!}
           @tag[group]{@item{Now we're going to do the next step as a group.}}
           @item{@exercise{Now let's examine the contract for another function. This time around, you're not allowed to touch the keyboard until you have copied the contract into your contract table, along with the contract for circle. Once you've done that, I want to see you try to draw a rectangle! GO!} @code{; rectangle: Number Number String String -> Image}}
           @item{@exercise{Here are a few more contracts. Once again, you have to have them written down before touching the keys. You'll have five minutes to figure out how to use each of these functions to make a shape! GO!} 
                  @code[#:multi-line ""]{; ellipse: Number Number String String -> Image
                        ; triangle: Number String String -> Image
                        ; star: Number String String -> Image
                        ; radial-star: Number Number Number String String -> Image
                        ; text: String Number String -> Image}}
           @pedagogy{@item{Let kids experiment with these functions and point out interesting results to the class.}}
           @item{Going Further - If time allows, you can go further into @lesson-link[#:name "Manipulating-Images" #:label "Manipulating Images"] or @lesson-link[#:name "Making-Flags" #:label "Making Flags"]!}
           @item{According to the domain of @code{circle}, the first input needs to be a number. That means it could be 4, 5, 100 or a 10000. But it could @italic{also} be an expression that produces a number! Take a look at the following pieces of code:
                                            @code[#:multi-line ""]{(circle (* 50 2) "solid" "red")
                                                                   (star (* 10 (string-length "hello")) "solid" "green")
                                                                   (text "purple" (string-length "purple") "purple")}}
           @item{What images will they produce? See if you can figure it out, before typing it in to test your hypothesis. For practice, try converting each of these expressions into a Circle of Evaluation. Can see the connection between these expressions and the ones you did during the review game?}
           ]}

@lesson/studteach[
     #:title "Contracts and Purpose Statements"
     #:duration "15 minutes"
     #:overview "Students learn to describe functions and their behavior, using formalisms including Contracts (Domain and Range), Datatypes and Purpose Statements."
     #:learning-objectives @itemlist[@item{Given an expression, students will be able to identify the name of the function being used}
                                      @item{Given an expression, students will be able to identify how many arguments are used}
                                      @item{TODO: Given a value, students will be able to identify it's type}
                                      @item{TODO: Students will be able to distinguish between types and values}
                                      @item{TODO: Students will be able to identify the parts of a contract}
                                      @item{TODO: Students will be able to distinguish between contracts and examples}
                                      @item{TODO: Students will articulate the reason for writing purpose statements}
                                      @item{TODO: Given an example of a function being applied, students will be able to write a contract and purpose statement}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "A-SSE.1-2" "N-Q" "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{<introduce strings>}
                        @teacher{}
                       }
                @point{@student{@bitmap{images/2.2.png} Here is a Circle of Evaluation for a simple program, and below is the code for that progtam. Notice that the name of the function is still at the top of circle, and is still the first thing that follows the open parenthesis. As always, we still write the arguments to that function in order, from left to right, and then end the expression with a closing parethesis. Evaluate this program by clicking "Run".
                                                                                                                                                                                                             @embedded-wescheme[#:id "Intro to Racket and Numbers"                                             
                                  #:height 250
                                  #:hide-toolbar? #f
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #f
                                  #:definitions-text "(triangle 50 \"solid\" \"red\")"]
                                }
                        @teacher{}
                        }
                 
                 @point{@student{@activity{More examples dealing with Circle->Code}}
                        @teacher{}
                        }
                 
                 @point{@student{@activity{Here is the code to produce another shape. Change the number and click "Run". Now it try with other numbers. What does this @vocab{argument} do?
                                           
                                           @embedded-wescheme[#:id "Intro to Racket and Numbers2"                                             
                                                                   #:height 250
                                                                   #:hide-toolbar? #f
                                                                   #:hide-project-name? #t
                                                                   #:hide-footer? #t
                                                                   #:hide-definitions? #f
                                                                   #:definitions-text "(star 50 \"solid\" \"purple\")"]
                                           } 
                                  }
                        @teacher{}
                        }
                 
                 @point{@student{The number determines the radius of the star.}
                        @teacher{}
                        }
                 
                 @point{@student{@activity{Try changing "purple" to some other values. What does this @vocab{argument} do?
                                           
                                           @embedded-wescheme[#:id "Intro to Racket and Numbers3"                                             
                                                                   #:height 250
                                                                   #:hide-toolbar? #f
                                                                   #:hide-project-name? #t
                                                                   #:hide-footer? #t
                                                                   #:hide-definitions? #f
                                                                   #:definitions-text "(star 50 \"solid\" \"purple\")"]
                                           } 
                                  }
                        @teacher{}
                        }
                 
                 @point{@student{The third argument determines the color of the star.}
                        @teacher{}
                        }
                 
                 @point{@student{By now you've generated several examples of stars, using the same pattern. After experimentation, you know that @code{star} will always produce that shape when given some combination of those three argument, in the proper order. @code{star} will always behave in this way, as long as we give it the right information. In computer programming, @vocab{contracts} are a way of showing what a function expects.}
                        @teacher{}
                        }
             
                 @point{@student{A contract is a promise: if you give a function the kinds of things in its Domain, then you'll get something in the Range. If you give a pizza shop your order and some money, it promises to give you some hot, delicious pizza.}
                        @teacher{}
                        }

                 @point{@student{Same thing in Racket: if you give plus two numbers, it will give you another number back.}
                        @teacher{}
                        }

                 @point{@student{When we write a contract in Racket, it's like writing a note to ourselves about how to use the program. Just like with our soda machine, we don't care how it works when we're writing the contract. All that matters is @italic{how to use the function.}}
                        @teacher{}
                        }

                 @point{@student{Since Contracts are for use by humans (and not computers), we put a semicolon (@code{;}) at the beginning when we write them into the computer. This tells the computer to ignore the line: it's for Humans Only!}
                        @teacher{}
                        }

                 @point{@student{We'd like to create a list of contracts for ourselves, so that we can keep track of these functions and exactly how they work. Once we've practiced entering these contracts into our book, I'll show you new functions that let you work with words and pictures!}
                        @teacher{}
                        }

                 @point{@student{Are you ready? Turn to the front of your workbooks, to the MOST IMPORTANT PAGE, where it says \"Contracts\".}
                        @teacher{}
                        }

                 @point{@student{A contract specifies @itemlist[#:style 'ordered
                                                        @item{the name of the function,}
                                                        @item{the domain, and}
                                                        @item{the range.}]}
                        @teacher{}
                        }

                 @point{@student{}
                        @teacher{}
                        }

                 @point{@student{}
                        @teacher{}
                        }
]}

@lesson[#:title "Strings"
        #:duration "10 minutes"]{
@itemlist/splicing[@item{One of the following does not belong. Can you find it? 6, "cat", 0, -2, 7.5}
           @item{Why doesn't "cat" belong? Why isn't 7.5 the odd one out? Or -2? @pedagogy{Circle "cat"}}
           @item{What you have all stumbled onto is that not all values are the same. Some of them are Numbers and some are words.}
           @item{Words like "cat" are called Strings. A String is anything in quotation marks. 5 is not the same as "5"! The first is a number, and the second is a string.}
           @item{You'll notice that our math functions don't really work on Strings.}
           @item{What does it mean to add three and the word "cat"? It doesn't make sense, does it?}
           @item{Remember that Numbers in Racket are just simple programs, which evaluate to themselves. Strings work the same way! To create a String, you type in the word or words that you want, and put quotation marks on either side. The number @code{6.51} evaluates to itself. What will the string @code{"this is easy"} evaluate to? 
                 @tag[group]{With your partner:} Try creating a few strings on your own. 
                 @tag[selftaught]{@embedded-wescheme[#:id "Strings"
                   #:interactions-text ";Enter some strings!"
                   #:hide-definitions? #t]}}
           @item{Racket also gives us functions we can use to work with Strings. For example, there's a function called string-length. What do you think it does? I'll give you one hint: the contract.
                 @pedagogy{Write the contract on the board, but without the labels Name, Domain, and Range:}
                 @tag[selftaught]{@think-about[#:question "Try to write the contract for string-length and check below."
                                              #:answer @code{; string-length: String -> Number}]}
                 @pedagogy{@code[#:contract "string-length: String -> Number"]}}
           @item{@think-about[#:question "What is the domain of this function? What is the range?"
                               #:answer "The domain is Strings, and the range is Numbers"]}
           @pedagogy{@item{Now that the students have written down the contract, let them turn on their monitors and experiment, see if they can figure out what string-length does!}}
           @tag[selftaught]{@item{Now that you have written out the contract, turn on your monitor and see if you can figure out what string-length does!}}]}



@lesson[#:title "Closing"
        #:duration "5 minutes"]{
    @pedagogy{@itemlist[@item{Who can tell us one thing we learned today?}
                             @item{Who saw someone else in the class do something great?}
                             @item{Cleanup, dismissal.}]}

    @tag[selftaught]{@itemlist[@item{Think about what you learned today.}
                               @item{Remember contracts and how to make them.}
                               @item{Think of strings and what differentiates a string from a different type.}
                               @item{Think about images and what goes into creating an image.}
                               @item{Have an awesome day!}]}
}


@copyright[]
