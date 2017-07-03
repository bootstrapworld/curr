#lang curr/lib

@title{Unit 7: Select and Order}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to their first examples of operations that consume and produce tables, and learn how to select columns  and order rows. They are also introduced to the beginnings of Table Plans, as a vehicle for thinking through compound queries.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Select Queries"
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
                                      Open the @editor-link[#:public-id "0BxJ2mGqPUGt0WWpheFVBNUNXX2s" "Unit 7 starter file"], click Run, and use it to answer the following questions @bold{as fast as you can}:

                                      @itemlist[
                                              @item{
                                                    What was the political party of Franklin Pierce?
                                              }
                                              @item{
                                                    How much protein does a burrito have?
                                              }
                                              @item{
                                                    How much sugar does a chicken salad have?
                                              }
                                              @item{
                                                    Does Estonia have universal health care?
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
                              You may have noticed that answering these questions requires a little extra work, because the columns we need about are separated by a lot of uneccessary columns.  Finding the political party for Franklin Pierce requires looking at the @code{name, party} columns, but not any of the columns in between them.  It would be nice if we could choose only the columns we need, and put those into a new table.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type @code{presidents-selected} into the interactions window.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              When we want to answer questions about just a few columns in a table, @italic{we can remove the unecessary ones} with @vocab{select}.  @code{select} is a @vocab{table query}: a special key word that will create a new table using information from a starting table. Table queries are called queries because they are used to ask questions using specific information in tables. @vocab{select} creates a table containing only the columns that the programmer specifies.

                              @code[#:multi-line #t]{
                                      presidents-selected = select name, party from presidents end
                              }
                      }
                      @teacher{
                              Demonstrate the @code{select} query to the class, selecting different columns from the @code{presidents} table.
                      }
                }
                @point{
                      @student{
                              The @code{select} keyword will choose the column names given (in this case, @code{name}, @code{party}) from the specified table @code{presidents}, and create a new table with just those columns.
                      }
                      @teacher{
                              The benefits of using the @code{select} keyword are mostly for the programmer: having less columns does not make it significantly faster to perform operations on the table, but less columns does make it easier for humans to observe relations between columns (like in the examples above).          
                      }
                }
                @point{
                      @student{
                              When thinking about select queries, we ask ourselves @bold{are any columns unecessary?} If the answer is no, we have no work to do. But if the answer is yes, we can zoom in and think about which columns we want to keep. Suppose we wanted to make a brochure showing local restaurants and ratings. "Are any columns unecessary?" The following code will select only the @code{name, rating} columns from the restaurants table, and bind the new table to the variable @code{restaurants-selected}:

                              @code[#:multi-line #t]{
                                      restaurants-selected = select name, rating from restaurants end
                              }

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Complete @worksheet-link[#:name "Select-Practice"] in your workbook, and complete the exercises requiring you to write and interpret @code{select} statements.
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
                                                        In your definitions window, complete exercises 1 and 2.
                                                }
                                                @item{
                                                        Complete @worksheet-link[#:name "Select-Plan"].
                                                }

                                        ]
                                        Test your code by hitting the Run button and typing the new variable names into the interactions window.
                                }                       
                        }
                        @teacher{
                                Encourage students to think of the interactions area as a playground:  if a student needs to write a definition but don't know exactly how, they should experiment with different expressions in the interactions window until they are satisfied.  THEN they should bind that expression to a variable name in the definitions window.
                        }
                }
        ]
   }
