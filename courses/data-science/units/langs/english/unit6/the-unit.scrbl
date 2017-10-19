#lang curr/lib

@title{Unit 6: Visualization}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr, mean, median, modes} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat} 
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
    Students are introduced to Visualizations in Pyret, and learn how to construct and interpret DataSeries for Pie Charts, Bar Charts, Frequency Bar Charts, and Histograms. After experimenting with these visualizations in a contrived dataset, they apply them to their own research and intepret the results in their research papers. 
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
                                
                        }
                        @teacher{
                                
                        }
                }
        ]
  }


  @lesson/studteach[
     #:title "Bar & Pie Charts"
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
                              In Pyet, you can easily construct pie charts and bar charts with functions.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the @editor-link[#:public-id "0BzzMl1BJlJDkVkViWHFGZy02UnM" "Unit 3 Starter File"], Save a Copy and Run the program. You should see the bar and pie charts from the previous section appear sequentially.
                              }

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's use these lists to build two different kinds of charts
                              @code[#:multi-line #t]{
                                    # Define some DataSeries
                                    cholesterol-bar-series = bar-chart(nutrition, "food", "cholesterol")
                                    cholesterol-pie-series = bar-chart(nutrition, "food", "cholesterol")
                              }

                              This code uses new functions you haven't seen before: @code{bar-chart} and @code{pie-chart}. As you might expect, the contracts for these function are:
                               @code[#:multi-line #t]{
                                    # bar-chart :: (t :: Table, label :: String, value :: String) -> DataSeries
                                    # pie-chart :: (t :: Table, label :: String, value :: String) -> DataSeries
                              }

                              What do the arguments in their domains represent?
                              @itemlist[
                                      @item{
                                            The first is the Table that we want to visualize.
                                      }
                                      @item{
                                            The second is the name of the column that we want to use as labels. These will be the @italic{labels} of a bar or pie slice on the chart.
                                      }
                                      @item{
                                            The third is the name of the quantitative column that we want to measure. Each of these corresponds to the @italic{size} of a bar or slice on the chart.
                                      }
                              ]
                      }
                      @teacher{
                        
                      }
                }
                @point{
                      @student{
                              These plots are @italic{interactive}, allowing you to experiment with the data before you generate the final image. While the plot window is open, it's interactive: what happens when you hover over a slice of the pie?
                      }
                      @teacher{
                              It reveals the value and percentage of the whole.
                      }
                }
                @point{
                      @student{

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                              @item{
                                                    Create a bar chart displaying the amount of sodium for each menu item in @code{nutrition}.
                                              }
                                              @item{
                                                    Create a pie chart showing the GDP of every country in @code{countries}.
                                              }
                                      ]
                                      After completing these bar charts, turn to @worksheet-link[#:name "Questions-With-Charts"] in your workbook and answer the questions using these charts.
                              }
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            Students should add 2 more function calls to their definitions window; one using @code{bar-chart}, the other using @code{pie-chart}.
                                      }
                                      @item{
                                            Emphasize that students should choose informative axis & title names, as if they're showing these charts to someone who has never seen these tables before.
                                      }
                              ]
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Frequency Bar Charts"
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
                              Recall the table of our favorite 4th grade class from Unit 2:

                              @build-table/cols[
                                    '("First" "Last" "Eye-Color")
                                    '(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
                                      ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
                                      ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\""))
                                     (lambda (r c) (para ""))
                                     3 8
                              ]

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Freq-Bar-Chart"] in your workbook, and complete the exercise using this table.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              By filling in the last bar, you have created a bar chart. However, there's something special about chart. What is different about this bar chart from the ones we have created before?
                              @itemlist[
                                      @item{
                                            Previous bar charts used a column from the table as the labels, and another column as the values.
                                      }
                                      @item{
                                            In this bar chart, we are using the @vocab{categories} of a column as the labels, and the @vocab{frequency} of each category as the value.
                                      }
                              ]
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              Here, we are looking at the Eye Color column, which contains categorical data. In this special kind of bar chart, we are computing the @vocab{frequency} of each category, and that frequency relates to the length of each bar. Since there are 3 people with brown eyes, the bar for Brown extends to 3 marks long.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              This special kind of bar chart is called a @vocab{frequency bar chart}.  There's a function in Pyret that lets us build frequency bar charts from a table:
                              @code[#:multi-line #t]{
                                freq-bar-char :: (t :: Table, values :: String) -> DataSeries
                              }
                              Below is an example that computes the frequency of categories in the @code{home-state} column of @code{presidents}.

                              @code[#:multi-line #t]{
                                    home-state-frequency = freq-bar-chart(presidents, "home-state")
                              }

                              What do the arguments in @code{freq-bar-chart}'s domain mean?
                              @itemlist[
                                      @item{
                                            The first is the Table that we want to visualize.
                                      }
                                      @item{
                                            The second is the name of the categorical column that we want to count. Each of these corresponds to the @italic{size} of a bar in the chart.
                                      }
                              ]
                      }
                      @teacher{
                          Show students that this is slightly different than how they've seen it before, breaking out the @code{home-state} column into its own definition.
                      }
                }
        ]
   }  

