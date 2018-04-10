#lang curr/lib

@title{Unit 5: Quantity Charts}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat, string-contains} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{.row-n, .order-by, .filter, .build-column}
                                              ""))]{
  @unit-descr{
      Students construct Bar and Pie Charts in Pyret, to visualize the @italic{quantities} present in rows of their dataset. They experiment with these visualizations in a contrived dataset, apply them to their own research, and interpret the results. They also begin to write their own Sample Tables
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Introduction"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.3")
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
                                Tables are great when we want to find a specific piece of information, like "how old is Wade the cat?" or "how long was Nibblet in the shelter before being adopted?".
                                @activity[#:forevidence (list )]{
                                    Turn to @worksheet-link[#:name "Column-Statements"] in your Student Workbook, and answer the questions you find there. 
                                }
                        }
                        @teacher{
                                    Debrief with the class.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")]{
                                    Sometimes it's easier to @italic{visualize} your dataset using a chart or a graph. Turn to @worksheet-link[#:name "Visualizing-Quantity"] in your student workbook. This page contains two charts for a small sample of 7 animals. On the left, we have a bar chart of animals' ages. On the right, a pie chart showing their weight. We can make a lot of observations about these charts, and there are two of them written in the table at the bottom of the page. Can you add two more?
                                }
                        }
                        @teacher{
                                Debrief with the class, paying special attention to the last question: when @italic{is} one chart better than another?
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Bar & Pie Charts"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.3")
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
                              You've now seen two kinds of charts: @vocab{bar chart} and @vocab{pie charts}. Both charts involve quantities and labels: each bar and slice is a measure of a quantitative column, and each one has a label. Both charts help us look at the whole dataset at once, and answer questions about @italic{quantity}. As you've observed, bar charts are great when we want to know exactly "how much" of a thing is contained in a single row. Pie charts, on the other hand, are best when we want to know "what percent" of the thing in our table is contained in a single row.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
                              }

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's take a look at their contracts...
                              @code[#:multi-line #t]{
                                    bar-chart :: (t :: Table, label :: String, value :: String) -> Image
                                    pie-chart :: (t :: Table, label :: String, value :: String) -> Image
                              }
                              The last two functions first consume the @italic{Table} that we want to look at, and their other arguments tell us @italic{which columns to look at} for both the labels and the values.
                      }
                      @teacher{
                        
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")]{
                                  In the Interactions Area, type @code{pie-chart(animals-table, "name", "age")} and hit Enter. What happens? What happens when you hover over a slice of the pie? These plots are @italic{interactive}! This allows us to experiment with the data before generating the final image. 
                              }
                      }
                      @teacher{
                              Hovering over a pie slice or bar reveals the value or percentage of the whole, and the label.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                              @item{
                                                    Create a bar and pie chart showing the age of every animal in the shelter.
                                              }
                                              @item{
                                                    Create a bar and pie chart showing the weight of every animal in the shelter.
                                              }
                                      ]
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Table Plans"
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
                          @activity[#:forevidence (list )]{
                            Turn to @worksheet-link[#:name "Pie-Dog-Weight"], and read the word problem carefully. Then write a Contract and Purpose Statement for this word problem.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bitmap{images/pie.png}
                          This time, our Result isn't a Table -- it's an @italic{Image}: a pie chart showing the weights of all the dogs in our shelter. @bold{Note:} When writing a Sample Table, it's okay to skip a few columns and focus on the ones you care about. Keep this in mind for the future!
                          @activity[#:forevidence (list )]{
                              Sketch a pie chart based on your Sample Table. When you're done, move on to defining the function, and fill out the methods to define the table. Do we need to build any columns? Filter any rows? Order the table?
                          }
                      }
                      @teacher{
                          Look to make sure students are drawing the right kind of chart, using the right labels, and have slices that are proportional to the data in their Sample Table.
                      }
                }
                @point{
                      @student{
                          We've got most of our function written:
                          @code[#:multi-line #t]{
                          pie-dog-weight :: (animals :: Table) -> Number
                          # Consume a table of animals, and produce a pie-chart showing the weight of the dogs
                          fun pie-dog-weight(animals):
                            t = animals.filter(is-dog)     # define the table
                            ...                            # produce our result
                          end
                          }
                          What expression will produce our result? Our purpose statement tells us we need to make a @code{pie-chart}, so we can start there. Which table should we use? Which column gives us our labels? Our values?
                      }
                      @teacher{
                          If there's only one method being used, it's convention to put the method call on the same line as the table.
                      }
                }
                @point{
                      @student{
                          Putting it all together, we get:
                          @code[#:multi-line #t]{
                          pie-dog-weight :: (animals :: Table) -> Number
                          # Consume a table of animals, and produce a pie-chart showing the weight of the dogs
                          fun pie-dog-weight(animals):
                            t = animals.filter(is-dog)     # define the table
                            pie-chart(t, "name", "pounds") # produce our result
                          end
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity[#:forevidence (list )]{
                              When your teacher has checked your paper, type in this function and try it! @bold{Based on this pie chart, does it look like some dogs are a lot heavier than others, or are the weights @italic{evenly distributed}?}
                          }
                          Not at all! Kujo and Mr. Peanutbutter each take up more than 13% of the total weight, but almost every other dog's share is 7% or less.
                      }
                      @teacher{
                          Hit this point hard. Seeing the pie slices gives us a feel for the @italic{distribution} of the dataset.
                      }
                }
                @point{
                      @student{
                          Up to now, the Sample Table has been provided for you. But for our next Table Plan, you'll need to make one of your own! A good Sample Table should have:
                          @itemlist[
                                @item{
                                    @italic{At least} the columns that matter - whether we'll be ordering or filtering by those columns.
                                }
                                @item{
                                    A good Sample Table has enough rows to be a representative sample of the dataset. If our dataset has a mix of dogs and cats, for example, we want at least one of each in this table.
                                }
                                @item{
                                    A good Sample Table has rows in random order, so that we'll notice if we need to order the table or not.
                                }
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity[#:forevidence (list )]{
                                It will take some practice for you to get good at making Sample Tables, but you can start by identifying @italic{bad} ones! turn to @worksheet-link[#:name "Bad-Sample-Tables"], and write down what's wrong with each of these tables.
                          }
                    }
                    @teacher{
                          If you're teaching a math or statistics class, go deeper to discuss sampling techniques and sample errors.
                    }
              }
              @point{
                    @student{
                          @activity[#:forevidence (list )]{
                              @bitmap{images/bar.png}
                              Turn to @worksheet-link[#:name "Bar-Kitten-Adoption"], and fill out the Contract and Purpose Statement. First, we'll provide a name that refers back to our dataset: @code{animals-table}. Then we need to provide a good Sample Table for this word problem. Fill out a good Sample Table and write your result.
                          }
                    }
                    @teacher{
                          Be sure to check the Sample Tables, and even have students trade workbooks and grade each other's Sample Tables.
                    }
              }
              @point{
                    @student{
                          @activity[#:forevidence (list )]{
                              Once your teacher has checked your Sample Table, type in the code for this function and try it out!
                          }
                    }
                    @teacher{
                    
                    }
              }
        ]
  }
  @lesson/studteach[
     #:title "Your Dataset"
     #:duration "25 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.2")
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
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Try making a bar or pie chart of a column in your dataset, and write up your findings on @worksheet-link[#:name "Visualizing-My-Dataset-1"]. 
                        }
                    }       
                    @teacher{
                        Give students 10-15min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                    }              
              }
              @point{
                    @student{
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Do you notice that the outliers all of something in common? What new questions does this raise? Would you like to change your table by filtering it or building a new column? If so, go deeper into your data, using @worksheet-link[#:name "Blank-Table-Plan-1"] and @worksheet-link[#:name "Blank-Table-Plan-2"] to figure out how you want to change your dataset. Write up your findings on @worksheet-link[#:name "Visualizing-My-Dataset-1"].
                        }
                    }
                    @teacher{
                        Give students 5-10min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
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
                        Bar and Pie Charts are powerful tools that make it easy to talk about the amount (or relative amount) of quantitative data in our dataset. But what if we wanted to see @italic{how many dogs v. cats there are in our dataset}? This question is about @italic{frequency} - specifically how often the @code{species} column is @code{"cat"} or @code{"dog"}. What if we wanted to know how many animals were between 1-10 pounds, 11-20 pounds, 21-30 pounds, and so on? Once again, that's a question about how @italic{frequent} a particular weight range comes up.
                    }       
                    @teacher{

                    }              
              }
        ]
   }
}
