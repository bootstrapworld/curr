#lang curr/lib

@title{Unit 4: Visualizing the "Shape" of Data}

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-char pie-chart} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter} 
                                              ""))]{
  @unit-descr{
    Students explore new visualizations in Pyret, this time focusing on the frequency of observations in a quantitative dataset. They learn how to see the shape of a histogram, understand the difference between bar charts and histograms, construct histograms by hand and with Pyret, experiment with these visualizations in a contrived dataset, apply them to their own research, and interpret the results.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Review"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list )
     #:materials @itemlist[]
     #:preparation @itemlist[
        @item{Computer for each student (or pair), with access to the internet}
        @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbooks"], and something to write with}]
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
                                Open your Animals Starter File, and click "Run". (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1gaYAyYhvlKBm6VJuvJDcnoINBw76pL-L" "new copy"].)
                              }
                        }
                        @teacher{
                                
                        }
                }
                @point{ 
                        @student{
                              Let's get some more practice working with the Design Recipe, as we prepare to do more complex analysis.
                              @activity{
                                  Turn to @worksheet-link[#:name "Building-Recipes"], and write the functions you see there. When you're ready, type the contracts, purpose statements, examples and definitions into the Definitions Area.
                              }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                              @activity{
                                  Use the @code{.build-column} method to add a new column to the animals table, showing the weight of every animal in kilograms.
                              }
                        }
                        @teacher{

                        }
                }
                
        ]
  }

  @lesson/studteach[
     #:title "Bar Charts v. Histograms"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students review bar charts, contrasting them with histograms}]
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
                              @activity{
                                  Let's explore two different ways of visualizing data. Complete @worksheet-link[#:name "Bar-vs-Histogram"].
                              }
                      }
                      @teacher{
                              Have students share their observations.
                      }
                }
                @point{
                      @student{
                              @bitmap{images/species-bar-chart.png}
                              @vocab{Bar charts}, like the one of the bottom-left of @worksheet-link[#:name "Bar-vs-Histogram"], use the horizontal axis to show values of a categorical variable (in the diagram on the right, @code{species}). The vertical axis here shows @vocab{frequency} of that value in the dataset, which can be shown as absolute numbers or percentages of the total.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              This bar chart happens to show the categorical values in alphabetical order from left to right, but it would be perfectly fine to re-order them any way we wish. For instance, the bar for "dogs" could have been drawn before the one for "cats". Unlike the numbers on a histogram's horizontal axis, there is no objective order to categories on a bar-chart's horizontal axis. For this reason, @italic{it never makes sense to talk about the "shape" of a categorical data set.}
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              The display on the bottom-right is called a @vocab{histogram}. Histograms show the distribution of @italic{quantitative} data. Since quantitative data can be ordered from smallest-to-largest, histograms allow us to see the shape of a data set.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Animal shelters make decisions about food, capacity and policies based on how long it takes for animals to be adopted. But looking at each value in the @code{weeks} column is tedious, and isn't always the easiest way to make sense of the data. As the saying goes, sometimes you "can't see the forest for the trees". Summarizing with a single number like the average alsi leaves out a lot of important information. So instead of talking about each individual in a dataset, or simply reporting the average for all those individuals, Data Scientists find it useful to describe the overall @bold{shape} of the data. 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              A display of how long it takes animals to get adopted can make it easier to get an idea of what adoption times were most common, and if there were any unusually long or short times that it took for an animal to be adopted. Let's take a look at a histogram of the @code{weeks} it takes an animal to be adopted. Type the following into the interactions area:
                              @code[#:multi-line #t]{histogram(animals-table, "weeks", 5)}
                              @activity{
                                  Look at the histogram and count how many animals took between 0 and 5 weeks to be adopted. How many took between 5 and 10 weeks? What else do you Notice? What do you Wonder?
                              }
                      }
                      @teacher{
                              Display this histogram for students to see.
                      }
                }
                @point{
                      @student{
                              @bitmap{images/weeks-histogram.png}
                              What do you Notice about this histogram? What can you conclude? Here are a few conclusions to get you started:
                              @itemlist[
                                  @item{
                                      Because we see most of the histogram's area encompassed by the two bars between 0 and 10 weeks, we can say it was most common for an animal to be adopted in 10 weeks or less.
                                  }
                                  @item{
                                      Because we see a small amount of the histogram's area trailing out to unusually high values, we can say that a couple of animals took an unusually long time to be adopted: one took even more than 30 weeks.
                                  }
                                  @item{
                                      More than half of the animals (17 out of 31) took just 5 weeks or less to be adopted. But those few unusually long adoption times pulled the average up to 5.8 weeks. Knowing about the shape gives us worthwhile information beyond the simple report of average.
                                  }
                              ]
                      }
                      @teacher{
                          
                      }
                }
                @point{
                      @student{
                          If someone would ask us what was typical for the adoption times, we might say: "Almost all of the animals were adopted in 10 weeks or less, but a couple of animals took an unusually long time to be adopted - even more than 20 or 30 weeks!" Without looking at the histogram's shape, it would have been very difficult to make this summary.
                          @activity{
                              What would the histogram look like if most of the animals took more than 20 weeks to be adopted, but a couple of them were adopted in fewer than 5 weeks?
                          }
                      }
                }
          ]
  }
  @lesson/studteach[
     #:title "Describing Shape"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students are introduced to histograms}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students create histograms using the animals dataset}]
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
                              Let's get some practice reading histograms, and figuring out what they mean.
                              @activity{
                                  Turn to @worksheet-link[#:name "Matching-Histograms"], and complete the matching activity there.
                              }
                        }
                        @teacher{

                        }
                }
                @point{
                      @student{
                              Shape is one way to @italic{summarize} information in a dataset, to quickly describe what values are more or less common.
                              @bitmap{images/weeks-histogram.png}
                              A more general way to summarize the shape of a data set like this, which contains a few unusually high values, is to say that it is @bold{"skewed right, or has high outliers."}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Here are the most common shapes that we see for real-world data sets:
                              @bannerline{Symmetric: values are balanced on either side of the middle.} 
                              It's just as likely for the variable to take a value a certain distance below the middle as it is to take a value that same distance above the middle. Examples:
                              @itemlist[
                                  @item{
                                      Heights of 12-year-olds would have a symmetric shape. It's just as likely for a 12-year-old to be a certain number of inches below average height as it is to be that number of inches above average height.
                                  }
                                  @item{
                                      In a standardized test, most students score fairly close to what's average. Also, we see just as many students scoring a certain number of points above average as we see scoring that same number of points below average. The shape is symmetric (and bulges in the middle because most students score fairly close to what's average).                 
                                  }
                              ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bannerline{Skewed left, or low outliers} 
                                Values are clumped around what's typical, but they trail off with a few unusually low values. Examples:
                                @itemlist[
                                    @item{
                                        Number of teeth that adults have in their mouths would be skewed left or have low outliers. Most adults will have close to a full set of 32 teeth, but a few of them with serious dental problems would have a very small number of teeth. We won't get anyone in our data set who has 10 or 20 @italic{extra} teeth in their mouths!
                                    }
                                    @item{
                                        If most students did pretty well on an exam, but a few students performed very badly, then we'd see a shape that has left skewness and/or low outliers.
                                    }
                                ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bannerline{Skewed right, or high outliers}
                                Values are clumped around what's typical, but they trail off with a few unusually high values. We see this shape often in the real world, because there are many variables - like "income" or "time spent on the phone" - for which a few individuals have unusually high values, which aren't balanced out by unusually low values (things like "income" and "phone time" can't be less than zero). Examples:
                                @itemlist[
                                    @item{
                                        Age when a woman in the U.S. gives birth would be skewed right or have high outliers. A few women would be unusually old, 40 years or even more @italic{above} the average age of 26 (check the tabloids!), but none of them could be even close to 40 years @italic{below} average to balance things out!
                                    }
                                    @item{
                                        A data set of earnings almost always shows right skewness or high outliers, because there are usually a few values that are so far above average, they can't be balanced out by any values that are so far below average. (Earnings can't be negative.)
                                    }
                                ]
                        }
                }
                @point{
                        @student{
                              To build a histogram, we start by sorting all of the numbers in our column from smallest to largest, marking our x-axis from the smallest value to the largest value and dividing into equally-sized intervals, or "bins". Once we have our bins, we put each value in our dataset into the bin it belongs, and then count how many values are in each bin. This count determines the height of the bars on our y-axis.
                              @activity{
                                  Turn to @worksheet-link[#:name "Making-Histograms"], and try drawing a histogram from a dataset.
                              }

                        }
                        @teacher{
                              Note that interals on this display include the left endpoint but not the right. If we included the right endpoint and someone had 0 teeth, we’d have to add on a bar from -5 to 0, which would be awfully strange!
                        }
                }
                @point{
                        @student{
                              @bold{The size of the bins matters a lot!} Bins that are too small will hide the shape of the data by breaking it into too many short columns. Bins that are too large will hide the shape by squeezing the data into just a few tall columns. In this workbook exercise, the bins were provided for you. But how do you choose a good bin-size?
                              @bannerline{ Rule of thumb: a histogram should have between 5-10 bins. }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                              Let's make a histogram for the @code{pounds} column in the animals table, sorting the animals into 20-pound bins: @code{ histogram(animals-table, "pounds", 20) }
                              @activity{
                                Would you describe the shape of your histogram as being skewed left/low outliers or symmetric or skewed right/high outliers? Which one of these statements is justified by the histogram’s shape?
                                @itemlist[
                                    @item{ A few of the animals were unusually light. } 
                                    @item{ A few of the animals were unusually heavy. }
                                    @item{ It was just as likely for an animal to be a certain amount below average weight as it was for an animal to be that amount above average weight. }
                                ]
                                Try bins of 1-pound intervals, then 100-pound intervals. Which of these three histograms best satisfies our rule of thumb?
                              }
                        }
                        @teacher{
                              
                        }
                }
                @point{
                        @student{
                              @activity{
                                  @bold{Challenge:} Compare histograms for @code{pounds} of cats vs. dogs in the dataset. Are their shapes different? If so, how?
                              }
                        }
                }
                @point{
                        @student{
                              @activity{
                                  On @worksheet-link[#:name "Shape-of-Animals-Dataset"], describe the @code{pounds} histogram and another one you make yourself. When writing down what you notice, try to use the language Data Scientists use, and discuss skew and outliers.
                              }
                        }
                        @teacher{

                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Your Dataset"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students create visualizations of frequency using their chosen dataset, and write up their findings}]
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
                            How is your dataset distributed? Choose two quantitative variables and display them with histograms. Explain what you learn by looking at these displays. If you're looking at a particular subset of the data, make sure you write that up in your findings on @worksheet-link[#:name "Shape-of-My-Dataset"].
                        }
                    }       
                    @teacher{
                        Give students 10-15min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                    }
              }
        ]
  }

  @lesson/studteach[
     #:title "Closing"
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
                          Histograms are a powerful way to display a data set and assess its @vocab{shape}. But shape is just one of three key aspects that tell us what's going on with a quantitative data set. In the next unit, we'll explore the other two: center and spread.
                    }
                    @teacher{

                    }
              }
        ]
  }
}
