#lang curr/lib

@title{Unit 1: Introduction to Pyret}

@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
    @unit-descr{
        Students are introduced to Tables in Pyret, and learn about Numbers, Strings, Types, Operations, and Function Application.
    }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Introduction"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "6.SP.1-3")
     #:materials @itemlist[]
     #:preparation @itemlist[
        @item{Computer for each student (or pair), with access to the internet}
        @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbooks"], and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
            @point{
                  @student{
                      Take a minute to look at the @resource-link[#:path "OpeningQuestions.pdf" #:label "opening questions"] we have prepared for you, and choose a topic that interests you.
                      @activity[#:forevidence (list "6.SP.1-3&1&1")]{
                            @itemlist[
                                @item{
                                    Once you've selected your topic, choose a question you'd like to answer.
                                }
                                @item{
                                    Spend one minute discussing your answer, and explaining @italic{why} you answered the way you did. Do other students agree with you?
                                }
                                @item{
                                    What could you @italic{measure} to determine if your answer is right or not?
                                }
                            ]
                      }
                  }
                  @teacher{
                        Have students work in groups (no larger than 4), with each group choosing an Opening Question (or writing their own). After they've had time to discuss, have a few students share back what they talked about.
                  }
            }
            @point{
                    @student{
                             What's the greatest movie of all time? Is Climate Change real? Who is the best quarterback? Is Stop-and-Frisk racially biased? These questions quickly turn into a discussion about data - how you measure it and how you interpret the results. In this course, you'll learn how to use data to ask and answer questions like this.  The process of learning from data is called @vocab{Data Science}. Data science techniques are used by scientists, business people, politicians, sports analysts, and hundreds of other different fields to ask and answer questions about data.
                    }
                    @teacher{
                            You can motivate relevance of data science by using additional examples that relate to student interests.  Here are a few:
                            @itemlist[
                                    @item{@(new-tab "http://motherboard.vice.com/read/a-data-scientists-emoji-guide-to-kanye-west-and-taylor-swift" "Emojis")}
                                    @item{@(new-tab "https://mic.com/articles/131092/these-students-are-using-data-science-to-predict-which-rap-songs-will-become-hits#.0d3wkhxQE" "Pop Music")}
                                    @item{@(new-tab "http://www.kdnuggets.com/2016/06/politics-analytics-trump-clinton-sanders-twitter-sentiment.html"  "Election Analysis")}
                                    @item{@(new-tab "http://fivethirtyeight.com/" "Polling")}
                                    @item{@(new-tab "http://games.espn.com/fba/tools/projections" "Predicting Sports Performance")}
                                    @item{@(new-tab "http://www.salon.com/2015/07/18/how_big_data_can_help_save_the_environment_partner/" "Climate Change")}
                            ]
                    }
             }
             @point{
                    @student{
                            We'll use a @vocab{programming language} to investigate these questions. Just like any human language, programming languages have their own vocabulary and grammar that you will need to learn. The language you'll be learning for data science is called @italic{Pyret}.
                    }
                    @teacher{
                            Set expectations for the class.  This course is an @italic{introduction} data science, so some questions will be out of reach!
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Open up the @editor-link[#:public-id "0BzzMl1BJlJDkVTlPTjlIWFB2aDA" "Image Table"] starter file. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
                            }
                    }
                    @teacher{
                            Each student (or pair of students) should have a Google Account.
                    }
             }
             @point{
                    @student{
                            @bitmap{images/wireframeIDE.png}
                            This screen is called the @vocab{editor}, and it looks something like the diagram you see here. There are a few buttons at the top, but most of the screen is taken up by two large boxes: the @vocab{Definitions Area} on the left and the @vocab{Interactions Area} on the right.

                            For now, we will only be writing programs in the Interactions area.
                    }
                    @teacher{
                            The Definitions Area is where programmers define values and functions that they want to keep, while the Interactions Area allows them to experiment with those values and functions. This is like writing function definitions on a blackboard, and having student use those functions to compute answers on scrap paper.
                    }
             }
             @point{
                    @student{
                            When you click "Run", Pyret reads what's written in the Definitions Area on the left, and allows us to use those definitions on the right. The first lines of code on in the Definitions Area load our Data Science library, which has some useful code that will help us in the course, as well as some libraries for working with Tables and making Images. The rest of the program defines a @vocab{Table} called @code{shapes}.
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            Now that we've clicked "Run", we can play with our @code{shapes} Table. Type @code{shapes} into the Interactions Area and hit Enter...
                    }
                    @teacher{

                    }
             }
     ]
  }

  @lesson/studteach[
     #:title "Exploring Tables"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students add rows to a Pyret table}]
     #:standards (list )
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
                            What comes back is called a @vocab{Table}. Pyret allows us to define names for values, and in this case the name @code{shapes} has been defined as the table you see here. Every table has as @vocab{header row}, which names each column in the table. The @code{shapes} table has two columns:  the @code{name} of the shape, and the number of @code{corners}.
                            @build-table/cols[
                                        '("name" "corners")
                                        '(("triangle" "square")
                                          ("3" "4"))
                                         (lambda (r c) (para ""))
                                         2 2
                            ]     
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            After the header row, tables can have @vocab{data rows}. Each data row has values for every column (nothing can be left empty!). A table can have any number of data rows, including @italic{zero}:
                            @build-table/cols[
                                '("name" "corners")
                                '(())
                                (lambda (r c) (para ""))
                                 2 0
                            ]
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            It's important to remember that tables are only an approximation of the real thing: this table @italic{describes} some shapes we've observed, but obviously it isn't the shapes themselves!
                            @activity[#:forevidence (list "BS-M&1&2" "BS-M&1&3" "BS-PL.1&1&1")]{
                                Add rows to this table for @code{circle}, @code{ellipse}, @code{square}, and @code{rectangle}. Pay close attention to how you use commas and colons, since these are part of the program! When you're done, click "Run" and print out your new-and-improved @code{shapes} table.
                            }

                    }
                    @teacher{
                            You may need to walk through these carefully with students, pointing out where the punctuation marks are so that they're aware of them before they start coding.
                    }
            }
            @point{
                    @student{
                            Before we dive into all of the cool things you can do with tables, we need to understand the two different kinds of data that come up in Data Science: Categorical and Quantitative. @vocab{Quantitative Data} is used to measure an @italic{amount} of something, or to compare two pieces of data to see which is @italic{less or more}. If we want to ask "how much" or "which is most", we're talking about Quantitative Data.
                            @activity[#:forevidence (list )]{
                                "Who is the tallest student?" is an example of a question that is answered with Quantitative Data. What are some other questions you can come up with?
                            }
                    }
                    @teacher{
                            Have students come up with columns that are quantitative (height, age, wealth, etc...)
                    }
            }
            @point{
                    @student{
                            @vocab{Categorical Data} is used to describe different @italic{categories}. Categories don't make sense to compare or measure - if we had a column for eye color, for example, we couldn't ask if "blue" is more than "brown". We use @vocab{Categorical Data} to ask "which one"? When you look at a whether forecast, temperature is quantitative but whether it's snowing or raining is categorical.
                            @activity[#:forevidence (list )]{
                                For the two columns in the @code{shapes} table, which is categorical? Which is quantitative?
                            }
                    }
                    @teacher{
                            Have students come up with examples of columns that are categorical (gender, race, diet, etc...).
                    }
            }
            @point{
                    @student{
                            Data can be categorical or quantitative, depending on how it is used. It doesn't make sense to ask whether "@code{square} is more than @code{triangle}", so most of the time we'd use the @code{name} column as categorical data. But if we wanted to sort the table in alphabetical order, suddenly we @italic{do} care whether @code{square} comes before @code{triangle}.
                            @activity[#:forevidence (list )]{
                                For each of the following questions, determine whether the data being used is quantitative or categorical.
                                @itemlist[
                                    @item{We'd like to sort a phone book by the "last name" column.}
                                    @item{We'd like to find out which car is the most expensive.}
                                    @item{We'd like to find out which cars are red.}
                                    @item{We'd like to find out which puppy is the youngest.}
                                    @item{We'd like to find out which kitten is a Tabby.}
                                    @item{We want to know which people have a ZIP code of 02907.}
                                ]
                            }
                    }
                    @teacher{
                            The big idea here is that some data can be both categorical @italic{and} quantitative -- what matters is how we use it!
                    }
            }
        ]
  }

  @lesson/studteach[
     #:title "Values and Operators"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about different types of values, and operators on those values.}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students add columns to a Pyret table}]
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
                            Pyret lets us use many different kinds of data. In this table, for example, you can see Numbers (the number of corners) and Strings (the name of the shape). Let's get some practice playing with both Datatypes.
                            @activity[#:forevidence (list "BS-PL.1&1&1" "Programming 5.5.1&1&1" "Programming 5.3.1&1&9")]{
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
                                        Strings must have quotation marks on both sides. Having only one is an error.
                                    }
                                    @item{
                                        Operators like @code{+}, @code{-}, @code{*}, and @code{/} need spaces around them.
                                    }
                                    @item{
                                        Any time there is more than one operator being used, Pyret requires that you use parentheses.
                                    }
                                    @item{
                                        Types matter! We can add two Numbers or two Strings to one another, but we can't add the Number @code{4} to the String @code{"hello"}.
                                    }
                            ]
                    }
                    @teacher{
                            
                    }
            }
            @point{
                    @student{
                            You've also seen a few @vocab{error messages} here. Error messages are a way for Pyret to tell you what went wrong, and are a really helpful way of finding mistakes! You've seen errors for missing spaces around operators, missing quotation marks, and mismatched operators without parentheses. What other errors do you think there are?
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
                            As you've seen, operators like @code{+} and @code{-} behave exactly the way in Pyret that they do in math class: they add and subtract Numbers, and produce new Numbers! But what about operators like @code{<} and @code{>}? 
                            @itemlist[
                                @item{
                                    To sort the table by age, we need to know if one person's age is @italic{less than} someone else's.
                                }
                                @item{
                                    To filter the table to show only young people, we need to know if one person's age is @italic{less than} 25.
                                }
                            ]
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Those come in handy when comparing quantitative data, so how do they work in Pyret?
                            @activity[#:forevidence (list "BS-PL.1&1&1" "Programming 5.5.1&1&5")]{
                                With your partner(s), complete @worksheet-link[#:name "Booleans"]. Talk about the answers to each question, and write down your answers when required.
                            }
                    }
                    @teacher{
                            Have students share back. Point out that all the same rules about parentheses, spaces, and types still applies!
                    }
            }
            @point{
                    @student{
                            By using @code{and} and @code{or}, we can @italic{combine tests}. For example, we might want to ask if a character in a videogame has run out of health points @italic{and} if they have any more lives. We might want to know if someone's ZIP Code puts them in Texas @italic{or} New Mexico. When you go out to eat at a restaurant, you might ask what items on the menu have meat @italic{and} cheese. We'll use these Boolean operators in a lot of our Data Science work later on.
                    }
                    @teacher{
                            Have students play "true or false", in which they stand if you say something true, and sit if you say something false. Start simple ("I am wearing a hat"), and gradually get complex ("I am wearing a hat, @italic{and} I am standing on one leg").
                    }
            }
            @point{
                    @student{
                            You've already gotten some practice adding rows to the table. But what if we want to add a column, to track whether or not a shape has any corners or not? Which shapes have corners and which don't?
                            @activity[#:forevidence (list "BS-PL.1&1&1" "Programming 5.5.1&1&5")]{
                                Add a new column, @code{is-round} to the table, then add a Boolean value to the end of each row indicating whether or not that shape has corners. Is this column made up of qualitative or categorical data?
                            }
                    }
                    @teacher{

                    }
            }
        ]
  }

  @lesson/studteach[
     #:title "Applying Functions"
     #:duration "25 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about Contracts, and how they are used in function applications}]
     #:evidence-statements @itemlist[]
     #:exercises (list (make-exercise-locator/file "Applying-Functions" "Contracts1" "Practicing Contracts")
                        (make-exercise-locator/file "Applying-Functions" "Contracts2" "Practicing Contracts")
                        (make-exercise-locator/file "Applying-Functions" "MatchingExpressions1" "Matching Expressions")
                        (make-exercise-locator/file "Applying-Functions" "MatchingExpressions2" "Matching Expressions"))
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
                        So now you know about Numbers, Strings, Booleans and Operators - all of which behave just like they do in math. But what about functions? You may remember functions from algebra: @math{f(x) = x^2}.

                        @activity{
                          @itemlist[
                            @item{ What is the name of this function? }
                            @item{ What will the expression @math{f(2)} evaluate to? @math{f(3)}? }
                            @item{ The values that we give to a function are called its @vocab{arguments}. How many arguments does @math{f} expect? }
                            ]
                        }
                    }
                    @teacher{
                        "Arguments" are the values passed into a function. This is subtley different from @italic{variables}, which are the placeholders that get replaced with those values!
                    }
            }
            @point{
                    @student{
                        Pyret has lots of built-in functions, which we can use to write more interesting programs. They also work pretty much the same way they do in algebra! Let's explore one of Pyret's function, called @code{num-sqrt}. Type this line of code into the interactions area and hit Enter.
                          @code[#:multi-line #t]{
                              num-sqrt(16)
                          }

                        @activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&2")]{
                            @itemlist[
                              @item{ What is the name of this function? }
                              @item{ What did the expression@code{num-sqrt(16)} evaluate to? }
                              @item{ Does the @code{num-sqrt} function produce Numbers? Strings? Booleans? }
                              @item{ How many @vocab{arguments} does @code{num-sqrt} expect? }
                            ]
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                          Of course, functions on a computer can do a lot more than make Numbers! Type this line of code into the interactions area and hit Enter.
                          @code[#:multi-line #t]{
                              triangle(50, "solid", "red")
                          }

                        @activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&2")]{
                            @itemlist[
                              @item{ What is the name of this function? }
                              @item{ What did the expression evaluate to? }
                              @item{ Does the @code{triangle} function produce Numbers? Strings? Booleans? }
                              @item{ How many arguments does @code{num-sqrt} expect? }
                            ]
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                        You've just created an example of a new Datatype, called an @italic{Image}. 
                        @activity[#:forevidence (list "BS-PL.1&1&2")]{
                            @itemlist[
                              @item{ What are the @italic{types} of the arguments @code{triangle} was expecting? }
                              @item{ How does this output relate to the two inputs? }
                              @item{ Try making different triangles. Change the size and color! Try using @code{"outline"} for the second argument. }
                            ]
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            The @code{triangle} function consumes a Number and two Strings as input, and produces an Image. As you can imagine, there are many other functions for making images, each with a different set of arguments. For each of these functions, we need to keep track of three things:
                            @itemlist[
                                @item{@bold{Name} - the name of the function, which we type in whenever we want to use it}
                                @item{@bold{Domain} - the data we give to the function (names and Types!), written between parentheses and separated by commas}
                                @item{@bold{Range} - the type of data the function produces}
                            ]
                            Domain and Range are @italic{Types}, not specific values. As a convention, @bold{we capitalize Types and keep names in lowercase}. @code{triangle} works on many different Numbers, not just the @code{20} we used in the example above!
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence (list "BS-IDE&1&1" "BS-DR.2&1&2")]{
                                Can you see what is wrong with each of these expressions? Try copying them into Pyret, one at a time, and reading the error messages aloud.

                                @itemlist[
                                        @item{
                                                @code{triangle(20, "solid", "red"}
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
                                            it knows exactly where the expression begins and ends.
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
                            These three parts make up a @vocab{contract} for each function. Let's take a look at the Name, Domain, and Range of @code{triangle}:
                            @code[#:multi-line #t]{
                                    # triangle :: (side :: Number, mode :: String, color :: String) -> Image
                            }
                            The first part of a contract is the function's name. In this example, our function is named @code{triangle}.

                            The second part is the @vocab{Domain}, or the names and types of arguments the function expects. @code{triangle} has a Number and two Strings as variables, representing the length of each side, the mode, and the color. We write name-type pairs with double-colons, with commas between each one.

                            Finally, after the arrow goes the type of the @vocab{Range}, or the function's output, which in this case is @code{Image}.
                            @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&2" "BS-IDE&1&1" "BS-IDE&1&2")]{
                                Turn to the back of your workbook. We've given you the contracts for many Image-producing functions (as well as quite a few others!). Try using some of these contracts to make shapes.
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence (list "BS-DR.2&1&1")]{
                              Here's the contract for another new function. Can you figure out how to use it in the Interactions Area?
                                @code[#:multi-line #t]{
                                      string-repeat :: (s :: String, n :: Number) -> String
                              }
                            }
                    }
                    @teacher{
                            The string @code{s} is printed @code{n} times, written as a single String.
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence (list "BS-DR.2&1&1")]{
                              Here's an example of another new function. Type it into the Interactions Area to see what it does. Can you figure out the contract?
                                @code[#:multi-line #t]{
                                      string-contains("apples, pears, milk", "pears")
                              }
                            }
                    }
                    @teacher{
                            The contract is @code{string-contains :: (s :: String, search :: String) -> Boolean}. Be sure the names students come up with for the variables make sense!
                    }
            }
            @point{
                    @student{
                            We can extend our @code{shapes} table even further, by adding a column called @code{sample}. Then, for each row, add an expression that will create an example of that shape. For example:
                            @code[#:multi-line #t]{
                                shapes = table: name, corners, is-round, sample
                                  row: "triangle", 3, true, triangle(20, "solid", "green")
                                  row: "square", ...
                            }
                            @activity[#:forevidence (list )]{
                                Complete the @code{sample} column in the @code{shapes} table by applying the other relevant functions.
                            }
                    }
                    @teacher{

                    }
            }
        ]
  }

  @lesson/studteach[
     #:title "Playing with Tables"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to access a column from a row}]
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
                            The library included at the top of the file includes some helper functions that are useful for Data Science, which we will use throughout this course. Here's the contract for one of them:
                            @code[#:multi-line #t]{
                                get-row :: (t :: Table, index :: Number) -> Row
                            }
                            The @code{get-row} function consumes a Table and an Index, and produces that row from the table. @italic{Note: indexes start at zero, not one!} To get the first row of a table, for example, we would write @code{get-row(shapes, 0)}.
                            @activity[#:forevidence (list  "BS-PL.2&1&1" "BS-PL.2&1&2")]{
                                In the Interactions Area, use @code{get-row} to get the 2nd and 3rd row of your table.
                            }
                    }
                    @teacher{

                    }
            }
             @point{
                      @student{
                              Pyret also has a way for us to get at individual @italic{columns} of a Row, by using a @italic{Row Accessor}. Row accessors start with a @code{Row} value, followed by square brackets and the name of the column. Here are two examples that use row accessors to get at different columns from the first row in the @code{shapes} table:
                              @code[#:multi-line #t]{
                                      get-row(shapes, 0)["name"]      # "triangle"
                                      get-row(shapes, 0)["corners"]   # 3
                                      get-row(shapes, 0)["is-round"]  # false
                              }
                              @activity[#:forevidence (list "BS-DR.2&1&1")]{
                                  How would you get the @code{name} column out of the @italic{second} row? The third?
                              }
                      }
                      @teacher{

                      }
              }
              @point{
                      @student{
                              Let's get some pratice playing with tables!
                              @activity{
                                 Complete the exercises on page @worksheet-link[#:name "Playing-With-Tables"].
                              }
                      }
              }
         ]
  }


  @lesson/studteach[
     #:title "Writing Examples"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about Example blocks in Pyret}]
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
                            Functions are powerful tools that let us transform data, and it's a good idea to jot down a few examples to make sure we understand them. Pyret gives us an easy way to write examples, using something called @code{example:} blocks.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Below is an examples block. Notice that @code{examples} is plural, that there's a colon at the end of the line to start the block, and that there's an @code{end} to finish it.
                            @code[#:multi-line #t]{
                                examples:
                                    num-min(5, 19)  is  5
                                    num-min(5, -2)  is -2
                                end
                            }
                            @activity[#:forevidence (list "BS-DR.2&1&1")]{
                                @itemlist[
                                    @item{ Add this code to the bottom of the Definitions Area in Pyret. Pay attention to the colon after the plural word @code{examples}!}
                                    @item{ How many examples are in this block? }
                                    @item{ What is the name of the function being used in these examples? }
                                    @item{ Based on these examples, what do you think this function does? }
                                    @item{ Add a third example to this block and click "Run". }
                                    @item{ Change one of your examples so that it is @bold{incorrect}, then click "Run". What happens? }
                                ]
                            }
                    }
                    @teacher{
                            Direct students to the test output. Point out that Pyret reports the number of tests that pass!
                    }
            }
            @point{
                    @student{
                        @activity{
                          Complete the exercises on page @worksheet-link[#:name "Examples"].
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
                            By learning to use values, operations and functions, you are now familiar with the fundamental concepts needed to write simple programs.  You will have many opportunities to use these concepts in this course, by writing programs to answer data science questions.

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
