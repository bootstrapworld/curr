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
                              So far we've answered questions by computing one or several numbers.
                              The mean/median/mode are measurements that try to summarize a data set.
                              These are useful, but often they do not give us "the whole picture"
                              about a data set.   
                      }
                      @teacher{
                              Feel free to use motivating examples that students will see in your
                              classroom, or examples from real life data sets.
                      }
                }
                @point{
                      @student{
                              Data scientists often use @vocab{charts} to give a graphical 
                              representation of the data.  @vocab{Charts} are pictures, where
                              some part of the picture relates to values in a data set.

                              @bitmap{images/cholesterol_per_item.png}

                              This is your first example of a chart.  @vocab{Bar charts}
                              are used to compare rows in a table by their entries
                              in some column.  Here, we are comparing each item on the menu
                              by their amount of cholesterol.  The length of the bar relates
                              to the amount of cholesterol:  shorter bars mean less cholesterol,
                              and higher bars mean more cholesterol.

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
                              Highlight that you can very quickly see which items have the most cholesterol,
                              compared to reading an entire table to find out.  Reading charts is advantageous
                              for seeing how the rows relate to each other.  However, it's harder to read
                              exact values from charts, as we see from the grilled chicken question. 
                      }
                }
                @point{
                      @student{
                              Another chart used to compare rows in a table by some column is a @vocab{pie chart}.

                              @bitmap{images/cholesterol_per_item_pie.png}

                              In pie charts, each row of the table gets a slice of the pie, and the size of 
                              the pie slice relates to the value of cholesterol:  bigger pie slice means more
                              cholesterol, and a thinner slice means less cholesterol. 
                      }
                      @teacher{
                              Later in the unit we will present guidelines for when to use pie charts vs. bar charts.
                              For this example, a bar chart is preferable, but we want students to understand that
                              pie and bar charts are different pictures to represent the same kind of data:  one
                              column of labels (food item), and one column of values (cholesterol).
                      }
                }
                @point{
                      @student{
                              Notice the main similarities between the two kinds of chart:
                              @itemlist[
                                      @item{
                                            Each row gets a bar/slice of the pie.
                                      }
                                      @item{
                                            How large the row's value is determines the height of the bar/size of the slice of pie.
                                      }
                              ]
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
                                      Open the TODO starter file, and hit run.  You should see the bar
                                      and pie charts from the previous section appear sequentially.
                                      Hit the X button in the top left to view the next chart.
                              }

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's go through this code together:

                              @code[#:multi-line #t]{
                                    food-list = extract food from nutrition end
                                    cholesterol-list = extract cholesterol from nutrition end
                              }

                              You've seen this code before:  Extracting specific
                              lists from a table, to look at columns by themselves.  These lists
                              are the labels and values (respectively) that will be used to
                              create our charts.

                              @code[#:multi-line #t]{
                                    bar-chart(food-list,
                                              cholesterol-list,
                                              'Menu Item',
                                              _.{title: 'Cholesterol per Menu Item'})
                              }

                              Here, the @code{bar-chart} function takes four arguments:
                              @itemlist[
                                      @item{
                                            The first is the list of labels.  Each of these will
                                            be the name of a bar on the chart.
                                      }
                                      @item{
                                            The second is the list of values.  Each of these 
                                            corresponds to the length of a bar on the chart.
                                      }
                                      @item{
                                            The next argument is a String, which is 
                                            the name of the horizontal axis.
                                      }
                                      @item{
                                            The final argument looks a little strange.  This
                                            argument is a PlotOptions object.  All you need to
                                            know is that this argument allows us to change the
                                            title, color, and many other aspects of the plot.
                                            For now, all we will change is the title.
                                      }
                              ]

                              @code[#:multi-line #t]{
                                    pie-chart(food-list,
                                              cholesterol-list,
                                              _.{title: 'Cholesterol per Menu Item'})
                              }

                              The @code{pie-chart} has a very similar contract:  it has all of the same
                              arguments, except for the name of the horizontal axis.
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            Encourage students to follow the convention of these function applications:
                                            Hit Enter/Return after every argument when applying plot functions, as it
                                            makes things easier to read.
                                      }
                                      @item{
                                            More information on the @code{_.{}} syntax of the PlotOptions
                                            can be found in the [@(hyperlink "https://www.pyret.org/docs/latest/plot.html#%28part._.The_.Options_.Types_and_.Default_.Values%29" "Pyret Documentation")]
                                      }
                              ]
                              
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
                                      After completing these bar charts, turn to TODO in your workbook and answer
                                      the questions using these charts.
                              }
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            Students should add 2 more function calls to their definitions window; 
                                            one using @code{bar-chart}, the other using @code{pie-chart}.
                                      }
                                      @item{
                                            Emphasize that students should choose informative axis & title names,
                                            as if they're showing these charts to someone who has never seen
                                            these tables before.
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
                              @itemlist[
                                      @item{ 
                                            
                                      }
                                      @item{

                                      }
                                      @item{

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
                              @itemlist[
                                      @item{ 
                                            Read bar charts and pie charts (some from outside of Pyret)
                                            and interpret them to answer questions.
                                      }
                                      @item{

                                      }
                                      @item{

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

