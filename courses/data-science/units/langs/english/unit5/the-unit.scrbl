#lang curr/lib

@title{Unit 5: Measuring Center and Variation}

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
                                              @code{.row-n, .order-by, .filter, .build-column, pie-chart, bar-chart}
                                              ""))]{
  @unit-descr{
    Students learn how to measure central tendency (using mean, median, and mode), as well as variation (visualizing quartiles with box plots). After applying these concepts to a contrived dataset, they apply them to their own datasets and interpret the results in their research papers.
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
     #:standards (list )
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
                              Animal shelters make decisions about food, capacity and policies based on how long it takes for animals to be adopted. But looking at the entire @code{weeks} column is tedious, and isn't always the easiest way to make sense of the data. What we want is a way to @italic{summarize} a dataset, so that we can describe the data quickly and easily.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bannerline{According to the Animal Shelter Bureau, the average pet waits 6 weeks to be adopted.} @activity[#:forevidence (list )]{
                            Does that mean most pets wait more than a month to find homes? Why or why not?
                          }
                      }
                      @teacher{
                          Invite an open discussion for a few minutes.
                      }
                }
                @point{
                      @student{
                              "The average pets waits 6 weeks" is a statement about the entire dataset, which summarizes a whole column of values into a single number. Summarizing a big dataset means that some information gets lost, so it's important to @italic{pick the right summary}. Picking the wrong summary can have serious implications! Here are just a few examples of summary data being used for important things. Do you think these summaries are accurate or not?
                              @itemlist[
                                  @item{ 
                                      Students are sometimes summarized by two numbers - their GPA and SAT scores - which can impact where they go to college or how much financial aid they get.
                                  }
                                  @item{
                                      Schools are sometimes summarized by a few numbers - student pass rates and attendance, for example - which can determine whether or not the school gets shut down.
                                  }
                                  @item{ 
                                      Adults are often summarized by a single number - like their credit score - which determines their ability to get a job or a home loan.
                                  }
                                  @item{
                                      When buying uniforms for a sports team, a coach might look for the most-common size that their players wear.
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
                              Data Scientists often look at two kinds of summaries: Measures of @bold{Center} and @bold{Variation}. Finding ways to summarize data @italic{accurately} is essential. In this lesson, we'll check the "6 week" claim made by the Animal Shelter Bureau, and see if it's an accurate way to summarize the data.
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
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
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
                              If we plotted all the @code{weeks} values as points on a number line, what could we say about where those points are clustered? Is there a midpoint? Is there a point that shows up most often? Each of these are different ways of "measuring center".
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
                              Pyret has a way for us to compute the @vocab{mean} of any column in a Table:
                              @code[#:multi-line #t]{
                                mean :: (t :: Table, col :: String) -> Number
                              }
                              @activity[#:forevidence (list )]{
                                  What is its name? Domain? Range?
                              }
                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zip codes:  even though we can and divide the numbers of zip codes, the output doesn't correspond to some "center" zip code.
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
                              You computed the mean of that list to be just 6 weeks. That IS the average, but if we look at the dots on our number line, we can see that most of the animals in the table waited for less than 4 weeks! What is throwing off the average so much?
                      }
                      @teacher{
                              Point students to Kujo and Mr. Peanutbutter.
                      }
                }
                @point{
                      @student{
                              In this case, the mean is being thrown off by a few extreme data points. These extreme points are called @vocab{outliers}, because they fall far outside of the rest of the dataset. Calculating the mean is great when all the points in a dataset are evenly distributed, but it breaks down for datasets with huge outliers.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Another way to measure center is to line up all of the data points - in order - and find a point in the center where half of the values are smaller and the other half are larger. This is the @vocab{median}, or "middle" value of a list.
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
                              The third and last measure of center is the @vocab{mode}. The @vocab{modes} of a list are all the elements that appear @italic{most often} in the list. Median and Mean always produce one number. Mode is different than the other measures, since a list can have multiple modes - or even no modes at all!
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
                              In Pyret, the mode list is calculated by the @code{modes} function, which consumes a List of Numbers and produces a list of Numbers. 
                              @code[#:multi-line #t]{
                                    # modes :: (t :: Table, col :: String) -> List<Number>
                              }
                              @activity[#:forevidence (list "S-ID.1-4&1&1" "6.SP.1-3&1&1" "6.SP.1-3&1&2" "6.SP.1-3&1&3" "HSS.ID.A&1&2")]{
                                  Compute the @code{modes} of the @code{weeks} column, and add it to @worksheet-link[#:name "Summarizing-Weeks"]. What did you get? The most common number of weeks an animal waits is only @code{1}! That's well below our mean, which is further proof that there must be some outliers skewing the results.
                              }
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              At this point, we have a lot of evidence that suggests the Bureau's summary is misleading. Our mean wait time agrees with their findings, but we have two reasons to doubt the validity of their measurement:
                              @itemlist[
                                  @item{ The median is only 4 weeks, meaning half the animals wait less than a month! }
                                  @item{ The mode of our dataset is only 1, which means there's a cluster of animals that are adopted in just one week! }
                              ]
                              The Animal Shelter Bureau started with a fact: the mean wait time @italic{is} over 6 weeks. But then they drew a conclusion without checking to see if that was the right statistic to look at. As Data Scientists, we had to look deeper into the data to find out whether or not to trust the Bureau.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                            @activity[#:forevidence (list "6.SP.1-3&1&1" "6.SP.1-3&1&2" "6.SP.1-3&1&3")]{
                                "In 2003, the average American family earned $43,000 a year - well above the poverty line! Therefor very few Americans were living in poverty." Do you trust this statement? Why or why not?
                            }
                            Consider how many policies or laws are informed by statistics like this! Knowing about measures of center helps us see through misleading statements.
                      }
                      @teacher{
                            
                      }
                }
                @point{
                      @student{
                              @bannerline{Variation Matters}
                              You now have three different ways to measure center in a dataset. But how do you know which one to use? Depending on the variation in the dataset, a measure could be really useful or totally useless! Here are some guidelines for when to use one measurement over the other:

                              @itemlist[
                                      @item{
                                            If the data is unlikely to have values occurring multiple times (like with decimals, or with grades), do not use mode.
                                      }
                                      @item{
                                            If the data is more "coarse grained", meaning the data is quantitative but there are only a small number of possible values each entry can take, then the modes will be useful.
                                      }
                                      @item{
                                            If the data is going to have lots of outliers, the median gives a better estimate of the center than mean.
                                      }
                              ]
                      }
                      @teacher{

                      }
                } 
        ]
  }

  @lesson/studteach[
     #:title "Measures of Variation"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
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
                          Measuring the "center" of a dataset is helpful, but we quickly found that it's also important to talk about the @italic{variation} in the dataset. So how do we do that?
                      }
                      @teacher{
                          
                      }
                }
                @point{
                      @student{
                          Suppose we lined up all of the values in the @code{weeks} column from smallest to largest, and then split the line up into two equal groups by taking the median. The first group is the 50% of animals that waited the @italic{least} amount of time to be adopted. The second group is the 50% of animals that waited the @italic{greatest} amount of time. Now, suppose we took the medians of both groups, to divide the line into four equal sections. Data Scientists call these groups @vocab{quartiles}.
                          @activity[#:forevidence (list )]{
                              The first quartile (Q1) is the 25% of animals that waited the least amount of time. What do the other three quartiles represent?
                          }
                      }
                      @teacher{
                          Point out the five numbers that create these quartiles: the three medians, the minimum and the maximum.
                      }
                }
                @point{
                      @student{
                          We can use @vocab{box plots} to visualize these quartiles. These plots can easily be represented using @bold{just five numbers}, which makes them convenient ways to summarize data. Below is the contract for @code{box-plot}, along with an example that will make a box plot for the weights in the @code{animals-table}.
                          @code[#:multi-line #t]{
                            box-plot :: (t :: Table, column :: String) -> Image
                            box-plot(animals-table, "pounds")
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
                          This plot shows us the variation in our dataset according to five numbers.
                          @itemlist[
                              @item{ 
                                  The @bold{minimum} value in the dataset (at the bottom). In our dataset, that's just 1 week.
                              }
                              @item{
                                  The @bold{Second Quartile (Q2)} value (the line in the middle), which is the median of the whole dataset. We already computed this, as 4.
                              }
                              @item{ 
                                  The @bold{maximum} value in the dataset (at the top). In our dataset, that's 30 weeks.
                              }
                              @item{
                                  The @bold{First Quartile (Q1)} (the bottom edge of the box), which is computed by taking @italic{the median of the all the smaller half of the values}.
                              }
                              @item{
                                  The @bold{Third Quartile (Q3)} (the bottom edge of the box), which is computed by taking  @italic{the median of the all the larger half of the values}.
                              }
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          One way to summarize the variation in the dataset is to measure the distance between the largest value and the smallest value. When we talk about functions having many possible outputs, we use the term "Range" to describe them. When we look at all the values between the smallest and largest in our dataset, we use the same term.
                          @activity[#:forevidence (list "HSS.ID.A&1&2")]{
                              On page @worksheet-link[#:name "Summarizing-Weeks"], and fill in the five-number summary for the @code{weeks} column, and sketch the box-plot. Find the @vocab{range} of this dataset. 
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          Data Scientists subtract the 1st quartile from the 3rd quartile to compute the range of the "middle half" of the dataset, also called the @vocab{interquartile range}.
                          @activity[#:forevidence (list "HSS.ID.A&1&2")]{
                              Find the @vocab{interquartile range} of this dataset.
                          }
                      }
                      @teacher{
                          @math{8 - 2.5 = 5.5 weeks}
                      }
                }
                @point{
                      @student{
                          The @vocab{Range} of our dataset is 29 weeks, but the @vocab{interquartile range} is only 5.5 weeks! That means that @italic{50% of the animals} fall into only 19% of the range! That tells us that there are definitely a lot of outliers. Looking at the first and third quartiles, we can conclude that the interquartile range is also @italic{skewed towards the minimum}.
                          @activity{
                            On page @worksheet-link[#:name "Summarizing-Weeks"], write down your conclusion for this box-plot.
                          }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Table Plans"
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
                          Let's put some of our new measures of center to work at the animal shelter...
                          @activity[#:forevidence (list )]{
                            Turn to @worksheet-link[#:name "Variation-Dog-Age"], and read the word problem carefully. Then write a Contract and Purpose Statement for this word problem.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          This time, our Result isn't a Table -- it's an @italic{Image}: the box-plot of the ages for all the dogs in the Sample Table. 
                          @activity[#:forevidence (list )]{
                            Draw a rough sketch of the plot you expect. When you're done, move on to defining the function, and fill out the methods to define the table. Do we need to build any columns? Filter any rows? Order the table?
                          }
                      }
                      @teacher{
                          
                      }
                }
                @point{
                      @student{
                          We've got most of our function written:
                          @code[#:multi-line #t]{
                          variation-dog-age :: (animals :: Table) -> Image
                          # Consumes a table and produces a box plot showing the variation in dogs' ages
                          fun variation-dog-age(animals):
                            t = animals.filter(is-dog)  # define the table
                            ...                         # produce our result
                          end
                          }
                          This time, our result uses the @code{box-plot} function to visualize the five numbers that help us summarize the variation.
                      }
                      @teacher{
                          If there's only one method being used, it's convention to put the method call on the same line as the table.
                      }
                }
                @point{
                      @student{
                          Putting it all together, we get:
                          @code[#:multi-line #t]{
                          variation-dog-age :: (animals :: Table) -> Image
                          # Consumes a table and produces the median age of all the dogs
                          fun median-dog-age(animals):
                            t = animals.filter(is-dog)  # define the table
                            box-plot(t, "age")          # produce our result
                          end
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
     #:product-outcomes @itemlist[]
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
                          Now that you're comfortable creating box plots and looking at measures of variation on the computer, it's time to put your skills to the test! 
                          @activity[#:forevidence (list "Data 3.2.1&1&1" "Data 3.2.1&1&2" "Data 3.2.1&1&3")]{
                            Turn to @worksheet-link[#:name "Interpreting-Variation"] and complete the questions you see there.
                          }
                      }
                      @teacher{
                          Review students' answers, especially to the question five.
                      }
                }
                @point{
                    @student{
                        By now, you've got a good handle on how to think talk about measures of center variation, and it's time to apply those skills to your dataset!
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
                          Data Scientists are skeptical people: they don't trust a claim unless they can see the data, or at least get some summary information about the center and variation in the dataset. In the next Unit, you'll investigate new ways to visualize variation and distribution.
                      }
                      @teacher{

                      }
                }
        ]
  }
}