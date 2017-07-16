#lang curr/lib

@title{Unit 6: Correlation and Line of Best Fit}

@declare-tags[]


@unit-overview/auto[#:lang-table (list (list "Number" @code{+, -, *, /, num-sqrt, num-sqr, mean, median, mode, modes})
                                       (list "String" "n/a")
                                       (list "Image" @code{draw-plot})
                                       (list "Boolean" @code{==, <>, <, >, <=, >=})
                                       (list "Series" @code{function-plot, scatter-plot, bar-chart, pie-chart, freq-bar-chart, histogram})
                                       (list "List" @code{extract}))]{
  @unit-descr{Students dig deeper into scatter plots as a method of visualizing the relationship between two axes, and into the notion of "line of best fit". }
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
                                Suppose you're visiting a new city, and you want to go out for a great meal. Someone suggests a really expensive restaurant, and assures you it's the best in town. How do you know if you're being ripped off? You now have significant experience asking questions about data sets: You know how to take measures of center, and how to visualize both categorical and quantitative data. Let's use this experience to find out if the expensive restaurants are really worth the money. First, we'll start with out data set: a table containing information about the restaurants in town.

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
                                    Turn to page @worksheet-link[#:name "Unit-6"]. Take two minutes and write down what you think.
                                }
                        }
                        @teacher{
                                Encourage students to discuss openly before writing.
                        }
                }
        ]
}

