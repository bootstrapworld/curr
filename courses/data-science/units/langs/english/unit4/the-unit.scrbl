#lang curr/lib

@title{Unit 4: Measuring Center}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
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
    Students learn how to measure central tendency using mean/median/mode. After applying these concepts to a contrived dataset, they apply them to their own datasets and interpret the results in their research papers.
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
                          According to the US Census Bureau, the average American household earned more than $45,000 in 2003 - more than 3x the poverty line that year. Does that mean only a small percentage of Americans were in poverty that year?

                          @activity{
                              Take two minutes to write down what you think on @worksheet-link[#:name "Unit-4"].
                          }
                      }
                      @teacher{
                          Invite an open discussion for a few minutes, then give students time to write down what they think.
                      }
                }
                @point{
                      @student{
                              Open the @editor-link[#:public-id "0BzzMl1BJlJDkVzhiR3JzYnlrem8" "Unit 4 Starter File"], then click "Save a Copy" and then Run the program. 
                              @activity{
                                  Turn to @worksheet-link[#:name "Table errors"], and see if you can find all the mistakes.
                              }

                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Mean, Median, and Mode"
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
                              Suppose the shelter is trying to raise money for new beds for the animals, and they want to talk about how big the animals are so they know what size beds to get. It would be pretty difficult to list the weight of every single animal, so it's convenient to @italic{summarize} the data into a single measure of the "center" of that dataset. If you plotted all the weights as points on a number line, what could we say about where those points are clustered? Is there a midpoint? Is there a point that shows up most often? Each of these are different ways of "measuring center", and Data Scientists use them to speak as accurately as possible when they summarize data.
                              @activity{
                                  Suppose you have nine animals that weight 20, 20, 30, 35, 35, 35, 40, 60, and 120 pounds. How many different "measures of center" can you come up with?
                              }
                      }
                      @teacher{
                              Have your students come up with ideas. It may be useful to write down 5-6 of them on the board, and have students brainstorm ideas.
                      }
                }
                @point{
                      @student{
                              One way of summarizing a column is to provide the @code{mean}, or @italic{average} of the values in that column. To take the average of a column, we add all the numbers in that column and divide by the number of rows.
                      }
                      @teacher{
                              Use your favorite lesson to teach students about computing averages.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open your workbooks to @worksheet-link[#:name "Mean-Median-Mode"] and fill in the answer to Question 1.
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zipcodes:  even though we can add and divide the numbers of zipcodes, the output doesn't correspond to some "center" zipcode.
                      }
                      @teacher{

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
                              Type @code{mean(animals-table, "age")}.  What does this give us? Why?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                    In the Interactions Area, take the @code{mean} of the @code{age} and @code{weeks} columns.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              On @worksheet-link[#:name "Mean-Median-Mode"], you computed the mean of those nine weights to be just under 42 pounds. That IS the average, but almost every animal in that list weighs less than 42 pounds! What is throwing off the average so much?
                      }
                      @teacher{
                              Point students to the two heaviest animals.
                      }
                }
                @point{
                      @student{
                              In this case, the mean is being thrown off by two extreme datapoints (60 and 120), which are throwing off the average. These are called @vocab{outliers}, because they fall far outside of the rest of the dataset. Calculating the mean is great when all the points in a dataset are evenly distributed, but it breaks down for datasets with huge outliers.
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                    Return to @worksheet-link[#:name "Mean-Median-Mode"] in your workbook and answer Question 2.
                              }

                              Pyret has a function to compute the median of a list as well, with the contract:

                              @code{# median :: (t :: Table, col :: String) -> Number}

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Test your answers in the median column with the @code{median} function.
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
                                @item{The mode of the first value is @italic{empty}, because no element is repeated at all.}
                                @item{The mode list of the second value is @italic{2}, since 2 appears more than any other number.}
                                @item{The mode list of the last value is @italic{a list containing 1 and 4}, because @code{1} and @code{4} both appear more often than any other element, and because they are appear equally often.}
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Complete Question 3 on @worksheet-link[#:name "Mean-Median-Mode"].
                              }
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
                            Take 10 minutes to fill out "Measures of Center" section in your Project Report.
                        }
                    }       
                    @teacher{
                        See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Project Report") to see an exemplar of student work.
                    }              
              }
        ]
  }
}