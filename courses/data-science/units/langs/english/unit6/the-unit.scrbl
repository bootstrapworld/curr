#lang curr/lib

@title{Unit 6: Plotting Frequency}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt} 
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
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart} 
                                              ""))]{
  @unit-descr{
    Students explore new visualizations in Pyret, this time focusing on the @italic{frequency} of observations in their dataset. They learn how to construct and interpret Frequency Bar Charts and Histograms, experiment with these visualizations in a contrived dataset, apply them to their own research, and intepret the results. 
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
                                In the last Unit, you learned about two ways to visualize a dataset. To review, turn to @worksheet-link[#:name "Visualizing-Quantity-Review"] in your Student Workbook, and answer the questions you find there. 
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                These visualizations tell us about the value of each row in our table. Bar charts tell us the precise value of each row, and pie charts tell us the fraction - or percent - of the total value that each row takes up. In both charts, every row in the table is represented by a unique bar or pie slice. But what if we want to talk about @italic{frequency} in our dataset?
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Frequency Bar Charts and Histograms"
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
                              Let's look at a Sample Table, sampled from the @code{animals-table}...

                              @build-table/cols[
                                    '("name" "species" "age" "pounds")
                                    '(("\"Sasha\"" "\"Boo-boo\"" "\"Felix\"" "\"Buddy\"" "\"Nori\"" "\"Wade\"" "\"Nibblet\"" "\"Maple\"")
                                      ("\"cat\"" "\"dog\"" "\"cat\"" "\"lizard\"" "\"dog\"" "\"cat\"" "\"rabbit\"" "\"dog\"")
                                      ("1" "11" "16" "2" "6" "1" "6" "3")
                                      ("6.5" "123" "9.2" "0.3" "35.3" "3.2" "4.3" "51.6"))
                                     (lambda (r c) (para ""))
                                     4 8
                              ]
                              What can we say about this table? How many rows and columns does it have? Are they categorical or quantitative? Could we talk about the mean, median or modes of some of this columns? Which ones?
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity{
                                    Turn to @worksheet-link[#:name "Visualizing-Frequency"] in your Student Workbook, and answer the questions you find there. 
                              }
                              What was different about these questions? What did the charts at the bottom tell us? The questions were all about @italic{frequency}. The first chart shows the frequency of different species in the table, and the second shows the frequency of certain @italic{weight-ranges}.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @bitmap{images/freq-bar.png}
                              The first chart is called a @vocab{frequency bar chart}. It uses the @vocab{categorical data} in a column as the labels, and then @italic{counts how often} those categories show up in the table. In other words, it shows us the frequency with which each category appears in the table.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              Here, we are looking at the @code{species} column, which contains categorical data. In this special kind of bar chart, we are computing the @vocab{frequency} with which each category occurs in our dataset. and that frequency relates to the length of each bar. Since there are 3 animals whose @code{species} is @code{"cat"}, the bar for Cat extends to 3 marks long.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              This works great for categorical data - there are only so many types of animals at our shelter! But what if we wanted to see a frequency of quantitative data, like the weights of each animal? There are so many unique weights in our table that we'd have have a hundred different bars, all the same size! What we want is a way to @italic{group the values into bins}, so all the animals weighing between 0 and 20 pounds are counted together, then the animals weighing 21-40 pounds, and so on.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @bitmap{images/histogram.png}
                              The second chart is called a @vocab{histogram}.  Histograms are like frequency bar charts, but they have a few important differences:
                                @itemlist[
                                    @item{ Frequency bar charts are for categorical data, but histograms are for quantitative data }
                                    @item{ The bars in a histogram are @italic{ordered} according to the ranges of the bins }
                                    @item{ The size of the bins are adjustable }
                                ]
                              These differences are made possible because quantitative data can be @italic{compared} - one bar can be said to be "greater than" than another bar, and a value can be said to be "within" the range of a bin. For categorical data, neither of these is the case, so we use bar charts instead of histograms. Frequency bar charts are only for counting the frequency of categorical data. In this chart, the weights of all the animals are groups into bins. How big are these bins?
                      }
                      @teacher{
                              Each bin represents a range of 20 pounds.
                      }
                }
                @point{
                      @student{
                              Here are the contracts for both charting functions, followed by two examples of how use them:
                              @code[#:multi-line #t]{
                                freq-bar-chart :: (t :: Table, values :: String)                      -> Image
                                histogram      :: (t :: Table, values :: String, bin-width :: Number) -> Image
                                freq-bar-chart(animals-table, "species")  # show frequency of each animal
                                histogram(animals-table, "pounds", 20)    # show the frequency of weights (in 20-pound bins)
                              }
                              @activity{
                                  In the Interactions Area, type each of these expressions and see what you get. Then try changing the bin-size of the histogram to be very small and very large. What works best?
                              }
                      }
                      @teacher{
                              Debrief with your students, focusing on what it means to "choose a good bin size".
                      }
                }
                @point{
                      @student{
                              @activity{
                                  Complete the Table Plans on @worksheet-link[#:name "Freq-Bar-Gender"], and @worksheet-link[#:name "Histogram-Adoption"].
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Your Dataset"
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
                        @activity{
                            How are is your dataset distributed? Create at least one frequency bar chart and one histogram to explore your dataset. If you're looking at a particular subset of the data, make sure you write that up in your findings on @worksheet-link[#:name "Frequency-My-Dataset"].
                        }
                    }       
                    @teacher{
                        Give students 5-10min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                    }
              }
              @point{
                    @student{
                        @activity{
                            What did you find? Do you need to refine your dataset further, either by filtering or building a new column? Take 10-15min to deepen your analysis, and write up your findings on @worksheet-link[#:name "Frequency-My-Dataset"].
                        }
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
        ]
  }
}

