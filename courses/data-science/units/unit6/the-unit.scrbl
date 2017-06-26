#lang curr/lib

@title{Unit 6: Scatter Plots & Correlation}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to scatter plots as a method of visualizing two }
}
@unit-lessons{
@lesson/studteach[
     #:title "Scatter Plots"
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
                                Suppose you want to go out to dinner, and you have a list of restaurants in town. 
                                If you knew the average price and average review score for each one, how would you know
                                which one is best? Does a more expensive menu always mean a better meal? 
                                You now have significant experience asking questions about data sets:  You can
                                measure the center of, and visualize, both categorical and quantitative data sets.
                                Let's use this experience to find out if the expensive restaurants are really worth the money.
                                First, we'll start with out data set:  a table containing information about the restaurants in
                                a town.

                                @build-table/cols[
                                        '("name" "price" "rating")
                                        '(("\"Family Diner\"" "\"Geoff's Sandwiches\"" "\"Best Burger\"" "\"Riverside Grille\"" "\"Jackie's BBQ\"" "\"La Taqueria\"" "\"Bebop Bar\"" "\"Spike's\"" "\"Fred's Shake Shack\"")
                                          ("13.21" "10.23" "6.52" "19.56" "5.57" "9.72" "7.2" "6.98" "5.25")
                                          ("4.5" "4.1" "2.9" "4.9" "2.3" "4" "3.3" "3.8" "3.5"))
                                         (lambda (r c) (para ""))
                                         3 9
                                ]

                                Here the @code{name} column is the name of the restaurant, the @code{price} 
                                contains the average price of an entree at the restaurant, and the @code{rating}
                                column contains the average star rating given by customers.
                        }
                        @teacher{
                                   
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        For each of the following questions, describe what you would need
                                        to answer the question using Pyret.  Which columns would you look at?
                                        What functions would need to use?

                                        @itemlist[
                                                @item{
                                                        What is the highest average price for a restaurant?
                                                }
                                                @item{
                                                        What is the mean star rating (out of 5 stars) of the restaurants in your town?
                                                }
                                                @item{
                                                        Visualize the average prices of restaurants with a histogram.
                                                }
                                                @item{
                                                        Do more expensive restaurants have better tasting food?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Students should extract the @code{price} column, and use the @code{max} function.
                                                Then, look through the table to find the row with that price, and look 
                                                at the entry in the @code{name} column.
                                        }
                                        @item{
                                                Students should extract the @code{rating} column and use the @code{mean} function.
                                        }
                                        @item{
                                                Students should extract the @code{price} column, and use the @code{histogram}
                                                function over the list.
                                        }
                                        @item{
                                                Students won't know how to answer this yet, and that's ok!
                                        }
                                ]  
                        }
                }
                @point{
                        @student{
                                Notice that the last question is different from the first 3 questions.  In the first 3,
                                you are answering questions about one column at a time.  But the last question is the first 
                                of its kind that we've seen.  It is asking "what is the relationship between two columns?"
                        }
                        @teacher{
                                 
                        }
                }
                @point{
                        @student{
                                In this case, we are asking about the relationship between two columns of quantitative 
                                data:  @code{price} and @code{rating}.  As the @code{price} increases, what happens to
                                the @code{rating}?  Does it increase as well?
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                To answer this question, we will create a new kind of chart called a @vocab{scatter plot}.
                                A @vocab{scatter plot} is a chart that shows dots for every single pair of numbers in 2 columns.
                                Here is a scatter plot of the data from the @code{price} and @code{rating} columns.

                                @bitmap{images/price-vs-rating.png}

                                This chart has two @vocab{axes}.  An @vocab{axis} is the line that measures a particular value.
                                For example, in this chart the @vocab{horizontal axis} (left to right) measures the @code{price} of a restaurant.
                                The @vocab{vertical axis} (up and down) axis in this chart measures the average star rating of the restaurant.
                                Each axis has lines to indicate where certain values should lie along the axis.  
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                There are 9 dots on the scatter plot, one for each restaurant in the table.  Each dot's
                                placement depends on the price and rating values of a particular restaurant.  For example,
                                look at the restaurant "Riverside Grille".  Riverside Grille has an average price of 19.56,
                                so it will appear to the far right of the chart.  Riverside Grille has an average rating of 4.9,
                                so it will appear towards the top of the chart.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                        Which dot represents the restaurant "Family Diner"?
                                                }
                                                @item{
                                                        If there were a 10th restaurant with an average price of $11,
                                                        and a rating of 3.5, where should that dot be?
                                                }
                                                @item{
                                                        Do restaurants with higher average price tend to have higher ratings?
                                                }
                                                @item{
                                                        If there were another restaurant with an average price of
                                                        $16, what is our best guess for what its rating might be,
                                                        based on this scatter plot?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                This last question motivates the idea of prediction:  using a general shape of the data
                                to estimate values.
                        }
                }
                @point{
                        @student{
                                Scatter plots are a simple way to visualize the relationship between two columns of quantitative
                                data.  In this scatter plot, we can see a general trend that restaurants with higher price 
                                tend to be rated higher.  This particular example might seem intuitive, but it's a lot easier to search
                                for relationships in data using a visualization than a table by itself.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to @worksheet-link[#:name "Scatter-Plot"] 
                                        in your workbook and complete the exercise practicing creating scatter plots.
                                }
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Does the Line Fit?"
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
                                Scatter plots are useful when searching for a relationship between two columns
                                of quantitative data.  Often, if we find a relationship, we can use that relationship
                                to predict values.  For example, we predicted that a restaurant with a price of $16
                                would have a rating somewhere between 4 and 5.
                        }
                        @teacher{
                                Students' predictions may differ from between [4, 5].  If so, guide them towards 
                                why this range is intuitive.
                        }
                }
                @point{
                        @student{
                                We made this prediction because we observed a @vocab{positive correlation} between
                                price and ratings.  A @vocab{positive correlation} between price and ratings means
                                the following:  Price increases if ratings increase, and vice versa.  If price decreases,
                                then ratings decrease, and vice versa.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                If there is a positive correlation between two columns, we can represent this with a 
                                line on a scatter plot.

                                @bitmap{images/price-vs-rating-predictor.png}

                                This line represents a very special function called a @vocab{predictor} function.
                                A predictor is a function that takes in a value for one variable, and returns an
                                estimate of a different variable.  In our example, we can predict the rating of a 
                                restaurant, based on its price.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        For each point, use the linear predictor to estimate the answer.
                                        @itemlist[
                                                @item{
                                                        What's the expected rating of a restaurant with
                                                        an average price of $12?
                                                }
                                                @item{
                                                        What's the expected price of a restaurant with
                                                        an average rating of 3?
                                                }
                                                @item{
                                                        What's the expected rating of a restaurant with
                                                        a price of $8?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Emphasize that the predictor isn't always exactly correct, but if the data shows a 
                                                direct correlation, then the predictor will be pretty close.  This makes it 
                                                very useful for problems where it is hard to gather lots of data.
                                        }
                                        @item{

                                        }
                                ]
                                
                        }
                }
                @point{
                        @student{
                                We can be reasonably confident in our predictor function, because it looks 
                                like it matches our data set.  Compare this to a different predictor function:

                                @bitmap{images/price-vs-rating-bad-predictor.png}

                                This line would give close predictions for restaurants with average prices around
                                $4 or $6, but for higher prices it's completely wrong.  What makes this predictor
                                so bad?
                        }
                        @teacher{
                                It is bad because it doesn't match the shape of the data.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Complete @worksheet-link[#:name "Grading-Predictors"] and @worksheet-link[#:name "More-Predictors"] 
                                        in your workbook, and complete the exercise grading
                                        different predictor functions on how well they match scatter plots.
                                }

                                Some of these scatter plots showed positive correlations.  Others 
                                showed @vocab{negative correlations}:  where if one variable increases,
                                the other decreases, and vice versa.  There are also examples where 
                                the line doesn't appear to have much value as a predictor;  in
                                these examples we say there is no correlation.
                        }
                        @teacher{

                        }
                }
        ]
   }

