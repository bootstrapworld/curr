#lang curr/lib

@title{Unit 8: Booleans and Filtering}

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
                                              @code{.row-n, .column, .select-columns, .order-by}
                                              ""))]{
    @unit-descr{Students are introduced to booleans and comparisons, and practice using them as predicates to write filter queries.}
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
                              China is an economic superpower. It's is one of the world's largest economies, and has tremendous growth each year. But Japan is also one of the world's largest economies - how much of Asia's total GDP does @italic{China} generate, compared to the other Asian countries? How could you answer this question?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Turn to @worksheet-link[#:name "Unit-8"] and take two minutes to write down what you think.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @bitmap{images/sieve.png}
                              We have our @code{countries} table, which lists @italic{every} country in the world and shows their GDP. But to answer this question, we need to learn two new things:
                              @itemlist[
                                  @item{
                                      How to write code that @italic{checks} if the row for a country is in Asia.
                                  }
                                  @item{
                                      How to use that check to generate a table showing only countries in Asia. Essentially, we want to create a @italic{filter} that traps all the rows we want - getting rid of the ones we don't.
                                  }

                              ]
                      }
                      @teacher{

                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Filtering"
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
                              We want to go through each of the countries in the table, and ask "is the value in the continent column equal to @code{"asia"}". This is a yes-or-no question, which immediately makes us think we'll need: Booleans!
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the @editor-link[#:public-id "0BzzMl1BJlJDkNkEtSXdzeXUyMGs" "Unit 8 Starter File"], Save a Copy, and Run the program.

                                      @itemlist[
                                            @item{
                                                  Type @code{restaurants} into the Interactions Area.
                                            }
                                            @item{
                                                  Type @code{restaurants-filtered} into the Interactions Area.
                                            }
                                      ]
                                      What is different about these two tables?
                              }
                      }
                      @teacher{
                              Guide students' discussion towards these points:
                              @itemlist[
                                    @item{
                                          @code{restaurants-filtered} has fewer rows
                                    }
                                    @item{
                                          All of the restaurants in @code{restaurants-filtered} have a rating greater than or equal to 4.0
                                    }
                              ]
                      }
                }
                @point{
                      @student{
                              When we want to filter a Table, we can use the @code{.filter} method. The contract for this method is shown below, along with an example expression that filters the @code{restaurants} table to show only highly-rated restaurants.
                              @code[#:multi-line #t]{
                                    # <Table>.filter :: (test :: (Row -> Boolean)) -> Table
                                    restaurants-filtered = restaurants.filter(high-rating)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Around line 22, you'll find some new code that you've never seen before:
                              @code[#:multi-line #t]{
                              fun high-rating(row):
                                row["rating"] >= 4
                              end
                              }
                              This @bold{defines a function} called @code{high-rating}, which takes in a row. What does it do with that row? How can you tell?
                      }
                      @teacher{
                              Be sure to talk students through this carefully, emphasizing that the @code{high-rating} function @italic{consumes a Row and produces a Boolean}.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Complete the next three excersises in the Definitions Area: Define new functions to solve Low-Calorie, CA Presidents, and Asian Countries.
                              }
                      }
                      @teacher{
                              Warning: When attempting the @code{presidents-filtered} problem, some students will probably run into a bug if they're not careful about capitalization!
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "3-Step Table Plans"
     #:duration "30 minutes"
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
                          @code{filter} queries will now become the first step in our Table Plan. Before we worry about ordering or selecting, we'll ask whether or not we want to drop any rows from our dataset. If the answer is no, we can skip ahead to ordering. But if it's yes, we'll write that @code{filter} query first.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              Turn to @worksheet-link[#:name "3-Step-Plan-1"] in your workbook, and fill in the Table Plan that will solve the Word Problem and get you from the start table to the end table. When you're done, type your solution queries into the Definitions Area under "Recent Title/Area".
                          }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                          @activity{
                              Sometimes it's obvious what your end table will have to look like, but a lot of the time you'll need to figure that out for yourself. For practice, turn to @worksheet-link[#:name "3-Step-Plan-2"] and read the Word Problem @italic{carefully}. This time, you'll have to fill in the end table yourself, before you start your table plan! When you're done, type your solution queries into the Definitions Area under "Title and Overseas".
                          }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                          Data scientists often have to work with enormous tables, containing thousands or even millions of rows! When figuring out your table plan, it's helpful to create just a small "starter table" so you can think things through. But what makes a good starter table?
                          @itemlist[
                              @item{
                                  A good starter table contains @italic{at least} the columns that matter - whether we'll be ordering, selecting, or sieving by those columns.
                              }
                              @item{
                                  A good starter table has enough rows to be a representative sample of the dataset.
                              }
                              @item{
                                  A good starter table has rows in truly random order, so that we'll notice if we need to order the table or not.
                              }
                              @item{
                                  A good starter table has a representative sample of rows from our full table. For example, a starter table based on @code{presidents} isn't very good if it only has Democratic presidents, or only presidents from the 1800s. That's a sampling bias that makes it harder to realize what we need to @code{filter} by!
                              }
                          ]
                          @activity{
                              It will take some practice for you to get good at making Starter Tables, but you can start by identifying @italic{bad} ones! turn to @worksheet-link[#:name "Bad-Starter-Tables"], and write down what's wrong with each of these tables.
                          }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                    @student{
                        @activity{
                              Turn to @worksheet-link[#:name "3-Step-Plan-3"] and read the Word Problem. This time you'll need to come up with a good starter table @italic{and} end table! When you're done, type your solution queries into the Definitions Area under "Asian GDPs".
                        }

                    }
                    @teacher{

                    }
               @point{
                    @student{
                        Now it's time to return to our original question: how much of Asia's total GDP does @italic{China} generate, compared to the other Asian countries? 

                        @activity{
                            Use the table you've created to generate a chart, showing the GDP of every country in Asia.
                        }
                    }
                    @teacher{
                        Some students will likely use pie, bar charts, or perhaps something else for this - point out the differences, and ask the class to discuss the pros and cons of each chart!
                    }
              }
                }
        ]
   }
@lesson/studteach[
     #:title "Closing"
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
                        Take a few minutes and record your findings on @worksheet-link[#:name "Unit-8"]. Do your findings match your hypothesis? What new questions does this raise?
                    }
                    @teacher{

                    }
                }
        ]
  }
}