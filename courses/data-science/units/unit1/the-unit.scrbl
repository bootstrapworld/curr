#lang curr/lib

@title{Unit 1: Introduction to Pyret}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to the Pyret development, and fundamental syntactic elements of the Pyret language: values, expressions, operations, and functions.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Programs, Values & Errors"
     #:duration "10 minutes"
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
                            Welcome to Bootstrap: DataScience. In this course, 
                            you'll learn how to ask and answer questions about data.  The process 
                            of learning from data is called @vocab{Data Science}.  Data science techniques 
                            are used by scientists, business people, politicians, sports analysts, 
                            and hundereds of other different fields to ask and answer questions about data.
                    }
                    @teacher{
                            Motivate relevance of data science by using examples that
                            relate to student interests.  Here are some examples:
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
                            In order to ask questions from data, you will use a @vocab{programming language}.  
                            Just like any language (English, Spanish, French), programming 
                            languages have their own vocabulary and grammar that you will need to learn.  
                            The language you'll be learning for data science is Pyret, which lets you ask 
                            and answer questions quickly from very large data sets.
                    }
                    @teacher{
                            Set expectations for the class.  This course is an introduction to
                            programming and data science, so some of the questions students want
                            to answer may be out of scope.  However, this course will give students
                            a foundation to answer their more complicated questions later in their 
                            data science education. 
                    }
            }
             @point{
                    @student{
                            Begin by opening the @editor-link["code.pyret.org editor"].  Hit the log in button, and sign in with your
                            Google account information, then choose "Start Coding".
                    }
                    @teacher{
                            Each student (or pair of students) should have a Google Account.    
                    }
             }
             @point{
                    @student{
                            @bitmap{images/wireframeIDE.png}This screen is called the @vocab{editor}, and it looks something
                            like the diagram you see here. There are a few buttons at the top, but most of the screen is 
                            taken up by two large boxes: the @vocab{Definitions area} on the left and the 
                            @vocab{Interactions area} on the right.


                            For now, we will only be writing programs in the Interactions area.
                    }
                    @teacher{
                            The Definitions area is where programmers define values and functions in their program, 
                            while the Interactions area allows them to experiment with those values and functions. 
                            This is analogous to writing a series of function definitions on a blackboard, and having 
                            student evaluate expressions using those function on scrap paper. As students are not yet 
                            defining values of their own, it is not important that students understand this distinction 
                            right now.  For now, we will work only with the Interactions area.
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{Begin by typing @code{4} into the Interactions area, then hit 
                                        Return.  You should see the value 4 appear on 
                                        the next line in the Interactions area.
                            }

                            Congratulations, you've written your first program!  Yes, really.  When a program
                            is run, the editor will turn that program into a @vocab{value}.  Values are how the computer represents
                            data.  In this case, the editor's job is easy because the program is already a value!  When we hit Run,
                            we @vocab{evaluate} the program, which is another way of saying "give me the value that is produced by
                            this program".
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
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
                            All values that a computer program can produce have a @vocab{type}.  Each of the values 
                            produced by the programs you just wrote are Numbers.  Another fundamental type is @vocab{String}.  A String
                            is a sequence of characters (letters, numbers, symbols) in between a pair of quotation marks @code{""}.

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


                            Error messages are really helpful, and they're a natural part of
                            programming;  they exist so that the computer can help you find
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
        ]
   }

