#lang curr/lib

@title{Unit 8: Linear Regression}

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
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
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart, scatter-plot, labeled-scatter-plot} 
                                                ""))]{
  @unit-descr{
    Students investigate scatter plots as a method of visualizing the relationship between two axes, and the notion of "line of best fit". 
  }
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
                                "The more you pay at a restaurant, the better it is". Do you agree with this statement?
                                You now have significant experience asking questions about data sets: You know how to take measures of center, and how to visualize both categorical and quantitative data. Let's use this experience to find out if the expensive restaurants are really worth the money. First, we'll start with out data set: a table containing information about the restaurants in town.

                                @build-table/cols[
                                        '("name" "price" "rating")
                                        '(("\"Family Diner\"" "\"Geoff's Sandwiches\"" "\"Best Burger\"" "\"Riverside Grille\"" "\"Jackie's BBQ\"" "\"La Taqueria\"" "\"Bebop Bar\"" "\"Spike's\"" "\"Fred's Shake Shack\"")
                                          ("13.21" "10.23" "6.52" "19.56" "5.57" "9.72" "7.2" "6.98" "5.25")
                                          ("4.5" "4.1" "2.9" "4.9" "2.3" "4" "3.3" "3.8" "3.5"))
                                         (lambda (r c) (para ""))
                                         3 9
                                ]

                                Here the @code{name} column is the name of the restaurant, the @code{price} contains the average price of an entree at the restaurant, and the @code{rating} column contains the average star rating given by customers.
                        }
                        @teacher{
                                   
                        }
                }
                @point{
                        @student{
                                Are more expensive restaurants generally better than cheaper ones?

                                @activity{
                                    Turn to @worksheet-link[#:name "Unit-6"]. Take two minutes and write down what you think.
                                }
                        }
                        @teacher{
                                Encourage students to discuss openly before writing.
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Linear Regression"
     #:duration "35 minutes"
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
                                This leaves us with two questions:
                                @itemlist[
                                    @item{
                                        How do we make a prediction from a scatter plot? In other words, "how do we know where to draw that line?"
                                    }
                                    @item{
                                        How do we measure the accuracy of our prediction? In other words, "how well does that line fit?"
                                    }
                                ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Data scientists use statistics to build a @italic{model} of a data set. This model takes into account a lot of different measures (including some of the ones you already know), and tries to identify patterns and relationships within the data. When we draw our predictor line on a scatter plot, we can imagine a rubber band stretching between the line itself and each point in the plot - every point pulls the line a little "up" or "down". 
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity{
                                  You can see this model action, in this @(hyperlink "https://www.geogebra.org/m/xC6zq7Zv" "interactive simulation"). Each vertical line represents the error, or the amount the rubber band has to stretch between a single datapoint and the prediction line. The "Target SSE" shows how much error there is in the best possible predictor line. Our goal is to match that, by moving the red line or the "guide dots" on it. 
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
                                We can compute our own predictor line in Pyret, and grab a @italic{predictor function} from it:

                                @code[#:multi-line #t]{
                                        # use linear regression to extract a predictor function
                                        lr-plot :: (t :: Table, xs :: Str, ys :: Str) -> Image
                                }
                                @code{linear-regression} is a function that takes 2 a List of xs and ys as arguments, and @italic{returns a function} of Type @code{Number -> Number}. This function is our predictor, representing the line that best fits the data. We define this function to be the identifier @code{rating-predictor}, and we can use it just like any other function. 

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Type @code{rating-predictor(0)} into the Interactions Area. What is the output?  What happens with @code{rating-predictor(20)?} What is the contract for @code{rating-predictor}?
                                }

                                You can learn more about how a predictor is created by watching @(hyperlink "https://www.youtube.com/watch?v=lZ72O-dXhtM" "this video").

                        }
                        @teacher{
                                If you want to teach students the algorithm for linear regression (calculating ordinary least squares), now is a good time to do it!
                        }
                }
                @point{
                        @student{
                                @activity{
                                    Once we have the function's DataSeries, we know how to plot it - we used @code{draw-chart} back in Unit 1! We can use @code{draw-chart} to plot the function @code{DataSeries} or the scatter plot @code{DataSeries}, but we'd like to plot these @italic{on top of one another}, and we can do this using the @code{draw-chart} function. It works much the way @code{draw-chart} does, but instead of one @code{DataSeries} it takes in a @italic{list of DataSeries} (@code{List<DataSeries>}) as its Domain.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Create statistical models and predictor functions for each of the following relationships, then plot the predictor function on top of the scatter plots you created earlier:

                                        @itemlist[
                                                @item{
                                                        The @code{fat} vs. @code{calories-from-fat} columns of @code{nutrition}.
                                                }
                                                @item{
                                                        The total @code{gdp} vs @code{median-life-expectancy} columns of @code{countries}
                                                }
                                                @item{
                                                        The total @code{population} vs @code{median-life-expectancy} columns of @code{countries}
                                                }
                                        ]

                                        Make sure to adjust the bounds to see all of the data on each one.  Also, use the appropriate axis labels.
                                }
                        }
                        @teacher{
                                It may be helpful for students to copy and paste the example code that constructs a scatter plot for these examples, and modify it.
                        }
                }
                @point{
                        @student{
                                Are there any correlations in this data? If so, what are they?
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Strong correlation between fat and calories from fat
                                        }
                                        @item{
                                                Almost no correlation between GDP and life expectancy - @bold{Note:} sharp-eyed students will point out that this is @italic{total} GDP, not per-per-capita, so we don't expect much correlation!
                                        }
                                        @item{
                                                Almost no correlation between Population and life expectancy
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                In your workbook activity, you gave predictors "grades" for how well they performed. Data scientists use @vocab{r-squared} values to grade predictors in real life.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Type @code{r-squared(prices-list, ratings-list, rating-predictor)} into the Interactions Area.
                                }

                                This is a number on the same scale [0, 1] that tell us "how much of the variation in the scatterplot is explained by this function". In other words, it's a measure for how well the line fits. A perfect score of 1.0 means that 100% of the variability in the data is explained by the function, and that our predictor is perfect. For the price vs ratings, the predictor score is ~0.71, which is fairly accurate. The contract for @code{r-squared} is:
                                @code[#:multi-line #t]{
                                    # r-squared :: (t :: Table, xs :: Str, ys :: Str, predictor :: Num->Num) -> Number
                                }

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                            @item{
                                                Determine the r-squared values for each of the 3 models you created previously, and interpret them. Do they show a strong correlation? A weak correlation? No correlation at all?
                                            }
                                            @item{
                                                What does it mean a data point is @italic{above} the predictor line?
                                            }
                                            @item{
                                                What does it mean a data point is @italic{below} the predictor line?
                                            }
                                            @item{
                                                If you only have two datapoints, why will the r-squared value always be 1.0?
                                            }
                                        ]
                                        
                                } 
                        }
                        @teacher{
                                Have your students examine the r-squared values for the life expectancy models. Population size has virtually no correlation, but GDP has roughly 30%! Is this surprising to the students? Did they expect it to be stronger or weaker? How can they explain the result?
                                Optional: teach your students how r-squared values are calculated.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Complete @worksheet-link[#:name "Checking-Understanding"] in your workbook, by writing your own definitions for predictor function, and vocab{r-squared}.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bitmap{images/nonlinear.png}
                                You've learned how linear regression can be used to compute a linear relationship for a cloud of data, and how to determine the error of that relationship. The word "linear" means "in a straight line", which is why all of our predictors are in a straight line. In the image on the right, there's clearly a pattern, but it doesn't look like a straight line! There are many other kinds of statistical modeling out there, but all of them work the same way: given a particular kind of mathematical function (linear or otherwise), figure out how to get the "best fit" for a cloud of data. 
                        }
                        @teacher{
                        
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
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to @worksheet-link[#:name "Unit-6"], and take two minutes to write down your findings. In your answer, include the fact that you used linear regression to come up with a predictor. Bonus points for explaining what the r-squared value tells about that prediction!
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                    Fill out the "Correlations" section in your Final Report. What correlations do you think are lurking in your dataset?
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Suppose you could divide your data up, perhaps by the @italic{kind of restaurant}, or by the @italic{neighborhood where the restaurant is located}. If you ran a linear regression on a per-neighborhood basis, do you think you would find a stronger correlation? Perhaps a different correlation? If your dataset includes both men and women, you might want to re-run the analysis on the genders separately. To do any of this analysis, you'll need to learn how to @italic{manipulate tables}, so you can sort them, break them apart, or add new columns. The next three units will show you how to do just that.
                        }
                        @teacher{

                        }
                }
        ]
  }
}

