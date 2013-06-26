#lang curr/lib

@title{Unit 1: Videogames and Coordinate Planes}

@declare-tags[group pedagogy management]

@unit-overview/auto{
  @unit-descr{Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.}
}

@lesson/studteach[
     #:title "Introduction"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[@item{}]
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
             @point{@student{Welcome to Bootstrap! In this course, you'll be learning a new @vocab{programming language} - a way to tell computer exactly what you want them to do. Just likeEnglish, Spanish or French, a programming language has it's own vocabulary and grammar that you'll have to learn. Fortunately, the language you'll be using here has a lot in common with simple math that you already know!}
                     @teacher{@management{Introduce the teaching staff. Give some background: age, where you're from, something surprising about yourself, favorite food, etc. Anything to allow kids to connect. Ask kids for their names! Set expectations and rules for the class.}
                               Connect the material that's to come with things students already know:
                              @itemlist[@item{Talk to them about what makes a language - especially if you have students who speak a second or third language}
                                         @item{Programming is very much a language, with it's own syntax, semantics, etc}
                                         @item{Ask students about their favorite videogames. Be open about the scale of a modern game: they cost millions of dollars, are build by huge teams of programmers and artists, and are developed over years.}
                                         @item{Set expectations about what can be accomplished in a single, introductory programming class.}]}
                     }
              ]
         }

@lesson/studteach[
     #:title "Dissecting a Demo"
     #:duration "10 minutes"
     #:overview "Play a simple game, then take it apart and figure out what's going on in the computer."
     #:learning-objectives @itemlist[@item{Model a simple system}]
     #:product-outcomes @itemlist[@item{In workbooks, students create a data model that describes a simple videogame}]
     #:standards (list "MP.1" "MP.7")
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
          @point{@student{Let's begin by exploring a simple videogame, and then figuring out how it works. Open @(hyperlink "http://www.wescheme.org/run.jsp?publicId=iK7rkNlvcS" "this link") in a new window. When you click "Run", be sure to read the directions at the top of the screen so you know how to play!}
                 @teacher{@management{Show the kids Ninjacat. Be sure to end on a frozen frame of the game, so the whole class can see the same image.}}
                 }
          
          @point{@student{This game is made up of @italic{characters}, each of which has it's own behavior. The Ruby moves from the right to the left, as does the Dog. NinjaCat only moves when you hit the arrow keys, and she can move left, right, up and down. We can figure out how the game works by first understanding about how each character works.}
                 @teacher{}
                 }
          
          @point{@student{@activity{@bitmap{images/game-table1.png} Turn to @worksheet-link[#:name "How-Does-Ninja-Cat-Work" #:page 1] in your workbook. Here we have a table, which we'll use to reverse-engineer NinjaCat and see how it works. Fill out the first column with a complete list of all things in the game.}}
                 @teacher{This can be a team activity. Solicit a few examples from students, to make sure they understand what's being listed here: nouns like "the cat", not verbs like "jumping". @management{During this activity, walk around and see how groups are doing. This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }}
                 }
          
          @point{@student{Did you list all four moving characters? What else is in the game? Is the background a part of the game? The score?}
                 @teacher{@management{Have students come up to the board, and fill in the table with what they've found. If time is short, call on students and have them tell you what to write.}}
                 }
          
          @point{@student{@activity{@bitmap{images/game-table2.png}We also need to think about what is @italic{changing} when we play the game. What about the Ruby? Does it get bigger? Does it change color? Does it spin around? The only thing that changes about the Ruby is its @italic{position}! Everything else about it is the same. What about the Dog? The Cat? Fill in the rest of the second column, listing everything that changes about each character.}}
                 @teacher{}
                 }
                            
          @point{@student{Did you notice that the Dog, Ruby, Cloud and Cat only change position, and nothing else? What about the Background - it doesn't change at all, so we can @italic{leave that cell in table black!}. Did you notice the Score changes value? You'll want to add that to your table, too!}
                 @teacher{@management{Quickly fill in the second column on the board. Assign scores.}}
                 }
          ]}

@lesson/studteach[
     #:title "Coordinate Planes"
     #:duration "15 minutes"
     #:overview "Students must use the Cartesian plane to describe the location of characters in a picture."
     #:learning-objectives @itemlist[@item{Students apply the number line as a tool for objectively defining location, first identifying how to apply it to describe the position of a character onscreen in one dimension. This understanding is extended to two dimensions, ultimately motivating the use of a coordinate grid.}]
     #:product-outcomes @itemlist[@item{Students identify the coordinates of characters in a picture}]
     #:standards (list)
     #:materials @itemlist[@item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Dog"] and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
                            @item{Student Workbooks, and something to write with}]
     #:preparation @itemlist[@item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Are there locations that can be described using one coordinate system, that cannot be described using another? Can any valid coordinate system can be perfectly mapped to any other valid coordinate system?}]}
                )
        ]{
  @points[
      @point{@student{@bitmap{images/number-line.png}Computers use numbers to represent a character's position onscreen, using number lines as rulers to measure the distance from the bottom-left corner of the screen. For our videogame, we will place the numberline so that the screen runs from 0 (on the left) to 640 (on the right). We can take the image of the Dog, stick it anywhere on the line, and measure the distance back to the lefthand edge. Anyone else who knows about our number line will be able to duplicate the exact position of the Dog, knowing only the number. What is the coordinate of the Dog on the righthand side of the screen? The center? What coordinate would place the Dog beyond the lefthand edge of the screen?}
              @teacher{The key point for students here is @italic{precision} and @italic{objectivity}. There are many possible correct answers, but students should understand why any solution should be accurate and unambiguous. This requires students to propose solutions that share a common "zero" (the starting point of their number line) and direction (literally, the direction from which a character's position is measured). @management{Have students discuss this. If time allows, have a student leave the room and let other students come up with ways to write down where the dog is on the board. Then remove the dog, call in the other student, and have the class direct them using only what they've written down.Try positioning the characters at different places on the line, and have students tell you what their coordinates are. Try giving them verbal descriptions (e.g. "The center of the screen", "Off the righthand side of the screen", etc.) and have them translate those into coordinates.}}
              }

      @point{@student{@bitmap{images/cat-coordinates.png}By adding a second number line, we can locate a character anywhere on the screen in either dimension. The first line is called the x-axis, which runs from left to right. The second line, which runs up and down, is called the y-axis. A 2-dimensional @italic{coordinate} consists of both the x- and y-locations on the axes. Suppose we wanted to locate NinjaCat's position on the screen. We can find the x-coordinate by dropping a line down from NinjaCat is and read the position on the number line. The y-coordinate is found by running a line to the y-axis.}
              @teacher{A coordinate represents a single point, and an image is (by definition) many points. Some students will whether a character's coordinate refers to the center of the image, or one of the corners. In this particular program, the center serves as the coordinate - but other programs may use another location. The important point in discussion with students is that there is flexibility here, @italic{as long as the convention is used consistently}. @management{If time allows, invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations. Have students identify the coordinates at the corners of the screen. For additional practice, have students bisect each side of the screen and label the midpoints.}}
              }
      @point{@student{When we write down these coordinates, we always put the x before the y (just like in the alphabet!). Most of the time, you'll see coordinates written like this: (200, 50) meaning that the x-coordinate is 200 and the y-coordinate is 50.}
              @teacher{}
              }

      @point{@student{Depending on how a character moves, their position might change only along the x-axis, only along the y-axis, or both. Look back to the table you wrote in the workbook (@worksheet-link[#:page 1 #:lesson "Ninja-Cat-Demo" #:name "How-Does-Ninja-Cat-Work"]). Can NinjaCat move up and down in the game? Can she move left and right? So what's changing: her x-coordinate, her y-coordinate, or both? What about the clouds? Do they move up and down? Left and right? Both?}
              @teacher{}
              }
      
      @point{@student{@activity{@bitmap{images/game-table3.png}Fill in the rest of the table, identifying what is changing for each of your characters.}}
              @teacher{}
              }
      
      @point{@student{@activity{Turn to @worksheet-link[#:page 2 #:name "Ninja-Cat-Coordinates"] in your game planning workbook, and look at the project sheet that has a picture of the NinjaCat game. What are the coordinates at the bottom-left corner of the screen? Top-right? Center? For practice, label the coordinates at the midpoint of @italic{each side} of the screen, then label the coordinates of each of the characters.}}
              @teacher{}
              }
               ]
   }

@lesson/studteach[
     #:title "Brainstorming"
     #:duration "15 minutes"
     #:overview "Students select the theme and characters for their videogame"
     #:learning-objectives @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{In workbooks, students complete the Videogame Design Worksheet}]
     #:standards (list)
     #:materials @itemlist[@item{}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        
@points[
        @point{@student{On @worksheet-link[#:page 3 #:name "Elements-of-a-Videogame"], you'll find a planning template for you to make your own game. Just like we made a list of everything in the NinjaCat game, we're going to start with a list of everything in your games.}
                @teacher{@management{Put your names at the top of this page.}}
                }
         
        @point{@student{To start, your game will have with four things in it: 
                        @itemlist[
                                  @item{A Background, such as a forest, a city, space, etc.}
                                   @item{A Player, who can move when the user hits a key.}
                                   @item{A Target, which flies from the right to the left, and gives the player points for hitting it.}
                                   @item{A Danger, which flies from the right to the left, which the player must avoid.}]}
                @teacher{Have students walk through some sample themes, to make sure they understand the format of the game. For example: A football game might have a quarterback for the player, a rival player for the danger, and a football as the target. A jungle game might have a monkey as the player, a snake as the danger, and bananas as the target.}
                }
        
        @point{@student{@activity{Now it's time to get creative! Fill out @worksheet-link[#:page 3 #:name "Elements-of-a-Videogame"] in your workbook for @italic{your} game, using your own player, target and danger.}}
                @teacher{@management{Be sure to consult with every team. A lot of students will have trouble fitting their ideas into this format, or they'll struggle with coordinates. Be clear about what can and cannot be done! (e.g. - no 3d games, joysticks, multiplayer games, etc. Hint: students who have a well-worded description of their images will be happier with any images you could find them. Try searching for "Person" versus "Jogger", for example.}}
                }
        ]}


@lesson/studteach[
     #:title "Order of Operations"
     #:duration "20 minutes"
     #:overview "Students identify the order of operations for complicated arithmetic expressions through diagramming (circles) and evaluating (the numerical answer). This lesson introduces students to the Circle of Evaluation, which is a sentence diagramming tool for arithmetic expressions. This is a powerful way to understand Order of Operations, as it forces students to focus on the structure of expressions over their computed result."
     #:learning-objectives @itemlist[@item{Students will be able to explain why arithemetic expressions require structure}
                                     @item{Students will be able to identify the order of operations in an expression that includes adding, subtracting, multiplying and dividing}
                                     @item{Given a Circle of Evaluation, students will be able translate the expression into the arithmetic expression it represents}
                                     @item{Given an arithmetic expression, students will be able to complete a partially-finished Circle of Evaluation for the same expression}
                                     @item{Given a bank of Circles of Evaluation and Arithmetic expressions, students will be able to match them}
                                     @item{Students will be able to translate the structure of an arithmetic expression using the Circles of Evaluation}]
     #:product-outcomes @itemlist[@item{Students convert several arithmetic expressions between multiple representations}]
     #:standards (list "A-SSE.1-2" "N-Q"  "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Have students practice translating very simple (one-operation) expressions into simple (one-circle) Circles of Evaluation. By choosing the numbers in these examples carefully, you can gradually introduce nesting by replacing a number in one expression with the Circle of Evaluation for another expression that evaluates to the same number. @italic{Replace the 7 in @code{7+5} with the Circle for @code{10-3}.}}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first opportunity to expose students to core vocabulary words, so be sure to use words like @bold{function}, @bold{value} and @bold{expression} carefully and consistently. Ask students to identify the parts of a Circle of Evaluation, and push them to use the vocabulary as well.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Math is a language, just like English, Spanish, or any other language. We use nouns, like "bread", "tomato", "mustard" and "cheese" to describe physical pbjects. Math has @vocab{values}, like the numbers "1", "2" or "3", to describe quantities. Humans also use verbs like "toast", "slice", "spread" and "melt" to describe operations on these nouns. Mathematics has @vocab{functions} like addition and subtraction, which are operations performed on numbers. Just as you can "slice piece of bread", a person can also "add four and five".
                        @activity{@math{4+5} @vocab{evaluates to} @math{9}. What does @math{8*4} evaluate to? What does @math{20-16} evaluate to? <other examples>}                                   }
                        @teacher{Students should begin to look at math as a @italic{language}, and start thinking about ambiguity, syntax and grammer of math.}
                        }
                 @point{@student{A @vocab{mathematical expression} is like a sentence: it's an instruction for doing something. If you were to write instructions for making a sandwich, it would matter very much which came first: melting the cheese, slicing the bread, spreading the mustard, etc. The order of functions matters in mathematics, too. If someone says "four plus two minus one", they could mean several things:
                                @itemlist[@item{Add four and two, then subtract one @math{(4+2) - 1}}
                                          @item{Add four to the result of subtracting one from two @math{4 + (2-1)}}]
                        @activity{Write an expression of your own that can mean several things.}}
                        @teacher{}
                        }
                 
                 @point{@student{@bitmap{images/PEMDASTriangle.png}Depending on which way you read, or @vocab{evaluate} the expression, you might have a very different result! Mathematicians didn't always agree on the order to evaluate each operation, which could make things very confusing. Fortunately, the world of math has come to an agreement on a common set of rules for how to evaluate these expressions:}
                         @teacher{}}
                 @point{@student{When evaluating an expression, we begin by applying the operations written at the top of the pyramid (multiplication and division). Only after we have completed all of those operations can we move down to the lower level. If both operations are present (as in @math{4+2-1}), we @vocab{apply} them in the order they appear in the pyramid (addition first).
                          @activity{In what order should we apply the functions in the following example? 
                                    @math{19 \div 2 * 11 - 7 + 8}
                                    @itemlist[#:style 'ordered
                                              @item{@math{+ \div * - }}
                                              @item{@math{* \div - +}}
                                              @item{@math{\div * + -}}
                                              @item{@math{* \div + -}}]
}
                          @activity{Write down one reason why it is important to have rules about the order of operations.}}
                         @teacher{}
                         }
                
                @point{@student{All of these operations are examples of things called @vocab{functions}. A function is an operation that takes in certain kinds of values and produces a new value. You've used the addition function thousands of times, with lots of different numbers! We can diagram the order of operations in an expression using the @italic{Circle of Evaluation.}}
                        @teacher{@management{This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to draw examples!}}
                        }
                        
                @point{@student{@bitmap{images/FixedCircle.png} Here you can see an example of a Circle of Evaluation, for the math expression @math{4-5}. The Circles of Evaluation are useful for diagramming the order of operations inside an expression, so we can see the structure that's going on inside. All Circles of Evaluation have two rules:
                       @bannerline{@bold{Rule 1: Each circles must have one function, which we will write at the top of the circle.}}
                       @bannerline{@bold{Rule 2: The numbers are written below, from left to right.}}
                       @activity{@bitmap{images/CircleBug.png}This Circle of Evaluation is breaking one of these rules. Which one??}
                       }
                @teacher{}
                }
                @point{@student{@activity{Try drawing the Cirlce of Evaluation for the following expressions:
                                          @itemlist[#:style 'ordered
                                                    @item{@math{6*4}}
                                                    @item{@math{7-10}}
                                                    @item{@math{6*4}}
                                                    @item{@math{\frac{351}{-1} }}]
                                          }}
                        @teacher{It's important for students to view the Circles of Evaluation as "just another way or writing arithemetic". Have students discuss whether associativity and commutativity still matter here (they do).}
                        }

                @point{@student{@bitmap{images/Nesting.png}To use use multiple functions in the same expression, we can combine Circles of Evaluation together.  Look at the Circle of Evaluation you've written for @math{351 / -1}. We already know that the Circle for @math{4 - 5} will evaluate to -1, so we can @italic{replace the number with the expression.} Does this change what the expression evaluates to?
                                @activity{<Partially-completed Circle of Evaluation is shown next to an arithmetic expression. Students are asked to complete the Circle by filling in what is missng>}
                      }
                        @teacher{From this point forward, the Circles of Evaluation are your assessment tool for Order of Operations. Quizzing students by asking them to correctly evaluate an expression is fraught with false negatives, as many student might get the order right but still have problems with basic calculation. This method is also vulnerable to Commutativity, since a student will correctly evaluate @math{1*2+2} even if they get the order of operations wrong! Circles of Evaluation have neither of these flaws, as they put them emphasis where it should be: exercising a students' ability to see the structure inside the arithemetic.}
                        }
                @point{@student{@bitmap{images/NestedCircle.png}How would evaluate this Circle of Evaluation?
                                 @itemlist[@item{We know we are multiplying because that's the function at the top of the Circle} 
                                           @item{The Number 6 comes first, because it's on the left-hand side}
                                           @item{On the right-hand side is @italic{the result of adding 4 and 5}, because that expression is a separate circle altogether.}
                                           @item{@math{4 + 5} evaluates to 9, and @math{6 * 9} is 54.}]
                        @activity{@bitmap{images/NestedCircle2.png}Convert this Circle of Evaluation into a arithmetic expression.}    
                        @activity{Match the following Circles of Evaluation with the corresponding arithmetic expressions <insert examples>.}    
                        }
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic expressions and then convert them into Circles, or giving them Circles and having them translate them back into arithmetic.}
                        }
             ]
         }

@lesson/studteach[
     #:title "Intro to Programming"
     #:duration "15 minutes"
     #:overview "Students are introduced to the programming environment"
     #:learning-objectives @itemlist[@item{Students will be able to identify the Interactions and Definitions window}
                                      @item{Students will be able to enter and evaluate simple arithmetic expressions in the Interactions window}
                                      @item{Students will be able to convert Circles of Evaluation into correctly-formed programs}
                                      @item{Students will be able to explain an 'unbounded identifier' error message}
                                      @item{Students will be able to explain the purpose of error messages}
                                      @item{Given a Circle of Evaluation, students will be able to complete a partially-written program}
                                      @item{Given a bank of Circles of Evaluation and programs, students will be able to match them}]
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
        @points[
                @point{@student{Open the programming tool of your choice: If you've installed, DrRacket, double-click the application to launch it. If you are using @(hyperlink "http://www.wescheme.org" "WeScheme.org"), enter your username and password to log in, then click "Start a New Program".}
                        @teacher{@management{Have the students look at the editor on their computers. Refer to overhead projector as necessary.}}
                        }
                 
                @point{@student{@bitmap{images/wireframeIDE.png}This screen is called the @vocab{editor}, and it looks something like the diagram you see here. There are a few buttons at the top, but most of the screen is taken up by two large boxes: the @vocab{Definitions window} at the top and the @vocab{Interactions window} at the bottom.}
                        @teacher{The Definitions window is where programmers define values and functions in their program, while the Interactions window allows them to experiment with those values and functions. This is analogous to writing a series of function definitions on a blackboard, and having student evaluate expressions using those function on scrap paper. As students are not yet defining values of their own, it is not important that students understand this distinction right now.}
                        }
                
                @point{@student{A program is a @vocab{legal expression} that, when evaluated, produces a value. You've been writing programs using mathematical expressions since you first learned how to add! Just as in English, there are rules that determine whether a sentence makes sense. Programs have rules too!  A program can be very complicated, but it doesn't have to be: the simplest programs of all are just Numbers.}
                        @teacher{@management{Draw students' attention to the Language Table (see Lesson Overview for Unit 1), which currently sits empty. Add "Numbers" to the Types section of the language table.}}
                        }
                @point{@student{@bannerline{@bold{Rule 1: All values are legal expressions.}}
                                 @activity{What do you think @code{4} will evaluate to? 
                                              @itemlist[@item{Enter 4 in the Definitions window, and click "Run". You will see the value @code{4} appear in the Interactions window below.}
                                                         @item{Type 10 on a @italic{new line} in the Definition window and click "Run". The computer now has to evaluate two separate programs, and you will see @code{4 10} printed out below.}
                                                         @item{We can also enter programs directly into the Interactions window. Enter a number down below, and hit "Return" instead of clicking Run. You should see that number printed out, just as if you'd written it in the Definitions window and clicked "Run". Now click "Run": what happens?}
                                                         @item{Try evaluating numbers, like @code{10345017}, or negative numbers, like @code{-2}. Is there a limit to how big a number can be? What happens if you write a decimal? What happens when you click on a decimal, like @code{1.5}? You get a new type of number, a fraction, like @code{3/4}.}]
                                              
                                @embedded-wescheme[#:id "Intro to Racket and Numbers"                                             
                                  #:height 200
                                  #:width "100%"
                                  #:hide-toolbar? #f
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #f
                                  #:definitions-text "4"]}
                                }
                        @teacher{The editing environment evaluates all fractions and returns them as decimals by default. This can be surprising to students at first, so you may want to take a moment to explain what's going on, and show them that these decimals can be converted back to fractions just by clicking on them.}
                        }
           
                
                @point{@student{@activity{The computer obviously knows about Numbers, but what happens if you type in something that it @italic{doesn't} know about? Will it complain? Crash? Guess? Try asking the computer to evaluate @code{dog} in the Interactions window.
                              @embedded-wescheme[#:id "Exploring bugs"                                                                                   
                                  #:height 100
                                  #:width "100%"
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
                         
                @point{@student{The Circles of Evaluation are also easy to convert into computer programs. To translate a Circle of Evaluation into a program, begin with an open parenthesis @code{(}, and then the function written at the top of the circle. Then translate the inputs from left to right in the same way, adding a closing parenthesis @code{)} when you're done. This process gives us the second rule for @vocab{expressions:}  
                                                                                                                                                                                              @bannerline{@bold{Rule 2: Each open parenthesis is followed by @italic{one} function, then by one or more legal expressions, and finally by a closing parenthesis.}} <ANIMATED GIF?>
                                 @bitmap{images/FixedCircle.png}Here is the code for this Circle of Evaluation: @code{(- 4 5)}
                                 @activity{@itemlist[@item{Enter this code into the Interactions window and hit Return.}
                                                      @item{What happens if you have too many parentheses? Too few?}
                                                      @item{What if you forget to put a space between a function and one of the inputs? Experiment with each of these bugs, and see what kind of error message comes back.}]
                                 @embedded-wescheme[#:id "Circle1"     
                                  #:height 100
                                  #:width "100%"
                                  #:hide-toolbar? #t
                                  #:hide-project-name? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:interactions-text "(- 4 5)"]}}
                        @teacher{Have students practice converting simple Circles of Evaluation into code.}
                        }   
                @point{@student{@bitmap{images/NestedCircle.png}When a Circle of Evaluation has other circles inside of it, the translation still follows the same rules: each Circle requires a new set of parentheses: @code{(* 6 (+ 4 5))}
                                 @activity{@itemlist[@item{Try entering this code into the Interactions window. What should the program evaluate to when you hit Return?}
                                                     @item{Practice converting other Circles of Evaluation you've drawn into code.}]}}
                        @teacher{}
                        }
               
                @point{@student{@bannerline{@bitmap{images/ExpressionDiagram.png}}All of the expressions that follow the function name are called @vocab{arguments} to the function.}
                        @teacher{}
                        }
                ]}


@lesson/studteach[
     #:title "Review"
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
        @points[@point{@student{}
                        @teacher{@management{Make sure student names are on page 3. Take page 3 itself, or take photos of page 3, to prep game images for a later Unit. Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds!}}}
                 @point{@student{}
                         @teacher{@management{TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with. For more instructions on setting up the game files, read the @(hyperlink "../../resources/teachers-guide/teachers-guide.html#addingimages" "Coding Instructions") document.}}}
               ]
         }

@copyright[]
