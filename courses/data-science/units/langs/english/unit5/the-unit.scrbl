#lang curr/lib

@title{Unit 5: Histograms}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              "n/a" 
                                              (list @code{"hello" "91"} ))
                                       (list "Image" 
                                              @code{triangle, star, draw-chart...} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "DataSeries" 
                                              @code{function-plot, scatter-plot, bar-chart, pie-char, freq-bar-chart} 
                                              "")
                                       (list "List" 
                                              @code{.get, mean, median, modes} 
                                              @code{[list: "list", "of", "strings"]})
                                       (list "Table"
                                              @code{.row-n, .column}
                                              ""))]{
  @unit-descr{Students are introduced to Histograms as visualizations for quantitative data, learn to analyze features of Histograms, and construct them in Pyret}
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
                                @bitmap{images/dice.png}
                                While traveling to Vegas, you find yourself at Pearson's Casino. Pearson himself invites you to play a game, and it only costs you $1. He rolls two dice and adds the numbers together, while you guess what number he came up with. If you guess right, you keep your money and get an extra $1 to boot! But if you guess wrong, he keeps your dollar. What are your odds of winning this game? Are they good enough that it's worth playing?
                                @activity{
                                        Turn to page @worksheet-link[#:name "Unit-5"]. Take two minutes to write your answer.
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                This section has students estimating expected values, so if you are also teaching students probability, you can use this section to introduce probabilistic concepts.
                                        }
                                        @item{
                                                If you are uneasy about using a gambling example in the classroom, we understand: the students will see at the end that they should NOT agree to play this game!
                                        }
                                        @item{
                                                Note: The field of Statistics (and Karl Pearson himself) has a @(hyperlink "https://en.wikipedia.org/wiki/Karl_Pearson" "checkered past") when it comes to how they have been used throughout history.
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                What are the all of the possible numbers we could guess? Is there a "lucky number" that we should use, or are all guesses equally likely? Should we play this game?
                        }
                        @teacher{
                                Ask the classroom if they have any guesses if there is a best number to guess, and if so why. Ask the class to remember their answers for after they've completed this exercise.
                        }
                }
                @point{
                        @student{
                                We can use Pyret to simulate this game, and analyze the results to answer our question. By writing a computer program to estimate what the most common dice rolls are, we can come up with a good guess for what the dice roll will be.
                        }
                        @teacher{
                                In this exercise, students will use a nondeterministic function for the first time. As they explore the @code{roll-dice} function, stress that @code{roll-dice} rarely gives the same answer more than once.
                        }
                }
        ]
}

