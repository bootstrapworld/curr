#lang curr/lib

@title{Unit 1: Introduction to Pyret}

@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
  @unit-descr{Students write simple programs in Pyret, and learn about Numbers, Strings, Lists, Types, operations, and function application.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Introduction"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[
                                @item{
                                    Show students the @resource-link[#:path "OpeningQuestions.pdf" #:label "opening questions"], either as a handout or on posters set up around the room.
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
                            Welcome to Bootstrap: DataScience! Take a minute to look at the @resource-link[#:path "OpeningQuestions.pdf" #:label "opening questions"] we have prepared for you, and choose a topic that interests you.  
                            @activity{
                                @itemlist[
                                    @item{
                                        Once you've selected your topic, break into groups of no more than 4 and choose a question you'd like to answer.
                                    }
                                    @item{
                                        Spend one minute discussing your answer, and explaining @italic{why} you answered the way you did. Does everyone in your group have the same answer? Why or why not?
                                    }
                                    @item{
                                        What kind of @italic{measurement} would you use to determine if your answer is right or not? What data would you need?
                                    }
                                    @item{
                                        Take 5 minutes to complete @worksheet-link[#:name "Unit-1"] in your Student Workbook, by copying down the question, your answer, and what you discussed with your group.
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
                             What's the greatest movie of all time? The best quaterback? Is Stop-and-Frisk racially biased? These questions quickly turn into a discussion about data - how you measure it and how you interpret the results. In this course, you'll learn how to use data to ask and answer questions like this.  The process of learning from data is called @vocab{Data Science}. Data science techniques are used by scientists, business people, politicians, sports analysts, and hundereds of other different fields to ask and answer questions about data.
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
                            In order to ask questions from data, we'll use a @vocab{programming language}. Just like any human language (English, Spanish, French), programming languages have their own vocabulary and grammar that you will need to learn. The language you'll be learning for data science is called @italic{Pyret}.
                    }
                    @teacher{
                            Set expectations for the class.  This course is an introduction to programming and data science, so some of the questions students want to answer may be out of scope.  However, this course will give students a foundation to answer their more complicated questions later in their data science education.
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Open up the @editor-link[#:public-id "0BzzMl1BJlJDkMTdodnJnenpPQUE" "Unit 1 Starter File"]. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
                            }
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
     #:title "Number and String Types"
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
                            Let's play with the starter file. First, click the Run button. This tells Pyret to read all the code on the left-hand side of the editor, in the Definitions Area. For now, let's ignore all those lines of code -- we'll get to them shortly.
                            @activity{
                                In the Interactions Area, type @code{language} and hit Enter. What comes back?
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            This table shows us a small map of the Pyret programming language. There's a lot more than what's in this table, as you'll see by the end of this Unit. Our language has different @vocab{Types} of data. What Types do you see here? In the row for each Type, the language table has a few examples of different @vocab{values} of that Type. Let's start with Numbers...
                    }
                    @teacher{
                            If time allows, encourage students to click on parts of the table. Let them discover that lists can change the way they print, and that rationals can be toggled between decimal and fractional representations.
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                Begin by typing @code{42} into the Interactions area, then hit Return.  You should see the value 42 appear on the next line in the Interactions area. Try this with other Numbers that you see in the table. Try evaluating numbers, like @code{10345017}, or negative numbers, like @code{-2}. Is there a limit to how big a number can be? What happens if you write a decimal? What happens when you click on a decimal, like @code{0.75}? You get a new type of number, a fraction, like @code{3/4}.
                            }

                            Congratulations, you've written your first (very simple) programs!  When we hit Enter in the Interactions Area, we @vocab{evaluate} the code, which is another way of saying "give me the value that is produced by this program". In this case, the computer's job is easy because the program is already a value!
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
                            @activity[#:forevidence "BS-IDE&1&1"]{Type @code{2 + 5} into the Interactions area. Notice the spaces between the numbers and the plus sign! Then hit Return.  You should see the value @code{7} printed on a new line.
                            }
                    }
                    @teacher{
                            Some students may encounter syntax errors because they did not put white space between the values and the operator. We address this error in the next point.
                    }
             }
             @point{
                    @student{
                            @code{2 + 5} is an expression, and this expression is made up of values and an @vocab{operator}.  Here the operator is +, which you've seen in math classes:  adding two values to create a new value.

                            Now try leaving out the spaces around the plus sign. We get an error! This error happened because Pyret needs you to write spaces between numbers and operators.

                    }
                    @teacher{
                            Pyret requires this whitespace for code readability, and to remove ambiguity when dealing with negative numbers.  For example, without the white space rule, the program @code{5+-2} is hard to understand.
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    What other operations can we use?  Experiment by writing different arithmetic expressions into the Interactions area. If you get an error message, read it out loud and see if you can figure out what it means.
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            Let's look at our next type, which is called a @vocab{String}.  A String is a sequence of characters (letters, numbers, symbols) inside a pair of quotation marks.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                            @item{
                                                Try typing in some of the example values that you see in the table, and then hit Return.
                                            }
                                            @item{
                                                 Try to type your name inside a pair of quotation marks, then hit Return.
                                            }
                                            @item{
                                                 What do you notice about the way Pyret displays Strings on the screen?
                                            }
                                            @item{
                                                 Type this program into the Interactions area:  @code{"4"}. Is this a String or a number?
                                            }
                                            @item{
                                                 What happens when you leave off the second quotation mark?  Type this code into the Interactions area and hit Return: @code{"Data}
                                            }
                                    ]
                            }
                    }
                    @teacher{
                            The program @code{"4"} is a String.  Even though this string only contains the character for the number 4, it is a String because it is between quotation marks. Data scientists care about this difference - ZIP codes, for example, contain only numbers, but the ZIP code 02125 is definitely not the same as the number 2125!
                    }
             }
             @point{
                    @student{
                            Notice when you leave off the second quotation mark, @code{"Data} is NOT
                            printed on the next line! Instead, we get a big red box called an @vocab{error message}.
                            The editor gives us error messages when a program can't be properly evaluated.


                            Error messages a way for the computer to help you find small mistakes in your code.  In the case above,
                            without the second quotation mark the computer can't figure out when the String ends, which makes
                            evaluation impossible.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Fix the error described in the error messages by typing @code{"Data"}
                                    and hitting the Return key.
                            }
                    }
                    @teacher{
                            It is crucial to encourage students to read error messages and debug their code.  When a student
                            encounters an error message for the first time, they will throw their hand up and tell the teacher 
                            "I did something wrong".  Have them read it aloud, and ask them what they think it means.
                    }
             }
             @point{
                    @student{
                            We know that Pyret gives errors whenever it can't evaluate a program.
                            @itemlist[
                                    @item{
                                            In @code{6 / 0} we know that you can't divide any number by 0!  In this case,
                                            Pyret obeys the same rules as humans, and gives an error.
                                    }

                                    @item{
                                            In @code{2 + "hello"}, we're trying to add a String to a Number.  This doesn't
                                            make sense to us, and it doesn't make sense to Pyret either;  Pyret can only add
                                            Numbers to Numbers with the + operation. @bold{Types matter!}
                                    }
                            ]
                    }
                    @teacher{
                                    
                    }
             }
             @point{
                    @student{
                            By now you've seen 4 different kinds of errors: can you write code that will demonstrate these errors?

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
                           @activity{
                                Turn to @worksheet-link[#:name "Expressions-Values-Errors"] in your student workbook, and identify whether the expressions you see will produce an error or a value. In either case, write the resulting value or error messages that you think the computer will respond with.
                            }
                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            @code{+}, @code{-}, @code{*}, @code{/} all work the way they do in math class. Parentheses are similar as well:

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
     #:title "Boolean and List Types"
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
                            There are lots of operators you might remember from your early math classrs. What about operators like @code{<} and @code{>}? 
                            @activity{
                                @itemlist[
                                    @item{What do you think will happen if you evaluate @code{4 < 3}? Type it in and try it out!}
                                    @item{What do you get back?}
                                    @item{Look at the language table - what Type of data did we get?}
                                ]
                                
                            }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            There are an infinite amount of Number values out there in the universe. An infinite amount of String values. But @code{true} and @code{false} are the only possible @italic{Boolean} values. Since a Boolean can only be one thing or the other - yes or no - Booleans are how Pyret answers yes or no questions. @code{4 < 3} is how we ask "is four less than three"? Data Scientists need to ask yes or no questions of data all the time:
                            @itemlist[
                                @item{
                                    We need to know if one person's age is @italic{less than} someone else's if we want to sort the table by age.
                                }
                                @item{
                                    We need to know if one person's age is @italic{less than} 35 if we want to filter the table to show only young people.
                                }
                            ]
                    }
                    @teacher{

                    }
             }
            @point{
                  @student{
                          @activity[#:forevidence "BS-IDE&1&1"]{
                                  What do each of these expressions evaluate to?
                                  @itemlist[
                                            @item{
                                                  @code{18 > 18}
                                            }
                                            @item{
                                                  @code{18 >= 18}
                                            }
                                            @item{
                                                  @code{-5 <= 20}
                                            }
                                            @item{
                                                  @code{-4 == -4}
                                            }
                                            @item{
                                                  @code{3 == 2}
                                            }
                                            @item{
                                                  @code{(-8 + 8) == 0}
                                            }
                                            @item{
                                                  @code{(12 - 4) == (-4 + 12)}
                                            }
                                  ]

                                  Is there a difference between @code{=} and @code{==}?
                          }
                  }
                  @teacher{
                          You can point out the difference between definitions (@code{=}) and equality expressions (@code{==}) by writing @code{x = 4} in the Interactions Area, and then evaluating the expression @code{x = 10}. This will produce an error because @code{x} is already defined, while @code{x == 10} will produce @code{false}.
                  }
            }
            @point{
                  @student{
                          @itemlist[
                                @item{
                                      @code{==} is very different from @code{=}, which @italic{defines} a variable to be equal to some value, whereas @code{==} asks a question: are these two things equal?
                                }
                                @item{
                                      Pyret also allows you to ask "are these two values NOT equal?" with this operator: @code{<>}.
                                }
                          ]
                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                          @activity[#:forevidence "BS-IDE&1&1"]{
                                  Turn to @worksheet-link[#:name "Booleans-Comparison"] in your workbooks, and complete the exercise. Call over the teacher when you have finished the worksheet
                          }
                  }
                  @teacher{
                          The exercise contains challenge questions where students must compare Strings for equality. Some students may have some intuition about this, but this activity "salts the waters" with a discussion of String comparisons.
                  }
            }
            @point{
                  @student{
                          @itemlist[
                                @item{
                                      The second table has expressions that evaluate to booleans, but they are different from other boolean expressions because they compare Strings for equality.
                                }
                                @item{
                                      Strings can only be equal if they are EXACTLY equal, down to every character. If two strings have the same characters, but one is upper case and the other is lower case, they are NOT equal!
                                }
                                @item{
                                      How might the last expression (@code{continent == "Asia"}) be useful to us, if we want to find out how China's GDP stacks up compared to other Asian countries?
                                }
                          ]
                  }
                  @teacher{
                          A very common bug when writing sieve queries is for students to use the incorrect case, or add extra spaces, within the target String. If students are having trouble with their programs, or if their sieve queries produce completely empty tables, ask them if their target String is exactly what they want it to be.
                  }
            }
             @point{
                    @student{
                        We can also group values together, into what is called a @code{List}. Here are four different List values:
                        @code[#:multi-line #t]{
                            [list: 1, 2, 3]
                            [list: 1 + 1, 2 + 2, 3 + 3]
                            [list: "lists", "can", "be", "strings"]
                            [list: true, false]
                        }
                        You can make any kind of list you want, but everything inside a list must be of the same @vocab{Type}. Each element in a list can be a complete expression (like @code{1 + 1}), which will evaluate to a single value. That means we can make lists of Numbers, Strings, or any other kind of data - but not a list that contains both Numbers @italic{and} Strings.
                        @activity{
                            In the Interactions Area, try making a List of strings, where each string is the name of a food you like to eat.
                        }
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                        What are some possible errors when making Lists? Try them out and see what Pyret says about them.
                        @itemlist[
                            @item{@code{[list 1, 2, 3]}}
                            @item{@code{[list: 1 2, 3]}}
                            @item{@code{[list: "a", "b]}}
                        ]
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                        These are functions that work on Lists, too. You'll learn all about them in the next lesson!
                    }
                    @teacher{

                    }
             }
        ]
   }

@lesson/studteach[
     #:title "Functions and Image Types"
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
                        So now you know about Numbers, Strings, Booleans and Operators - all of which behave just like they do in math. But what about functions? Pyret has lots of built in functions, which we can use to write more interesting programs.

                        @activity[#:forevidence "BS-IDE&1&1"]{
                            Let's explore a new function, called @code{triangle}.  Type this line of code into the interactions area and hit Enter.
                            @code[#:multi-line #t]{
                                triangle(50, "solid", "red")
                            }
                            What does this expression evaluate to? What is the Type of this data?
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                        You've just created a new Type of data, called an Image. And you used something called a @vocab{function} to do it. The values that we give to a function are called its @vocab{arguments}. How many arguments are we giving to @code{triangle} in this example? What are the @italic{types} of those arguments? How does this output relate to the two inputs?
                        @activity{
                            Take a minute to try making different triangles. Change the size and color! Is there a something besides @code{"solid"} we can use for the second argument?
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            The @code{triangle} function needs a Number and two Strings as input, and it produces an Image. As you can imagine, there are many other functions for making images, each with a different set of arguments. For each function we learn, we need to keep track of three things:
                            @itemlist[
                                @item{@bold{Name} - the name of the function, which we type in whenver we want to use it}
                                @item{@bold{Domain} - the data we give to the function (names and Types!), written between parentheses and separated by commas}
                                @item{@bold{Range} - the type of data the function produces}
                            ]
                            Domain and Range are @italic{Types}, not specific values. As a convention,  @bold{we capitalize Types and keep names in lowercase when writing contracts}. @code{triangle} works on many different Numbers, not just the @code{20} we used in the example above!
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                Can you see what is wrong with each of these expressions? Try copying them into Pyret, one at a time, and reading the error messages aloud.

                                @itemlist[
                                        @item{
                                                @code{triangle(2, "solid", "red")}
                                        }
                                        @item{
                                                @code{triangle(20 "solid" "red")}
                                        }
                                        @item{
                                                @code{triangle("20", "solid", "red")}
                                        }
                                        @item{
                                                @code{triangle(20, "solid", "red", "striped")}
                                        }
                                ]
                        }
                    }
                    @teacher{
                            Explanations for each error message:
                            @itemlist[
                                    @item{
                                            Pyret needs both parentheses around the arguments, so that 
                                            it knows exactly where function call begins and ends.
                                    }
                                    @item{
                                            Arguments must be separated with a comma.
                                    }
                                    @item{
                                            @code{triangle} expects the first argument to be a Number.
                                            @code{"20"} is a String.
                                    }
                                    @item{
                                            @code{triangle} takes exactly three arguments. Functions 
                                            must be called with the correct number of arguments. 
                                    }

                            ]
                    }
            }
            @point{
                    @student{
                            These three parts make up a @vocab{contract} for each function. What are the Name, Domain and Range of @code{triangle}?
                              @code[#:multi-line #t]{
                                    # triangle :: (side :: Number, mode :: String, color :: String) -> Image
                            }
                            The first part of a contract is the function's name. In this example, our function is named @code{triangle}. 
                            The second part of a contract is the @vocab{Domain}, or the types of arguments the function expects. @code{triangle} expects a Number and two Strings as arguments, so we write @code{Number, String, String} to indicate the Domain, with commas between each one (just like lists!).  
                            Finally, after the arrow goes the type of the @vocab{Range}, or the function's output, which in this case is Image.
                            @activity{
                                Write the contract for @code{triangle} in the back of your workbook. What do you think the contract would be for @code{circle}? @code{rectangle?}. Experiment on the computer to see what other functions there are. Once you've discovered the contract for a function, write it down in your contracts page.
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            There are also plenty of functions you know from math class. Pyret, for example, has a function called @code{num-sqrt}. What do you think it does?

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
                                    # num-sqrt :: (n :: Number) -> Number
                            }
                            There's also a function for @italic{squaring} numbers, called @code{num-sqr}. Write the contract for @code{num-sqr} on your contracts page.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Here are some examples of a function you may not have seen before. What do you think its contract is? Write it down in your contracts page.
                              @code[#:multi-line #t]{
                                    num-min(5, 19)  # produces 5
                                    num-min(0, 4)   # produces 0
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Here's the contract for a new function. Can you figure out how to use it in the Interactions Area? Once you've figure it out, write it down in your contracts page.
                              @code[#:multi-line #t]{
                                    string-repeat :: (s :: String, n :: Number) -> String
                            }
                    }
                    @teacher{

                    }
            }
        ]
   }

@lesson/studteach[
     #:title "Definitions"
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
                            In Pyret, you can define @vocab{names} with the @code{=} sign, just like in math class. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name "x" to be the number "4".
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                            In Pyret, you can name values to make them easier to remember and easy to change. In the Definitions Area, you'll see lots of sample definitions. Let's take a look at a few of them:
                                @code[#:multi-line #t]{
                                    A = 42
                                    B = "buffalo "
                                    C = 2 * 2
                                    D = 42 - A
                                }
                            @bold{Every definition has a name and a value}, and we know that every value has a type. The name is the part to the left of the equals sign, and the value is the part on the right. The value can be simple, like @code{42} and @code{"buffalo "}, or it can be an expression, such as @code{2 * 2}. Definitions can even refer to previous definitions, like @code{D = 42 - A}.
                        }
                        @teacher{

                        }
                }
                @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to @worksheet-link[#:name "Fill-In-Value"] in your workbook. For each definition, come up with a value or expression that matches the given name and type, and write it on the space provided.
                            }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        We've added comments to the starter file, so you can fill in the @vocab{type} of each value being defined. We've already written the name and type for A, B and F. Can you fill in everything else between A and I? 
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        We can also use functions inside definitions. In the Definitions Area, take a look at line 18:
                        @code[#:multi-line #t]{
                            J = num-sqrt(C)   # J :: Number
                        }
                        This definition creates a value called @code{J}, which is the square root of @code{C}. You can see that we've also added a comment, which lists the name and type for this definition.
                        @activity{
                            Fill in the name and type for @code{K} and @code{L}.
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        We can even define new names for @italic{functions themselves}. Take a look at line 24:
                        @code[#:multi-line #t]{
                                M = num-sqrt   # M :: (n :: Number) -> Number
                            }
                        This definition creates a name called @code{J}, which is the square root function @italic{itself}! In the comment, you'll notice that M's type looks different from other types we've seen before. Instead of just being a @code{Number}, @code{String}, @code{List}, or @code{Image}, it has an arrow in it! That's because it's a function, just like @code{num-sqrt}. In fact, @code{M} has the same Domain and Range as @code{num-sqrt} because it's being defined as @code{num-sqrt}.
                        @activity{
                            Fill in the name and type for @code{N}, @code{O} and @code{P}.
                        }
                    }
                    @teacher{
                    
                    }
                }
                @point{
                        @student{
                                Pyret has many, many more functions. Some of these functions are defined as part of the language, and others are defined in extra files that we have to load by hand. In fact, all of the image functions you explored are part of the @code{image} library, which is loaded in the very first line of code in the Definitions Area. Do you see any other library being loaded? The second line of code includes a file called @code{plot-list}, which defines a lot of extra functions for drawing charts, graphs and plots. When you click Run, Pyret will read that file and become aware of all those plotting functions.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            Two of the functions imported by this file are called @code{function-plot} and @code{draw-plot}. Write them down in your contracts page:
                            @code[#:multi-line #t]{
                                # draw-plot :: (title :: String, ds :: DataSeries) -> Image
                                # function-plot :: (fn :: Number -> Number) -> DataSeries

                            }
                            These contracts have a lot of new information in them, but you can use what you know to reason about them. 
                            @itemlist[
                                @item{What is the Name, Domain and Range of the first function?}
                                @item{What is the Name, and Range of the second function?}
                            ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            Even though you haven't seen a @code{DataSeries} before, we can figure out that @code{draw-plot} consumes a String and a @code{DataSeries}, and then produces an Image. The String is the title of a plot, and the resulting Image is the picture of the plot (with that title). You've used your knowledge of contracts to identify that the function also takes in a @code{DataSeries}, but what @italic{is} that? 

                            When you plot a function on your calculator, you can zoom in and out of the resulting graph. Zooming in and out will change the image on the screen, but it doesn't change the data itself. That means you can think about a plot as having two parts: the abstract @italic{data}, and then the settings for how that data is presented. A @code{DataSeries} is the abstract data. You've already seen some functions that may be familiar to you, such as @code{num-sqr} and @code{num-sqrt}. How can we take these functions and build a DataSeries out of them? 
                        }
                        @teacher{
                            You can provide other examples that distinguish data from presentation: the same graph can be shown in any color, or with xMin and xMax shifted by any amount, but the underlying data behind the graph doesn't change!
                        }
                }
                @point{
                        @student{
                            You might notice that every contracts has an arrow separating Domain from Range. @code{function-plot} has an interesting domain: @code{(Number -> Number)}. That means it consumes a @italic{function} that maps from Numbers to Numbers (xs to ys, for example), and returns a @code{DataSeries}. 
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            We can define names for both the DataSeries and the plot:
                            @code[#:multi-line #t]{
                                # define the series and the graph for the function f(x)=√x
                                sqrt-series  = function-plot(num-sqrt)
                                sqrt-graph = draw-plot("f(x)=√x", sqrt-DataSeries)
                            }
                            Review: once I've defined an identifier, I can see its value for by clicking Run, then typing in the identifier in the Interactions Area and hitting Enter.

                            Looking at your contracts page, do you see any other functions that we could plot?
                        }
                        @teacher{
                            Have student plot @code{num-sqrt}.
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
                        One of the skills you'll learn in this class is how to diagnose and fix errors. Some of these errors will be @italic{syntax errors}: a missing comma, an unclosed string, etc. All the other errors are @italic{contract errors}. If you see an error and you know the syntax is right, ask yourself these two questions:
                        @itemlist[
                            @item{
                                What is the function that is generating that error?
                            }
                            @item{
                                What is the contract for that function?
                            }
                        ]
                    }
                    @teacher{

                    }
             }
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


