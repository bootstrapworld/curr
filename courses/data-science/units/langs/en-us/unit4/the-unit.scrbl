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
     #:title "Introduction"
     #:duration "10 minutes"
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
                                Open your "Animals Dataset (w/Functions)" file, and click "Run". (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1NaJoA5RRjwMwN19NOAUOSnkB8pEl9fqQ" "new copy"].)
                              }
                        }
                        @teacher{
                                
                        }
                }
                @point{
                      @student{
                          @bannerline{According to the Animal Shelter Bureau, the average pet waits 5.8 weeks to be adopted.}
                          Does this mean that most of the animals wait about 5.8 weeks to find homes? Why or why not?
                      }
                      @teacher{
                          Let students discuss.
                      }
                }
                @point{
                      @student{
                              Animal shelters make decisions about food, capacity and policies based on how long it takes for animals to be adopted. But looking at each value in the @code{weeks} column is tedious, and isn't always the easiest way to make sense of the data. As the saying goes, sometimes you "can't see the forest for the trees". Also, summarizing with a single number like the @vocab{average} leaves out a lot of important information. So instead of talking about each individual in a dataset, or simply reporting the average for all those individuals, Data Scientists find it useful to describe the overall @bold{shape} of the data. 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              A display of how long it takes animals to get adopted can make it easier to get an idea of what adoption times were most common, and if there were any unusually long or short times that it took for an animal to be adopted. Looking at the shape of a @vocab{histogram} of adoption times is the best way to see what was typical and what was unusual. Let's take a look at a histogram of the @code{weeks} it takes an animal to be adopted. Type the following into the interactions area:
                              @code[#:multi-line #t]{histogram(animals-table, “weeks”, 5)}
                              @activity{
                                Look at the histogram and count how many animals took between 0 and 5 weeks to be adopted. How many took between 5 and 10 weeks? What else do you Notice? What do you Wonder?
                              }
                      }
                      @teacher{
                              Display this histogram for students to see, as well.
                      }
                }
                @point{
                      @student{
                              @bitmap{images/weeks-histogram.png}
                              From this display, we can draw several conclusions:
                              @itemlist[
                                  @item{
                                      Because we see most of the histogram's area encompassed by the two bars between 0 and 10 weeks, we can say it was most common for an animal to be adopted in 10 weeks or less.
                                  }
                                  @item{
                                      Because we see a small amount of the histogram's area trailing out to unusually high values, we can say that a couple of animals took an unusually long time to be adopted: one took even more than 30 weeks.
                                  }
                                  @item{
                                      Most of the animals (17 out of 31) took just 5 weeks or less to be adopted. But those few unusually long adoption times pulled the average up to 5.8 weeks. Knowing about the shape gives us worthwhile information beyond the simple report of average.
                                  }
                              ]
                      }
                      @teacher{
                          Can students draw any other conclusions?
                      }
                }
                @point{
                      @student{
                          If someone would ask us what was typical for the adoption times, we might say: "Most of the animals were adopted in 10 weeks or less, but a couple of animals took an unusually long time to be adopted - even more than 20 or 30 weeks!" Without looking at the histogram's shape, it would have been very difficult to make this summary.
                          @activity{
                              What would the histogram look like if most of the animals took more than 20 weeks to be adopted, but a couple of them were adopted in fewer than 5 weeks?
                          }
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Reviewing Bar Charts"
     #:duration "10 minutes"
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
                              @bitmap{images/species-bar-chart.png}
                              @vocab{Bar charts}, as you've seen before, use the horizontal axis to show values of a @vocab{categorical} variable (in the diagram on the right, @code{species}). The vertical axis here shows @vocab{frequency}. Since there are 31 animals shown in this dataset, it could also have shown @italic{relative} frequencies as 11/31 for cats and 15/31 for rabbits, or converted those fractions to percentages. The chart would look the same either way: only the numbers on the vertical axis would change.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              This bar chart happens to show the categorical values in alphabetical order from left to right, but it would be perfectly fine to re-order them any way we wish. For instance, the dog bar could have been drawn before the one for cat. Unlike the numbers on a histogram's horizontal axis, the different categories on a bar-chart's horizontal axis can be "scrambled." For this reason, it makes no sense to talk about the "shape" of a categorical data set.
                              @activity{
                                  Suppose a set of people from around the country are involved in an online discussion, and we want to make a @code{bar-chart} of what time zone they live in (Central Daylight, Mountain Daylight, Mountain Standard, Pacific Daylight, Alaska Daylight, or Hawaii-Aleutian Standard). What are some of the ways that might make sense to order those six bars from left to right?
                              }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              A quick report on this bar-chart should definitely mention the fact that “dog” is the mode of the data set; the most common of the five possible species was dog, with cats being a fairly close second.
                      }
                      @teacher{

                      }
                }
          ]
  }
  @lesson/studteach[
     #:title "Describing Shape"
     #:duration "25 minutes"
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
                              Let's take another look at our histogram of adoption times:
                              @bitmap{images/weeks-histogram.png}
                              A more general way to summarize the shape of a data set like this, which contains a few unusually high values, is to say that it is "@bold{skewed right, or has high outliers.}" We see this shape often in the real world, because there are many variables - like "income" or "time spent on the phone" - for which a few individuals have unusually high values, which aren't balanced out by unusually low values things like "income" and "phone time" can't be less than zero.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Shape is one way to @italic{summarize} information in a dataset, to quickly describe what values are more or less common. For example, we might be interested in a data set for all the countries around the world, telling their average life expectancy (how long the people in that country live, on average). Someone could produce a histogram of the data and then say that in most countries people live to be in their seventies, on average, but the shape is "@bold{skewed left, with low outliers.}"
                              @activity{
                                  Knowing that the life expectancy histogram is skewed left with low outliers, what can we say about what kind of life expectancies are common or unusual?
                              } 
                      }
                      @teacher{
                              There are some countries in Africa with a life expectancy in the low 50's, which is ~25 years below average. But the longest life expectancy (Japan), is only ~10 years above average.
                      }
                }
                @point{
                      @student{
                              Here are the most common shapes that we see for real-world data sets:
                              @bannerline{Symmetric: values are balanced on either side of the middle.} 
                              It's just as likely for the variable to take a value a certain distance below the middle as it is to take a value that same distance above the middle. Examples:
                              @itemlist[
                                  @item{
                                      Heights of 12-year-old females would have a symmetric shape. It's just as likely for a 12-year-old girl to be a certain number of inches below average height as it is to be that number of inches above average height.
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
                                        Number of teeth that adults have in their mouths would be skewed left or have low outliers. Most adults will have close to a full set of 32 teeth, but a few of them with serious dental problems would have a very small number of teeth. We won't get anyone in our data set who has 10 or 20 extra teeth in their mouths!
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
                                Values are clumped around what's typical, but they trail off with a few unusually high values. Examples:
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
                              To build a histogram, we start by sorting all of the numbers in our column from smallest to largest, marking our x-axis from the smallest value to the largest value and dividing into equally-sized intervals, or "bins". Once we have our bins, we put each value in our dataset into the bin it belongs, and then count how many values are in each bin. This count determines the height of the bars on our y-axis.
                              @activity{
                                  Turn to @worksheet-link[#:name "Making-Histograms"], and try drawing a histogram from a dataset.
                              }

                        }
                        @teacher{
                              Note that interals on this chart include the left endpoint but not the right. If we included the right endpoint and someone had 0 teeth, we’d have to add on a bar from -5 to 0, which would be awfully strange!
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
        ]
  }

  @lesson/studteach[
     #:title "Your Dataset"
     #:duration "30 minutes"
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
                            How is your dataset distributed? Choose a categorical variable and display it with a bar chart, then choose a quantitative variable and display it with a histogram. Explain what you learn by looking at these displays. If you're looking at a particular subset of the data, make sure you write that up in your findings on @worksheet-link[#:name "Shape-of-My-Dataset"].
                        }
                    }       
                    @teacher{
                        Give students 5-10min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
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
                          Histograms are a powerful way to visually summarize the @vocab{shape} of a dataset. But sometimes we need to dig deeper, and summarize shape using hard numbers. In the next unit, we'll explore the concept of shape using computed values instead of visual charts.
                    }
                    @teacher{

                    }
              }
        ]
  }
}
