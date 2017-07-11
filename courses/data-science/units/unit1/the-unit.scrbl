#lang curr/lib

@title{Unit 1: Introduction to Pyret}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students write simple programs in Pyret, and learn about Numbers, Strings, Expressions, Operations, and Functions.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Introduction"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[
                                @item{
                                    Show students the @(hyperlink "../resources/OpeningQuestions.pdf" "opening questions"), either as a handout or on posters set up around the room.
                                }
                             ]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{
                    @student{
                            Welcome to Bootstrap: DataScience! Take a few minutes to look at the @(hyperlink "../resources/OpeningQuestions.pdf" "opening questions") we have prepared for you, and choose a topic that interests you.  
                            @activity{
                                @itemlist[
                                    @item{
                                        Once you've selected your topic, break into groups of no more than 4 and choose a question you'd like to answer.
                                    }
                                    @item{
                                        Spend a minute or two discussing your answer, and explaining @italic{why} you answered the way you did. Does everyone in your group have the same answer? Why or why not?
                                    }
                                    @item{
                                        What kind of @italic{measurement} would use to determine if your answer is right or not? What data would you need?
                                    }
                                    @item{
                                        Complete Page 1 in your Student Workbook, by copying down the question, your answer, and what you discussed with your group.
                                    }
                                ]
                            }
                    }
                    @teacher{
                            Have students self-select into groups (no larger than 4), with each group choosing an Opening Question (or writing their own). After they've had time to discuss, have a few students share back what they talked about.
                    }
            }
            @point{
                    @student{
                             What's the greatest movie of all time? The best quaterback? Is Stop and Frisk racially biased? These question quickly turn into a discussion about data - how you measure it and how you interpret the results. In this course, you'll learn how to use data to ask and answer questions like this.  The process of learning from data is called @vocab{Data Science}. Data science techniques are used by scientists, business people, politicians, sports analysts, and hundereds of other different fields to ask and answer questions about data.
                    }
                    @teacher{
                            You can motivate relevance of data science by using additional examples that relate to student interests.  Here are a few:
                            @itemlist[
                                    @item{@(hyperlink "http://motherboard.vice.com/read/a-data-scientists-emoji-guide-to-kanye-west-and-taylor-swift" "Emojis")}
                                    @item{@(hyperlink "https://mic.com/articles/131092/these-students-are-using-data-science-to-predict-which-rap-songs-will-become-hits#.0d3wkhxQE" "Pop Music")}
                                    @item{@(hyperlink "http://www.kdnuggets.com/2016/06/politics-analytics-trump-clinton-sanders-twitter-sentiment.html"  "Election Analysis")}
                                    @item{@(hyperlink "http://fivethirtyeight.com/" "Polling")}
                                    @item{@(hyperlink "http://games.espn.com/fba/tools/projections" "Predicting Sports Performance")}
                                    @item{@(hyperlink "http://www.salon.com/2015/07/18/how_big_data_can_help_save_the_environment_partner/" "Environmental")}
                            ]
                    }
             }
             @point{
                    @student{
                            In order to ask questions from data, we'll use a @vocab{programming language}. Just like any human language (English, Spanish, French), programming languages have their own vocabulary and grammar that you will need to learn. The language you'll be learning for data science is Pyret, which lets you ask and answer questions quickly from very large data sets.
                    }
                    @teacher{
                            Set expectations for the class.  This course is an introduction to programming and data science, so some of the questions students want to answer may be out of scope.  However, this course will give students a foundation to answer their more complicated questions later in their data science education.
                    }
             }
             @point{
                    @student{
                            Begin by opening a web browser, and going to @(hyperlink "http://code.pyret.org" "The Pyret Editor"). Hit the "log in" button, and sign in with your Google account information, then choose "Start Coding".
                    }
                    @teacher{
                            Each student (or pair of students) should have a Google Account.    
                    }
             }
             @point{
                    @student{
                            @bitmap{images/wireframeIDE.png}
                            This screen is called the @vocab{editor}, and it looks something like the diagram you see here. There are a few buttons at the top, but most of the screen is taken up by two large boxes: the @vocab{Definitions area} on the left and the @vocab{Interactions area} on the right.

                            For now, we will only be writing programs in the Interactions area.
                    }
                    @teacher{
                            The Definitions Area is where programmers define values and functions in their program, while the Interactions Area allows them to experiment with those values and functions. This is analogous to writing a series of function definitions on a blackboard, and having student evaluate expressions using those function on scrap paper. As students are not yet defining values of their own, it is not important that students understand this distinction right now.  For now, we will work only with the Interactions area.
                    }
             }
     ]
 }

