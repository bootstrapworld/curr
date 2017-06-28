#lang curr/lib

@title{Unit 7: Select and Order}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to their first examples of operations that consume and produce tables.  Students will select columns from tables, and order columns from tables.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Selecting"
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the @editor-link[#:public-id "0BxJ2mGqPUGt0WWpheFVBNUNXX2s" "Unit 7"] template file, and use it to answer the following questions:

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

                      }
                }
                @point{
                      @student{
                              You may have noticed that answering these questions requires a little extra work, because the columns involved are far apart.  Finding the political party for Franklin Pierce requires looking at the @code{name, party} columns, but not any of the columns in between them.  It would be nice if we could choose only the important columns and put those into a new table.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type @code{presidents-selected} into the interactions window.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              We can do just that with @vocab{select}.  @code{select} is a @vocab{table query}: a special key word that will create a new table using information from a starting table. @vocab{Table queries} are called queries because they are used to ask questions using specific information in tables. @vocab{select} creates a table containing only the columns that the programmer specifies.

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
                              The following code will select only the @code{name, rating} columns from the restaurants table, and bind the new table to the variable @code{restaurants-selected}:

                              @code[#:multi-line #t]{
                                      restaurants-selected = select name, rating from restaurants end
                              }

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Complete @worksheet-link[#:name "Select-Practice"] and @worksheet-link[#:name "Select-Continued"] in your workbook, and complete the exercises requiring you to write and interpret @code{select} statements.
                              }
                      }
                      @teacher{
                              @code{select} will be used in combination with @code{order} (and other operations later in the course) to produce tables that are easier for humans to visually extract relevant information from, so one exercise that could highlight these benefits is having students race (everyone tries to beat a time of 3 seconds) to find the 3 foods with highest protein amount, or what parties Herbert Hoover, Benjamin Harrison, and Millard Fillmore belong to.  When students have to keep scrolling back and forth to see which values are in entries within the rows they were searching for, they will see the benefits of removing columns with @code{select}.
                      }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                        In your definitions window, write code to create a new table with the variable name @code{countries-selected} by selecting the @code{country} and @code{continent} columns from the @code{countries} tables.
                                                }
                                                @item{
                                                        In your definitions window, write code to create a new table with the variable name @code{nutrition-selected} by selecting the @code{food} and @code{fat} columns from @code{nutrition}.
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
     #:title "Ordering"
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
      ]{f
        @points[
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
                                This table has all of the same rows as the classroom table, but they are now ordered by @code{test-grade} in @vocab{descending} order. It is in descending order by test grade because the test grades start high at the top of the table, and get lower further in the table.
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
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to @worksheet-link[#:name "Order-Practice"] in your workbook and complete the exercises for ordering tables.
                                }                   
                        }
                        @teacher{
                                You may want to go over this worksheet as a class, since it will involve ordering the table by different columns for each question.  Some students may order the table by the same column both times.
                        }
                }
        ]
   }
@lesson/studteach[
     #:title "Ordering in Pyret"
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
                                Pyret lets you change the order of a table's rows with the @code{order} table operation.
                                
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
                                                    The column nth contains a number representing the chronological order of the presidents (i.e. George Washington is the 1st president so the value of George Washington's nth column is 1). 

                                                    Create a new table @code{presidents-ordered} that is the @code{presidents} table ordered by the @code{nth} column, in @code{ascending} order. What are the political parties of the first 5 presidents?
                                                }
                                                @item{
                                                    Create a new table @code{countries-ordered} that is the @code{countries} table ordered by the @code{population} column, in descending order. What are the 3 countries have the highest population?
                                                }

                                        ]
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
     #:title "Combining Expressions"
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
                            These table operations are even more useful when they are combined:

                            @activity[#:forevidence "BS-IDE&1&1"]{ 
                                    Type @code{nutrition-selected} into the interactions window.
                            }

                            This new table was created using both the @code{order} and @code{select} table operations.
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Write the code necessary for each of these in the definitions window.  Make sure to comment out the select statements you wrote earlier for exercises 1, 2.

                                    @itemlist[
                                            @item{
                                                    Create a new table containing only the @code{name} column of @code{presidents-ordered}, and bind the variable @code{nutrition-selected} to this table.
                                            }
                                            @item{
                                                    Select @code{country} column from the @code{countries-ordered} table, and bind this table to the variable @code{countries-selected}.
                                            }
                                    ]
                            }
                    }
                    @teacher{
                            Students must comment out their earlier code to avoid name clashes between @code{nutrition-selected} and @code{countries-selected}.  We use the same names in different contexts, because this naming scheme helps scaffold students later when breaking down problems into their different table operations.
                    }
            }
        ]
   }


}

