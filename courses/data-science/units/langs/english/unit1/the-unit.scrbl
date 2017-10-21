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
                      Take a minute to look at the @resource-link[#:path "OpeningQuestions.pdf" #:label "opening questions"] we have prepared for you, and choose a topic that interests you.
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
                                    Open up the @editor-link[#:public-id "0BzzMl1BJlJDkVTlPTjlIWFB2aDA" "Unit 1 Starter File"]. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
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
             @point{
                    @student{
                            When you click "Run", Pyret reads what's written in the Definitions Area on the left, and allows us to use those definitions on the right. The first line of code on the left loads our DataScience library, which has some code that will help us in the course. The rest of the program, however, defines a @vocab{Table} called @code{shapes}.
                    }
                    @teacher{
                    }
             }
             @point{
                    @student{
                            Now that we've clicked "Run", we can play with that definition. Type @code{shapes} into the Interactions Area and hit Enter...
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
                            What comes back is called a @vocab{Table}. Pyret allows us to define names for values, and in this case the name @code{shapes} has been defined as the table you see here. Every table has as @vocab{header row}, which names each column in the table. The @code{shapes} table has two columns, for the @code{name} and number of @code{corners} each shape has.
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
                            After the header row, tables can have @vocab{data rows}. Each data row has values for each column (nothing can be left empty!), and table can have an infinite number of rows. A table can even have @italic{zero} data rows:
                            @build-table/cols[
                                '("name" "corners")
                                '(())
                                (lambda (r c) (para ""))
                                 2 0
                            ]
                    }
            }
            @point{
                    @student{
                            It's important to remember that tables are only a proxy for the real thing: this table @italic{describes} some shapes we've observed, but it isn't the shapes themselves! Data Scientists use the term @vocab{observations} instead of "data rows", and @vocab{variable} to refer to columns.
                            @activity{
                                Add rows to this table for @code{circle}, @code{ellipse} and @code{rectangle}. Pay close attention to how you use commas and colons, since these are part of the program! When you're done, click "Run" and print out your new-and-improved @code{shapes} table.
                            }

                    }
                    @teacher{
                            You may need to walk through these carefully with students, pointing out where the punctuation marks are so that they're aware of them before they start coding.
                    }
            }
            @point{
                    @student{
                            Before we can dive into all of the cool things you can do with tables, we need to understand the two different kinds of data that come up in Data Science: Categorical and Quantitative. @vocab{Quantitative Data} is used to measure an @italic{amount} of something, or to compare two pieces of data to see which is @italic{less or more}. If we want to ask "how much" or "which is most", we're talking about Quantitative Data.
                            @activity{
                                "Who is the tallest student?" is an example of a question that needs Quantitative Data. Can you come up with additional quantitative questions?
                            }
                    }
                    @teacher{
                            Have students come up with columns that are quantitative (height, age, wealth, etc...)
                    }
            }
            @point{
                    @student{
                            @vocab{Categorical Data} is used to describe different @italic{categories}. Categories don't make sense to compare or measure - if we had a column for eye color, for example, we couldn't ask if "blue" is more than "brown". We use @vocab{Categorical Data} to ask "which one"? When you look at a whether forecast, temperature is quantitative but whether it's snowing or raining is categorical.
                            @activity{
                                For the two columns in the @code{shapes} table, which is categorical? Which is quantitative?
                            }
                    }
                    @teacher{
                            Have students come up with examples of columns that are categorical (gender, race, diet, etc...).
                    }
            }
            @point{
                    @student{
                            Data can be categorical or quantitative, depending on how it's used. It doesn't make sense to ask whether "@code{square} is more than @code{triangle}", so most of the time we'd use the @code{name} column as categorical data. But if we wanted to sort the table in alphabetical order, suddenly we @italic{do} care whether @code{square} comes before @code{triangle}.
                            @activity{
                                For each of the following questions, determine whether the data being used is quantitative or qualitative.
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
                            Pyret lets us use many different kinds of data. In this table, for example, you can see Numbers (the number of corners) and Strings (the name of the shape). Let's get some pratice playing with both Datatypes.
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
                            As you've seen, operators like @code{+} and @code{-} behave exactly the way in Pyret that they do in math class: they add and subtract Numbers, and produce new Numbers! But what about operators like @code{<} and @code{>}? 
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
                            Those come in handy when comparing quanitative data, so how do they work in Pyret?
                            @activity{
                                With your partner(s), go through the Boolean section at the top of @worksheet-link[#:name "Booleans"]. Talk about the answers to each question, and write down your answers when required.
                            }
                    }
                    @teacher{

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
                            You've already gotten some practice adding rows - or @vocab{observations} - to the table. But what if we want to add a column, to track whether or not a shape has any corners or not? Which shapes have corners and which don't?
                            @activity{
                                Add a new column, @code{is-round} to the table, then add a Boolean value to the end of each row indicating whether or not that shape has corners.
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
                            What does this expression evaluate to? Is it a Number? A String? A Boolean?
                        }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                        You've just created an example of a new Datatype, called an @italic{Image}. And you used something called a @vocab{function} to do it. The values that we give to a function are called its @vocab{arguments}. How many arguments are we giving to @code{triangle} in this example? What are the @italic{types} of those arguments? How does this output relate to the two inputs?
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
                            We can extend our @code{shapes} table even further, by adding a column called @code{example}. Then, for each row, add an expression that will create an example of that shape. For example:
                            @code[#:multi-line #t]{
                                shapes = table: name, corners, is-round, example
                                  row: "triangle", 3, true, triangle(20, "solid", "green")
                                  row: "square", ...
                            }
                            @activity{
                                Complete the @code{example} column in the @code{shapes} table by applying the other relevant functions.
                            }
                    }
            }
            @point{
                    @student{
                            The library included at the top of the file includes some helper functions that are useful for DataScience, which we will use throughout this course. Here's the contract for one of them:
                            @code[#:multi-line #t]{
                                get-row :: (t :: Table, index :: Number) -> Row
                            }
                            The @code{get-row} function consumes a Table and an Index, and produces that row from the table. @italic{Note: indexes start at zero, not one!} To get the first row of a table, for example, we would write @code{get-row(shapes, 0)}.
                            @activity{
                                In the Interactions Area, use @code{get-row} to get the 2nd and 3rd row of your table.
                            }
                    }
                    @teacher{

                    }
            }
        ]
  }

  @lesson/studteach[
     #:title "Writing Examples"
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
                            Functions are powerful tools that let us transform data, and it's a good idea to jot down a few examples to make sure we understand them. In the next Unit, you'll learn how to make your @italic{own} functions, and writing examples will become even more important. Pyret gives us an easy way to write examples, using something called @code{example:} blocks.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Below is an example block:
                            @code[#:multi-line #t]{
                                examples:
                                    num-min(5, 19)  is  5
                                    num-min(5, -2)  is -2
                                end
                            }
                            @activity{
                                @itemlist[
                                    @item{ Add this code to the bottom of the Definitions Area in Pyret. }
                                    @item{ How many examples are in this block? }
                                    @item{ What is the name of the function being used? }
                                    @item{ Based on these examples, what does this function do? }
                                    @item{ Add another example to this block and click "Run". }
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
                            Example blocks are ways for us to automatically check our work, by writing down how functions @italic{should} work and having Pyret report back about whether our examples are accurate. Pyret, for example, has a function called @code{num-sqrt}. What do you think it does?
                            @activity{
                                Add two examples that use @code{num-sqrt} to your @code{examples:} block. Make sure they both pass!
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Here's the contract for another new function. Can you figure out how to use it in the Interactions Area? Once you've figured it out, add an example to the @code{examples:} block.
                              @code[#:multi-line #t]{
                                    string-repeat :: (s :: String, n :: Number) -> String
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Pyret also has a way for us to get at individual columns of a Row, by using square brackets and the name of the column. Here's an @code{examples:} block that shows how:
                            @code[#:multi-line #t]{
                                    get-row(shapes, 0)["name"] is "triangle"
                                    get-row(shapes, 1)["corners"] is 4
                            }
                            @activity{
                                Add three examples to your block that use this technique. Challenge: can you write an one for the @code{example} column?
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