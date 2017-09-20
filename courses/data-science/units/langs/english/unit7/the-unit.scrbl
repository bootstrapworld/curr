#lang curr/lib

@title{Unit 7: Select and Order}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              "n/a" 
                                              (list @code{"hello" "91"} ))
                                       (list "Image" 
                                              @code{triangle, star, draw-chart...} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "DataSeries" 
                                              @code{function-plot, scatter-plot, bar-chart, pie-char, freq-bar-chart, histogram} 
                                              "")
                                       (list "List" 
                                              @code{.get, mean, median, modes} 
                                              @code{[list: "list", "of", "strings"]})
                                       (list "Table"
                                              @code{.row-n, .column}
                                              ""))]{
  @unit-descr{Students are introduced to their first examples of operations that consume and produce tables, and learn how to select columns and order rows. They are also introduced to the beginnings of Table Plans, as a vehicle for thinking through compound queries.}
}
@unit-lessons{


@lesson/studteach[
   #:title "Review"
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
                      @activity{
                          Take 15 minutes to answer question 9 in your Project Report.
                      }
                  }       
                  @teacher{
                      See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Project Report") to see an exemplar of student work.
                  }              
            }
      ]
 }

@lesson/studteach[
     #:title "Selecting"
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
                              Open the @editor-link[#:public-id "0BzzMl1BJlJDkQTBLVmhyTTZGUWM" "Unit 7 Starter File"], Save a Copy, and Run the program. Today we're going to look at a new table, called @code{movies}. 
                              @activity[#:forevidence "BS-IDE&1&1"]{

                                      @itemlist[
                                              @item{
                                                    What was the domestic gross for "Big Hero 6"?
                                              }
                                              @item{
                                                    What was the overseas gross for "Up"?
                                              }
                                              @item{
                                                    What was the total gross for "Zootopia"?
                                              }
                                              @item{
                                                    What year did "Maleficent come out?"
                                              }
                                      ]
                              }
                      }
                      @teacher{
                        Suggestion: Give the class one question at a time, and time them for each one. Afterwards, ask them what made it hard to answer things quickly.
                      }
                }
                @point{
                      @student{
                              You may have noticed that answering these questions requires a little extra work, because the columns we need are separated by a lot of uneccessary columns. Finding the year "Maleficent" came out requires looking at the @code{title, year} columns, but not any of the columns in between. It would be nice if we could choose only the columns we need, and put those into a new table.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type @code{movies-selected} into the Interactions Window. What did you get back? In the Definitions Area, find the line of code that defines @code{movies-selected}.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              When we want to answer questions about just a few columns in a table, @italic{we can grab the ones we want} with @code{select-columns}. @code{select-columns} is a @vocab{method} that creates a new table containing only the columns that the programmer specifies. 

                              @code[#:multi-line #t]{
                                      movies-selected = movies.select-columns([list: "title", "year"])
                              }
                      }
                      @teacher{
                              Demonstrate the @code{select-columns} method to the class, selecting different columns from the @code{movies} table.
                      }
                }
                @point{
                      @student{
                              What is the contract for @code{select-columns}? We know that it's a method, so we should write down the Type of data it's attached to as part of the name: @code{<Table>.select-columns}. The Domain is a list of Strings, and the Range is a @italic{new Table}. Take a minute to write the contract for @code{select-columns} in your contracts page:
                              @code[#:multi-line #t]{
                                <Table>.select-columns :: (cols :: List<String>) -> Table
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Why would we want to use @code{select-columns} to drop columns from a table? Because removing data can be an important part of @italic{privacy}! A Data Scientist might need to analyze medical records of everyone in a particular hospital, but they don't want to share the names attached to those records. By using @code{select-columns}, they can produce a table that keeps all the relevant data, without the names.
                      }
                      @teacher{
                      }
                }
                @point{
                      @student{
                              When thinking about select queries, we ask ourselves @bold{what columns do we need?} If the answer is no, we have no work to do. But if the answer is yes, we can zoom in and think about which columns we want to keep. Suppose we wanted to make a brochure showing local restaurants and ratings. "What columns do we need?"

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                          @item{
                                              In your Definitions Area, complete the next two exercises ("Countries and Continents" and "Fat Content Information"). Test your code by hitting the Run button and typing the new variable names into the Interactions Area.
                                          }
                                          @item{
                                              Complete @worksheet-link[#:name "Select-Practice"] in your workbook, and complete the Word Problems requiring you to write and interpret @code{select} statements.
                                          }
                                          @item{
                                              Complete @worksheet-link[#:name "Select-Plan"].
                                          }
                                      ]
                              }
                        }
                        @teacher{
                                Encourage students to think of the interactions area as a playground: if a student needs to write a definition but don't know exactly how, they should experiment with different expressions in the Interactions Area until they are satisfied. THEN they should bind that expression to a variable name in the Definitions Area.
                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Ordering"
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
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                      Answer the following questions @bold{as fast as you can}:

                                      @itemlist[
                                              @item{
                                                    Which three foods have the most sodium?
                                              }
                                              @item{
                                                    Which 3 movies had the highest domestic gross ticket sales?
                                              }
                                              @item{
                                                    What are the 3 countries with the smallest population?
                                              }
                                      ]
                              }
                        }
                        @teacher{
                          Suggestion: Give the class one question at a time, and time them for each one. Afterwards, ask them what made it hard to answer things quickly.
                      }
                }
                @point{
                        @student{
                                Let's look again at our favorite 4th grade class. This time, we have 3 columns: 
                                First name, Last name, and the students' grades on the most recent test.

                                @build-table/cols[
                                            '("first" "last" "test-grade")
                                            '(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
                                              ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
                                              ("82" "86" "88" "76" "81" "93" "79" "91"))
                                             (lambda (r c) (para ""))
                                             3 8
                                ]

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                     Who had the highest score on the test?
                                                }
                                                @item{
                                                     What are the names of the top 4 scorers?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                                            
                        }
                }
                @point{
                        @student{
                                When we answer this question, we have to look through every row in the table to figure out what the top 4 scores are, then the names of the students with those scores. The next operation we will see is @vocab{ordering}. @vocab{Ordering} is sorting all of the rows in a table in a meaningful way, using one of the columns in particular. Data scientists will often order tables so that they are easier to search through.
                        }
                        @teacher{
                                         
                        }
                }
                @point{
                        @student{
                                This table has all of the same rows as the classroom table, but they are now ordered by @code{test-grade} in @vocab{descending} order. It is in descending order by test grade because the test grades start high at the top of the table, and get lower further in the table.
                                @build-table/cols[
                                            '("first" "last" "test-grade")
                                            '(("\"Dominique\"" "\"Andrea\"" "\"Javon\"" "\"Jane\"" "\"John\"" "\"Jack\"" "\"Sammy\"" "\"Angela\"")
                                              ("\"Rodriguez\"" "\"Garcia\"" "\"Jackson\"" "\"Smith\"" "\"Doe\"" "\"Thompson\"" "\"Carter\"" "\"Enriquez\"")
                                              ("93" "91" "88" "86" "82" "81" "79" "76"))
                                             (lambda (r c) (para ""))
                                             3 8
                                ]
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                The opposite order, in which values are INCREASING as you go further down the table, is called @vocab{ascending}. Here's what the classroom table looks like ordered by the @code{test-grade} column in ascending order:

                                @build-table/cols[
                                            '("first" "last" "test-grade")
                                            '(("\"Angela\"" "\"Sammy\"" "\"Jack\"" "\"John\"" "\"Jane\"" "\"Javon\"" "\"Andrea\"" "\"Dominique\"")
                                              ("\"Enriquez\"" "\"Carter\"" "\"Thompson\"" "\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Garcia\"" "\"Rodriguez\"")
                                              ("76" "79" "81" "82" "86" "88" "91" "93"))
                                             (lambda (r c) (para ""))
                                             3 8
                                ]
                        }
                        @teacher{
                                                     
                        }
                }
                @point{
                        @student{
                                Pyret lets you change the order of a table's rows with the @code{order-by} method. The contract for this method is:
                                @code[#:multi-line #t]{
                                    <Table>.order-by :: (col :: String, ascending :: Boolean) -> Table
                                }
                                This makes our questions a lot easier to answer quickly! For example, let's think back to our "most sodium" question...
                                
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Return to your @editor-link[#:public-id "0BxJ2mGqPUGt0WWpheFVBNUNXX2s" "Unit 7"] template file. Type @code{presidents-ordered} into the interactions window.
                                }

                                Here, movies are in alphabetic order by title, from A to Z. The table is sorted by the @code{"title"} column, in ascending order. Both of the following lines of code are definitions. One should look familiar, while the other uses the @code{.order-by} method. What do you think would need to change to have it ordered in @italic{descending} order? 

                                @code[#:multi-line #t]{
                                      a = 4 + 2
                                      movies-ordered = movies.order-by("title", true)
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                        Can we order the movies table by the second word in the title? If not, why?
                                                }
                        
                                                @item{
                                                        In the Definitions Area, complete the next two exercises: "Salt Order" and "Population Order".
                                                }
                                                @item{
                                                        Complete the word problems on @worksheet-link[#:name "Order-Plan"].
                                                }
                                        ]
                                        Test your code by hitting the Run button and typing the new variable names into the interactions window.
                                }                       
                        }
                        @teacher{
                              Pyret has a way to sort by multiple columns as well, but that requires one additional concept that students haven't seen yet. Documentation can be @(hyperlink "https://www.pyret.org/docs/horizon/tables.html#%28part._tables_.Table_order-by-columns%29" "found here").
                        }
                }
                @point{
                        @student{
                                The @code{order-by} method allow us to sort the entries of a table so that we can easily answer these kinds of questions:

                                @itemlist[
                                        @item{
                                                What rows have the highest value in a particular column?
                                        }
                                        @item{
                                                What rows have the lowest value in a particular column? 
                                        }
                                ]               
                        }
                        @teacher{
                                                            
                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Combining Methods"
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
                            These table operations are even more useful when they are combined:

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                        @item{
                                            Type @code{b} into the Interactions Area. Where is the definition for @code{b}?
                                        }
                                        @item{
                                            Type @code{studio-and-gross} into the Interactions Area. Where is the definition for @code{studio-and-gross}?
                                        }
                                        @item{
                                            Are the rows in the @code{studio-and-gross} table in any particular order?
                                        }
                                    ]
                            }
                            You've already seen definitions that refer back to previous definitions, and this is no different. The definition for @code{b} @italic{uses} the definition for @code{a}. Here the definition for @code{studio-and-gross} @italic{uses} the definition for @code{movies-ordered}. Note that the new table is @italic{still sorted}, even though we've dropped the column we used to sort!
                    }
                    @teacher{
                        Why would you want to order by one column, and then throw that column away?

                        Selecting is merely a presentation matter, but sometimes it matters whether a column is in the output or not. Suppose we want sort a class's data by grade; we may want to share the ranking of students, but we certainly don't want to leak their grades! In that case it's vital that we select away the grades column @italic{after sorting}.                  
                    }
            }
            @point{
                    @student{
                            This is another example of why @bold{order of operations matters}. If we'd @code{select}ed our columns first, there would be no way for us to achieve this ordering. That's why we always put @code{order} before @code{select}.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            In this course, we'll use @bold{Table Plans} to help us set up our queries. One way to think about Table Plans is to view them as a "Recipe" for writing queries: by answering a series of questions about our data, we can gradually piece together the queries we need. 
                    }
                    @teacher{
                            If your students are familiar with the Design Recipe from Bootstrap:Algebra or Bootstrap:Reactive, this is the time to make those connections!
                    }
            }
            @point{
                    @student{
                            We can also think of Table Plans as a kind of puzzle-solver, for getting us from one table to another. 
                            @activity{
                                @itemlist[
                                    @item{
                                        Turn to @worksheet-link[#:name "Select-Order-Plan"], and look at the start and end table.
                                    }
                                    @item{
                                        What queries will get us from one to the other? Use this 2-step Table Plan to figure out the @code{order} and @code{select} queries that will produce the final table. When you've finished, type these queries into the Definitions Area, under "Gross and Domestic".
                                    }
                                    @item{
                                        Complete @worksheet-link[#:name "Select-Order-Plan-2"]. When you've finished, type these queries into the Definitions Area, under "Title and Year"
                                    }
                                ]
                            }
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            Table Plans allow us to turn query-writing into a series of questions. By focusing on just one question at a time, we minimize our chances of making mistakes, and give ourselves a way to retrace our steps if something goes wrong. Being comfortable with Table Plans takes time, but once you've mastered them you'll find it gets easier and easier to program complex table queries.
                    }
                    @teacher{

                    }
            }
        ]
   }

@lesson/studteach[
     #:title "Closing"
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
                          At this point, you may have noticed that your dataset contains a few "extreme" points that skew the results of your analysis. Perhaps one movie was a box-office failure, or a war in one country is artificially dragging down their life-expectency. These extreme points are called @vocab{outliers}, and sometimes it's best to remove them from your dataset in order to identify a pattern. Or perhaps you've decided you want to zoom in on a subset of the data, or break it apart and do an analysis on two different groups. Maybe you want to run a separate analysis for movies with female leads v. male leads, or analyze Democratic and Republican presidents separately. You don't know how to do this - yet - but that's exactly what we'll cover in the next lesson!
                          @activity{
                              Take 10 minutes to answer question 9 in your Project Report.
                          }
                      }       
                      @teacher{
                          See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Project Report") to see an exemplar of student work.
                      }              
                }
        ]
    }
}