@lesson/studteach[
     #:title "Scatter Plots, Linear Regression"
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
                                We create scatter plots & predictor functions in Pyret the same way we create bar and pie charts: using function
                                application, with functions that consume lists.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Open the @editor-link[#:public-id "0BxJ2mGqPUGt0ZURsOENMb1NNU28" "Unit 6"] template file, and hit run.
                                }

                                The code in this starter file creates the scatter plot for the restaurant example we
                                saw above.  
                        }
                        @teacher{
                                This code will be the most complex that the students have seen so far.  They 
                                are introduced to multiple new functions, two new types, and dot syntax for 
                                accessing methods.  This is also the first instance of passing a function as
                                an argument.  It's ok if this takes longer than 35 minutes.
                        }
                }
                @point{
                        @student{
                                @code[#:multi-line #t]{
                                        ratings-list = extract rating from restaurants end
                                        prices-list = extract price from restaurants end
                                }

                                The functions that create scatter plots and predictors will take List<Number>
                                arguments, so we will extract them from the tables the same way we've seen before.

                                @code[#:multi-line #t]{
                                        prices-vs-ratings-plot = scatter-plot(
                                                                    prices-list, 
                                                                    ratings-list, 
                                                                    _.{title: ''})
                                }

                                Here we see a function @code{scatter-plot}. Like the other chart functions you've seen,
                                it takes in the two Lists we care about, and a @code{PlotOptions} object.  It is different 
                                because, unlike @code{histogram, bar-chart,} etc., this doesn't make a scatter plot appear 
                                on screen. Instead, it produces a @code{Plot} value, which we define to be @code{prices-vs-ratings-plot}.  
                                A Plot is a new type, like String, Number, List or Table.
                                We will use the variable @code{prices-vs-ratings-plot} later to make a plot appear on screen.
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                @code{scatter-plot} doesn't make a plot appear on screen
                                                immediately because often we want to superimpose
                                                different scatter plots and predictor plots onto the 
                                                same plot.  We will cover this in the remainder of the unit.
                                        }
                                        @item{
                                                For this reason, we leave the title as an empty string.  TODO the object
                                                should be allowed as empty, or we should use defaults?
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                @code[#:multi-line #t]{
                                        rating-model = lin-reg-2V(prices-list, ratings-list)
                                        rating-predictor = rating-model.predictor()

                                        predictor-plot = function-plot(
                                          rating-predictor,
                                          _.{title: ''})
                                }
                                @itemlist[
                                        @item{
                                                There are a lot of new things going on here.  @code{lin-reg-2V} is a 
                                                function that takes 2 lists as arguments.  It returns another new type:
                                                a StatModel.  A StatModel is Pyret's representation of a statistical
                                                model of some data.  Later in your data science careers you will 
                                                learn about many different kinds of statistical models, but all you 
                                                need to know right now is that we need this model to draw our line of best fit.
                                        }
                                        @item{
                                                The @code{rating-model.predictor()} is a little strange:  this line of code returns 
                                                a Function itself.

                                                @activity[#:forevidence "BS-IDE&1&1"]{
                                                        Type @code{rating-predictor(0)} into the interactions window.
                                                        What is the output?  What happens with @code{rating-predictor(20)?}
                                                }

                                                This is a function that takes one number, and outputs a number.  @code{rating-predictor}
                                                is now the name of the predictor function that will be drawn as a
                                                line on the scatter plot.
                                        }
                                        @item{
                                                @code{function-plot} consumes a predictor function (Number -> Number),
                                                and a PlotOptions object, and returns a Plot.  This type is 
                                                the same as the return from @code{scatter-plot}.
                                        }
                                ]
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                @code{lin-reg-2V} stands for linear regression of two variables.
                                                If you also want to teach students the algorithm for calculating
                                                ordinary least squares, do so before students use this function.
                                        }
                                        @item{
                                                For this reason, we leave the title as an empty string.  TODO the object
                                                should be allowed as empty, or we should use defaults?
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                @code[#:multi-line #t]{
                                        render-multi-plot([list: prices-vs-ratings-plot, predictor-plot], 
                                                          _.{title: 'Restaurant Prices vs. Ratings',
                                                            x-axis: 'Price',
                                                            y-axis: 'Rating',
                                                            x-min: 0, 
                                                            x-max: 20, 
                                                            y-min: 0, 
                                                            y-max: 5})
                                }

                                @itemlist[
                                        @item{
                                                Finally, the @code{render-multi-plot} function is what makes a plot show up on screen.
                                                This function takes a @code{List<Plot>} as its first argument.  This let's us show
                                                our scatter plot and the function plot on the same chart.
                                        }
                                        @item{
                                                This function also takes a PlotOptions object, but this object has much
                                                more information than we've seen previously.  The title field is familiar.
                                                @code{x-axis} and @code{y-axis} are strings for the axis labels (the names
                                                of the columns being used).  @code{x-min} and @code{x-max} are the numbers
                                                representing the left and right bounds of the plot; basically what the minimum
                                                values are that will show up in the plot.  @code{y-min} and @code{y-max}
                                                are the same, but for the top and bottom of the plot.
                                        }
                                ]
                        }
                        @teacher{
                                For the following exercises, the students may need to tweak the values of the bounds of the
                                plot, and should definitely rename the axis labels.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Create scatter plots and linear regressions to determine correlation between 
                                        the following:

                                        @itemlist[
                                                @item{
                                                        The @code{fat} vs. @code{calories-from-fat} columns of @code{nutrition}.
                                                }
                                                @item{
                                                        The @code{gdp} vs @code{median-life-expectancy} columns of @code{countries}
                                                }
                                                @item{
                                                        The @code{population} vs @code{gdp} columns of @code{countries}
                                                }
                                        ]

                                        Make sure to adjust the bounds to see all of the data on each one.  Also,
                                        use the appropriate axis labels.
                                }
                        }
                        @teacher{
                                It may be helpful for students to copy and paste the example code that constructs a scatter plot
                                for these examples, and modify it.
                        }
                }
                @point{
                        @student{
                                Are there any correlations in this data?  If so, what are they?
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                Strong correlation between fat and calories from fat
                                        }
                                        @item{
                                                Almost no correlation between GDP and life expectancy
                                        }
                                        @item{
                                                Weak correlation between Population and GDP
                                        }
                                ]
                        }
                }
                @point{
                        @student{
                                In your workbook activity, you gave predictors "grades" for how well they performed.
                                Data scientists use @vocab{r squared} values to grade predictors in real life.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Type @code{rating-model.r-squared()} into the interactions window.
                                }

                                This is a number on the same scale [0, 1] that represents how well our predictor 
                                fits the data.  For the price vs ratings, the predictor score is ~0.71, which is 
                                fairly accurate.

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Determine the r squared values for each of the 3 models you 
                                        created previously, and interpret them.  Do they show perfect direct correlation?
                                        A weak correlation?  No correlation at all?
                                } 
                        }
                        @teacher{
                                If you plan to teach your students how r squared values are calculated,
                                you may do so here now that they have been motivated.
                        }
                }
        ]
   }
@lesson/studteach[
     #:title "Brainstorming"
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
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Brainstorm questions that could be answered by determining correlations between
                                        data that YOU are interested.  It could be using a sports dataset, music dataset,
                                        etc.
                                }
                        }
                        @teacher{
                                You are welcome to "salt the waters" with the data sets that we provide for students'
                                final projects.
                        }
                }
        ]
   }
}

