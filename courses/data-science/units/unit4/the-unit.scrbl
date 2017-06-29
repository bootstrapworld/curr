#lang curr/lib

@title{Unit 4: Visualizing Categorical Data}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students learn to create and interpret bar charts and pie charts.}
}
@unit-lessons{
@lesson/studteach[
     #:title "How Can We Present Data?"
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
                              So far we've answered questions by computing one or several numbers. The mean/median/mode are measurements that try to summarize a data set. These are useful, but often they do not give us "the whole picture" about a data set.   
                      }
                      @teacher{
                              Feel free to use motivating examples that students will see in your classroom, or examples from real life data sets.
                      }
                }
                @point{
                      @student{
                              @bitmap{images/cholesterol_per_item.png}

                              Data scientists often use @vocab{charts} to give a graphical  representation of the data.  @vocab{Charts} are pictures, where some part of the picture relates to values in a data set.
                              You've already seen one kind of chart: a scatterplot.  @vocab{Bar charts} are used to compare rows in a table by their entries in a particular column.  In this example, we are comparing each item on the menu by the amount of cholesterol it has.  The length of the bar relates to the amount of cholesterol:  shorter bars mean less cholesterol, and higher bars mean more cholesterol.

                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                                @item{
                                                      Which item has the most cholesterol?
                                                }
                                                @item{
                                                      Which item has the second most cholesterol?
                                                }
                                                @item{
                                                      How much cholesterol does a grilled chicken sandwich have? 
                                                }
                                      ]
                              }
                      }
                      @teacher{
                              Highlight that you can very quickly see which items have the most cholesterol, compared to reading an entire table to find out.  Reading charts is advantageous for seeing how the rows relate to each other.  However, it's harder to read exact values from charts, as we see from the grilled chicken question. 
                      }
                }
                @point{
                      @student{
                              @bitmap{images/cholesterol_per_item_pie.png}

                              Another chart used to compare rows in a table by some column is a @vocab{pie chart}.
                              In pie charts, each row of the table gets a slice of the pie, and the size of  the pie slice relates to the value of cholesterol:  bigger pie slice means more cholesterol, and a thinner slice means less cholesterol. 
                      }
                      @teacher{
                              Later in the unit we will present guidelines for when to use pie charts vs. bar charts. For this example, a bar chart is preferable, but we want students to understand that pie and bar charts are different pictures to represent the same kind of data: one column of labels (food item), and one column of values (cholesterol).
                      }
                }
                @point{
                      @student{
                              Bar and Pie charts are similar in some ways:
                              @itemlist[
                                      @item{
                                            Every row is represented, either as a bar or a pie slice.
                                      }
                                      @item{
                                            The value being examined is proportional to the size of the bar or pie slice.
                                      }
                              ]
                              What differences do you see between bar and pie charts?
                      }
                      @teacher{
                              Pie charts are useful for showing @italic{percentages}, or "how big is this row relative to the size of the whole?" Bar charts show the actual magnitude of each row, independently of the total value.
                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Bar Charts & Pie Charts in Pyret"
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
                              In Pyet, you can easily construct pie charts and bar charts with functions.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the @editor-link[#:public-id "0BzzMl1BJlJDkMWdNU2huZWp3Zkk" "Unit 4 template"] file and hit Run.  You should see the bar and pie charts from the previous section appear sequentially. Hit the X button in the top left to view the next chart.
                              }

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's go through this code together:

                              @code[#:multi-line #t]{
                                    food-list        = extract food        from nutrition end
                                    cholesterol-list = extract cholesterol from nutrition end
                              }

                              @activity{
                                What does this code do?
                              }

                              You've seen this code before:  Extracting columns from a table as lists.  These lists are the labels and values (respectively) that will be used to create our charts.
                      }
                      @teacher{
                              If students cannot explain what these first two lines do, STOP and review.
                      }
                }
                @point{
                      @student{
                              @code[#:multi-line #t]{
                                    bar-chart(food-list,
                                              cholesterol-list,
                                              _.{title: 'Cholesterol per Menu Item'})
                              }

                              This code uses a new function you haven't seen before: @code{bar-chart}. The contract for the function is:
                               @code[#:multi-line #t]{
                                    bar-chart : List<String> List<Number> PlotOptions -> Image
                              }

                              The @code{bar-chart} function takes three arguments, and returns a @code{Image}. What do these arguments mean?
                              @itemlist[
                                      @item{
                                            The first is the list of labels.  Each of these will be the @italic{name} of a bar on the chart.
                                      }
                                      @item{
                                            The second is the list of values.  Each of these corresponds to the @italic{length} of a bar on the chart.
                                      }
                                      @item{
                                            The final argument is a PlotOptions object.  This argument allows us to change the title, color, and many other aspects of the plot. For now, all we will change is the title.
                                      }
                              ]

                              @activity{
                                  Write the contract for @code{bar-chart} in your Contracts page.
                              }

                              @code[#:multi-line #t]{
                                    pie-chart(food-list,
                                              cholesterol-list,
                                              _.{title: 'Cholesterol per Menu Item'})
                              }

                              The @code{pie-chart} function is very similar. Can you guess the contract for @code{pie-chart}? Write it into your Contracts page.
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            Encourage students to follow the convention of these function applications: Hit Enter/Return after every argument when applying plot functions, as it makes things easier to read.
                                      }
                                      @item{
                                            More information on the @code{_.{}} syntax of the PlotOptions can be found in the @(hyperlink "https://www.pyret.org/docs/latest/plot.html#%28part._.The_.Options_.Types_and_.Default_.Values%29" "Pyret Documentation")
                                      }
                              ]
                              
                      }
                }
                @point{
                      @student{
                              These plots are @italic{interactive}, allowing you to experiment with the data before you generate the final image. One of the nice things about a @code{Plot} is that it can be interactive: what happens when you hover over a slice of the pie?
                      }
                      @teacher{
                              It reveals the value and percentage of the whole.
                      }
                }
                @point{
                      @student{

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                              @item{
                                                    Create a bar chart displaying the amount of sodium for each menu item in @code{nutrition}.
                                              }
                                              @item{
                                                    Create a pie chart showing the GDP of every country in @code{countries}.
                                              }
                                      ]
                                      After completing these bar charts, turn to @worksheet-link[#:name "Questions-With-Charts"] in your workbook and answer the questions using these charts.
                              }
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            Students should add 2 more function calls to their definitions window; one using @code{bar-chart}, the other using @code{pie-chart}.
                                      }
                                      @item{
                                            Emphasize that students should choose informative axis & title names, as if they're showing these charts to someone who has never seen these tables before.
                                      }
                              ]
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
                              Recall the table of our favorite 4th grade class from Unit 2:

                              @build-table/cols[
                                    '("First" "Last" "Eye-Color")
                                    '(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
                                      ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
                                      ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\""))
                                     (lambda (r c) (para ""))
                                     3 8
                              ]

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Freq-Bar-Chart"]  in your workbook, and complete the exercise using this table.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              By filling in the last bar, you have created a bar chart.  However, there's something special about chart.  What is different about this bar chart from the ones we have created before?
                              @itemlist[
                                      @item{
                                            Previous bar charts used a column from the table as the labels, and another column as the values.
                                      }
                                      @item{
                                            In this bar chart, we are using the @vocab{categories} of a column as the labels, and the @vocab{frequency} of each category as the value.
                                      }
                              ]
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              Here, we are looking at the Eye Color column, which contains categorical data. In this special kind of bar chart, we are computing the @vocab{frequency} of  each category, and that frequency relates to the length of each bar.  Since there are 3 people with brown eyes, the bar for Brown extends to 3 marks long.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              This special kind of bar chart is called a @vocab{frequency bar chart}.  There's a function in Pyret that lets us build frequency bar charts from a list:
                              @code[#:multi-line #t]{
                                freq-bar-char : List<String> PlotOptions -> Plot
                              }
                              Below is an example that computes the frequency of categories in the @code{home-state} column of @code{presidents}.

                              @code[#:multi-line #t]{
                                    home-state-list = extract home-state from presidents end

                                    freq-bar-chart(home-state-list,
                                                   _.{title: 'Presidents from each State'})
                              }

                              What do the two arguments to @code{freq-bar-chart} mean?
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                              @item{
                                                    Create a frequency bar chart for the @code{party} column in @code{presidents}. Which political party has created the most presidents?
                                              }
                                              @item{
                                                    Create a frequency bar chart for the @code{continent} column in @code{countries}. Which continent has the most countries within it?
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
     #:title "Analysis of Charts"
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
                              For the rest of your life, you will probably see bar charts and pie charts in many different colors and formats.  To prepare for this, we'll practice answering questions about several different bar and pie charts from a variety of sources.
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Complete @worksheet-link[#:name "Chart-Practice"] and @worksheet-link[#:name "More-Chart-Practice"] in your workbook by answering the questions about each of the charts.
                              }                          
                      }
                      @teacher{
                              This workbook assignment could also become a homework assignment, or be
                              made into a quiz/jeopardy style game.

                              Image Sources:
                              @itemlist[
                                    @item{
                                           @(hyperlink "http://study.com/cimages/multimages/16/pie_chart_2.JPG" "Accounting")
                                    }
                                    @item{
                                           @(hyperlink "http://study.com/cimages/multimages/16/pie_chart_1.JPG" "Pet Ownership")
                                    }
                                    @item{
                                           @(hyperlink "https://gurufrequent.files.wordpress.com/2015/05/simple_bar_chart.png" "Fruit Sales")
                                    }
                                    @item{
                                           @(hyperlink "https://www.mathsisfun.com/data/images/bar-chart-movies.svg" "Movie Types")
                                    }

                              ]
                                                
                      }
                }
        ]
   }
}

