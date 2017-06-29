#lang curr/lib

@title{Unit 3: Measuring Center}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students learn how to measure central tendency using mean/median/mode.  They will practice calculating these values by hand, and learn to do so using Lists in Pyret}
}
@unit-lessons{
@lesson/studteach[
     #:title "Extracting Lists"
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
                              Now that you are familiar with how tables organize data, it's time to solve some problems with them.
                              However, we have a problem:  We can type the identifier @code{presidents} or @code{nutrition} into
                              the interactions window, and we see the table.  However, we can't write any other expressions using
                              this table using the functions & operators we've learned.

                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Tables are 2-dimensional collections of data.  If we ask "what is the lowest amount of sodium on the menu", or
                              "What is biggest serving size possible", these are questions that only involve one column at a time.  We
                              need some way of looking at each column individually in our programs.  
                              In other words, we want to get 1-dimensional data OUT of the 2-dimensional table.

                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              The @vocab{extract} operation does just that!

                              @code[#:multi-line #t]{
                                    sodium-list = extract sodium from nutrition end
                              }

                              After running this program, typing @code{sodium-list} into the interactions window and hitting Return
                              gives us the following list: @code{[list: 480, 680, 820, 360, 1300, 790, 160, 150, 680, 130]}.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's examine this line of code, piece by piece.

                              @itemlist[
                                      @item{
                                            @code{extract} tells Pyret that we want to take a particular column out of a table. 
                                      }
                                      @item{
                                            After the @code{extract} keyword, we choose the name of 1 column we want 
                                            to see as a list.  In this case, it is the @code{sodium} column.
                                      }
                                      @item{
                                            Then, the @code{from} keyword, which indicates which table we are extracting the
                                            column from.  Following this is the table name, which is @code{nutrition}.
                                      }
                                      @item{
                                            Finally, an @code{end} keyword tells Pyret that our line of code involving a
                                            table is done.
                                      }
                              ]


                      }
                      @teacher{
                              This is the first example of an expression that consumes a table that students will need to write
                              for themselves.  These expressions (@code{extract, sieve, select, order}, and @code{extend})
                              have fundamentally different syntax than programs they have seen with arithmetic or function application.
                      }
                }
                @point{
                      @student{
                              @vocab{lists} are a new type:  they are collections of values.  Whereas tables are 2-dimensional collections
                              of values, lists are 1-dimensional collections of values.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the @editor-link[#:public-id "0BxJ2mGqPUGt0Zjl2Nk4yeTJzeU0" "Unit 3"] template file, 
                                      and for each of these bullet points, add code to the definitions window to extract a column as a list:

                                      @itemlist[
                                              @item{
                                                    Define a list called @code{sodium-list} that contains the @code{sodium} column from @code{nutrition}.
                                              }
                                              @item{
                                                    Define a list called @code{name-list} that contains the @code{name} column from
                                                    @code{presidents}.
                                              }
                                      ]
                              }
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              You may have noticed there's a new table in this program.  This 
                              table contains information about different countries all over the world.
                              Part of being data scientists is 
                      }
                      @teacher{

                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Mean, Median, Mode, and Pyret"
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
                              One of the most important questions we can ask about 
                              columns containing quantitative data is:  what is the @vocab{average} value?
                              How can we estimate what the 'center' of the data in a column is?
                      }
                      @teacher{
                              Use your favorite method of teaching the concept of averages.
                      }
                }
                @point{
                      @student{
                              There are 3 ways to measure the center of a list of data:  The first is 
                              the @vocab{mean}.  We calculate the mean by adding up each element in the list,
                              and dividing by the number of elements in the list.

                              For example, the @vocab{mean} of the list @code{[list: 1, 4, 5, 8, 2]} 
                              is calculated by @code{(1 + 4 + 5 + 8 + 2) / 5}, which evaluates to 4.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open your workbooks to @worksheet-link[#:name "Mean-Median-Mode"] 
                                      and practice calculating the mean of
                                      each list of Numbers by hand.  DO NOT fill in the median and mode
                                      columns yet, even if you know how!
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide,
                              so the @vocab{mean} only makes sense for quantitative data.  For example,
                              the mean of a list of Presidents doesn't make sense.  Same thing for a list
                              of zipcodes:  even though we can add and divide the numbers of zipcodes, the
                              output doesn't correspond to some "center" zipcode.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              It would be nice if Pyret had a way for us to compute the @vocab{mean} of
                              any List.  What would that function be called?
                      }
                      @teacher{
                              Get students to give suggestions as to what the mean function should be called.
                      }
                }
                @point{
                      @student{
                              Type @code{mean(sugar-list)}.  What does this give us?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type each of the following programs
                                      into the interactions window, to check your work:
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
                              A Number, that is the mean.
                      }
                }
                @point{
                      @student{
                              This function takes a List of Numbers as input, and gives us the mean (a Number)
                              as output.  We write this contract as:

                              @code{# mean: List<Number> -> Number}
                      }
                      @teacher{
                              Have the students add this to their contract list.
                      }
                }
                @point{
                      @student{
                              The second measure of center is the @vocab{median}.  The median is 
                              the "middle" value of a list, or a value that separates the top
                              half of a list from the bottom half.
                      }
                      @teacher{
                              Again, you can use your preferred method of teaching the median concept,
                              as long as the students complete the workbook practice exercises for
                              calculating the median.
                      }
                }
                @point{
                      @student{
                              As an example, consider this list:

                              @code[#:multi-line #t]{
                                    [list: 2, 3, 1]
                              }

                              Here @code{2} is the median, because it separates the "top half" 
                              (all values greater than @code{2}, which is just @code{3}), and 
                              the "bottom half" (all values less than or equal to 2).
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
                                            Repeat these steps until there is only one number
                                            left in the list.  This number is the median.
                                            If there are two numbers left, take the mean of 
                                            those numbers, for reasons explained in the next point.
                                      }
                              ]
                               
                      }
                }
                @point{
                      @student{
                              For lists that have an even number of elements, this question 
                              is a little trickier.

                              @code[#:multi-line #t]{
                                    [list: 2, 3]
                              }

                              There is no one number in the list separating the top half and
                              the bottom half, because there are only 2 numbers!  In this case,
                              we take the @vocab{mean} of the two middle numbers.  So here, the
                              median is @code{(2 + 3) / 2} which evaluates to @code{2.5}.
                      }
                      @teacher{
                              If students are entirely unfamiliar with median, it may
                              help them to work through several more examples of lists with
                              even/odd sizes, before they return to the workbook assignment.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Return to your workbook and complete the column for median values.
                              }

                              Pyret has a function to
                              compute the median of a list as well, with the contract:

                              @code{# median: List<Number> -> Number}

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Test your answers in the median column with the @code{median} function.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              The third and last measure of center is the @vocab{mode}.  The @vocab{mode}
                              of a list is the element that appears most often in the list.

                              @code[#:multi-line #t]{
                                    [list: 1, 2, 2, 3, 4]
                              }

                              Here the mode is @code{2}, since 2 appears more than any other number.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              What is the mode of this list?

                              @code[#:multi-line #t]{
                                    [list: 1, 1, 2, 3, 4, 4]
                              }

                              This list has multiple modes:  @code{1, 4},
                              because they appear equally often, and more than other elements in
                              the list.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Complete the final column, by calculating the mean for 
                                      each example list.
                              }
                      }
                      @teacher{
                              For the examples in which a list has multiple modes,
                              students should write in the smallest mode because that
                              is the behavior of the @code{mode} function in Pyret, which
                              can only return one Number, as opposed to @code{modes} which
                              returns a List<Number>.
                      }
                }
                @point{
                      @student{
                              There are two different functions provided by Pyret:  @code{mode},
                              and @code{modes}.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type each of these lines of code into the interactions window.
                                      What's different about these two functions, when applied to
                                      the same List?

                                      @itemlist[
                                              @item{
                                                    mode(c)
                                              }
                                              @item{
                                                    modes(c)
                                              }
                                      ]
                              }

                              @code{mode} will return the smallest mode, which is a Number,
                              but @code{modes} will return a List<Number> containing all of
                              the modes.  Their contracts are:

                              @code[#:multi-line #t]{
                                    # mode : List<Number> -> Number
                                    # modes : List<Number> -> List<Number>
                              }
                      }
                      @teacher{
                              @itemlist[
                                    @item{
                                          Have students add these two contracts to their contract list.
                                    }
                                    @item{
                                          Note that later, we will reveal that @code{mode} and @code{modes}
                                          can be used on Lists of Strings as well.

                                          TODO: Do we explain generic type notation here?
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
                              After completing @worksheet-link[#:name "Mean-Median-Mode"] 
                              in your workbook, you may have noticed that 
                              the @vocab{mean}, @vocab{median}, and @vocab{mode} are rarely the
                              same value.  So, which one should we use, and when?
                      }
                      @teacher{
                              For each of the following example lists, discuss with the students 
                              what the strengths/weaknesses of each measurement.
                      }
                }
                @point{
                      @student{
                              Imagine that a math teacher is tracking their students' grades, using
                              lists in Pyret.  Here are the students' grades on the first test.

                              @code[#:multi-line #t]{
                                    [list: 68, 64, 62, 100, 100, 68, 67]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{75.57}
                                      }
                                      @item{
                                            median:  @code{68}
                                      }
                                      @item{
                                            mode:  @code{69}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that the mean here is more affected by outliers;  the two
                              100s are bringing the average up, when most students scored below 70.
                              This is because mean is calculated using every value in the list,
                              while the median is calculated with at most 2 values from the list.
                      }
                }
                @point{
                      @student{
                              Here is a different list of student grades, from their second test.

                              @code[#:multi-line #t]{
                                    [list: 68, 68, 89, 91, 88, 93, 92]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{84.14}
                                      }
                                      @item{
                                            median:  @code{89}
                                      }
                                      @item{
                                            mode:  @code{68}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that even though 68 appears more than any one number,
                              most of the scores are concentrated around ~90.
                      }
                }
                @point{
                      @student{
                              Grades on the students' 3rd test:

                              @code[#:multi-line #t]{
                                    [list: 94, 96, 98, 85, 82, 70, 71]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{85.14}
                                      }
                                      @item{
                                            median:  @code{85}
                                      }
                                      @item{
                                            modes:  @code{94, 96, 98, 85, 82, 70, 71}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that, since all of the values are distinct,
                              the mode is less useful than the median or mode.
                      }
                }
                @point{
                      @student{
                              The teacher just gave the students their fourth test, and here
                              is the list of grades:

                              @code[#:multi-line #t]{
                                    [list: 98, 96, 98, 85, 70, 70, 71]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{84}
                                      }
                                      @item{
                                            median:  @code{85}
                                      }
                                      @item{
                                            modes:  @code{70, 98}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that the mean and median are both weaker measures here,
                              because the scores are clustered in two groups around the modes.
                      }
                }
                @point{
                      @student{
                              In general, here are some guidelines for when to use 
                              one measurement over the other:

                              @itemlist[
                                      @item{
                                            If the data is unlikely to have values occurring multiple times
                                            (like with decimals, or with grades), do not use mode.
                                      }
                                      @item{
                                            If the data is more "course grained", meaning the data is
                                            quantitative but there are only a small number of possible values
                                            each entry can take, then mode will be useful.
                                      }
                                      @item{
                                            If the data is going to have lots of outliers, then median
                                            gives a better estimate of the center than mean.
                                      }
                              ]
                      }
                      @teacher{

                      }
                }

        ]
   }

@lesson/studteach[
     #:title "More Practice in Pyret"
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Measuring-Center"]  in your workbooks and complete all
                                      of the questions, using your Pyret program. 
                              }
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            This exercise gives students more practice using Pyret
                                            to compute mean/median/mode.  Students will also see
                                            first hand that calculating a median of medians of many lists
                                            is not necessarily the same as the median of a larger list.
                                      }
                                      @item{
                                            After all the students complete this workbook page,
                                            discuss the implications of this for the countries table.
                                            Taking the median of the @code{median-life-expectancy} column
                                            is an inaccurate measure of the median life expectancy of humans
                                            all over the world.  The most accurate measure of median human life
                                            expectancy would require a table with every human as a row.
                                      }
                                      @item{
                                            The punchline of this portion of the exercise is:  
                                            don't take the median of medians.
                                      }
                              ]
                      }
                }
        ]
   }

}