@lesson/studteach[
     #:title "Creating Histograms"
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
                                        Open the @editor-link[#:public-id "0BzzMl1BJlJDkVnU0Z2ZUOHJfaVE" "Unit 5 Starter File"], Save a Copy and Run the program. Then evaluate each of the following expressions:

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
                                Guide students to suggest using mean, median, and modes to measure the center of the list of dice rolls.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        What are the @code{mean}, @code{median}, and @code{modes} of a list of 10,000 dice rolls? Use the functions you've learned in Pyret to compute them. Does @code{roll-dice} give you the same list every time? Will you get the same mean every time?
                              }
                        }
                        @teacher{
                                Students should try running these functions on the output of @code{roll-dice} multiple times, since @code{roll-dice} returns slightly different lists each time.
                        }
                }
                @point{
                        @student{
                                We can see that the mean and median are both 7, and the mean is very, @italic{very} close to 7. So 7 is probably our best guess.

                                Unfortunately, we still don't know if 7 comes up often enough for this to be a game worth playing! If each round means we lose a dollar or win a dollar, we need our odds to be better than 50% to make it worth playing. We've used our measures of center to figure out the most frequent number, but just @italic{how frequent is it}? We need some way of asking if 7 appears more than all the other numbers combined.
                        }
                }
                @point{
                        @student{
                                We can use a different kind of chart for visualizing @italic{how frequent values are} in a list of quantitative data. This kind of chart is a called @vocab{histogram}, and it is similar to the bar charts you have seen before.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Type the following code into your Definitions Area to create the histogram DataSeries and draw the chart.

                                        @code[#:multi-line #t]{
                                                dice-histogram-series = histogram(roll-dice(10000), 11)
                                                dice-histogram-chart  = draw-chart("dice rolls", dice-histogram-series)
                                        }

                                        See what the histogram looks like, then try changing the second argument to @code{histogram}. What do you think this argument means?
                                }

                                The contract for @code{histogram} is:
                                @code[#:multi-line #t]{
                                    # histogram :: (values :: List<Number>, bins :: Number) -> DataSeries
                                }
                                @itemlist[
                                        @item{
                                                The first is a list of numbers, containing the quantitative data.
                                        }
                                        @item{
                                                The second is the size of @italic{bins} that we want to distribute this list into (we'll talk more about this in a moment).
                                        }
                                ]
                        }
                        @teacher{
                                Show students the histogram before explaining what the second argument (number of bins) means, to give them a point of reference. It may be easier for you to project the live code/image of the histogram. Since students do not yet know what a histogram is, or what this code is doing, they will have a harder time if they make syntax errors.
                        }
                }
                @point{
                        @student{
                                @bitmap{images/histogram.png}
                                We want to count the number of times @italic{each} permutation shows up in the dice game. Since there are 11 possible values for each dice roll, we have 11 bars in our chart. Just like the frequency bar charts from last unit, the length of the bar corresponds with how frequent a value is. For example, the longest bar the bar for 7, because 7 is the most frequent. Notice the shape of the histogram: the further away from 7, the less common the number.
                        }
                        @teacher{
                                For curious students, you can explain this by showing that there are more combinations that add up to 8 than there are for 2 (for example).
                        }
                }
                @point{
                        @student{
                                By hovering over a particular bar on the histogram, you can see how frequent a value is.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                    Hover over the middle bar, for the number 7.  How many 
                                                    times was a 7 rolled?
                                                }
                                                @item{
                                                    Out of the 10000 rolls, is this more than half?  Less than half?
                                                }
                                                @item{
                                                    Run the code to make the histogram a few more times.  Is the 
                                                    number of times 7 appears ever more than 5000 times?
                                                }
                                                @item{
                                                    Turn to @worksheet-link[#:name "Unit-5"] and write down your findings.
                                                }
                                        ]
                                }

                                The roll 7 is definitely the roll that happens the most often.  However, it never
                                appears more than half of the 10000 rolls. That means, most of the time we 
                                play this game, we will lose!
                        }
                        @teacher{

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

                                Look back at your call to the @code{histogram} function for the dice game. In the first example, it made sense to 1 bin for each possible value that the pair of dice could produce.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        What would happen if we used fewer, larger bins? What if we used more, smaller ones?
                                        Try them out with new function calls in the interactions window.
                                }

                                Using only fewer, larger bins gives us a histogram that is less helpful, because 11 bins more accurately covers the range from 2 to 12. However, lots of tiny bins isn't any more helpful, because there are so many bins that are empty. Choosing the right bin size helps us make sense of the data, and is a skill that every data scientist should practice.
                        }
                    @teacher{

                    }
                }
                @point{
                        @student{
                                We can't have a bar for every possible height, and having a bar for each student in the table isn't really helpful to us. This is where being able to control the number of bins comes in really handy!

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
                                The histogram that you completed only has 5 bars, yet each possible value contributes to the height of a particular bar. This is possible because each of the decimal values is put into a @vocab{bin}. Each @code{bin} represents a range of values in our dataset.
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

                                        Play around with the number of bins to try and find the sweet spot.
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
                                Notice that each of these different data sets, no matter what the bin size is, have different general shapes. The histogram for the dice game had a roughly even spread around one peak. The other data sets may have multiple peaks, and have thin or wide humps.
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Interpreting Histograms"
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
                @point{
                      @student{
                        A good histogram can help explain complicated data, but a bad one can make things very confusing. Come up with good histograms for the following questions. How will you choose your bin size?

                        @activity{
                            @itemlist[
                                @item{
                                    You want to rent a shuttle bus to take people from the airport to an event. You know what time everyone's flight lands, and they all arrive between 8am and 8pm. What would be a good bin-size to determine how many buses you'll need?
                                }
                                @item{
                                    Look back at your histogram for @code{median-life-expectancy}. How many bins make this chart helpful?
                                }
                                @item{
                                    How common is it for a country to have more than a billion people? Make a histogram that shows how common different population sizes are.
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
                            Take 10 minutes to answer question 7 in your Project Report.
                        }
                    }       
                    @teacher{
                        See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Project Report") to see an exemplar of student work.
                    }              
              }
              @point{
                    @student{
                           Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you answer more complex questions, and in greater detail.

                    }
                    @teacher{
                             If your students are working in pairs/groups, make sure that each student has access to a version of the program. The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option. This will allow them to copy a link to the program, then send to their partners in an email/message.
                   }
              }
        ]
   }
}

