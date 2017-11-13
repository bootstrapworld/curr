#lang curr/lib

@title{Unit 6: Frequency Charts}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt} 
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
                                              @code{.row-n, .order-by, .filter, .build-column, bar-chart, pie-chart, mean, median, modes} 
                                              ""))]{
  @unit-descr{
    Students explore new visualizations in Pyret, this time focusing on the @italic{frequency} of observations in their dataset. They learn how to construct and interpret Frequency Bar Charts and Histograms, experiment with these visualizations in a contrived dataset, apply them to their own research, and interpret the results. 
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
                              }
                              Turn to @worksheet-link[#:name "Visualizing-Quantity-Review"] in your Student Workbook, and answer the questions you find there. 
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                These visualizations tell us about the value of each row in our table. Bar charts tell us the precise value of each row, and pie charts tell us the fraction - or percent - of the total value that each row takes up. In both charts, every row in the table is represented by a unique bar or pie slice. But what if we want to talk about @italic{frequency} in our dataset?
                        }
                        @teacher{
                        
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Frequency Bar Charts"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.3" "6.SP.4-5" "HSS.ID.A")
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
                              What can we say about this table? How many rows and columns does it have? Are they categorical or quantitative? Could we talk about the mean, median or modes of some of these columns? Which ones?
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "6.SP.4-5&1&1" "Data 3.1.3&1&1" "Data 3.1.3&1&2")]{
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
                              This works great for categorical data - there are only so many types of animals at our shelter! But what if we wanted to see a frequency of quantitative data, like the weights of each animal? There are so many unique weights in our table that we'd have a hundred different bars, all the same size! What we want is a way to @italic{group the values into bins}, so all the animals weighing between 0 and 20 pounds are counted together, then the animals weighing 21-40 pounds, and so on.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Here is the contract for @code{freq-bar-chart}, followed by an example of how use it:
                              @code[#:multi-line #t]{
                                freq-bar-chart :: (t :: Table, values :: String) -> Image
                                freq-bar-chart(animals-table, "species")  # show frequency of each animal
                              }
                              @activity[#:forevidence (list "6.SP.4-5&1&1" "HSS.ID.A&1&1" "Data 3.1.3&1&1" "Data 3.1.3&1&2" "Data 3.1.3&1&3")]{
                                  In the Interactions Area, type in the example to make a frequency bar chart of the animals, broken down by species. Are there more animals at the shelter that are female than male? Complete the Table Plan on @worksheet-link[#:name "Freq-Bar-Gender"].
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }
  @lesson/studteach[
     #:title "Histograms"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "S-ID.1-4" "HSS.ID.A" "Data 3.1.3")
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
                              @bitmap{images/histogram.png}
                              The second chart is called a @vocab{histogram}.  Histograms are like frequency bar charts, but they have a few important differences:
                                @itemlist[
                                    @item{ Frequency bar charts are for categorical data, but histograms are for quantitative data }
                                    @item{ The bars in a histogram are @italic{ordered} according to the ranges of the bins }
                                    @item{ The size of the bins is adjustable }
                                ]
                              These differences are made possible because quantitative data can be @italic{compared} - one bar can be said to be "greater than" than another bar, and a value can be said to be "within" the range of a bin. For categorical data, neither of these is the case, so we use bar charts instead of histograms. Frequency bar charts are only for counting the frequency of categorical data. In this chart, the weights of all the animals are groups into bins. How big are these bins?
                      }
                      @teacher{
                              Each bin represents a range of 20 pounds.
                      }
                }
                @point{
                      @student{
                               Here is the contract for @code{histogram}, followed by an example of how use it:
                              @code[#:multi-line #t]{
                                histogram :: (t :: Table, values :: String, bin-width :: Number) -> Image
                                histogram(animals-table, "pounds", 20)    # show the frequency of weights (in 20-pound bins)
                              }
                              @activity[#:forevidence (list )]{
                                  In the Interactions Area, type in the example to make a histogram of the animals, broken down by weight into 20-pound bins. Then try playing with the bin-size. Is it useful to have a bin-size of 1? What about 100?
                              }
                      }
                      @teacher{
                              Debrief with your students, focusing on what it means to "choose a good bin size".
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "S-ID.1-4&1&1" "Data 3.1.3&1&3" "Data 3.1.3&1&4")]{
                                  How long does it take for most animals to be adopted? Complete the Table Plan on @worksheet-link[#:name "Histogram-Adoption"].
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
     #:standards (list "Data 3.1.2")
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
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            How are is your dataset distributed? Create at least one frequency bar chart and one histogram to explore your dataset. If you're looking at a particular subset of the data, make sure you write that up in your findings on @worksheet-link[#:name "Visualizing-My-Dataset-2"].
                        }
                    }       
                    @teacher{
                        Give students 5-10min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                    }
              }
              @point{
                    @student{
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            What did you find? Do you need to refine your dataset further, either by filtering or building a new column? Take 10-15min to deepen your analysis, and write up your findings on @worksheet-link[#:name "Visualizing-My-Dataset-2"].
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
              @point{
                    @student{
                          You've now learned about a lot of different charts! How many can you name? When is it best to use a pie chart instead of a bar chart? What about a histogram instead of a frequency bar chart? Each chart is good for answering different kinds of questions, and Data Scientists know when to use each kind.
                          @activity[#:forevidence (list )]{
                                Turn to @worksheet-link[#:name "Which-Chart-Is-Best"]. Here you'll find a set of questions about the @code{animals} dataset. For each question, draw a line to the kind of chart that would answer it best.
                          }
                    }
                    @teacher{

                    }
              }
        ]
  }
}