@lesson/studteach[
     #:title "Finding Relationships"
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
                                        Open the @editor-link[#:public-id "0BzzMl1BJlJDkNnlKOE84QUlUZVk" "Unit 6 Starter File"], Save a Copy and Run the program.

                                        @itemlist[
                                                @item{
                                                        What tables do you see defined here? What other definitions do you see?
                                                }
                                                @item{
                                                        What is the highest average price for a restaurant?
                                                }
                                                @item{
                                                        Use Pyret to define @code{ratings-list} and @code{prices-list} as two lists representing the rating and price columns of the restaurants table.
                                                }
                                                @item{
                                                        Use Pyret to calculate the mean star rating (out of 5 stars) of the restaurants.
                                                }
                                                @item{
                                                        Use Pyret to visualize the average prices of restaurants with a histogram.
                                                }
                                                @item{
                                                        Use Pyret to create a scatter plot showing the average prices and average review ratings of all the restaurants.
                                                }
                                                @item{
                                                        According to this plot, do you think expensive restaurants have higher ratings?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Students should extract the @code{price} column, and use the @code{max} function. Then, look through the table to find the row with that price, and look at the entry in the @code{name} column.
                                        }
                                        @item{
                                                Students should extract the @code{rating} column and use the @code{mean} function.
                                        }
                                        @item{
                                                Students should extract the @code{price} column, and use the @code{histogram} function over the list.
                                        }
                                        @item{
                                                Students should create a scatterplot, using what they learned in previous lessons.
                                        }
                                        @item{
                                                Students won't know how to answer this yet, and that's ok!
                                        }
                                ]  
                        }
                }
                @point{
                        @student{
                                In the last question, we are asking about the relationship between two columns of quantitative data: @code{price} and @code{rating}. As the @code{price} increases, what happens to the @code{rating}? Does it increase as well?
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                To answer this question, we will return to the very first chart you learned about in this class: @vocab{scatter plots}. A scatter plot is a chart that plots every pair of numbers in 2 columns. By extracting the two columns from @code{restaurants}, we can create a series to plot:
                                @code[#:multi-line #t]{
                                        ratings-list = extract rating from restaurants end
                                        prices-list  = extract price  from restaurants end
                                        prices-vs-ratings-series = scatter-plot(prices-list, ratings-list)
                                        prices-vs-ratings-plot = draw-plot("Restaurant Prices vs. Ratings", prices-vs-ratings-series)
                                }
                                Click Run, and show the scatterplot for @code{prices-vs-ratings-plot}
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bitmap{images/price-vs-rating.png}
                                There are 9 points on our restaurant scatter plot: one for each restaurant in the table. Each dot's placement depends on the price and rating values of a particular restaurant. For example, look at the restaurant "Riverside Grille". Riverside Grille has an average price of 19.56, so it will appear to the far right of the chart. Riverside Grille has an average rating of 4.9, so it will appear towards the top of the chart.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                    In Pyret, open the scatter plot that shows the relationship between prices and ratings.
                                        @itemlist[
                                                @item{
                                                        Which dot represents the restaurant "Family Diner"?
                                                }
                                                @item{
                                                        If there were a 10th restaurant with an average price of $11, and a rating of 3.5, where should that dot be?
                                                }
                                                @item{
                                                        Do more expensive restaurants in this chart tend to have higher ratings or lower ones? What about the chart makes you think so?
                                                }
                                                @item{
                                                        If there were another restaurant with an average price of $16, what is our best guess for what its rating might be, based on this scatter plot?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                This last question motivates the idea of @bold{prediction}:  using the general @italic{shape of the data} to estimate values.
                        }
                }
                @point{
                        @student{ 
                                @activity{
                                    For practice, try making scatter plots for each of the following relationships:
                                    @itemlist[
                                                @item{
                                                        The @code{fat} vs. @code{calories-from-fat} columns of @code{nutrition}.
                                                }
                                                @item{
                                                        The @code{gdp} vs @code{median-life-expectancy} columns of @code{countries}
                                                }
                                                @item{
                                                        The @code{population} vs @code{media-life-expectancy} columns of @code{countries}
                                                }
                                        ]
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Scatter plots are a simple way to visualize the relationship between two columns of quantitative data. In this scatter plot, we can see a general trend that restaurants with higher price tend to be rated higher. This particular example might seem intuitive, but it's a lot easier to search for relationships in data using a visualization than a table by itself.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to @worksheet-link[#:name "Scatter-Plot"] in your workbook and complete the exercise practicing creating scatter plots.
                                }
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Seeing Correlations"
     #:duration "25 minutes"
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
                                We noticed that higher-rated restaurants tended to be better-reviewed. This relationship is called a @vocab{positive correlation}, because an increase in one measurement (price) tended to result in an increase in the other (rating). What do you think it would mean if we saw a @vocab{negative correlation}?
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                Scatter plots are useful when searching for a relationship between two columns of quantitative data. Often, if we find a relationship, we can use that relationship to make predictions. For example, we predicted that a restaurant with a price of $16 would have a rating somewhere between 4 and 5. A prediction summarizes the relationship within our data cloud, for example "for every $4 in price, a restaurant's rating tends to be a full point higher". 
                        }
                        @teacher{
                                Students' predictions may differ from between [4, 5]. If so, guide them towards why this range is intuitive.
                        }
                }
                @point{
                        @student{
                                Correlations help us make predictions, but not every prediction is right! We might predict that a cheap restaurant won't be as good as a fancy one, but sometimes the local diner is actually better than fancy bistro! Height is positively correlated with being good at basketball - but that doesn't mean a taller player is @italic{always} better!

                                @activity{
                                    Brainstorm three positive correlations you see in the world around you, as well as three negative ones. Can you think of exceptions where the correlation does not hold?
                                }
                                But how do measure a correlation? Can something be "more positively" or "more negatively" correlated than another? Are some correlations stronger or weaker than others?
                        }
                        @teacher{

                        }
                }

                @point{
                        @student{
                                @bitmap{images/price-vs-rating-predictor.png}
                                We can represent a positive correlation by drawing a line on a scatter plot, representing the prediction.

                                This line is the graph of a @vocab{predictor} function. A @italic{predictor} is a function that takes in a value for one variable, and returns an estimate of a different variable, based on all the other points in the cloud. In our example, we can predict the rating of a restaurant, based on its price.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        For each point, use the linear predictor to estimate the answer.
                                        @itemlist[
                                                @item{
                                                        What's the expected rating of a restaurant with an average price of $12?
                                                }
                                                @item{
                                                        What's the expected price of a restaurant with an average rating of 3?
                                                }
                                                @item{
                                                        What's the expected rating of a restaurant with a price of $8?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Emphasize that the predictor isn't always exactly correct, but if the data shows a direct correlation, then the predictor will be pretty close. This makes it very useful for problems where it is hard to gather lots of data.
                                        }
                                        @item{

                                        }
                                ]
                                
                        }
                }
                @point{
                        @student{
                                @bitmap{images/price-vs-rating-bad-predictor.png}
                                We can be reasonably confident in our predictor function, because it looks like it matches our data set. But what would it look like if we had a predictor that didn't match? Let's take a look at a different predictor function.

                                This line would give close predictions for restaurants with average prices around $4 or $6, but for higher prices it's completely wrong. What makes this predictor so bad?
                        }
                        @teacher{
                                It is bad because it doesn't match the shape of the data.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Complete @worksheet-link[#:name "Grading-Predictors"] in your workbook, by grading different predictor functions on how well they match scatter plots (on a scale of 0="worst fit" to 1="best fit").
                                }

                                Some of these scatter plots showed positive correlations.  Others showed @vocab{negative correlations}: where if one variable increases, the other decreases, and vice versa. There are also examples where the line doesn't appear to have much value as a predictor; in these examples we say there is no correlation.
                        }
                        @teacher{

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
                                        How do we make a prediction from a scatterplot? In other words, "how do we know where to draw that line?"
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
                                Data scientists use statistics to build a @italic{model} of a data set. This model takes into account a lot of different measures (including some of the ones you already know), and tries to identify patterns and relationships within the data. We can build a model of our own in Pyret, and grab a @italic{predictor function} from it:

                                @code[#:multi-line #t]{
                                        # use linear regression to extract a predictor function
                                        rating-predictor = linear-regression(prices-list, ratings-list) 
                                }
                                @code{linear-regression} is a function that takes 2 lists as arguments, and returns a function of Type @code{Number -> Number}. This function is our predictor, representing the line that best fits the data. We define this function to be the identifier @code{rating-predictor}, and we can use it just like any other function. 

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
                                    Once we have the function series, we know how to plot it - we used @code{draw-plot} back in Unit 1! Use Pyret to plot this function, and the scatter-plot. Ideally, we'd like to plot these @italic{on top of one another}, and we can do this using the @code{draw-plots} function. It works much the way @code{draw-plot} does, but instead of one @code{series} it takes in a @italic{list of series} (@code{List<Series>}) as its Domain.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Create statistical models and predictor functions for each of the following relationships, then plot the predictor function on top of the scatterplots you created earlier:

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
                                    # r-squared : List<Number> List<Number> (Number->Number) -> Number
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
                                    Open your Final Project document, and answer question 8. What correlations do you think are lurking in your dataset?
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