@lesson/studteach[
     #:title "Expressions & Operations"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{Make sure each student (or pair of students) has a Google Account}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{
                    @student{
                            We've successfully written and evaluated programs, but writing programs that only contain values would
                            be boring.  Luckily, Pyret allows us to compute new values using old values in @vocab{expression}s.  
                            One of the great things about Pyret is that these expressions are similar to the ones you've seen
                            in math classes.
                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{Type @code{2 + 5} into the Interactions area, then hit 
                                        Return.  You should see the value 7 printed on a new line.
                            }
                    }
                    @teacher{
                            Some students may encounter syntax errors because they did not put white space
                            between the values and the operator.  We address this error in the next point.
                    }
             }
             @point{
                    @student{
                            Let's break this down.  @code{2 + 5} is an expression, and this expression is made up of values
                            and an @vocab{operator}.  Here the operator is +, which is the standard addition you've seen in
                            math classes:  adding two values to create a new value.

                            Some of you may have gotten an error when trying to run this program.  This error happened 
                            because Pyret needs you to write spaces between numbers and operators.  To address this issue,
                            add spaces between the operator and values.

                    }
                    @teacher{
                            @itemlist[
                                    @item{
                                            Ask students who encountered this error to read the error 
                                            message out loud before you explain it.
                                    }

                                    @item{
                                            Pyret requires this whitespace for code readability, and to remove ambiguity
                                            when dealing with negative numbers.  For example, without the white space rule,
                                            the program @code{5+-2} is hard to understand.
                                    }
                            ]
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    What other operations can we use?  Type each of these programs into the Interactions area.
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
                            Notice that the last two programs give errors.  We know that Pyret gives errors whenever it can't evaluate a program. Read the errors
                            carefully, and see if you can understand why the program could
                            not be evaluated.
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
                            As data scientists, you will see many different error messages in this course.  They are
                            a part of using the computer as a tool to solve problems, so don't give up when you see them!
                            The most important part of using an error message is reading the message editing the program
                            to fix the errors.

                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            @code{+}, @code{-}, @code{*}, @code{/} all work the way they do in math class. Parentheses work pretty much the same way, but with one
                            important exception!

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Type @code{(2 * 3) + 5} into the Interactions window, and hit Run.  It should produce 11.
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            Parentheses allow you to write more complex expressions.  In this example, Pyret evaluates what is inside the parentheses: @code{2 * 3}.
                            Then, it uses this value in the larger expression.  So @code{(2 * 3) + 5} becomes @code{6 + 5}, 
                            which is evaluated to 11.  @bold{Note:} There is one difference between the way parentheses work in math class, and the way they do in Pyret! In Pyret, any time you have more than one operation, you @bold{must} include parenthesis.
                    }
                    @teacher{
                    
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to @worksheet-link[#:name "Expressions-Values-Errors"] in your workbook.  For each program, say whether it will produce an error or not.  If it
                                    does not produce an error, what value will it produce?  If it does produce an error, why?  
                                    The error will be a kind of error you have seen before.  
                            }
                    }
                    @teacher{
                                        
                    }
             }
        ]
   }

