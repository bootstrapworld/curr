#lang curr/lib

@title{Unit 4: Measuring Center}

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
    Students learn how to measure central tendency using mean/median/mode. After applying these concepts to a contrived dataset, they apply them to their own datasets and interpret the results in their research papers.
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          According to the Animal Shelter Bureau, the average pet waits 6 weeks to be adopted. Does that mean most pets wait more than a month to find homes?
                      }
                      @teacher{
                          Invite an open discussion for a few minutes.
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Mean, Median, and Mode"
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
                              Suppose we want to check the Bureau's claim. It would be pretty difficult to list the weeks-waiting-for-adoption of every single animal, so it's convenient to @italic{summarize} the data into a single measure of the "center" of that dataset. If you plotted all the weeks as points on a number line, what could we say about where those points are clustered? Is there a midpoint? Is there a point that shows up most often? Each of these are different ways of "measuring center", and Data Scientists use them to speak as accurately as possible when they summarize data.
                              @activity{
                                  Suppose you have nine animals that took 1,  1,  3,  3,  3,  3,  4,  6, 12 weeks to be adopted. How many different "measures of center" can you come up with?
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
                                      Open your workbooks to @worksheet-link[#:name "Measuring-Center"]. We've already decided on the answer to Question 1 (@code{weeks}). Fill in the answer to Question 2.
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zipcodes:  even though we can add and divide the numbers of zipcodes, the output doesn't correspond to some "center" zipcode.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Wou computed the mean of that list to be just 6 weeks. That IS the average, but most of the animals in the table waited for less than 4 weeks! What is throwing off the average so much?
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
                                  @item{ The mode of our dataset is only 1, which means that many animals are adopted in just one week! }
                              ]
                              The Animal Shelter Bureau started with a fact: the mean wait time @italic{is} over 6 weeks. But then they drew a conclusion without checking to see if that was the right statistic to look at. As Data Scientists, we had to look deeper into the data to find out whether or not to trust the Bureau.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              @activity{
                                  Repeat this analysis for the @code{age} column, filling out the next set of questions on the bottom half of the paper. What do you conclude?
                              }
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
                            Consider how many policies and laws are defended with statistics like this. Get your students to realize that this knowledge helps them see through fake claims.
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
                          Let's put some of our new measures of center to work at the animal shelter...
                          @activity{
                            Turn to @worksheet-link[#:name "Median-Dog-Age"], and read the word problem carefully. Then write a Contract and Purpose Statement for this word problem.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          This time, our Result isn't a Table -- it's a @italic{Number}: the mean of the ages for all the dogs in the Sample Table. 
                          @activity{
                            Compute this by hand, and write your result on the page. When you're done, move on to defining the function, and fill out the methods to define the table. Do we need to build any columns? Filter any rows? Order the table?
                          }
                      }
                      @teacher{
                          The median age for this table is 3, and all that's needed is filtering.
                      }
                }
                @point{
                      @student{
                          We've got most of our function written:
                          @code[#:multi-line #t]{
                          median-dog-age :: (animals :: Table) -> Number
                          # Consumes a table and produces the median age of all the dogs
                          fun median-dog-age(animals):
                            t = animals.filter(is-dog)  # define the table
                            ...                         # produce our result
                          end
                          }
                          Up to now, the result has always just been the new table, @code{t}. But this time, we're going to @italic{compute the median of the age column}, and use our new table instead of @code{animals}.
                      }
                      @teacher{
                          If there's only one method being used, it's convention to put the method call on the same line as the table.
                      }
                }
                @point{
                      @student{
                          Putting it all together, we get:
                          @code[#:multi-line #t]{
                          median-dog-age :: (animals :: Table) -> Number
                          # Consumes a table and produces the median age of all the dogs
                          fun median-dog-age(animals):
                            t = animals.filter(is-dog)  # define the table
                            median(t, "age")            # produce our result
                          end
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              Turn to @worksheet-link[#:name "Mean-Kitten-Adoption"], and complete the Table Plan there.
                          }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Which Measure is Best?"
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
                              By now, you may have noticed that the @vocab{mean}, @vocab{median}, and @vocab{mode} of a data set are rarely the same value.  So, which one should we use, and when?
                      }
                      @teacher{
                              For each of the following example lists, discuss with the students what the strengths/weaknesses of each measurement.
                      }
                }
                @point{
                      @student{
                              Imagine that a teacher is tracking their students' grades. Here are the students' grades on the first test.

                              @code[#:multi-line #t]{
                                    [list: 68, 64, 62, 100, 100, 68, 67]
                              }
                              Which measure of center gives the best indication of how the class did?
                              @itemlist[
                                      @item{
                                            mean:  @code{75.57}
                                      }
                                      @item{
                                            median:  @code{68}
                                      }
                                      @item{
                                            modes:  @code{[list: 68, 100]]}
                                      }
                              ]
                              Notice that the mean is well over 75, even though most of the students scored below 70! The mean here is more affected by @italic{outliers}: those two 100s are bringing the average up. This is because the mean is calculated using every value in the list, while the median is calculated with at most 2 values from the list.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              In general, here are some guidelines for when to use one measurement over the other:

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
                        @activity{
                            Take 10 minutes to fill out @worksheet-link[#:name "Measuring-Center-My-Dataset"] in your Student Workbook. Make sure you investigate two different columns, and write up your findings.
                        }
                    }       
                    @teacher{

                    }              
              }
        ]
  }
}