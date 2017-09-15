#lang curr/lib

@title{Unit 9: Building Columns}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              "n/a" 
                                              (list @code{"hello" "91"} ))
                                       (list "Image" 
                                              @code{draw-plot} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "DataSeries" 
                                              @code{function-plot, scatter-plot, bar-chart, pie-char, freq-bar-chart, histogram} 
                                              "")
                                       (list "List" 
                                              @code{.get, mean, median, modes} 
                                              @code{[list: "list", "of", "strings"]})
                                       (list "Table" 
                                              @code{.select-columns, .order-by, .filter}
                                              "")
                                  )]{
  @unit-descr{Students learn to extend tables with new columns, computed from other columns.}
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
                              A while back, we found that a nation's total GDP explained about 30% of the variation in median life expectancy. In other words, our predictor wasn't that great. That's not a surprise: more populous countries will usually have a higher GDP! We're just comparing big countries to small ones, not rich countries to poor ones. Do you think that the GDP @italic{per person} - which is a measure of individual wealth - would be a better indicator?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Turn to @worksheet-link[#:name "Unit-9"] and take two minutes to write down what you think.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              We have our @code{countries} table, but that only tells us the @italic{total} GDP. We need to find a way to add a new column to the table, which is calculated based on other columns. By the end of this lesson, you'll know how to do just that.
                      }
                      @teacher{

                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Building Columns"
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
                                    Turn to @worksheet-link[#:name "Extending-Tables"] in your workbook, and complete the exercise.
                                }                     
                        }
                        @teacher{
                                In this activity, students manually compute entries to new columns, based on values in a table's columns that area already filled in.
                        }
                }
                @point{
                        @student{
                                In this workbook exercise, you've done something very different from what we've learned so far: you computed a new column @italic{based on existing data in the table}. In the sock exercise, this means creating a new column called @code{price-per-sock}, and filling in a new value for each row, based on the @code{price} and @code{socks} values in that row. Creating a new table with an additional column is called @vocab{extending} a table.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Open the @editor-link[#:public-id "0BzzMl1BJlJDkR2JlQzdIRXdZemM" "Unit 9 Starter File"], Save a Copy, and Run the program.

                                        @itemlist[
                                                @item{
                                                    What does @code{basketball} evaluate to?
                                                }
                                                @item{
                                                    What does @code{basketball-extended} evaluate to?
                                                }
                                        ]

                                        Do these outputs match your answers for the workbook exercise?
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                @code{.build-column} produces a table with a new column, containing data that is computed by an expression over each @vocab{row}.  It is similar @code{.filter} in that it applies a function to each row, but is different because it CREATES data instead of removing it.
                                        }
                                ]                    
                        }
                }
                @point{
                        @student{
                                Let's examine the code used to create the @code{basketball-extended} table:

                                @code[#:multi-line #t]{
                                        basketball-extended = basketball.build-column(total-points)
                                }
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        In your Definitions Area, follow the directions in the code for the first exercise, to extend the @code{stores} table in Pyret. You should create a column called @code{price-per-sock}.
                                }
                        }
                        @teacher{
                                This could also be a group activity, where you are live coding and prompting the class to help you write the correct definition.
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Suppose we want to find out which menu items have the highest amount of sodium @italic{per gram}. Use the @code{sodium} and @code{serving-size} columns to build a column that will answer this question.
                                }
                        }
                        @teacher{
                        }                
                }
        ]
   }