@lesson/studteach[
     #:title "Identifiers & Variables"
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
                                You've used operations and expressions to compute new values.  Now it's
                                time to put your data science skills to their first test!
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                For each of these word problems, write an expression in Pyret to compute
                                the answer.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        You want to buy two ice cream cones:  one for you, and one for a friend.
                                        Each ice cream cone costs $1.98.
                                        How much will 2 ice cream cones cost?
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                    @student{
                            We need to compute the cost of 2 cones, and each cone costs $1.98.
                            So we need to multiply the cost-per-cone by the number of ice cream cones we
                            want to buy.

                            @code[#:multi-line #t]{
                                    2 * 1.98
                            }
                    }
                    @teacher{

                    }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        There 365 days in a year, 60 minutes in an hour, and 24 hours in a day.  How many
                                        minutes are there in a year?
                                }
                        }
                        @teacher{
                                Multiply 60 min/hour by 24 hours/day to get the number of minutes per day.
                                Then multiply by 365 days/year.

                                @code[#:multi-line #t]{
                                        (60 * 24) * 365
                                }
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        You want to throw a pizza party for a class of 16 students.  
                                        We need to buy one of each of these per student:
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
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                The particular items for the party do not matter, feel free to change
                                                them as long as they are supplies where each student gets one of each
                                                item.  Also, change the class size to be the same as your actual
                                                class.
                                        }
                                        @item{
                                                Sum the cost of each item, then multiply by the number of students:

                                                @code[#:multi-line #t]{
                                                        (2.50 * 16) + (0.20 * 16) + (0.98 * 16)
                                                }
                                        }
                                        @item{
                                                You could write this program more concisely as @code{(2.50 + 0.20 + 0.98) * 16},
                                                but this form will emphasize how using variables/identifiers can make it
                                                easier to edit and read programs.
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
                                @itemlist[
                                        @item{
                                                Notice how tedious it is to change each @code{16} to a @code{17}, when
                                                each number represents the same thing.  If we ever want to change the
                                                number of people at the party, we'll have to change all 3 numbers again.
                                        }
                                        @item{
                                                There has to be a better way...
                                        }
                                ]
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                                ...and there is!  In Pyret, you can define @vocab{variable}s with the
                                @code{=} sign, just like in math class.
                                You're probably used to seeing variables @code{x, y, z}, etc.  In Pyret,
                                you can use words to define variables, which will make your code readable and
                                easy to change.
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Add this line of code to the top of your definitions window:
                                        @code[#:multi-line #t]{
                                            how-many-people = 17
                                        }
                                        Then, substitute all of the instances of @code{17} with @code{how-many-people}
                                        in your expression to compute the cost of the party.
                                }
                        }
                        @teacher{
                                Make students compute the cost of throwing a pizza party for 20 people.  Ask them
                                which line they need to update for this party size, and highlight the ease of 
                                editing this program vs. the previous one.
                        }
                }
                @point{
                        @student{
                                Imagine we learn that a different pizza place will sell us 
                                better tasting pizza, for only $2 per slice!  We could change the @code{2.50}
                                in our program to @code{2.00}, but what's a more readable solution?

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                        Add variable definitions at the top of your definitions window
                                                        for the cost of each item we need
                                                        to buy per person (@code{pizza-slice-cost, plate-cost, soda-cost}). 
                                                }
                                                @item{
                                                        Then, use these new variables to rewrite your old program to 
                                                        compute the cost of the party.
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                Here is what the final solution should look like.  Once you have motivated
                                the use of variables in code, you can encourage students to use the distributive
                                rule to simplify this code.

                                @code[#:multi-line #t]{
                                        pizza-slice-cost = 2
                                        plate-cost = 0.2
                                        soda-cost = 0.98
                                        how-many-people = 20

                                        (pizza-slice-cost + 
                                        plate-cost + 
                                        soda-cost) * how-many-people
                                }
                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Applying Functions"
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
							You've probably seen numbers, variables, and operators in math classes as
                            well as in Pyret.  These are extremely important concepts that will be used
                            in almost all programs you write in this course.  However, there's one more 
                            important construct from math classes that is crucial to writing Pyret programs:
                            @vocab{function}s.
					}
                    @teacher{

					}
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Type @code{num-sqr(2)} into the interactions window, and hit Enter.
                                    What does this code evaluate to?  Try changing the number in between
                                    the parentheses.
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            This is your first example of a function in Pyret.  Each function has:
                            @itemlist[
                                    @item{
                                            A name.  This function's name is @code{num-sqr}
                                    }
                                    @item{
                                            Parentheses.  A correct function usage will always have
                                            one left, and one right parentheses.
                                    }
                                    @item{
                                            Argument(s).  In this case, there is one argument:  The
                                            number we want to square.  However, different functions
                                            can have any number of arguments.
                                    }
                            ]
                            Each function also outputs a value.  The @code{num-sqr} function outputs
                            a number that is equal to the argument times itself.
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            Pyret has hundreds of built in functions we can use to write more interesting
                            programs than are possible with just operators and variables.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Let's explore a new function, @code{num-min}.  Type each of these
                                    lines of code into the interactions window and hit enter.

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

                                    How many arguments does @code{num-min} have?
                                    What type of values does this function take in?
                                    What type of value does this function output?  How does
                                    this output relate to the arguments?
                            }
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
                            Every successful application of @code{num-min} will take 2 Numbers
                            as input, and evaluate to one Number.  For each function we learn,
                            we need to keep track of what arguments it takes, and what type of
                            value it returns.
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            We do this by writing @vocab{contracts}.  @vocab{Contracts}
                            are comments in code that give the programmer instructions on what
                            functions take in and output.  Below is the contract for
                            @code{num-min}:

                            @code[#:multi-line #t]{
                                    # num-min : Number Number -> Number
                            }

                            The first part of a contract is the function name.  This function
                            is @code{num-min}, so that part is easy.  @code{num-min} takes two
                            arguments of type Number, so we write Number Number.  Finally, after
                            the arrow goes the type of the function's output, which in this case is
                            Number.

                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            Let's write the contract for @code{num-sqr} together.

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
                                    # num-sqr : Number -> Number
                            }                          
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to @worksheet-link[#:name "Contracts-Functions"] in your workbook.  
                                    For each set of function calls,
                                    determine the name, number of arguments, type of argument(s), and
                                    in your own words what is the output of this function.
                            }   
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
                            Pat yourself on the back:  you're now officially data scientists!  By
                            learning to use values, variables, operations and functions, you are now familiar with the 
                            fundamental concepts needed to write programs.  You will have many opportunities to
                            use these concepts in the next units, by writing programs to answer data science questions.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Make sure to save your Pyret program as @code{unit-1} into your Google Drive.
                            }
					}
                    @teacher{

					}
             }
        ]
   }
}


