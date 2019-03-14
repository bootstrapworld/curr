#lang curr/lib

@title{Unit 1: Intro to Computational Data Science}

@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
    @unit-descr{
        Students are introduced to Tables in Pyret, and learn about Numbers, Strings, Types, Operations, Contracts, and Function Application.
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
                                    What informationcould you @italic{collect}, to determine if your answer is right or not?
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
                             What's the greatest movie of all time? Is Climate Change real? Who is the best quarterback? Is Stop-and-Frisk racially biased? These questions quickly turn into a discussion about data - how you assess it and how you interpret the results. In this course, you'll learn how to use data to ask and answer questions like this.  The process of learning from data is called @vocab{Data Science}. Data science techniques are used by scientists, business people, politicians, sports analysts, and hundreds of other different fields to ask and answer questions about data.
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
     ]
  }


  @lesson/studteach[
     #:title "The Animals Dataset"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")
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
                        Open the @(new-tab "https://docs.google.com/spreadsheets/d/19m1bUCQo3fCzmSEmWMjTfnmsNIMqiByLytHE0JYtnQM/" "Animals Spreadsheet") in a new tab. This is some data from an animal shelter, listing animals that have been adopted. We'll be using this as an example throughout the course, but you'll be applying what you learn to @italic{a dataset you choose} as well.

                        @activity[#:forevidence (list )]{
                            @itemlist[
                                @item{
                                    Turn to @worksheet-link[#:name "Animals-Notice-Wonder"] in your Student Workbook. @italic{What do you notice} about this dataset? Write down your observations in the left-hand column at the top of the page.
                                }
                                @item{
                                    Sometimes, looking at data sparks questions. @italic{What do you wonder} about this dataset? Write down your questions in the right-hand column.
                                }
                                @item{
                                    If you look at the bottom, you'll see that this spreadsheet contains @italic{multiple sheets} called "pets" and "README". Which sheet are we looking at?
                                }
                                @item{
                                    Each sheet contains a table. For our purposes, we only care about the animals table on the @code{"pets"} sheet.
                                }
                            ]
                        }
                  }
                  @teacher{
                      Each student (or pair of students) should have a Google Account. Have students share back their noticings (statements) and wonderings (questions), and write them on the board.
                  }
              }
              @point{
                      @student{
                              Data Science is all about using a smaller sample of data to make predictions about a larger population. It's important to remember that tables are only an @italic{approximation} of a larger population: this table @italic{describes} some animals, but obviously it isn't every animal in the world! If we took the average age of the animals at this particular shelter, it @italic{might} tell us something about the average age of animals in other shelters.
                      }
                      @teacher{
                      }
              }
              @point{
                      @student{
                              There are two different kinds of data that come up in Data Science: Categorical and Quantitative. @vocab{Quantitative Data} is used to measure an @italic{amount} of something, or to compare two pieces of data to see which is @italic{less or more}. If we want to ask "how much" or "which is most", we're talking about Quantitative Data.
                              @activity[#:forevidence (list )]{
                                  "Age" is a categorial variable, because we can ask questions like "who is the oldest animal?" or "what is the average age of the animals?" What are some other quantitative variables you see in this table?
                              }
                      }
                      @teacher{
                      }
              }
              @point{
                      @student{
                              @vocab{Categorical Data} is used to @italic{classify}, not measure. Categories aren't subject to the laws of arithmetic. For example, we couldn't ask if "cat" is more than "lizard", and it doesn't make sense to find the "average ZIP code" in a list of addresses. We use @vocab{Categorical Data} to ask "which one"? When you look at a whether forecast, temperature is quantitative but weather it's snowing or raining is categorical.
                              @activity[#:forevidence (list )]{
                                  "Species" is a categorical variable, because we can ask questions like "which species does Mittens belong to?" What are some other categorical variables you see in this table?
                              }
                      }
                      @teacher{
                      }
              }
              @point{
                      @student{
                              Sometimes it can be tricky to figure out if data is categorical or quantitative, because it depends on how that data is being used!
                              @activity[#:forevidence (list )]{
                                  For each of the following questions, determine whether the data being used is quantitative or categorical.
                                  @itemlist[
                                      @item{We'd like to sort a list of numbers by area code.}
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
              @point{
                    @student{
                        @activity{
                          On @worksheet-link[#:name "Animals-Notice-Wonder"] in your Student Workbook, fill in the blanks for Questions 1 and 2.
                        }
                    }
                    @teacher{

                    }
              }
              @point{
                  @student{
                      Open up the @editor-link[#:public-id "1gaYAyYhvlKBm6VJuvJDcnoINBw76pL-L" "Animals Starter File"] in a new tab. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
                  }
                  @teacher{
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
                          The first few lines in the Definitions Area tell Pyret to @code{import} files from elsewhere, which contain tools we'll want to use for this course. We're importing a file called Bootstrap:Data Science, as well a files for working with google sheets, tables, and images:
                          @code[#:multi-line #t]{
                            include shared-gdrive("Bootstrap-DataScience-...")
                            include gdrive-sheets
                            include tables
                            include image
                          }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                          After that, we see a line of code that @italic{defines} @code{shelter-sheet} to be a spreadsheet. This table is loaded from Google Drive, so now Pyret and see the same spreadsheet you do. After that, we see the following code:
                          @code[#:multi-line #t]{
                            # load the 'pets' sheet as a table called animals-table
                            animals-table = load-table: name, species, age, fixed, legs
                              source: pets-sheet.sheet-by-name("pets", true)
                            end
                          }
                          This code @italic{defines} a new table. We call it @code{animals-table}, and we load it from the @code{shelter-sheet} defined above. You can see the names we are giving to each of the columns, called @code{name}, @code{species}, @code{gender}, @code{age}, @code{fixed}, @code{legs}, @code{pounds} and @code{weeks}. (We could use any names we want for these columns, but it's always a good idea to pick names that make sense!)
                    }
                    @teacher{
                          Have students look back at the column names in the Google Sheet, and in the @code{load-table} function. Point out that they refer to the same columns, even though they have different names!
                    }
              }
              @point{
                    @student{
                        @activity{
                          Click "Run", and type @code{animals-table} into the Interactions Area to see what the table looks like in Pyret. Is it the same table you saw in Google Sheets? What is the same? What is different?
                        }
                    }
                    @teacher{

                    }
              }
              @point{
                  @student{
                      In Pyret, every table has as a @vocab{header} row, which identifies each variable (or "column") in the table. 
                      @activity{
                          How many variables are listed in the header row? What are they called?
                      }
                  }
                  @teacher{

                  }
              }
              @point{
                  @student{
                    After the header, Pyret tables can have any number of @vocab{data rows}. Each data row has values for every variable (nothing can be left empty!). A table can have any number of data rows, including @italic{zero}, as in the table below:
                    @build-table/cols[
                        '("name" "species")
                        '(())
                        (lambda (r c) (para ""))
                         2 0
                    ]
                  }
                  @teacher{

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
     #:standards (list "BS-PL.1&1&1")
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
                            Pyret lets us use many different kinds of data. In this table, for example, you can see Numbers (the number of legs each animal has) and Strings (the name of the animal). Let's get some practice playing with both Datatypes.
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
                                        Anything in quotes is a String, even something like @code{"42"}.
                                    }
                                    @item{
                                        Strings @italic{must} have quotation marks on both sides.
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
                                    To sort the table by age, we need to know if one animal's age is @italic{less than} another's.
                                }
                                @item{
                                    To filter the table to show only young animals, we need to know if an animal's age is @italic{less than} 2.
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
        ]
  }

  @lesson/studteach[
     #:title "Applying Functions"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about Contracts, and how they are used in function applications}]
     #:evidence-statements @itemlist[]
     #:exercises (list (make-exercise-locator/file "Applying-Functions" "Contracts1" "Practicing Contracts")
                        (make-exercise-locator/file "Applying-Functions" "Contracts2" "Practicing Contracts")
                        (make-exercise-locator/file "Applying-Functions" "MatchingExpressions1" "Matching Expressions")
                        (make-exercise-locator/file "Applying-Functions" "MatchingExpressions2" "Matching Expressions"))
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.1&1&2" "BS-PL.2&1&1" "BS-PL.2&1&2")
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
                              @item{ What did the expression @code{num-sqrt(16)} evaluate to? }
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
                              @item{ How many arguments does @code{triangle} expect? }
                              @item{ Does the @code{triangle} function produce Numbers? Strings? Booleans? }
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
                              @item{ How does this output relate to the inputs? }
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
                            These three parts make up a @vocab{contract} for each function. Let's take a look at the Name, Domain, and Range of @code{num-sqrt} and @code{triangle}:
                            @code[#:multi-line #t]{
                                    # num-sqrt :: (n :: Number) -> Number
                                    # triangle :: (side :: Number, mode :: String, color :: String) -> Image
                            }
                            The first part of a contract is the function's name. In this example, our functions are named @code{num-sqrt} and @code{triangle}.

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
                          @activity{
                              Turn to the back of your workbook, and get some practice reading and using contracts! Make sure you try out the following functions:
                              @itemlist[
                                  @item{ @code{text} }
                                  @item{ @code{circle} }
                                  @item{ @code{ellipse} }
                                  @item{ @code{star} }
                              ]
                          }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence (list "BS-DR.2&1&1")]{
                              Here's the @vocab{contract} for another new function. Can you figure out how to use it in the Interactions Area?
                                @code[#:multi-line #t]{
                                    # string-repeat :: (s :: String, n :: Number) -> String
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
                              Here's an @italic{example} of another function. Type it into the Interactions Area to see what it does. Can you figure out the contract, based on the example?
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
                      Can you think of a situation when you'd want to consume a @italic{Table}, and use that to produce an image? Have you ever seen any pictures created from tables of data?
                    }
                    @teacher{
                        Give the class a minute to brainstorm.
                    }
            }
            @point{
                    @student{
                        The library included at the top of the file includes some helper functions that are useful for Data Science, which we will use throughout this course. Here is the contract for a function that does just that, and an example of using it:
                        @code[#:multi-line #t]{
                             # pie-chart :: (t :: Table, label-col :: String, data-col :: String) -> Image
                             pie-chart(animals-table, "name", "pounds")
                            }
                        @activity{
                          @itemlist[
                            @item{What is the Name of this function?}
                            @item{How many inputs are in its Domain?}
                            @item{Type the example into the Interactions Area.}
                            @item{What comes back?}
                          ]
                        }
                    }
                    @teacher{
                        
                    }
            }
            @point{
                  @student{
                          @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")]{
                              In the Interactions Area, type @code{pie-chart(animals-table, "name", "pounds")} and hit Enter. What happens? What happens when you hover over a slice of the pie? These plots are @italic{interactive}! This allows us to experiment with the data before generating the final image.
                          }
                  }
                  @teacher{
                          Hovering over a pie slice or bar reveals the value or percentage of the whole, and the label.
                  }
            }
            @point{
                    @student{
                        The function @code{pie-chart} consumes a Table of data, along with the @italic{names of two columns in that table}. The first name tells the computer where to look to label each pie slice. The second tells the computer where to look to find out how big each pie slice should be. In this example, we used our @code{animals-table} table as our dataset, and made a pie chart showing the distribition of @code{pounds} across the shelter.
                    }
                    @teacher{
                        
                    }
            }
            @point{
                    @student{
                        Here is the contract for another function:
                        @code[#:multi-line #t]{
                             # bar-chart :: (t :: Table, label-col :: String, data-col :: String) -> Image
                        }
                        @activity{Use this function to make a bar chart showing the number of weeks it takes for each animal to be adopted.}
                    }
                    @teacher{
                        
                    }
            }
            @point{
                    @student{
                        Do you think we could use @italic{any} column for our labels? Could we use @italic{any} column for our data?
                        @activity{
                            Experiment with these two functions, passing in different column names for the label and data columns. If you get an error message, @italic{read it carefully!} What do you think are the rules for what kinds of columns can be used by @code{bar-chart} and @code{pie-chart}?
                        }
                    }
            }
         ]
  }

  @lesson/studteach[
     #:title "Counting Values"
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
                        As you can see, this isn't a terribly useful way to use Bar and Pie-Charts:
                        @itemlist[
                          @item{ 
                            With so many rows in our dataset, we wind up with tons of pie slices and bars, and it's very difficult to read.
                          }
                          @item{ 
                            Hovering over any pie slice or bar tells us the name of the animal and gives us the value at that cell in the table. But is that really that much an improvement over just looking that up ourselves in the table?
                          }
                        ]
                    }
                    @teacher{
                    }
              }
              @point{
                    @student{
                        We use charts to @italic{summarize} complex data into a simpler image, and to answer questions that would be difficult to answer by just staring at a table. For example, suppose we wanted to see a @code{pie-chart} showing how many of @italic{each species} was at the shelter?
                        @activity{
                          If you wanted to draw this pie chart by hand, how would you do it?
                        }
                    }
                    @teacher{
                        Let students discuss for a moment - the key insight here that @italic{counting} is required.
                    }
              }
              @point{
                    @student{
                        You'd need to first @italic{count} how many of each species was at the shelter, and make a @italic{new table} with columns for "name of the species" and "how many of that species is in the shelter". Then we'd make a @code{pie-chart} for @italic{that} table. For a table with hundreds of rows, this would take a very long time! Fortunately, Pyret has a function to do this for us! Try typing this code into the Interactions Area:
                        @code[#:multi-line #t]{
                          count(animals-table, "species")
                        }
                    }
                    @teacher{
                    }
              }
              @point{
                  @student{
                      @activity{
                        @itemlist[
                          @item{
                            Use the @code{count} function to make a table showing the number of animals of each @code{gender} at the shelter.
                          }
                          @item{
                            Use the @code{count} function to make a table showing the number of animals that are @code{fixed} (or not) at the shelter.
                          }
                        ]
                      }
                  }
                  @teacher{
                  }
              }
              @point{
                    @student{
                        @code{count} is a function that consumes a table and the name of a categorical column, and produces a @italic{new table} with exactly the columns we want: the name of the category and the number of times that category occurs in the dataset. What are the names of the columns in this new table?
                        @activity{
                          How can we use this alongside @code{pie-chart}?
                        }
                    }
                    @teacher{
                    }
              }
              @point{
                    @student{
                        Here are two ways to accomplish the same thing. Can you descibe what is happening in each one? Which do you like better?
                        @code[#:multi-line #t]{
                          # solution 1
                          species-table = count(animals-table, "species")
                          pie-chart(species-table, "value", "count")

                          # solution 2
                          pie-chart(count(animals-table, "species"), "value", "count")
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
                      Today you've learned about quantitative and categorical data. You've learned about Numbers, Strings, Booleans, and Images. You've learned about operators and functions, and how they can be used to make shapes, chart data, and even transform tables!
                  }
                  @teacher{
                  }
            }
            @point{
                  @student{
                      One of the other skills you'll learn in this class is how to diagnose and fix errors. Some of these errors will be @italic{syntax errors}: a missing comma, an unclosed string, etc. All the other errors are @italic{contract errors}. If you see an error and you know the syntax is right, ask yourself these two questions:
                      @itemlist[
                          @item{
                              What is the function that is generating that error?
                          }
                          @item{
                              What is the contract for that function?
                          }
                          @item{
                              Is the function getting what it needs, according to its Domain?
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
