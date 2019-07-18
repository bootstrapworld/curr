#lang curr/lib

@title{Unit 8: Computing Relationships }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat, string-contains} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart, bar-chart-raw, pie-chart-raw, histogram, scatter-plot} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter, mean, median, mode}
                                              ""))]{
  @unit-descr{
    Students compute the "line of best fit" using linear regression, and search for correlations in their own datasets.
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
     #:standards (list)
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
                                "Do smaller animals get adopted faster? Do younger animals?" We started the previous Unit with these questions, and looked at scatter plots as a way to visualize possible @vocab{correlations} between two variables in our dataset. What did we find?
                        }
                        @teacher{
                                   
                        }
                }
                @point{
                        @student{
                                Whenever there's a possible linear relationship, Data Scientists try to draw the @vocab{line of best fit}, which cuts through the data cloud and can be used to make predictions. This line can be graphed on top of the scatter plot as a function, called the @vocab{predictor}. In this Unit, you'll learn how to compute the line of best fit in Pyret, and how to measure the strength of a relationship by finding the correlation.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset" starter file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1gaYAyYhvlKBm6VJuvJDcnoINBw76pL-L" "new copy"].)
                              }
                        }
                        @teacher{
                        
                        }
                }

        ]
  }

  @lesson/studteach[
     #:title "Linear Regression"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[
        @item{Students learn about linear regression as a tool for quantifying correlations}
        @item{Students learn how to interpret the results of a linear regression}
     ]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students interpret linear regression data for the animals table}]
     #:standards (list "S-ID.7-9" "HSS.ID.B" "HSS.ID.C" "Data 3.1.3" "Data 3.2.1")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:exercises (list (make-exercise-locator/file "Linear-Regression" "Relationships1" "Describing Relationships-1")
                        (make-exercise-locator/file "Linear-Regression" "Relationships2" "Describing Relationships-2"))

     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                        @student{
                                @bitmap{images/age-vs-weeks.png}
                                After our last Unit, we are left with two questions:
                                @itemlist[
                                    @item{
                                        Is there a positive or negative relationship between our two variables? In other words, "@italic{where do we draw} the line of best fit?"
                                    }
                                    @item{
                                        How do we measure the strength of that relationship? In other words, "@italic{how well} does the line allow us to make predictions?"
                                    }
                                ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Data scientists use a statistical method called @vocab{linear regression} to search for certain kinds of relationships in a dataset. When we draw our regression line on a scatter plot, we can imagine a rubber bands stretching vertically between the line itself and each point in the plot - every point pulls the line a little "up" or "down". Linear regression is the math behind the line of best fit.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list )]{
                                  You can see this in action, in this @(new-tab "https://www.geogebra.org/m/ZcVIxKtF" "interactive simulation"). Try moving the blue point "P", and see what effect it has on the red line.
                                  @itemlist[
                                      @item{Could the regression line ever be above or below @italic{all} the points? Why or why not?}
                                      @item{What's the largest r-value you can get? What do you think that number means?}
                                  ]
                                }
                        }
                        @teacher{
                                Give students some time to experiment here! Can your students come up with rules or suggestions for how to minimize error? 
                        }
                }
                @point{
                        @student{
                                We can compute our own predictor line in Pyret, plot it on top of a scatterplot, and even get the equation for that line:

                                @code[#:multi-line #t]{
                                        # use linear regression to extract a predictor function
                                        # lr-plot :: (t :: Table, ls :: String, xs :: String, ys :: String) -> Image
                                }
                                @code{lr-plot} is a function that takes a Table and the names of @bold{3 columns}:
                                @itemlist[
                                    @item{ @code{ls} - the name of the column to use for @italic{labels} (e.g. "names of pets") }
                                    
                                    @item{ @code{xs} - the name of the column to use for @italic{x-coordinates} (e.g. "age of each pet") }
                                    @item{ @code{ys} - the name of the column to use for @italic{y-coordinates} (e.g. "weeks for each pet to be adopted") }
                                ]
                        }
                        @teacher{
                                If you want to teach students the algorithm for linear regression (calculating ordinary least squares), now is the time. However, this algorithm is not a core portion of Bootstrap:Data Science.
                        }
                }
                @point{
                        @student{
                                Our goal is to figure out how strongly or weakly the variable on our x-axis @italic{explains} the change in the variable on our y-axis, the x-variable is sometimes referred to as the @italic{explanitory variable} and the y-variable is referred to as the @italic{response or "outcome" variable.}
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list )]{
                                    In the Interactions Area, create a @code{lr-plot} for our @code{animals-table}, using @code{"names"} for the labels, @code{"age"} for the x-axis and @code{"weeks"} for the y-axis.
                                    You can learn more about how a predictor is created by watching @(new-tab "https://www.youtube.com/watch?v=lZ72O-dXhtM" "this video").
                                }

                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bitmap{images/lr-explained.png}
                                The resulting scatterplot looks like those we've seen before, but it has a few important additions. First, we can see the @vocab{line of best fit} drawn on top. We can also see the equation for that line (in red), in the form @math{y=mx+b}. In this plot, we can see that the slope of the line is @math{0.714}, which means that on average, each extra year of age results in an extra 0.714 weeks of waiting to be adopted. By plugging in an animal's age for @math{x}, we can make a @italic{prediction} about how many weeks it will take to be adopted.
                                @activity[#:forevidence (list "S-ID.7-9&1&1" "HSS.ID.C&1&1" "HSS.ID.C&1&2")]{
                                    If an animal is 5 years old, how long would this line of best fit @italic{predict} they would wait to be adopted? What if they were a newborn, just 0 years old?
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                A predictor @italic{only makes sense within the range of the data that was used to generate it}. For example, if we extend our line out to where it hits the y-axis, it appears to predict that "unborn animals are adopted instantly"! Statistical models are just proxies for the real world, drawn from a limited sample of data: they might make a useful prediction in the range of that data, but once we try to extrapolate beyond that data we quickly get into trouble!
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                These charts also include something called an @vocab{r}-value at the top (in blue), which always seems to be between -1 and 1. What do you think this number means?
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                The correlation @vocab{r} is a number that tells us the direction and strength of a linear relationship between two quantitative variables. In other words, it tells us if the best-fitting line goes up or down, and how tightly clustered or loosely scattered the points are around that line. If the number is positive, it means that the y-values tend to go up as the x-values go up. For example, we would expect a positive r-value between @code{age} and @code{pounds}, because animals get heavier as they grow up. If it's negative, it means the y-values go @italic{down} as the x-values go up. @bold{The strength of a correlation is the distance from zero:} an r-value of zero means there is no correlation at all, and stronger correlations will be closer to -1 or 1.
                                @activity[#:forevidence (list "HSS.ID.B&1&1" "HSS.ID.B&1&2" "HSS.ID.B&1&3" "HSS.ID.B&1&5")]{
                                        @itemlist[
                                            @item{
                                                What is the r-value for @code{age} vs. @code{weeks} for our entire shelter population? What about for just the cats? What does this difference mean?
                                            }
                                            @item{
                                                What does it mean when a data point is @italic{above} the line of best fit?
                                            }
                                            @item{
                                                What does it mean when a data point is @italic{below} the line of best fit?
                                            }
                                            @item{
                                                If you only have two data points, why will the r-value always be either -1 or +1?
                                            }
                                        ]
                                        
                                } 
                        }
                        @teacher{
                                It's always possible to draw a line between points, so any predictor for a 2-item dataset will be perfect! Of course, that's why we never trust correlations drawn from such a small sample size!
                        }
                }
                @point{
                        @student{
                                An r-value of @math{\pm0.65} or more is typically considered a strong correlation, and anything between @math{\pm0.35} and @math{\pm0.65} is "moderately correlated". Anything less than @math{\pm0.35} may be considered weak. However, these cutoffs are not an exact science! Different types of data may be "noisier" than others, and in some fields an r-value of @math{\pm0.50} might be considered impressively strong!
                                @activity[#:forevidence (list "8.SP.1-4&1&1" "8.SP.1-4&1&2" "8.SP.1-4&1&3" "8.SP.1-4&1&4")]{
                                    Turn to @worksheet-link[#:name "Grading-Predictors"]. For each plot, circle the display that has the best predictor. Then, give that predictor a grade between -1 and 1.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                You may notice another value, called @math{\mathrm{R}^2}. This value describes the @italic{percentage of the variation in the y-axis that is explained by variation on the x-axis}. In other words, an @math{\mathrm{R}^2} value of 0.42 could mean that "42% of the variation in dog adoption time is explained by the age of the dog."
                        }
                        @teacher{
                                Discussion of @math{\mathrm{R}^2} may be appropriate for older students, or in an AP Statistics class.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        In the Interactions Area, use linear regression to answer the following questions:

                                        @itemlist[
                                                @item{
                                                        What correlates @italic{most strongly} with the time it takes an animal to be adopted: the animal's age, or weight?
                                                }
                                                @item{
                                                        Is age more strongly correlated with adoption time for dogs than for cats?
                                                }
                                                @item{
                                                        Is age more strongly correlated with weight for dogs than for cats?
                                                }
                                        ]
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                When looking at just the cats, we also saw that the slope of the predictor function was +0.23, meaning that for every year older a cats is, we expect a +0.23-week increase in the time taken to adopt that cat. The r-value was 0.566, confirming that the correlation is positive and indicating moderate strength.
                                @activity[#:forevidence (list "S-ID.7-9&1&1")]{
                                      Turn to @worksheet-link[#:name "Findings-Animals"] to see how Data Scientists would write up the finding involving cats' age and adoption time. Write up two other findings from the linear regressions you performed on this dataset.
                                }
                        }
                        @teacher{
                                Have students read their text aloud, to get comfortable with the phrasing.
                        }
                }
                @point{
                        @student{
                                How well can you interpret the results of a linear regression analysis? 
                                @activity{
                                    Turn to @worksheet-link[#:name "Reading-Regression"], and match the write up on the left with the line of best fit and r-value on the right.
                                }
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                                @bannerline{Correlation does NOT imply causation.}
                                It's worth revisiting this point again. It's easy to be seduced by large r-values, but Data Scientists know that correlation can be accidental! Here are some real-life correlations that have absolutely no causal relationship:
                                @itemlist[
                                    @item{ "Number of people who drowned after falling out of a fishing boat" v. "Marriage rate in Kentucky" (@math{R=0.98}) }
                                    @item{ "Average per-person consumption of chicken" v. "US crude oil imports" (@math{R=0.95}) }
                                    @item{ "Marriage rate in Wyoming" v. "Domestic production of cars" (@math{R=0.99}) }
                                ]
                        }
                        @teacher{
                                All of these correlations come from the @(new-tab "http://tylervigen.com/" "Spurious Correlations") website. If time allows, have your students explore the site to see more!
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Your Dataset"
     #:duration "40 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students use linear regression to quantify patterns in their chosen dataset, and write up their findings }]
     #:standards (list "Data 3.2.1" )
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
                            @activity[#:forevidence (list "Data 3.2.1&1&1" "Data 3.2.1&1&2" "Data 3.2.1&1&3" "Data 3.2.1&1&5" "Data 3.2.1&1&6")]{
                                Turn back to @worksheet-link[#:name "Correlations-My-Dataset"], where you listed possible correlations. Use Table Plans and the Design Recipe to investigate these correlations. If you need blank Table Plans or Design Recipes, you can find them at the back your workbook, just before the Contracts.
                            }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                              @activity[#:forevidence (list "Data 3.2.1&1&1" "Data 3.2.1&1&2" "Data 3.2.1&1&3" "Data 3.2.1&1&5" "Data 3.2.1&1&6" "Data 3.1.3&1&1" "Data 3.1.3&1&2" "Data 3.1.3&1&3")]{
                                  What correlations did you find? Did you need to filter out certain rows in order to get those correlations? Write up your findings by filling out @worksheet-link[#:name "Findings-My-Dataset"].
                              }
                        }
                        @teacher{
                              Have several students read their findings aloud.
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Closing"
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
                                @bitmap{images/nonlinear.png}
                                You've learned how linear regression can be used to fit a line to a linear cloud, and how to determine the direction and strength of that relationship. The word "linear" is important here. In the image on the right, there's clearly a pattern, but it doesn't look like a straight line! There are many other kinds of statistical models out there, but all of them work the same way: use a particular kind of mathematical function (linear or otherwise), to figure out how to get the "best fit" for a cloud of data. 
                        }
                        @teacher{
                        
                        }
                }
        ]
  }
}