@lesson/studteach[
     #:title "Numbers, Strings & Operators"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{Begin by typing @code{4} into the Interactions area, then hit 
                                        Return.  You should see the value 4 appear on 
                                        the next line in the Interactions area.
                            }

                            Congratulations, you've written your first (very simple) program!  When a program is run, the computer will run that program to produce a @vocab{value}.  Values are how the computer represents
                            data.  In this case, the computer's job is easy because the program is already a value!  When we hit Run, we @vocab{evaluate} the program, which is another way of saying "give me the value that is produced by this program".
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            @activity{
                                @itemlist[
                                    @item{
                                         Type 10 in the Interactions area and hit "Return".  Now the 
                                         value @code{10} appears in the Interactions area.
                                    }
                                    @item{
                                        Try evaluating numbers, like @code{10345017}, or negative 
                                        numbers, like @code{-2}. Is there a limit to how big a number can be?
                                        What happens if you write a decimal? What happens when you click on
                                        a decimal, like @code{0.75}? You get a new type of number, a 
                                        fraction, like @code{3/4}.
                                    }
                                ]
                            }
                    }
                    @teacher{
                            The editing environment evaluates all fractions and returns them as decimals by default. This can be
                            surprising to students at first, so you may want to take a moment to explain what's going on, and 
                            show them that these decimals can be converted back to fractions just by clicking on them.  The 
                            environment uses standard annotations for repeating, non-terminating decimal expressions and 
                            properly handles expressions like @math{(\sqrt -1)}.  If you want to work with those kinds of 
                            numbers in your class, enter them to get familiar with how they appear in the Interactions area.             
                    }
             }
             @point{
                    @student{
                            Every value has a  @vocab{Type}.  Each of the values produced by the programs you just wrote are Numbers, but there are other types as well. One of these types is called a @vocab{String}.  A String
                            is a sequence of characters (letters, numbers, symbols) in between a pair of quotation marks.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                            @item{
                                                 Begin by typing @code{"Ahoy, World!"} into the Interactions area, then hit 
                                                 Return.  You should see the value "Ahoy, World!" appear on 
                                                 the next line in the Interactions area.
                                            }
                                            @item{
                                                 Try to type your name within a pair of quotation marks, then hit Return.
                                            }
                                            @item{
                                                 What do you notice about the way Pyret displays Strings on the screen?
                                            }
                                            @item{
                                                 CHALLENGE:  Type this program into the Interactions area:  @code{"4"}
                                                 Is this a String or a number?
                                            }
                                            @item{
                                                 CHALLENGE:  What happens when you leave off the second quotation mark?  Type this
                                                 code into the Interactions area and hit Return: @code{"I love writing programs}
                                            }
                                    ]
                            }
                    }
                    @teacher{
                            The program @code{"4"} is a String.  Even though this string only contains the character for the number 4,
                            it is a String because it is between quotation marks.  Data scientists care about this distinction, because
                            we often run into data that is represented in a String but should be considered a number by Pyret.  This will
                            become more relevant later in the course, for now stress to the students that anything within quotations is 
                            a String.  Pyret is helpful in detecting strings because it highlights them green.
                    }
             }
             @point{
                    @student{
                            Notice when you leave off the second quotation mark, @code{"I love writing programs} is NOT
                            printed on the next line;  instead, we get a big red box.  This big red box is an @vocab{error message}.
                            The editor gives us error messages when a program can't be properly evaluated.


                            Error messages a way for the computer to help you find
                            small mistakes in your code.  In the case above,
                            without the second quotation mark the computer can't figure out when the end of the String is, which makes
                            evaluation impossible.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Fix the error described in the error messages by typing @code{"I love writing programs"}
                                    and hitting the Return key.
                            }
                    }
                    @teacher{
                            It is crucial to encourage students to read error messages and debug their code.  Often, when a student
                            encounters an error message for the first time, they will throw their hand up and tell the teacher 
                            "I did something wrong".  When helping students with this, make sure to ask questions about the answer 
                            rather than fixing code for them.
                    }
             }
             @point{
                    @student{
                            We've successfully written and evaluated programs, but writing programs that only just repeat values would be boring.  Luckily, Pyret allows us to @italic{compute} values using @vocab{expression}s.  One of the great things about Pyret is that these expressions are similar to the ones you've seen
                            in math classes.
                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{Type @code{2 + 5} into the Interactions area. Notice the spaces between the numbers and the plus sign! Then hit Return.  You should see the value @code{7} printed on a new line.
                            }
                    }
                    @teacher{
                            Some students may encounter syntax errors because they did not put white space between the values and the operator.  We address this error in the next point.
                    }
             }
             @point{
                    @student{
                            Let's break this down.  @code{2 + 5} is an expression, and this expression is made up of values
                            and an @vocab{operator}.  Here the operator is +, which you've seen in math classes:  adding two values to create a new value.

                            Now try leaving out the spaces around the plus sign. We get an error! This error happened because Pyret needs you to write spaces between numbers and operators.

                    }
                    @teacher{
                            Pyret requires this whitespace for code readability, and to remove ambiguity when dealing with negative numbers.  For example, without the white space rule, the program @code{5+-2} is hard to understand.
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    What other operations can we use?  Type each of these programs into the Interactions area. If you get an error message, read it out loud and see if you can figure out what it means.
                                    @itemlist[
                                            @item{
                                                    @code{3 - 8}
                                            }
                                            @item{
                                                    @code{1.5 * 3}
                                            }
                                            @item{
                                                    @code{100 / 5}
                                            }
                                            @item{
                                                    @code{8 + -2}
                                            }
                                            @item{
                                                    @code{2.3 * 7}
                                            }
                                            @item{
                                                    @code{6 / 0}
                                            }
                                            @item{
                                                    @code{2 + "hello"}
                                            }              
                                    ]
                            }
                    }
                    @teacher{
                            Each of these programs should compile and execute correctly except for the last two, which
                            should raise errors.  Possible errors for the other programs should be whitespace/syntax related. 
                    }
             }
             @point{
                    @student{
                            Notice that the last two programs give errors.  We know that Pyret gives errors whenever it can't evaluate a program.
                            @itemlist[
                                    @item{
                                            In @code{6 / 0} we know that you can't divide any number by 0!  In this case,
                                            Pyret obeys the same rules as humans, and gives an error.
                                    }

                                    @item{
                                            In @code{2 + "hello"}, we're trying to add a String to a Number.  This doesn't
                                            make sense to us, and it doesn't make sense to Pyret either;  Pyret can only add
                                            Numbers to Numbers with the + operation.
                                    }
                            ]
                    }
                    @teacher{
                                    
                    }
             }
             @point{
                    @student{
                            By now you've seen 4 different kinds of errors:  What are they caused by?

                            @itemlist[
                                    @item{
                                            Leaving off quotation marks for String values
                                    }
                                    @item{
                                            Missing whitespace between operators and values
                                    }
                                    @item{
                                            Division by zero
                                    }
                                    @item{
                                            Adding non-Numbers to Numbers.
                                    }
                            ]
                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            Error messages are the computer's way of giving you a hint on what went wrong. The most important part of using an error message is reading the message editing the program to fix the errors.
                            @activity{
                            Turn to @worksheet-link[#:name "Expressions-Values-Errors"] in your student workbook, and identify whether the expressions you see will produce an error or a value. In either case, write the resulting value or error messages that you think the computer will respond with.
                            }
                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            @code{+}, @code{-}, @code{*}, @code{/} all work the way they do in math class. Parentheses work pretty much the same way, but with one
                            important exception!

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Type @code{(2 * 3) + 5} into the Interactions area, and hit Run.  It should produce 11.
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            Parentheses allow you to write more complex expressions.  In this example, Pyret evaluates what is inside the parentheses: @code{2 * 3}. Then, it uses this value in the larger expression.  So @code{(2 * 3) + 5} becomes @code{6 + 5}, which is evaluated to 11.  @bold{Note:} There is one difference between the way parentheses work in math class, and the way they do in Pyret! @italic{In Pyret, any time you have more than one operation, you must include parentheses.}
                    }
                    @teacher{
                    
                    }
             }
        ]
   }

