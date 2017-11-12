#lang curr/lib

@title{Unit 8: Linear Regression}

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart, scatter-plot, labeled-scatter-plot} 
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
                                "Younger animals are cuter, and therefore get adopted faster". We started the previous Unit with this question, and looked at scatter plots as a way to visualize possible @vocab{correlations} between two variables in our dataset. What did we find?
                        }
                        @teacher{
                                   
                        }
                }
                @point{
                        @student{
                                Whenever there's a possible correlation, Data Scientists try to draw the @vocab{line of best fit}, which cuts through the data cloud and can be used to make predictions. This line is literally graphed on top of the scatter plot as a function, called the @vocab{predictor}. In this Unit, you'll learn how to compute the line of best fit in Pyret, and how to measure the strength of a correlation (or "how good the predictor is").
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
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
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "S-ID.7-9" "HSS.ID.B" "HSS.ID.C" "Data 3.1.3" "Data 3.2.1")
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
                                @bitmap{images/age-vs-weeks.png}
                                After our last Unit, we are left with two questions:
                                @itemlist[
                                    @item{
                                        How do we make a prediction from a scatter plot? In other words, "@italic{where do we draw} the line of best fit?"
                                    }
                                    @item{
                                        How do we measure the accuracy of our prediction? In other words, "@italic{how well} does that line fit?"
                                    }
                                ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Data scientists use a statistical method called @vocab{linear regression} to search for certain kinds of relationships in a dataset. When we draw our predictor line on a scatter plot, we can imagine a rubber band stretching between the line itself and each point in the plot - every point pulls the line a little "up" or "down". Linear regression is the statistics behind the line of best fit.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list )]{
                                  You can see this in action, in this @(hyperlink "https://www.geogebra.org/m/xC6zq7Zv" "interactive simulation"). Each vertical line represents the error, or the amount the rubber band has to stretch between a single datapoint and the prediction line. The "Target SSE" shows how much error (specifically, "the Sum of the Squared Errors") there is in the best possible predictor line. Our goal is to match that, by moving the red line or the "guide dots" on it. 
                                  @itemlist[
                                      @item{Could the predictor line ever be above or below @italic{all} the points? Why or why not?}
                                      @item{What would the plot have to look like for SSE to be zero?}
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
                                        lr-plot :: (t :: Table, xs :: String, ys :: String) -> Image
                                        labeled-lr-plot :: (t :: Table, ls :: String, xs :: String, ys :: String) -> Image
                                }
                                @code{lr-plot} is a function that takes a Table and the names of columns to use for @code{xs} and @code{ys}, computes the line of best fit, and then draws it on top of the point cloud.

                                @activity[#:forevidence (list )]{
                                    In the Interactions Area, create a @code{labeled-lr-plot} for our @code{animals-table}, using @code{"names"} for the labels, @code{"age"} for the x-axis and @code{"weeks"} for the y-axis.
                                    You can learn more about how a predictor is created by watching @(hyperlink "https://www.youtube.com/watch?v=lZ72O-dXhtM" "this video").
                                }

                        }
                        @teacher{
                                If you want to teach students the algorithm for linear regression (calculating ordinary least squares), now is the time. However, this algorithm is not a core portion of Bootstrap:Data Science.
                        }
                }
                @point{
                        @student{
                                @bitmap{images/lr-explained.png}
                                The resulting scatterplot looks like those we've seen before, but it has a few important additions. First, we can see the @vocab{line of best fit} - or our predictor function - drawn on top. We can also see the equation for that line, in the form @math{y=mx+b}. In this plot, we can see that the slope of the line is @math{0.714}, which means that each extra year of age results in an extra 0.714 weeks of waiting to be adopted. By plugging in an animal's age for @math{x}, we can make a @italic{prediction} about how many weeks it will take to be adopted.
                                @activity[#:forevidence (list "S-ID.7-9&1&1" "HSS.ID.C&1&1" "HSS.ID.C&1&2")]{
                                    If an animal is 5 years old, how long would this line of best fit @italic{predict} they would wait to be adopted? What if they were a newborn, and 0 years old?
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                A predictor @italic{only makes sense within the range of the data that was used to generate it}. For example, if we extend our line out to where it hits the x-axis, it appears to predict that "unborn animals are adopted instantly"! Statistical models are just proxies for the real world, drawn from a limited sample of data: they might make useful prediction in the range of that data, but once we try to extrapolate beyond that data we quickly get into trouble!
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                These charts also include something called an @vocab{r-squared} value at the top, which always seems to be between 0 and 1. What do you think this number means? 
                                @activity[#:forevidence (list "8.SP.1-4&1&1" "8.SP.1-4&1&2" "8.SP.1-4&1&3" "8.SP.1-4&1&4")]{
                                    Turn to @worksheet-link[#:name "Grading-Predictors"]. For each plot, circle the chart that has the best predictor. Then, give that predictor a grade between 0 and 1.
                                }
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                The @vocab{r-squared} value for a predictor is a number on that tell us @italic{"how much of the variation in the scatter plot is explained by this line"}. In other words, it's a measure for how well the line fits. A perfect score of 1.0 means that 100% of the variability in the data is explained by the function and that every point falls exactly on the line. A score of 0.0 means that @italic{none} of the variability is explained by the predictor. 
                                @activity[#:forevidence (list "HSS.ID.B&1&1" "HSS.ID.B&1&2" "HSS.ID.B&1&3" "HSS.ID.B&1&5")]{
                                        @itemlist[
                                            @item{
                                                What is the r-squared value for @code{age} vs. @code{weeks} for our entire shelter population? What about for just the dogs? What does this difference mean?
                                            }
                                            @item{
                                                What does it mean when a data point is @italic{above} the predictor line?
                                            }
                                            @item{
                                                What does it mean when a data point is @italic{below} the predictor line?
                                            }
                                            @item{
                                                If you only have two datapoints, why will the r-squared value always be 1.0?
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
                                An r-squared value of 0.60 or higher is typically considered a strong correlation, and anything between 0.40 and 0.60 is "moderately correlated". Anything less than 0.40 is such a weak correlation that it might as well be random. However, these cutoffs are not an exact science! Different types of data may be "noisier" than others, and in some fields an r-squared value of 0.50 might be considered impressively strong!
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Show a scatter plot and line-of-best-fit for the following relationships:

                                        @itemlist[
                                                @item{
                                                        The @code{age} vs. @code{weeks} waiting for adoption, but just for the dogs in the shelter.
                                                }
                                                @item{
                                                        The @code{weight} vs. @code{weeks} waiting for adoption, but just for the cats in the shelter.
                                                }
                                                @item{
                                                        The @code{age} vs. @code{weight} waiting for adoption, but just for animals that have been fixed.
                                                }
                                        ]
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                When looking at just the dogs, we found that our predictor had an r-squared value of about 0.25. That means that 25% of the variation in adoption times is due to the age of the dogs. Turn to @worksheet-link[#:name "Findings-Animals"] to see how Data Scientists would write up this finding.
                                @activity[#:forevidence (list "S-ID.7-9&1&1")]{
                                      Write up two other findings from the linear regressions you performed on this dataset.
                                }
                        }
                        @teacher{
                                Have students read their text aloud, to get comfortable with the phrasing.
                        }
                }
                @point{
                        @student{
                                @bannerline{Correlation does NOT imply causation.}
                                It's worth revisiting this point again. It's easy to be seduced by large r-squared values, but Data Scientists know that correlation can be accidental! Here are some real-life correlations that have absolutely no causal relationship:
                                @itemlist[
                                    @item{ "Number of people who drowned after falling out of a fishing boat" v. "Marriage rate in Kentucky" (@math{r^2=0.952}) }
                                    @item{ "Average per-person consumption of chicken" v. "US crude oil imports" (@math{r^2=0.899}) }
                                    @item{ "Marriage rate in Wyoming" v. "Domestic production of cars" (@math{r^2=0.976}) }
                                ]
                        }
                        @teacher{
                                All of these correlations come from the @(hyperlink "http://tylervigen.com/" "Spurious Correlations") website. If time allows, have your students explore the site to see more!
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
                                You've learned how linear regression can be used to compute a linear relationship for a cloud of data, and how to determine the error of that relationship. The word "linear" means "in a straight line", which is why all of our predictors are in a straight line. In the image on the right, there's clearly a pattern, but it doesn't look like a straight line! There are many other kinds of statistical models out there, but all of them work the same way: given a particular kind of mathematical function (linear or otherwise), figure out how to get the "best fit" for a cloud of data. 
                        }
                        @teacher{
                        
                        }
                }
        ]
  }
}