@lesson/studteach[
     #:title "Order Queries"
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
                                                    Did Herbert Hoover, Benjamin Harrison and Millard Fillmore all belong to the same party?
                                              }
                                              @item{
                                                    What are the 5 countries with the smallest population?
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
                                The opposite order, in which values are INCREASING as you go further down the table, is called @vocab{ascending}.  Here's what the classroom table looks like ordered by the @code{test-grade} column in ascending order:

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
                                Pyret lets you change the order of a table's rows with the @code{order} query. This makes our questions a lot easier to answer quickly! For example, let's think back to our "most sodium" question...
                                
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Return to your @editor-link[#:public-id "0BxJ2mGqPUGt0WWpheFVBNUNXX2s" "Unit 7"] template file. Type @code{nutrition-ordered} into the interactions window.
                                }

                                Here, foods that have larger values in the sodium column will be closer to the top, and foods with smaller values in the sodium column will be closer to the bottom. The expression for ordering the @code{nutrition} table is the following:

                                @code[#:multi-line #t]{
                                      nutrition-ordered = 
                                          order nutrition:
                                              sodium descending
                                          end
                                }
                        }
                        @teacher{
                                 Demonstrate that this code can be crammed onto one line, but it may be more readable this way.                           
                        }
                }
                @point{
                        @student{

                                The key word @code{order} is followed by the name of the table we are ordering (in this case, @code{nutrition}), then a colon (@code{:}).  The colon always comes in front of an expression using column names.  In this case, we are ordering by the @code{sodium} column, in @code{descending} order.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Change the keyword @code{descending} in the definition of @code{nutrition-ordered} to @code{ascending}. Then hit Run and type @code{nutrition-ordered} into the interactions window. What has changed?
                                }

                                Now the table is in ascending order by the @code{sodium} column.  

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        What happens if we order the @code{nutrition} table by the food's name, which is a String?  Change the @code{sodium ascending} to @code{food ascending}
                                }

                                It turns out you can order tables by columns Numbers AND Strings.  A table in ascending order by a String means it is in alphabetical order, and descending means reverse alphabetical order.
                        }
                        @teacher{
                                        
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                        Can we order the presidents table by the presidents' last names? If not, why?
                                                }
                        
                                                @item{
                                                        In your definitions window, complete exercises 3 and 4.
                                                }
                                                @item{
                                                        Complete @worksheet-link[#:name "Order-Plan"].
                                                }

                                        ]
                                        Test your code by hitting the Run button and typing the new variable names into the interactions window.
                                }                       
                        }
                        @teacher{
                                                            
                        }
                }
                @point{
                        @student{
                                Notice how similar these two questions are. Both of them involve ordering the table by a column X to figure out which rows have the highest/lowest value for X. With this new ordered table, it's easy to see the first 5 presidents' political parties, or the 3 most populated countries.              
                        }
                        @teacher{
                                                     
                        }
                }
                @point{
                        @student{
                                The @code{order} keyword allow us to reorganize the entries of a table so that we can more easily answer these kinds of questions:

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
     #:title "Combining Queries"
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
                            These table operations are even more useful when they are combined:

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                        @item{
                                            Type @code{nutrition-selected} into the interactions window.
                                        }
                                        @item{
                                            Find the definition of @code{nutrition-selected} in the Definitions Area. What table is this query @italic{using}?
                                        }
                                    ]
                            }

                            This query does something you haven't seem before: @italic{it uses the result of a prior query}. We ordered our table by sodium content and bound the result to @code{nutrition-ordered}, and now we're @code{select}ing only the relevant columns from that table.
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @bold{Order matters}. Notice that we perform the @code{order} query first, before performing our @code{select} query. This order matters a lot! Suppose we wanted an alphabetical list of @italic{only the names} of our restaurants, ranked from the highest-rated to lowest-rated. If we @code{selected} the name column first, we wouldn't be able to put them in order.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    In the Definitions Area, complete exercises 5 and 6.
                            }
                    }
                    @teacher{
                            Students must comment out their earlier code to avoid name clashes between @code{nutrition-selected} and @code{countries-selected}.  We use the same names in different contexts, because this naming scheme helps scaffold students later when breaking down problems into their different table operations.
                    }
            }
            @point{
                    @student{
                            Combining table queries is extremely powerful, especially as you learn about some of the other queries that are possible in Pyret. But Data Science isn't about chaining queries together - @italic{it's about solving problems}. And just like in math, the hard part of problem-solving is rarely solving equations. It's setting up the equation in the first place! 
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
                    @student{
                            We can also think of Table Plans as a kind of puzzle-solver, for getting us from one table to another. 
                            @activity{
                                @itemlist[
                                    @item{
                                        Turn to @worksheet-link[#:name "Select-Order-Plan"], and look at the start and end table.
                                    }
                                    @item{
                                        What queries will get us from one to the other? Use this 2-step Table Plan to figure out the @code{order} and @code{select} queries that will produce the final table.      
                                    }
                                    @item{
                                        Complete @worksheet-link[#:name "Select-Order-Plan-2"].
                                    }
                                ]
                            } 
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
                                Table Plans allow us to turn query-writing into series of questions. By focusing on just one question at a time, we minimize our chances of making mistakes, and give ourselves a way to retrace our steps if something goes wrong. Being comfortable with Table Plans takes time, but once you've mastered them you'll find it gets easier and easier to program complex table queries.
                        }
                        @teacher{

                        }
                }
        ]
    }
}