@lesson/studteach[
     #:title "Defining Variables"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
                @point{
                        @student{
                            In Pyret, you can define @vocab{variable}s with the @code{=} sign, just like in math class. You're probably used to seeing variables @code{x, y, z}, etc.  In Pyret, you can use meaningful to define variables, which will make your code readable and easy to change.
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Suppose you want to throw a pizza party for a class of 16 students. We need to buy one of each of these per student:
                                        @itemlist[
                                                @item{
                                                        1 Slice of Pizza : $2.50
                                                }
                                                @item{
                                                        1 Plastic Plate : $0.20
                                                }
                                                @item{
                                                        1 Soda : $0.98
                                                }
                                        ]
                                        What code would you write, to compute the total cost of the party?
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                The particular items for the party do not matter, feel free to change them as long as they are supplies where each student gets one of each item, or change the number of students to be the number of students in your class.
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                Now suppose that you want to include the teacher in the pizza party (teachers like
                                pizza too!)  How would you rewrite this program to compute the cost of paying 
                                for supplies for 16 students and 1 teacher?

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Rewrite your program to get the new cost of a pizza party for 17 people.
                                }
                        }
                        @teacher{
                                Force students to manually change each @code{16} to a @code{17}.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Add this line of code to the top of your definitions area:
                                        @code[#:multi-line #t]{
                                            party-people = 17
                                        }
                                        Then, substitute all of the instances of @code{17} with @code{party-people} in your expression to compute the cost of the party.
                                }
                        }
                        @teacher{
                                Make students compute the cost of throwing a pizza party for 20 people.  Ask them which line they need to update for this party size, and highlight the ease of editing this program vs. the previous one.
                        }
                }
                @point{
                    @student{
                            @activity{
                                Use identifiers to program the following word problem:
                                A train is moving at a constant speed of 65mph. How far has it gone in 3.75 hours?
                            }
                    }
                    @teacher{
                            Students should use identifiers for @code{speed} and @code{time}. 
                    }
                }
                @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to @worksheet-link[#:name "Identifiers-Expressions"] in your workbook.   For each expression, write down the value the computer will return. If the expression will result in an error, write down what you think the error will say.
                            }   
                    }
                    @teacher{

                    }
                }
        ]
   }