@lesson/studteach[
     #:title "Body Building"
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
                                Now let's get some practice using @code{.build-column} with our Table Plans! Turn to @worksheet-link[#:name "Body-Building"], and read the word problem carefully. 
                                @activity{
                                    @itemlist[
                                        @item{
                                            On a sheet of scrap paper, sketch a sample Start and End Table to make sure you have a clear picture of what you need to do.
                                        }
                                        @item{
                                            Now start your table plan: do you need to add any new columns to the table? Yes! We need to add a @code{protein-per-gram} column, which is computed using the @code{protein} and @code{serving-size} columns. Write the @code{.build-column} query to do this.
                                        }
                                        @item{
                                            Do we need to get rid of any rows? Yes! We want to keep only the rows that have a @code{protein-per-gram} higher than .12. Write the @code{.filter} query to do this.
                                        }
                                        @item{
                                            Do the rows need to be any particular order? It's not clear from the word problem, so we can choose: do we skip this step, or should we order them so your aunt can immediately see which food is best?
                                        }
                                        @item{
                                            Which columns do we need? All we care about are the @code{name}, @code{calories}, and @code{protein-per-gram} columns. Write the @code{select} query to do grab those columns.
                                        }
                                        @item{
                                            Once you're done with your Table Plan, program your queries in the Definitions Area, under "4. Body Building".
                                        }
                                    ]
                                }
                        }
                        @teacher{
                            Debrief and review with the class.
                        }
                }
        ]
}

@lesson/studteach[
     #:title "Term-Length"
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
                                How common is it for a president to serve two terms? We'd like to see a histogram comparing 1-term vs. 2-term presidents. The length of a term is defined by @math{year_{ended} - year_{started}}. 
                                @activity{
                                    @itemlist[
                                        @item{
                                            Turn to page @worksheet-link[#:name "Term-Length"], and read the word problem carefully.
                                        }
                                        @item{
                                            Complete the Table Plan to create the table you'll need.
                                        }
                                        @item{
                                            Extract the columns you'll need to create the histogram
                                        }
                                        @item{
                                            Define the histogram DataSeries, and then plot the histogram. If you've forgotten how to make a historgram DataSeries, a plot, or how to draw the plot, don't forget to refer back to your contracts page!
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
     #:title "Economic Indicators"
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
                                 Economics data scientists use something called a @code{gdp-per-capita} to compare countries' productivity.  This is calculated by dividing a country's GDP by population. This estimates how productive the average citizen of a particular country is:
                                @bannerline{@math{GDP_{per-capita} = \frac{GDP}{population}}}
                        }
                        @teacher{
                                Have students calculate this by hand for one or two countries in the @code{countries} table.
                        }                
                }

                @point{
                        @student{
                                The United Nations has hired our class to come up with a report on Africa's economy. They want us to investigate whether population size or per-capita GDP is the @italic{more significant predictor} for median life expectancy.
                                @activity{
                                    @itemlist[
                                        @item{
                                            Turn to page @worksheet-link[#:name "GDP-v-Pop-Plan"], and read the word problem carefully.
                                        }
                                        @item{
                                            Complete the Table Plan to create the table you'll need.
                                        }
                                        @item{
                                            Extract the columns you'll need to create the scatterplots and @vocab{predictor} functions for @bold{both relationships}: "population v. life expectancy" and "per-capita-GDP v. life expectancy".
                                        }
                                        @item{
                                            Define the two scatterplot DataSeries, and then plot them both.
                                        }
                                        @item{
                                            Define your predictor functions and r-squared values. Plot your predictor functions on top of your scatterplots, and use the r-squared values to determine which predictor better explains median life expectancy.
                                        }
                                    ]
                                }
                        }
                        @teacher{
                        
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        The UN also wants following information:

                                        @itemlist[
                                                @item{
                                                        A bar chart of the @code{gdp-per-capita} for every country in Africa.
                                                }
                                                @item{
                                                        The mean and median @code{gdp-per-capita} values for countries in Africa.
                                                }
                                        ]

                                        Add code to your definitions window to answer these questions.
                                }
                        }
                        @teacher{

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
                        Take a few minutes and record your findings on @worksheet-link[#:name "Unit-9"]. Do your findings match your hypothesis? What new questions does this raise?
                    }
                    @teacher{

                    }
                }
                @point{
                        @student{
                            You now have all the tools you need to complete your analysis for your final project! Open your Project File and Report, and finish the remaining questions. Be sure to explain why you chose to remove any rows with @code{.filter} or add any columns with @code{.build-columns}, and to add the @vocab{r-squared} value for any correlations you find through linear regression.
                        }
                        @teacher{

                        }
                }
        ]
  }

}