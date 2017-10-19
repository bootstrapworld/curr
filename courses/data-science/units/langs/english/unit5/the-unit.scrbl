#lang curr/lib

@title{Unit 5: Measuring Center}

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
                              Open the @editor-link[#:public-id "0BzzMl1BJlJDkdTNka0NxY0tDVTg" "Unit 4 Starter File"], then click "Save a Copy" and then Run the program. Now that you are familiar with how tables organize data, it's time to solve some problems with them. We already know how to evaluate an identifier once a program has been run: we just type the identifier into the Interactions Area and hit "Enter" to see the value. For example, we can type the identifier @code{presidents} or @code{nutrition} into the interactions window, and we see the table. There are some other identifiers defined here - what are their names?
                              @activity{
                                  You'll notice that there's a new table defined here as well, called @code{countries}. What columns are included in this table, and what do they tell us about each country?
                              }

                      }
                      @teacher{
                              The identifiers are @code{a}, @code{b}, and @code{c}, each of which is defined to be a different List.
                      }
                }
        ]
      }

@lesson/studteach[
     #:title "Mean, Median, and Mode"
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
                              We encounter quantitative, 1-dimensional data all the time. Sometimes we have a list of temperatures for the day, and we want to know what the average is. Maybe we want to split a list of players into two teams, or find the most common birthday in our group of friends. All of these involve taking 1-dimensional data and asking questions about it's "center", but there are several different kinds of center. 
                      }
                      @teacher{
                              Have your students come up with other questions involving "center".
                      }
                }
                @point{
                      @student{
                              There are 3 ways to measure the "center" of a list of data: @vocab{mean}, @vocab{median} and @vocab{mode}. One of the most important questions we can ask about a column of quantitative data is:  what is the @vocab{average} value?
                      }
                      @teacher{
                              Use your favorite lesson to teach students about computing averages.
                      }
                }
                @point{
                      @student{
                              We calculate the mean by adding up a list of numbers, and dividing that sum by the number of elements in that list.

                              For example, the @vocab{mean} of the list @code{1, 4, 5, 8, 2} is calculated by @code{(1 + 4 + 5 + 8 + 2) / 5}, which evaluates to 4.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open your workbooks to @worksheet-link[#:name "Mean-Median-Mode"] and practice calculating the mean of each list of Numbers by hand.  DO NOT fill in the median and mode columns yet, even if you know how!
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zipcodes:  even though we can add and divide the numbers of zipcodes, the output doesn't correspond to some "center" zipcode.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              It would be nice if Pyret had a way for us to compute the @vocab{mean} of any column in a Table.  What do you think the contract for this function might be? Can you think of its Name, Domain and Range?
                      }
                      @teacher{
                              Get students to give suggestions as to what the mean function should be called.
                      }
                }
                @point{
                      @student{
                              Type @code{mean(pets, "age")}.  What does this give us? Why?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type each of the following programs into the interactions window, to check your work:
                                      @itemlist[
                                              @item{
                                                    mean(a)
                                              }
                                              @item{
                                                    mean(b)
                                              }
                                              @item{
                                                    mean(c)
                                              }
                                              @item{
                                                    mean(d)
                                              }
                                      ]
                              }
                      }
                      @teacher{
                              @code{2}, which is the mean of the numbers 1, 2 and 3.
                      }
                }
                @point{
                      @student{
                              This function takes a @italic{List of Numbers} as input, and gives us the mean (a Number) as output. Write the contract for this function into your Contracts page as:

                              @code[#:multi-line #t]{# mean :: (t :: Table, col :: String) -> Number}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              The second measure of center is the @vocab{median}.  The median is the "middle" value of a list, or a value that separates the top half of a list from the bottom half.
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
                              For lists that have an even number of elements, this question is a little trickier.

                              @code[#:multi-line #t]{
                                    2, 3
                              }

                              There is no one number in the list separating the top half and the bottom half, because there are only 2 numbers!  In this case, we take the @vocab{mean} of the two middle numbers.  So here, the median is @code{(2 + 3) / 2} which evaluates to @code{2.5}.
                      }
                      @teacher{
                              If students are entirely unfamiliar with median, it may help them to work through several more examples of lists with even/odd sizes, before they return to the workbook assignment.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                    Return to @worksheet-link[#:name "Mean-Median-Mode"] in your workbook and complete the column for median values.
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
                              The third and last measure of center is the @vocab{mode}. The @vocab{modes} of a list are all the elements that appear most often in the list. Median and Mean always produce one number. Mode is different than the other measures, since a list can have multiple modes - or even no modes at all!
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
                                      Complete the final column on @worksheet-link[#:name "Mean-Median-Mode"], by calculating the mode list for each value.
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
                              @itemlist[
                                    @item{
                                          Have students add the two contracts to their contract list.
                                    }
                                    @item{
                                          Note that later, we will reveal that @code{modes} can be used on Lists of Strings as well. There are also functions for producing a single number, which more closely mirrors what you may find in math class: @code{mode-smallest} and @code{mode-largest}. These will raise an error if the input list has no duplicate values.
                                    }
                              ]
                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Measuring Tables"
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
                          Suppose we wanted to know what the average number of calories are on the menu. We'd need to first extract that column from the table, and then take the @code{mean} of the resulting list. We can write this using identifiers:

                          @code[#:multi-line #t]{
                              mean(nutrition, "calories")
                          }

                          @activity{
                              How would you compute the median grams of sodium on the menu?
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Measuring-Center"] in your workbooks and complete all of the questions. You may have to do some programming to answer some of these!
                              }
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            This exercise gives students more practice using Pyret to compute mean/median/mode.  Students will also see first hand that calculating a median of medians of many lists is not necessarily the same as the median of a larger list.
                                      }
                                      @item{
                                            After all the students complete this workbook page, discuss the implications of this for the countries table. Taking the median of the @code{median-life-expectancy} column is an inaccurate measure of the median life expectancy of humans all over the world.  The most accurate measure of median human life expectancy would require a table with every human as a row.
                                      }
                                      @item{
                                            The punchline of this portion of the exercise is: don't take the median of medians.
                                      }
                              ]
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
                              Imagine that a math teacher is tracking their students' grades.  Here are the students' grades on the first test.

                              @code[#:multi-line #t]{
                                    68, 64, 62, 100, 100, 68, 67
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
                                            If the data is more "coarse grained", meaning the data is quantitative but there are only a small number of possible values each entry can take, then mode will be useful.
                                      }
                                      @item{
                                            If the data is going to have lots of outliers, then median gives a better estimate of the center than mean.
                                      }
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                    @student{
                          @activity{
                              @itemlist[
                                  @item{
                                      Suppose we want to look at how much sodium is in our menu. Would taking the @code{mean} or @code{median} be more accurate? Why or why not?
                                  }
                                  @item{
                                      Suppose we want to know how long the average person on Earth lives. Would taking the mean of @code{median-life-expectancy} give us the answer? Why or why not?
                                  }
                              ]
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity{
                            @itemlist[
                                  @item{
                                    Make sure to save your work.  Hit the Save button in the top left. This will save your program in the code.pyret.org folder within your Google Drive.
                                  }
                                  @item{  
                                    Use @code{mean}, @code{median} and @code{modes} with the @code{household-income} list. Do you think the "average household income" is still a good measure to use when talking about poverty? Why or why not? Take two minutes to write your answer on @worksheet-link[#:name "Unit-4"].
                                  }
                            ]
                        }

                    }
                    @teacher{
                        Have the class debrief their findings. Did anyone's mind change after looking at the data? Is the data convincing or not? Why or why not?
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
                            Take 10 minutes to fill out "Measures of Center" section in your Project Report.
                        }
                    }       
                    @teacher{
                        See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Project Report") to see an exemplar of student work.
                    }              
              }
              @point{
                    @student{
                           Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you to answer more complex questions, and in greater detail.

                    }
                    @teacher{
                             If your students are working in pairs/groups, make sure that each student has access to a version of the program.  The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option.  This will allow them to copy a link to the program, then send to their partners in an email/message.
                   }
              }
        ]
   }
}