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
     #:standards (list "S-ID.1-4" "6.SP.4-5" "HSS.ID.A")
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
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              It's important to find ways to talk about lots of data without having to handover a giant list of numbers of a page of charts. Most of the time, they use a single number to summarize a complex story, and that. You've probably seen this before:
                              @itemlist[
                                  @item{ 
                                      Students are sometimes summarized by a two numbers - their GPA and SAT scores - which can impact where they go to college or how much financial aid they get.
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
                              @activity{
                                  Can you think of other examples where a number or two are used to summarize something complex?
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Data Scientists work with @italic{huge} datasets, and finding ways to describe that data @italic{accurately} are essential. There are two kinds of summary that Data Scientists look at:
                              @bold{Center} and @bold{Distribution}.
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
                          According to the Animal Shelter Bureau, the average pet waits 6 weeks to be adopted. Does that mean most pets wait more than a month to find homes?
                      }
                      @teacher{
                          Invite an open discussion for a few minutes.
                      }
                }
                @point{
                      @student{
                              Suppose we want to check the Bureau's claim. If you plotted all the weeks as points on a number line, what could we say about where those points are clustered? Is there a midpoint? Is there a point that shows up most often? Each of these are different ways of "measuring center", and Data Scientists use them to speak as accurately as possible when they summarize data.
                              @activity{
                                  Suppose you have nine animals that took 1, 1, 3, 3, 3, 3, 4, 6, and 12 weeks to be adopted. How many different "measures of center" can you come up with for this list?
                              }
                      }
                      @teacher{
                              Have your students come up with ideas. It may be useful to write down 5-6 of them on the board, and have students brainstorm ideas.
                      }
                }
                @point{
                      @student{
                              One way of summarizing a column is to provide the @code{mean}, or @italic{average} of the values in that column. To take the average of a column, we add all the numbers in that column and divide by the number of rows. That's exactly what the Animal Shelter Bureau did to make a statement about how long animals stay in shelters.
                      }
                      @teacher{
                              Use your favorite lesson to teach students about computing averages.
                      }
                }
                @point{
                      @student{
                              Pyret has a way for us to compute the @vocab{mean} of any column in a Table:
                              @code[#:multi-line #t]{
                                mean :: (t :: Table, col :: String) -> Number
                              }
                              @activity{
                                  What is it's name? Domain? Range?
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Type @code{mean(animals-table, "weeks")}.  What does this give us? Does this back up the Bureau's claims?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open your workbooks to @worksheet-link[#:name "Summarizing-Weight"]. We've already decided on the answer to Question 1 (@code{weeks}). Fill in the answer to Question 2.
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zipcodes:  even though we can add and divide the numbers of zipcodes, the output doesn't correspond to some "center" zipcode.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              You computed the mean of that list to be just 6 weeks. That IS the average, but most of the animals in the table waited for less than 4 weeks! What is throwing off the average so much?
                      }
                      @teacher{
                              Point students to Kujo and Mr. Peanutbutter.
                      }
                }
                @point{
                      @student{
                              In this case, the mean is being thrown off by a few extreme datapoints, which are throwing off the average. These are called @vocab{outliers}, because they fall far outside of the rest of the dataset. Calculating the mean is great when all the points in a dataset are evenly distributed, but it breaks down for datasets with huge outliers.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Another way to measure center is to line up all of the datapoints - in order - and find a point in the center where half of the values are smaller and the other half are larger. This is the @vocab{median}, or "middle" value of a list.
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

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                    Compute the @code{median} for the @code{weeks} column in our dataset, and answer Question 3 in your workbook. Is it different than the mean? What does that mean? For practice, compute the mean for the @code{weight} and @code{age} columns.
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
                                    The mode list of the last value is @italic{a list containing 1 and 4}, because @code{1} and @code{4} both appear more often than any other element, and because they are appear equally often.
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
                              @activity{
                                  Compute the @code{modes} of the @code{weeks} column, and fill in the answer to Question 4. What did you get? The most common number of weeks an animal waits is only @code{1}! That's well below our mean, which is further proof that there must be some outliers skewing the results.
                              }
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              At this point, we have a lot of evidence that suggests the Bureau's claim is wrong. Our mean wait time agrees with their findings, but we have two reasons to doubt the validity of their measurement:
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
                            @activity{
                                "In 2003, the average American family earned $43,000 a year - well above the poverty line! Therefor very few Americans were living in poverty." Do you trust this statement? Why or why not?
                            }
                      }
                      @teacher{
                            Consider how many policies and laws are defended with statistics like this. Knowing about measures of center helps us see through misleading statements.
                      }
                }
                @point{
                      @student{
                              You now have three different ways to measure center in a dataset. But how do you know which one to use? Here are some guidelines for when to use one measurement over the other:

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
                          Measuring the Center of a dataset is helpful. It might, for example, tell us how much the animals in the shelter "generally" weigh. If every animal had similar weights, this would be all we need! But as we saw from the pie chart in the previous unit, some animals weigh a lot, @italic{lot} more than others! So we also need a way to describe @italic{variation} in our dataset, using @bold{just five numbers.}
                      }
                      @teacher{
                          
                      }
                }
                @point{
                      @student{
                          Data Scientists use @vocab{box plots} to visualize distribution in a dataset. These plots can easily be represented using just five numbers, which makes them convenient ways to summarize data. Below is the contract for @code{box-plot}, along with an example that will make a box plot for the weights in the @code{animals-table}.
                          @code[#:multi-line #t]{
                            box-plot :: (t :: Table, column :: String) -> Image
                            box-plot(animals-table, "pounds")
                          }
                          @activity{
                              Type in this expression in the Interactions Area, and see the resulting plot.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bitmap{images/box-plot.png}
                          This plot shows us the variation in our dataset according to five numbers. Let's look at three of them now:
                          @itemlist[
                              @item{ 
                                  The @bold{minimum} value in the dataset (at the bottom). This is Snuggles, our 0.1 pound Tarantula.
                              }
                              @item{ 
                                  The @bold{maximum} value in the dataset (at the top). This is Kujo, our 172 pound dog.
                              }
                              @item{
                                  The @bold{median} value, which we computed earlier as 28.9.
                              }                              
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          One way to summarize the variation in the dataset is to measure the distance between the largest value and the smallest value. When we talk about functions having many possible outputs, we use the term "Range" to describe them. When we look at all the values between the smallest and largest in our dataset, we use the same term.
                          @activity{
                              Find the @vocab{Range} of weights in your dataset, by subtracting the lightest one (@code{snuggles}) from the heaviest one (@code{kujo}).
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              These three numbers divide our dataset into two halves. The first half runs from the @bold{min} to the @bold{median}, and the second half runs from the @bold{median} to the @bold{max}. In this chart, the median is much closer to the min than it is to the max. What does that tell us?
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          By definition, half the animals in our sample weigh less than the median. That already tells us that the distribution is skewed towards the min, possibly with a few outliers on the high end. But suppose we wanted to zoom in a little closer, to get a better view. Rather than merely dividing our dataset in half we can take the @italic{median of each half}. Now we have @italic{five numbers}, which chop our dataset into four @vocab{quartiles}.
                          @itemlist[
                              @item{
                                  The 1st quartile is 6.50 pounds.
                              }
                              @item{
                                  The 2nd quartile is our median: 28.90 pounds.
                              }
                              @item{
                                  The 3rd quartile is 72.05 pounds.
                              }
                          ]
                      }
                      @teacher{
                          
                      }
                }
                @point{
                      @student{
                          This approach chops the dataset into four pieces, which gives us even more insight into our distribution. Each quartile contains 25% of the animals in our dataset. Data Scientists subtract the 1st quartile from the 3rd quartile to compute the range of the "middle half" of the dataset, also called the @vocab{interquartile range}.
                          @activity{
                              Compute the interquartile range of the weights of the animals in this dataset.
                          }
                      }
                      @teacher{
                          @math{72.05 - 6.5 = 65.55}
                      }
                }
                @point{
                      @student{
                          The @vocab{Range} of our dataset is 171.9, but the @vocab{interquartile range} is 65.55. That means that half the animals' weights fall within only a third of range. Looking at the first and third quartiles, we can conclude that the interquartile range is also skewed to the lower side of our values.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          It's much easier to see this skew when we look at the box plot, but any Data Scientist can communicate this information just by sharing the five numbers that determine the quartiles.
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
                          @activity{
                            Turn to @worksheet-link[#:name "Variation-Dog-Age"], and read the word problem carefully. Then write a Contract and Purpose Statement for this word problem.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          This time, our Result isn't a Table -- it's an @italic{Image}: the box-plot of the ages for all the dogs in the Sample Table. 
                          @activity{
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
                @point{
                      @student{
                          Now that you have your box-plot, turn to @worksheet-link[#:name "Interpreting-Variation"] and complete the questions you see there.
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Closing"
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
                        @activity{
                            Take 10 minutes to fill out @worksheet-link[#:name "Summarizing-My-Dataset"] in your Student Workbook. Choose a column to investigate, and write up your findings.
                        }
                    }       
                    @teacher{

                    }              
              }
        ]
  }
}