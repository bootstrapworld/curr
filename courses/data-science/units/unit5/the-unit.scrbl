#lang curr/lib

@title{Unit 5: Visualizing Quantitative Data}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to Histograms as visualizations for quantitative data, learn to analyze features of Histograms, and construct them in Pyret}
}
@unit-lessons{
@lesson/studteach[
     #:title "Guess the Dice"
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
                                Suppose a stranger invites you to play a game. You start by guessing a number between 2 and 12.  The stranger rolls two dice, and add the numbers together.  If that number matches your number, you win the jackpot! If your number is wrong, then you lose your money. How can we maximize our chances of winning?
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                This section has students estimating expected values,  so if you are also teaching students probability, you can use this section to introduce probabilistic concepts.
                                        }
                                        @item{
                                                If you are uneasy about using a gambling example in the classroom, we understand:  the students will see at the end that they should NOT agree to play this game!
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                What are the all of the possible numbers we could guess? Is there a "lucky number" that we should use, or are all guesses equally likely? Should we play this game?  
                        }
                        @teacher{
                                Ask the classroom if they have any guesses if there is a best number to guess, and if so why.  Ask the class to remember their answers for after they've completed this exercise.
                        }
                }
                @point{
                        @student{
                                We can use Pyret to simulate this game, and analyze the results to answer our question. By writing a computer program to estimate what the most common dice rolls are, we can come up with a good guess for what the dice roll will be.
                        }
                        @teacher{
                                In this exercise, students will use a nondeterministic function for the first time.  As they explore the @code{roll-dice} function, stress that @code{roll-dice} rarely gives the same answer more than once.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Open the @editor-link[#:public-id "0BxJ2mGqPUGt0aVBzZFNTc1NMM0k" "Unit 5 starter file"], and click run. Then evaluate each of the following expressions:

                                        @itemlist[
                                                @item{
                                                        @code{roll-dice(1)}
                                                }
                                                @item{
                                                        @code{roll-dice(3)}
                                                }
                                                @item{
                                                        @code{roll-dice(10)}
                                                }
                                        ]
                                        What is the contract for @code{roll-dice}? How does the input relate to the output? Try typing in @code{roll-dice(10)} multiple times. Does it always return the same thing?
                              }
                        }
                        @teacher{
                                The function @code{roll-dice} takes in a number of rolls to perform, and returns a @code{List<Number>} containing all of the dice rolls. The @code{roll-dice} treats each dice roll separately, and makes different numbers every time.
                        }
                }
                @point{
                        @student{
                                Use @code{roll-dice} to create a list of 10,000 rolls.  How can we use this List to come up with our lucky number? Is there a measure of center that could answer this question, and help us win the jackpot?
                        }
                        @teacher{
                                Guide students to suggest using mean, median, and mode to measure the center of the list of dice rolls.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        What are the @code{mean}, @code{median}, and @code{mode} of a list of 10,000 dice rolls?  Use the functions you've learned in Pyret to compute them.
                              }
                        }
                        @teacher{
                                Students should try running these functions on the output of @code{roll-dice} multiple times, since @code{roll-dice} will usually return a different list.
                        }
                }
                @point{
                        @student{
                                We can see that the mean and median are both 7, and the mean is very very close to 7.  So 7 is probably our best guess.

                                Should we play the game?  We haven't answered this question yet.  What do we need to know to figure this out?
                        }
                        @teacher{
                                We've used our measures of center to figure out the most frequent number, but just @italic{how frequent} is it?  We need some way of asking if 7 appears more than all the other numbers combined.
                        }
                }
                @point{
                        @student{
                                We can use a different kind of chart for visualizing @italic{how frequent values are} in a list of quantitative data.  This kind  of chart is a called @vocab{histogram}, and it is similar to the bar charts you have seen before.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Type the following code into your interactions window, then hit Enter/Return:

                                        @code[#:multi-line #t]{
                                                histogram(roll-dice(10000),
                                                          11,
                                                          _.{title: 'Frequency of Dice Rolls'})
                                        }

                                        Try changing the second argument from @code{11} to @code{1}. What do you think this argument means?
                                }

                                Here, the @code{histogram} function takes three arguments:
                                @itemlist[
                                        @item{
                                                The first is a list of numbers, containing the quantitative data.
                                        }
                                        @item{
                                                The second is the number of evenly-spaced @italic{bins} into which we want to group our list (we'll talk more about this in a moment).
                                        }
                                        @item{
                                                The third is a @code{PlotOptions} object, just like in @code{bar-chart}, @code{pie-chart}, or @code{freq-bar-chart}.
                                        }
                                ]
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                We will first show and explain what the histogram represents, then we will more thoroughly go through what that second argument (bin size) means.
                                        }
                                        @item{
                                                It may be easier for you to project the live code/image of the histogram. Since students do not yet know what a histogram is, or what this code is doing, they will have a harder time if they make syntax errors.
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                We want to count the number of times @italic{each} permutation shows up in the dice game. Since there are 11 possible values for each dice roll, we have 11 bars in our chart. Just like the frequency bar charts from last unit, the length of the bar corresponds with how frequent a value is.  For example, the longest bar the bar for 7, because 7 is the most frequent.  Notice this interesting hump shape; the further away from 7, the less common the number.
                        }
                        @teacher{
                                For curious students, you can explain this by showing that there are more combinations that add up to 8 than there are for 2 (for example).
                        }
                }
                @point{
                        @student{
                                Bar charts and histograms both count the @italic{frequency} in which values show up in a dataset. Unlike bar charts, however, histograms provide extra features for @vocab{quantitative data}: the bars are ordered from left to right, and the bins can be resized. Both of these are only made possible because quantitative data can be compared - one bar can be said to be "greater than" than another bar, and a value can be said to be "within" the range of a bin. For categorical data, neither of these is the case, so we use bar charts instead of histograms.
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Bins and Spread"
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
                                In the dice roll game, there were 11 possible numbers that the dice roll could produce. Would it be helpful to have 20 bars? 30? What would happen if we only used 1?

                                Look back at your call to the @code{histogram} function for the dice game. In the first example, it made sense to use 11 bins because there were only 11 possible values that the pair of dice could produce.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        What would happen if we only used 4 bins for the dice game?  What if we used 40?
                                        Try them out with new function calls in the interactions window.
                                }

                                Using only 4 bins gives us a histogram that is less helpful, because 11 bins more accurately covers the range from 2 to 12.  However, 40 isn't any more helpful, because there are so many bins that are empty. Choosing the right bin size helps us make sense of the data, and is a skill that every data scientist should practice.
                        }
                    @teacher{

                    }
                }
                @point{
                        @student{
                                For another example, let's look again at our favorite 4th grade class:

                                @build-table/cols[
                                        '("First" "Last" "Height")
                                        '(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
                                          ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
                                          ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
                                         (lambda (r c) (para ""))
                                         3 8
                                ]

                                Suppose we had 100 different students in this table. If we want to make a histogram for their height, how many possible values are there? 10? 100? The values of heights have decimals.  If we want to have a bar for every possible height value, how many bars do we need?
                        }
                        @teacher{
                                Guide discussion towards the fact that there are infinitely many values that height could take, so we can't have a bar for each one.
                        }
                }
                @point{
                        @student{
                                We can't have a bar for every possible height, and having a bar for each student in the table isn't really helpful to us. This is where bin sizes come in really handy!

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
                                The histogram that you completed only has 5 bars, yet each possible value contributes to the height of a particular bar.  This is possible because each of the decimal values is put into a @vocab{bin}.  Each @code{bin} is a range of values that our data can take.  
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

                                        Play around with the 2nd argument (the number of bins) to try and find the sweet spot.
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
                                Notice that each of these different data sets, no matter what the bin size is, have different general shapes.  The histogram for the dice game had a roughly even spread around one peak.  The other data sets may have multiple peaks, and have thin or wide humps.
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Analyzing Histograms"
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
                              Just like the bar and pie charts, histograms come in many shapes, sizes, colors, and forms.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Histograms-Practice"] in your workbook and answer the questions about each of the histograms.
                              }                          
                      }
                      @teacher{
                              This workbook assignment could also become a homework assignment, or be made into a quiz/jeopardy style game.

                              Image Sources:
                              @itemlist[
                                    @item{
                                           @(hyperlink "https://tinyurl.com/mubo8ze" "Population")
                                    }
                                    @item{
                                           @(hyperlink "http://media1.shmoop.com/images/prealgebra/unit5/pa.5.044.png" "Test Scores")
                                    }
                              ]
                                                
                      }
                }
        ]
   }

}

