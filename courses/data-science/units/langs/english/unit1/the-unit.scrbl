#lang curr/lib

@title{Unit 1: Introduction to Pyret}

@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
  @unit-descr{Students write simple programs in Pyret, and learn about Numbers, Strings, Lists, Types, operations, and function application.}
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
                                    Open up the @editor-link[#:public-id "0BzzMl1BJlJDkZ2IyU3dGYXAzblE" "Unit 1 Starter File"]. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
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
     #:title "Values and Operators"
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
                            Let's play with the starter file. First, click the "File" menu, and select "Save as". This will save a copy of the file in @italic{your} account, so you can edit it and refer to it later. Then click the Run button. This tells Pyret to read all the code on the left-hand side of the editor, in the Definitions Area. For now, let's ignore all those lines of code -- we'll get to them shortly.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            In the Definitions Area, you can see that there's already some code in this program:
                            @code[#:multi-line #t]{
                                # A table of simple shapes: triangle, circle, square, rectangle, ellipse
                                shapes = table: name, corners
                                    row: "triangle", 3
                                    row: "circle",   0
                                end
                            }
                            This code @italic{defines} a value called @code{shapes}, which is a table keeping track of different shapes. After you've clicked Run, type @code{shapes} into the Interactions Area on the right.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Every table has a @vocab{header row}, which lists the columns in the table, and @italic{data rows}, which in this case are where each shape is described. Data Scientists use tables of data all the time. A table of students in this class might have columns for First Name, Last Name, Age, etc.
                            How many columns does this table have? How many data rows does it have?
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            It's important to remember that tables are only a proxy for the real thing: this table @italic{describes} some shapes we've observed, but it isn't the shapes themselves! Similarly, the table of students in this class isn't @italic{actually} the students - it's merely a description of students we have observed, and each column tells us a new piece of information about how students vary from one to another. Data Scientists use the term @vocab{observations} instead of "data rows", and @vocab{variable} to refer to columns.
                            @activity{
                                Add rows to this table for @code{circle}, @code{square}, @code{ellipse} and @code{rectangle}. Pay close attention to how you use commas and colons, since these are part of the program! When you're done, click "Run" and print out your new-and-improved @code{shapes} table.
                            }

                    }
                    @teacher{
                            You may need to walk through these carefully with students, pointing out where the punctuation marks are so that they're aware of them before they start coding.
                    }
            }
            @point{
                    @student{ 
                            Pyret lets us use many different kinds of data. In this table, for example, you can see Numbers (the number of corners) and Strings (the name of the shape). Let's get some pratice making Numbers and Strings.
                            @activity{
                                With your partner(s), go through the questions on @worksheet-link[#:name "Numbers-and-Strings"]. Talk about the answers to each question, and write down your answers when required.
                            }
                    }
                    @teacher{
                            Give students time to experiment, and then debrief as a group.
                    }
            }
            @point{
                    @student{
                            By now you've discovered a number of important things about our programming language:
                            @itemlist[
                                    @item{
                                        Numbers and Strings evaluate to themselves.
                                    }
                                    @item{
                                        Anything in quotes is a String value, even something like @code{"42"}. Data scientists care about the difference between Numbers and Strings. ZIP codes, for example, contain only numbers, but the ZIP code 02125 is definitely not the same as the number 2125!
                                    }
                                    @item{
                                        Strings must have an open and close quotation mark. Having only one is an error.
                                    }
                                    @item{
                                        Operators like @code{+}, @code{-}, @code{*}, and @code{/} need spaces around them.
                                    }
                                    @item{
                                        Any time there is more than one operator being used, Pyret demands that you use parentheses.
                                    }
                                    @item{
                                        Types matter! We can add two Numbers or two Strings, but we can't add the Number @code{4} to the String @code{"hello"}.
                                    }
                            ]
                    }
                    @teacher{
                            
                    }
            }
            @point{
                    @student{
                            You've also seen a few @vocab{error messages} here. Error messages are a way for Pyret to give you a hint that something went wrong, and are a really helpful way of finding mistakes! You've seen errors for missing spaces around operators, missing quotation marks, and mismatched operators without parentheses. What other errors do you think there are?
                            @itemlist[
                                    @item{
                                            In @code{6 / 0} we know that you can't divide any number by 0!  In this case,
                                            Pyret obeys the same rules as humans, and gives an error.
                                    }

                                    @item{
                                            An unclosed quotation mark is a problem, but so is an unmatched paren. @code{(2 + 2}, for example, will give you an error too!
                                    }
                            ]
                    }
                    @teacher{
                                    
                    }
            }
            @point{
                    @student{
                            You've already gotten some practice adding rows - or @vocab{observations} - to the table. But what if we want to add a column, to track whether or not a shape has any corners or not? Which shapes have corners and which don't? 
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            There are an infinite amount of Number values out there in the universe. An infinite amount of String values. But having corners is more of a yes/no, black/white, or true/false thing -- we need a type of data that can only be @code{true} or @code{false} are the only possible @italic{Boolean} values. Since a Boolean can only be one thing or the other - yes or no - Booleans are how Data Scientists indicate if something @italic{does or doesn't} have a certain property.
                            @activity{
                                Add a new column, @code{has-corners} to the table, then add a Boolean value to the end of each row indicating whether or not that shape has corners.
                            }
                    }
                    @teacher{
                            You may want to walk through one of the rows with your students first, as an example.
                    }
            }
            @point{
                    @student{
                            Booleans are how Pyret answers yes or no questions. You already know about Number operators like @code{+} and @code{-}, which produce Numbers by adding or subtracting. There are Boolean operators, which produce Booleans by @italic{comparing}! @code{4 < 3} is how we ask "is four less than three"? 
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
                            @activity{
                                With your partner(s), go through the Boolean section at the top of @worksheet-link[#:name "Booleans-and-Lists"]. Talk about the answers to each question, and write down your answers when required.
                            }
                  }
                  @teacher{

                  }
            }
        ]
  }

  @lesson/studteach[
     #:title "Functions and Images"
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
                        You've just created a new Type of data, called an @italic{Image}. And you used something called a @vocab{function} to do it. The values that we give to a function are called its @vocab{arguments}. How many arguments are we giving to @code{triangle} in this example? What are the @italic{types} of those arguments? How does this output relate to the two inputs?
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
                                Turn to the back of your workbook. We've given you the contracts for many Image-producing functions (as well as quite a few others!). Try using some of these contracts to make shapes.
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Extend our @code{shapes} table even further, by adding a column called @code{example}. Then, for each row, add an expression that will create an example of that shape.
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
     #:title "Methods and Lists"
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
                        There are also some special functions that work on tables, called @vocab{methods}. Methods are different from @vocab{functions} in a several ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. For example, the @code{.row-n} method has to be called as part of a Table.
                                  }
                                  @item{
                                        @italic{They change the way they behave}, depending on which piece of data they're attached to. One of these lines of code will work, while the other will cause an error:
                                         @code{shapes.row-n(4)} will work if our table has four observations, but fail if there are only two.
                                  }
                                  @item{
                                        @italic{Their contracts are different.} The @code{.row-n} method only exists within the @code{Table} Type, so we can't use its name without also specifying the name of a Table. The contract for a method includes the Type along with the name:
                                         @code[#:multi-line #t]{
                                          <Table>.row-n :: (n :: Number) -> Row
                                         }
                                  }
                          ]


                  }
                  @teacher{
                          This method v. function distinction is subtle, and it's worth spending some time walking through it carefully.
                  }
            }
            @point{
                    @student{
                        @activity{
                            In the Interactions Area, practice pulling out each of the obervations in your Table using the @code{.row-n} method.
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                  @student{
                        We also have methods for extracting an entire column. For example:
                        @code[#:multi-line #t]{
                            <Table>.column :: (name :: Number) -> List
                        }
                        What is the Name of this method? What is the Domain?
                        @activity{
                            In the Interactions Area, use the @code{.column} method to extract the @code{name} column from your @code{shapes} table. Try extracting other columns, and see what you get.
                        }
                  }
                  @teacher{

                  }
            }
            @point{
                    @student{
                        Lists are a new type of data, and represent a way to group entire columns. We can also make them ourselves!
                        @activity{
                                With your partner, go through the List section at the bottom of @worksheet-link[#:name "Booleans-and-Lists"]. Talk about the answers to each question, and write down your answers when required.
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
                                    Turn to @worksheet-link[#:name "Fill-in-Value"] in your workbook. For each definition, come up with a value or expression that matches the given name and type, and write it on the space provided.
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
                                Pyret has many, many more functions. Some of these functions are defined as part of the language, and others are defined in extra files that we have to load by hand. The @code{include} line at the top of the file loads one of these files.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            Two of the functions imported by this file are called @code{function-plot} and @code{draw-plot}. Write them down in your contracts page:
                            @code[#:multi-line #t]{
                                # draw-chart :: (title :: String, ds :: DataSeries) -> Image
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
                            Even though you haven't seen a @code{DataSeries} before, we can figure out that @code{draw-chart} consumes a String and a @code{DataSeries}, and then produces an Image. The String is the title of a chart, and the resulting Image is the picture of the plot (with that title). You've used your knowledge of contracts to identify that the function also takes in a @code{DataSeries}, but what @italic{is} that? 

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
                                sqrt-graph = draw-chart("f(x)=√x", sqrt-series)
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
                                    Make sure to save your work, so you can go back to it later!
                            }
					}
                    @teacher{

					}
             }
        ]
  }
}