@lesson/studteach[
     #:title "Histograms"
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

                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                We can use a different kind of chart for visualizing @italic{how frequent values are} in a list of quantitative data. This kind of chart is a called @vocab{histogram}.

                                
                                The contract for @code{histogram} is:
                                @code[#:multi-line #t]{
                                    # histogram :: (t :: Table, values :: String, bin-size :: Number) -> DataSeries
                                }
                                @itemlist[
                                        @item{
                                                The first is the Table that we want to visualize as a histogram.
                                        }
                                        @item{
                                                The second is the name of the quantitative column, wich we want to sort into bins.
                                        }
                                        @item{
                                                The third is @italic{the size of bins} into which we will distribute these quantitative values.
                                        }
                                ]
                        }
                        @teacher{
                                Show students the histogram before explaining what the second argument (size of bins) means, to give them a point of reference. It may be easier for you to project the live code/image of the histogram. Since students do not yet know what a histogram is, or what this code is doing, they will have a harder time if they make syntax errors.
                        }
                }
                @point{
                        @student{
                                @bitmap{images/histogram.png}
                                We want to count the number of times @italic{each} permutation shows up in the dice game. Since there are 11 possible values for each dice roll, we have 11 bars in our chart. Just like the frequency bar charts from last unit, the length of the bar corresponds with how frequent a value is. For example, the longest bar the bar for 7, because 7 is the most frequent. Notice the shape of the histogram: the further away from 7, the less common the number.
                        }
                        @teacher{
                                For curious students, you can explain this by showing that there are more combinations that add up to 8 than there are for 2 (for example).
                        }
                }
                @point{
                        @student{
                                By hovering over a particular bar on the histogram, you can see how frequent a value is.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                    Hover over the middle bar, for the number 7.  How many 
                                                    times was a 7 rolled?
                                                }
                                                @item{
                                                    Out of the 10000 rolls, is this more than half?  Less than half?
                                                }
                                                @item{
                                                    Run the code to make the histogram a few more times.  Is the 
                                                    number of times 7 appears ever more than 5000 times?
                                                }
                                                @item{
                                                    Turn to @worksheet-link[#:name "Unit-5"] and write down your findings.
                                                }
                                        ]
                                }

                                The roll 7 is definitely the roll that happens the most often.  However, it never
                                appears more than half of the 10000 rolls. That means, most of the time we 
                                play this game, we will lose!
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Frequency Bar charts and Histograms both count the @italic{frequency} in which values show up in a dataset. Histograms provide extra features for @vocab{quantitative data}: the bars are ordered from left to right, and the bins can be resized. Both of these are only made possible because quantitative data can be compared - one bar can be said to be "greater than" than another bar, and a value can be said to be "within" the range of a bin. For categorical data, neither of these is the case, so we use bar charts instead of histograms. Frequency bar charts are only for counting the frequency of categorical data.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                In the dice roll game, there were 11 possible numbers that the dice roll could produce. Would it be helpful to have 20 bars? 30? What would happen if we only used 1?

                                Look back at your call to the @code{histogram} function for the dice game. In the first example, it made sense to 1 bin for each possible value that the pair of dice could produce.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        What would happen if we used fewer, larger bins? What if we used more, smaller ones?
                                        Try them out with new function calls in the interactions window.
                                }

                                Using only fewer, larger bins gives us a histogram that is less helpful, because 11 bins more accurately covers the range from 2 to 12. However, lots of tiny bins isn't any more helpful, because there are so many bins that are empty. Choosing the right bin size helps us make sense of the data, and is a skill that every data scientist should practice.
                        }
                    @teacher{

                    }
                }
                @point{
                        @student{
                                We can't have a bar for every possible height, and having a bar for each student in the table isn't really helpful to us. This is where being able to control the number of bins comes in really handy!

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to @worksheet-link[#:name "Histograms"] in your workbook and complete the exercise.
                                }
                        }
                        @teacher{
                                In this workbook activity, students will explicitly count the frequency of values appearing within certain ranges, and draw the bar corresponding to a particular bin.
                        }
                }
                @point{
                        @student{
                                The histogram that you completed only has 5 bars, yet each possible value contributes to the height of a particular bar. This is possible because each of the decimal values is put into a @vocab{bin}. Each @code{bin} represents a range of values in our dataset.
                        }
                        @teacher{
                                Before this discussion, ask students to describe in their own words how histograms can visualize the frequency of an unlimited number of values, using a limited number of bars.
                        }
                }
                @point{
                        @student{
                                Determining the right number of bins is something that takes trial and error.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Create histograms for each of the following columns of quantitative data.

                                        @itemlist[
                                                @item{
                                                        The @code{calories} column in @code{nutrition}
                                                }
                                                @item{
                                                        The @code{median-life-expectancy} column in @code{countries}
                                                }
                                                @item{
                                                        The @code{gdp} column in @code{countries}
                                                }
                                        ]

                                        Play around with the number of bins to try and find the sweet spot.
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Make sure the students know that there are many possible right answers to the question of "what is the correct number of bins".
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                Notice that each of these different data sets, no matter what the bin size is, have different general shapes. The histogram for the dice game had a roughly even spread around one peak. The other data sets may have multiple peaks, and have thin or wide humps.
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Which Chart is Best?"
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
                        
                    }       
                    @teacher{
                        
                    }              
              }
        ]
   }

@lesson/studteach[
     #:title "Closing"
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
                        @activity{
                            Take 10 minutes to fill out the "Histograms" section in your Project Report.
                        }
                    }       
                    @teacher{
                        See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Project Report") to see an exemplar of student work.
                    }              
              }
              @point{
                    @student{
                           Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you answer more complex questions, and in greater detail.

                    }
                    @teacher{
                             If your students are working in pairs/groups, make sure that each student has access to a version of the program. The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option. This will allow them to copy a link to the program, then send to their partners in an email/message.
                   }
              }
        ]
   }
}

