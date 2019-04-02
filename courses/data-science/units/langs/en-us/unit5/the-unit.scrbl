#lang curr/lib

@title{Unit 5: Computing the "Shape" of Data}

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart, bar-chart-raw, pie-chart-raw, histogram} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter}
                                              ""))]{
  @unit-descr{
    Students learn how to evaluate the "shape" of a dataset in a number of ways. They measure central tendency (using mean, median, and mode), as well as spread (visualizing quartiles with box plots). After applying these concepts to a contrived dataset, they apply them to their own datasets and interpret the results.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Introduction"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students learn about shape, and how outliers or skewness prevent a data set from being balanced or on either side of its center}]
     #:standards (list )
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
        @points[@point{
                        @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1NaJoA5RRjwMwN19NOAUOSnkB8pEl9fqQ" "new copy"].)
                              }
                        }
                        @teacher{
                                
                        }
                }
                @point{
                      @student{
                            In the last Unit, you learned how to talk about shape by looking at histograms. In this Unit, you'll learn about the different ways of @italic{computing} shape, and how to connect those back to a visual representation.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bannerline{According to the Animal Shelter Bureau, the average pet waits 5.8 weeks to be adopted.} 
                          @activity[#:forevidence (list )]{
                            Does that mean most pets wait more than a month to find homes? Why or why not?
                          }
                      }
                      @teacher{
                          Invite an open discussion for a few minutes.
                      }
                }
                @point{
                      @student{
                              "The average pet waits 5.8 weeks" is a statement about the entire dataset, which summarizes a whole column of values with a single number. Summarizing a big dataset means that some information gets lost, so it's important to pick and @italic{appropriate} summary. Picking the wrong summary can have serious implications! Here are just a few examples of summary data being used for important things. Do you think these summaries are appropriate or not?
                              @itemlist[
                                  @item{ 
                                      Students are sometimes summarized by two numbers - their GPA and SAT scores - which can impact where they go to college or how much financial aid they get.
                                  }
                                  @item{
                                      Schools are sometimes summarized by a few numbers - student pass rates and attendance, for example - which can determine whether or not a school gets shut down.
                                  }
                                  @item{ 
                                      Adults are often summarized by a single number - like their credit score - which determines their ability to get a job or a home loan.
                                  }
                                  @item{
                                      When buying uniforms for a sports team, a coach might look for the most-common size that the players wear.
                                  }
                              ]
                              @activity[#:forevidence (list "6.SP.1-3&1&1")]{
                                  Can you think of other examples where a number or two are used to summarize something complex?
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Every kind of summary has situations in which it is very accurate and useful, and others where it's not accurate or useful at all. In fact, the shape of the data can play a huge role in whether or not one kind of summary is accurate!
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Data Scientists often look at two kinds of summaries: Measures of @bold{Center} and @bold{Spread}. Finding ways to summarize data @italic{appropriately} is essential. Let's check the "5.8 week" claim made by the Animal Shelter Bureau, and see if it's an appropriate way to summarize the data. Then you'll have a chance to apply what you've learned to your own dataset, to find the best way to provide an overall summary of the data.
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Measures of Center"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[
          @item{Students learn different notions of "center", including mean, median and mode}
          @item{Students explore how to properly talk about measures of center}
      ]
     #:evidence-statements @itemlist[]
     #:exercises (list (make-exercise-locator/file "Measures-of-Center" "CritiquingFindings" "Critiquing Findings"))
     #:product-outcomes @itemlist[@item{Students take the mean, median and mode of various columns in the animals table}]
     #:standards (list "S-ID.1-4" "HSS.ID.A")
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
                              @bitmap{images/points-on-line.png}
                              If we plotted all the @code{weeks} values as points on a number line, what could we say about the average of those values? Is there a midpoint? Is there a point that shows up most often? Each of these are different ways of "measuring center".
                      }
                      @teacher{
                              Draw some sample points on a number line, and have students volunteer different ways to summarize the distribution.
                      }
                }
                @point{
                      @student{
                              The Animal Shelter Bureau used one method of summary, called the @code{mean}, or @italic{average}. To take the average of a column, we add all the numbers in that column and divide by the number of rows.
                      }
                      @teacher{
                              This lesson does not teach the algorithm for computing averages, but this would be an appropriate time to do so.
                      }
                }
                @point{
                      @student{
                              Pyret has a way for us to compute the @vocab{mean} of any column in a Table. It consumes a Table and the name of the column you want to measure, and produces the mean - or average - of the numbers in that column.
                              @code[#:multi-line #t]{
                                # mean :: (t :: Table, col :: String) -> Number
                              }
                              @activity[#:forevidence (list )]{
                                  What is its name? Domain? Range?
                              }
                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zip codes:  even though we can divide a sum of zip codes, the output doesn't correspond to some "center" zip code.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Type @code{mean(animals-table, "weeks")}.  What does this give us? Does this support the Bureau's claims?
                              @activity[#:forevidence (list "S-ID.1-4&1&1" "6.SP.1-3&1&1" "6.SP.1-3&1&2" "6.SP.1-3&1&3" "HSS.ID.A&1&2")]{
                                      Open your workbooks to @worksheet-link[#:name "Summarizing-Weeks"]. We've already decided on the answer to Question 1 (@code{weeks}). Under the "measures of center" section, fill in the computed mean.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              You computed the mean of that list to be just 5.8 weeks. That IS the average, but if we look at the dots on our number line, we can see that most of the animals in the table waited for less than 5 weeks! What is throwing off the average so much?
                      }
                      @teacher{
                              Point students to Kujo and Mr. Peanutbutter.
                      }
                }
                @point{
                      @student{
                              In this case, the mean is being thrown off by a few extreme data points. These extreme points are called @vocab{outliers}, because they fall far outside of the rest of the dataset. Calculating the mean is great when all the points in a dataset are evenly distributed, but it breaks down for datasets with extreme outliers. The mean may also be thrown off by the presence of @vocab{skew}: a lopsided shape due to values trailing off left or right of center, but not separated by the visible gap typical of outliers.
                              @activity{
                                  Make a @code{histogram} of the @code{weeks} column, and try different bin sizes. Can you see the skew towards the right?
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              A different way to measure center is to line up all of the data points - in order - and find a point in the center where half of the values are smaller and the other half are larger. This is the @vocab{median}, or "middle" value of a list.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              As an example, consider this list:

                              @code[#:multi-line #t]{
                                    2, 3, 1
                              }

                              Here @code{2} is the median, because it separates the "top half" (all values greater than @code{2}, which is just @code{3}), and the "bottom half" (all values less than or equal to 2).
                      }
                      @teacher{
                              If students are not already familiar with median, we recommend the following
                              "pencil and paper algorithm" for median finding over a list:

                              @itemlist[
                                      @item{
                                            Cross out the highest number in the list.
                                      }
                                      @item{
                                            Cross out the lowest number in the list.
                                      }
                                      @item{
                                            Repeat these steps until there is only one number left in the list.  This number is the median. If there are two numbers left, @italic{take the mean of those numbers}.
                                      }
                              ]
                               
                      }
                }
                @point{
                      @student{
                              Pyret has a function to compute the median of a list as well, with the contract:

                              @code{# median :: (t :: Table, col :: String) -> Number}

                              @activity[#:forevidence (list "S-ID.1-4&1&1" "6.SP.1-3&1&1" "6.SP.1-3&1&2" "6.SP.1-3&1&3" "HSS.ID.A&1&2")]{
                                    Compute the @code{median} for the @code{weeks} column in our dataset, and add this to @worksheet-link[#:name "Summarizing-Weeks"]. Is it different than the mean? What can we conclude when the median is so much lower than the mean? For practice, compute the mean and median for the @code{weight} and @code{age} columns.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              The third and last measure of center is the @vocab{mode} of a dataset. The @vocab{mode} of a data set is the value that appears @italic{most often}.  Median and Mean always produce one number, but if two or more values are equally common, there can be more than one mode. If all values are equally common, then there is no mode at all!
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @code[#:multi-line #t]{
                                    1, 2, 3, 4
                                    1, 2, 2, 3, 4
                                    1, 1, 2, 3, 4, 4
                              }

                              @itemlist[
                                @item{
                                    The mode of the first value is @italic{empty}, because no element is repeated at all.
                                }
                                @item{
                                    The mode list of the second value is @italic{2}, since 2 appears more than any other number.
                                }
                                @item{
                                    The mode list of the last value is @italic{a list containing 1 and 4}, because @code{1} and @code{4} both appear more often than any other element, and because they appear equally often.
                                }
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              In Pyret, the modes are calculated by the @code{modes} function, which consumes a Table and the name of the column you want to measure, and produces a List of Numbers. 
                              @code[#:multi-line #t]{
                                    # modes :: (t :: Table, col :: String) -> List<Number>
                              }
                              @activity[#:forevidence (list "S-ID.1-4&1&1" "6.SP.1-3&1&1" "6.SP.1-3&1&2" "6.SP.1-3&1&3" "HSS.ID.A&1&2")]{
                                  Compute the @code{modes} of the @code{weeks} column, and add it to @worksheet-link[#:name "Summarizing-Weeks"]. What did you get? The most common number of weeks an animal waits is either @code{1} or @code{3}! Both of those are well below our mean, which is further evidence of outliers or skewness.
                              }
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              At this point, we have a lot of evidence that suggests the Bureau's use of "mean" to summarize data is inaccurate. Our mean wait time agrees with their findings, but we have three reasons to suspect that @vocab{mean} isn't the best value to use:
                              @itemlist[
                                  @item{ The median is only 4 weeks. }
                                  @item{ The modes of our dataset are only 1 and 3, which means there are clusters of animals that are adopted in just one or three weeks. }
                                  @item{ When viewed as a histogram, we can see the rightward skew in the dataset. Mean is sensitive to highly-skewed datasets }
                              ]
                              The Animal Shelter Bureau started with a fact: the mean wait time @italic{is} about 5.8 weeks. But then they reported a conclusion without checking to see if that was the best summary statistic to look at. As Data Scientists, we had to look deeper into the data to find out whether or not to settle for the Bureau's summary. This is why using tools like histograms can be so important when deciding on a summary tool.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                            @activity[#:forevidence (list "6.SP.1-3&1&1" "6.SP.1-3&1&2" "6.SP.1-3&1&3")]{
                                "In 2003, the average American family earned $43,000 a year - well above the poverty line! Therefore very few Americans were living in poverty." Do you trust this statement? Why or why not?
                            }
                            Consider how many policies or laws are informed by statistics like this! Knowing about measures of center helps us see through misleading statements.
                      }
                      @teacher{
                            
                      }
                }
                @point{
                      @student{
                              @bannerline{Shape Matters}
                              You now have three different ways to measure center in a dataset. But how do you know which one to use? Depending on the shape of the dataset, a measure could be really useful or totally misleading! Here are some guidelines for when to use one measurement over the other:

                              @itemlist[
                                      @item{
                                            If the data is doesn't show much skewness or have outliers, @vocab{mean} is the best summary because it incorporates data from every vlaue.
                                      }
                                      @item{
                                            If the data clearly has a lot of outliers or skewness, @vocab{median} gives a better summary of center than the mean.
                                      }
                                      @item{
                                            If there are very few possible values, such as a set of letter grades (A, B, C, D, and F) or AP Scores (1-5), the @vocab{mode} could be a useful way to summarize the data set.
                                      }
                              ]
                      }
                      @teacher{

                      }
                } 
        ]
  }

  @lesson/studteach[
     #:title "Measures of Spread"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[
          @item{Students learn different measures of spread, including range, and interquartile range}
          @item{Students practice describing spread using these concepts}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "HSS.ID.A&1&2" "6.SP.4-5" "S-ID.1-4")
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
                          Measuring the "center" of a dataset is helpful, and we've seen that shape should be taken into account. But we should also pay attention to the @italic{spread} in a data set. A teacher may report that her students averaged a 75 on a test, but it's important to know how those scores were spread out: did all of them get exactly 75, or did half score 100 and the other half 50? When Data Scientists use the mean of a sample to report on the mean of a whole population, it's important to know the spread in order to report how good or bad a job that estimate does.
                      }
                      @teacher{
                          
                      }
                }
                @point{
                      @student{
                          Suppose we lined up all of the values in the @code{weeks} column from smallest to largest, and then split the line up into two equal groups by taking the median. The first group is the 50% of animals that waited the @italic{least} amount of time to be adopted. The fourth group is the 50% of animals that waited the @italic{greatest} amount of time. Now, suppose we took the medians of both groups, to divide the line into four equal sections. Data Scientists call these groups @vocab{quartiles}.
                          @activity[#:forevidence (list )]{
                              The first quartile (Q1) is the value for which 25% of animals waited that time or less. What does the third quartile represent?
                          }
                      }
                      @teacher{
                          Point out the five numbers that create these quartiles: the three medians, the minimum and the maximum.
                      }
                }
                @point{
                      @student{
                          We can use @vocab{box plots} to visualize these quartiles. These plots can easily be represented using @bold{just five numbers}, which makes them convenient ways to display data. Below is the contract for @code{box-plot}, along with an example that will make a box plot for the @code{weeks} column in the @code{animals-table}.
                          @code[#:multi-line #t]{
                            # box-plot :: (t :: Table, column :: String) -> Image
                            # box-plot(animals-table, "weeks")
                          }
                          @activity[#:forevidence (list "S-ID.1-4&1&2" "HSS.ID.A&1&1" "HSS.ID.A&1&2" "6.SP.4-5&1&1" "S-ID.1-4&1&1")]{
                              Type in this expression in the Interactions Area, and see the resulting plot.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bitmap{images/box-plot.png}
                          This plot shows us the spread in our dataset according to five numbers.
                          @itemlist[
                              @item{ 
                                  The @bold{minimum} value in the dataset (at the bottom). In our dataset, that's just 1 week.
                              }
                              @item{
                                  The @bold{First Quartile (Q1)} (the bottom edge of the box), is computed by taking @italic{the median of the smaller half of the values}. In the @code{weeks} column, that's 2.5 weeks.
                              }
                              @item{
                                  The @bold{Median (Q2)} value (the line in the middle), which is the second Quartile of the whole dataset. We already computed this to be 4.
                              }
                              @item{
                                  The @bold{Third Quartile (Q3)} (the top edge of the box), which is computed by taking  @italic{the median of the larger half of the values}. That's 8 weeks in our dataset.
                              }
                              @item{ 
                                  The @bold{maximum} value in the dataset (at the top). In our dataset, that's 30 weeks.
                              }
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          One way to summarize the spread in the dataset is to measure the distance between the largest value and the smallest value. When we talk about functions having many possible outputs, we use the term "Range" to describe them. (@bold{Note:} the term "Range" means something different in statistics than it does in algebra and programming!) When we look at the distance between the smallest and largest in our dataset, we use the same term.
                          @activity[#:forevidence (list "HSS.ID.A&1&2")]{
                              On page @worksheet-link[#:name "Interpreting-Spread"], and fill in the five-number summary for the @code{weeks} column, and sketch the box-plot. Find the @vocab{statistical range} of this dataset. 
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          Data Scientists subtract the 1st quartile from the 3rd quartile to compute the range of the "middle half" of the dataset, also called the @vocab{interquartile range}.
                          @activity[#:forevidence (list "HSS.ID.A&1&2")]{
                              Find the @vocab{interquartile range} of this dataset. @bold{ What percentage of animals fall within the interquartile range? }
                          }
                      }
                      @teacher{
                          @math{8 - 2 = 6} weeks
                      }
                }
                @point{
                      @student{
                          The @vocab{Range} of our dataset is 29 weeks, but the @vocab{interquartile range} is only 6 weeks! That means that @italic{50% of the animals} fall into only 19% of the range! That suggests the data set has one or more outliers. Because the minimum is very close to Q1, but the maximum is far above Q3, we suspect the maximum (and maybe other points in between) to be a high outlier.
                          @activity{
                            On page @worksheet-link[#:name "Interpreting-Spread"], write down your conclusion for this box-plot.
                          }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Your Dataset"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students describe the centers and spread in their chosen dataset}]
     #:standards (list "Data 3.2.1" "Data 3.2.1")
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
                          Now that you're comfortable creating box plots and looking at measures of spread on the computer, it's time to put your skills to the test! 
                          @activity[#:forevidence (list "Data 3.2.1&1&1" "Data 3.2.1&1&2" "Data 3.2.1&1&3")]{
                            Turn to @worksheet-link[#:name "Interpreting-Spread"] and complete the questions you see there.
                          }
                      }
                      @teacher{
                          Review students' answers, especially to the question five.
                      }
                }
                @point{
                    @student{
                        By now, you've got a good handle on how to report center, shape and spread, and it's time to apply those skills to your dataset!
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Take 10 minutes to fill out @worksheet-link[#:name "Summarizing-My-Dataset"] in your Student Workbook. Choose a column to investigate, and write up your findings.
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
                          Data Scientists are skeptical people: they don't trust a claim unless they can see the data, or at least get some summary information about the center, shape and spread in the dataset. In the next Unit, you'll investigate new ways to visualize spread and distribution.
                      }
                      @teacher{

                      }
                }
        ]
  }
}