@lesson/studteach[
     #:title "Functions"
     #:duration "25 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
             @point{
                    @student{
                    So now you know about Numbers, Strings, Operators and Variables - all of which behave just like they do in math. But what about functions? Pyret has hundreds of built in functions, which we can use to write more interesting programs than are possible with just operators and variables.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Let's explore a new function, @code{num-min}.  Type each of these
                                    lines of code into the interactions area and hit enter.

                                    @itemlist[
                                            @item{
                                                    @code{num-min(0, 1)}
                                            }
                                            @item{
                                                    @code{num-min(-5, 2)}
                                            }
                                            @item{
                                                    @code{num-min(8, 6)}
                                            }
                                    ]

                                    How many arguments does @code{num-min} have? What type of values does this function take in? What type of value does this function output?  How does this output relate to the arguments?
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            This is your first example of @italic{using a function} in Pyret. To use a function, a programmer writes:
                            @itemlist[
                                    @item{
                                            The name of the function.  This function's name is @code{num-sqr}
                                    }
                                    @item{
                                            The argument(s) we want to give to the function, wrapped in parentheses and separated by commas.  In this case, there is one argument:  The number we want to square.  However, different functions can have differents numbers of arguments.
                                    }
                            ]
                            Each function also outputs a value.  The @code{num-sqr} function outputs a number that is equal to the square of the argument. What do you think the function @code{num-sqrt} does?
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    For each of these lines of code, try to guess what 
                                    the problem is based on the error messages.

                                    @itemlist[
                                            @item{
                                                    @code{num-min(2, 3}
                                            }
                                            @item{
                                                    @code{num-min(1 9)}
                                            }
                                            @item{
                                                    @code{num-min("hi", 2)}
                                            }
                                            @item{
                                                    @code{num-min(1, 4, 6)}
                                            }
                                    ]

                            }                            
                    }
                    @teacher{
                            Explanations for each error message:
                            @itemlist[
                                    @item{
                                            Pyret needs both parentheses around the arguments, so that 
                                            it knows exactly where function call begins and ends.  This
                                            is similar to the error with Strings needing both quotation
                                            marks.
                                    }
                                    @item{
                                            For a similar reason, Pyret needs a comma between each argument
                                            so that it can tell how many arguments there are.
                                    }
                                    @item{
                                            @code{num-min} returns the minimum between the two numbers 
                                            that are given as arguments.  It can't compare a String "hi"
                                            to a number, so an error is raised.
                                    }
                                    @item{
                                            Functions need to be called with the exact number of arguments
                                            it is expecting.  @code{num-min} takes two arguments, so calling
                                            it with 1, 3, 4, 5 etc. will give an error.
                                    }

                            ]
                    }
             }
             @point{
                    @student{
                            Every successful application of @code{num-min} will take 2 Numbers as input, and evaluate to one Number.  For each function we learn, we need to keep track of what arguments it takes, and what type of value it returns.
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            We do this by writing @vocab{contracts}. Contracts are comments in code that give the programmer instructions on what functions take in and output.  Below is the contract for @code{num-min}:

                            @code[#:multi-line #t]{
                                    # num-min : Number Number -> Number
                            }

                            The first part of a contract is the function name.  This function is @code{num-min}, so that part is easy.  @code{num-min} takes two arguments of type Number, so we write Number Number.  Finally, after the arrow goes the type of the function's output, which in this case is Number.
                            @activity{
                                Write the contract for @code{num-min} in the back of your workbook. What do you think the contract would be for @code{num-max}? Write it down, and then try using it in the Interactions area.
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            There are also plenty of functions you know from math class. Let's write the contract for @code{num-sqrt} together.

                            @itemlist[
                                    @item{
                                            What is the function name?
                                    }
                                    @item{
                                            How many arguments are there?  What are the types of each?
                                    }
                                    @item{
                                            What is the type of the output?
                                    }
                            ]

                            @code[#:multi-line #t]{
                                    # num-sqrt : Number -> Number
                            }
                            On your own, write the contract for @code{num-sqr}.
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to the last page in your workbook.  For each set of function calls, write the complete contract for the function, as well as an example of how to use it.
                            }   
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Pyret has many, many more functions. Some of these functions are defined as part of the language, and others are defined in extra files that we have to load by hand. Fortunately, including an external file is really easy! Try typing in the following code at the top of the Definitions Area:
                            @code[#:multi-line #t]{
                                include plot-list
                            }
                            This includes a file called @code{plot-list}, which defines a lot of extra functions for making charts, graphs and plots. When you click Run, Pyret will read that file and become aware of all those plotting functions.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                        Two functions imported by this file are called @code{plot} and @code{function-plot}:
                        @code[#:multi-line #t]{
                            # function-plot: (Number -> Number) -> Series
                            # plot : Series -> Plot
                        }
                        @code{function-plot} consumes any function that maps from Numbers to Numbers (xs to ys, for example), and returns a series representing the graph of that function. @code{plot} consumes that series, and produces a @code{Plot} object. Make sure you write these down in your contracts page!
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                        We can define identifiers for both the series and the plot:
                        @code[#:multi-line #t]{
                            # define the series and the graph for the function f(x)=√x
                            sqrt-series = function-plot(num-sqrt)
                            sqrt-graph  = plot(sqrt-series)
                        }
                        Once we click Run, we can see what these values look like. The @code{plot-object} has a method we can call to display the series:
                        @code[#:multi-line #t]{
                            sqrt-graph.display()
                        }
                        Looking at your contracts page, do you see any other functions that we could plot?
                }
                @teacher{

                }
            }
        ]
   }
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
             @point{
                    @student{
                            By learning to use values, variables, operations and functions, you are now familiar with the fundamental concepts needed to write simple programs.  You will have many opportunities to use these concepts in the next units, by writing programs to answer data science questions.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Make sure to save your Pyret program as @code{Pyret Practice} into your Google Drive, so you can go back to it later.
                            }
					}
                    @teacher{

					}
             }
        ]
   }
}


