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
                              this table using the functions & operators we've learned.  Try it if you aren't convinced!

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Do any of these evaluate to something that makes sense?
                                      @itemlist[
                                              @item{ 
                                                    @code{presidents * 2}
                                              }
                                              @item{
                                                    @code{presidents + nutrition}
                                              }
                                              @item{
                                                    @code{}
                                              }
                                      ]
                              }

                      }
                      @teacher{
                              TODO is this worthwhile motivation?
                      }
                }
                @point{
                      @student{
                              Tables are 2-dimensional collections of data.  If we ask "what is the lowest amount of sodium on the menu", or
                              "What is biggest serving size possible", these are questions that only involve 

                      }
                      @teacher{
                              TODO segue???
                      }
                }
                @point{
                      @student{
                              When we ask questions about only one column in the table, it would be nice if we could only work with 
                              a 1-dimensional collection of data, and not worry about the rest of the Table.

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              In fact, the @vocab{extract} operation does just that!

                              @code{
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
                              @vocab{lists} are a new type:  they are collections of values.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the TODO Unit 3 template file, and for each of these, add code to the definitions
                                      window to extract a column as a list:

                                      @itemlist[
                                              @item{
                                                    Create a list called @code{name-list} that contains the name column from @code{presidents}.
                                              }
                                              @item{
                                                    Create a list called @code{calories-list} containing the calories column from @code{nutrition}.
                                              }
                                              @item{
                                                    Create a list called @code{sugar-list} containing the sugar column from @code{nutrition}.
                                              }
                                      ]

                                      Notice that these Lists contain either Strings, or Numbers.
                              }
                      }
                      @teacher{
                              TODO add usage of the lifespan dataset
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
                              @activity[#:forevidence "BS-IDE7&1&1"]{
                                      Open your workbooks to TODO and practice calculating the mean of
                                      each list of Numbers by hand.
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide,
                              so the @vocab{mean} only makes sense for quantitative data.  The mean of 
                              a list of zipcodes does not make sense, for example.
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
                              The second measure of center is the @vocab{median}.  Pyret has a function to
                              compute the @vocab{median} of a list as well, with the contract:

                              @code{# median: List<Number> -> Number}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{

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
                              @itemlist[
                                      @item{
                                            Students are given 3 examples of lists & context, 
                                            and the 3 measures of center for each list
                                      }
                                      @item{
                                            Students choose which measure is most accurate for 
                                            that context.  The answer is different for each.
                                      }
                                      @item{
                                            At the end, we give heuristics:  mode is better for categorical,
                                            or course grained data, mean is affected by outliers easily. 
                                      }
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{

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
                              @itemlist[
                                      @item{
                                            Students practice extracting & measuring center with lifespan data
                                      }
                                      @item{
                                            We explain why NOT to get median of medians, using 3 lists of size 3 example.
                                      }
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{

                      }
                      @teacher{
                      
                      }
                }
        ]
   }

}

