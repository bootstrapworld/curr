#lang curr/lib

@title{Unit 7: Scatter Plots and Correlation }

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
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart} 
                                                ""))]{
  @unit-descr{
    Students investigate scatter plots as a method of visualizing the relationship between two axes, and begin searching for correlations in their dataset.
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
     #:standards (list "Data 3.1.1")
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
                                "Younger animals are cuter, and therefore get adopted faster". Do you agree with this statement?
                                You now have significant experience asking questions about data sets: You know how to take measures of center, and how to visualize both quantity and distribution of quantitative and categorical data. Let's use this experience to find out if younger animals really do get adopted faster. First, we'll start with a sample of our dataset: the @code{animals-table}.

                                 @build-table/cols[
                                    '("name" "species" "age" "weeks")
                                    '(("\"Sasha\"" "\"Boo-boo\"" "\"Felix\"" "\"Buddy\"" "\"Nori\"" "\"Wade\"" "\"Nibblet\"" "\"Maple\"")
                                      ("\"cat\"" "\"dog\"" "\"cat\"" "\"lizard\"" "\"dog\"" "\"cat\"" "\"rabbit\"" "\"dog\"")
                                      ("1" "11" "16" "2" "6" "1" "6" "3")
                                      ("3" "5" "4" "24" "9" "2" "12" "2"))
                                     (lambda (r c) (para ""))
                                     4 8
                                ]
                                Based on this limited sample, does it look like older animals have to wait longer to find their families?
                        }
                        @teacher{
                                   
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list "Data 3.1.1&1&4" "Data 3.1.1&1&5")]{
                                    Take a few minutes to look through the whole dataset, and see if you agree with the statement. Could any of our visualizations or measures of center help us answer this question? Write down your hypothesis on @worksheet-link[#:name "Cuter-Adoption"], and how we could use this dataset to see if you're right.
                                }
                        }
                        @teacher{
                                Encourage students to discuss openly before writing.
                        }
                }
                @point{
                        @student{
                                We've got a lot of tools in our toolkit that help us think about an @italic{entire} column of a dataset:
                                @itemlist[
                                    @item{ We have three ways to find measures of center for a given column }
                                    @item{ We have visualizations that let us see the @italic{quantities} in a given column }
                                    @item{ We have visualizations that let us see the @italic{frequencies} in a given column }
                                ]
                                What column is this question asking about?
                        }
                        @teacher{
                                Use this as an opportunity to review what these measures and visualizations are. Redirect students back to their contracts page! Point out that this question is asking about both @code{age} and @code{weeks}.
                        }
                }
                @point{
                        @student{
                                This question is asking about @italic{two columns} in our dataset. Specifically, it's asking @bold{if there is a relationship} between @code{age} and @code{weeks}. Fortunately, there are other tools that let us visualize a 2-column relationship!
                        }
                        @teacher{
                                If time allows, ask students how we might visualize this relationship.
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Scatter Plots"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "8.SP.1-4" "S-ID.5-6" "HSS.ID.B" "Data 3.1.3" "Data 3.2.1")
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
                                @activity[#:forevidence (list)]{
                                  Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
                                }
                                For each animal in the shelter, there are two data points we care about: their @code{age} and the number of @code{weeks} it took to be adopted. We can use these points to plot each animal as a point on the x- and y-axes. Eventually, we'll have a whole cloud of points, which show us the relationship between the two columns for all the animals at the shelter.
                                @activity[#:forevidence (list "S-ID.1-4&1&1")]{
                                    Complete @worksheet-link[#:name "Make-Scatter-Plot"] in your Student Workbook.
                                }
                        }
                        @teacher{
                                Suggestion: divide the full table up into sub-lists, and have a few student plot 3-4 animals on the board. This can be done collaboratively, resulting in a whole-class scatterplot!
                        }
                }
                @point{
                        @student{
                                This visualization is called a @vocab{scatter plot}. Pyret has two functions for making scatter plots:
                                @code[#:multi-line #t]{
                                    scatter-plot :: (t :: Table, xs :: String, ys :: String) -> Image
                                    labeled-scatter-plot :: (t :: Table, ls :: String, xs :: String, ys :: String) -> Image
                                }
                                Both functions consume the Table that we want to visualize, as well as the columns that we want to use as @code{xs} and @code{ys}. However, @code{labeled-scatter-plot} consumes another argument after the Table, which is a column that we will use to @italic{label each point}.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                To make a scatter-plot for our @code{animals-table}, we write...
                                @code[#:multi-line #t]{
                                    scatter-plot(animals-table, "age", "weeks")
                                }
                                @activity[#:forevidence (list "8.SP.1-4&1&1")]{
                                    Make a @code{labeled-scatter-plot}, using the animals' names as labels. What happens when you hover over the points?
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bitmap{images/age-vs-weeks.png}
                                Now that we have our scatter plot, what kind of patterns do we see? 
                                @activity[#:forevidence (list "8.SP.1-4&1&2" "S-ID.5-6&1&3" "S-ID.5-6&1&4" "HSS.ID.B&1&2")]{
                                    @itemlist[
                                        @item{ Where are the points clustered? }
                                        @item{ Are there places where the "cloud" is denser than others? }
                                        @item{ Are there any points that "stray from the pack?" Which ones? }
                                        @item{ Does the cloud seem to go up or down as the number of weeks increases? }
                                    ]
                                }
                        }
                        @teacher{
                                Suggestion: project the scatter plot at the front of the room, and have students @italic{come up to the plot} to point out their patterns.
                        }
                }
                @point{
                        @student{
                                When we look for patterns in a scatter plot like this, we are looking for @vocab{correlations}. A correlation is just a relationship between two variables. In this case, we're looking for a correlation between an animal's @code{age} and how many @code{weeks} it takes for them to be adopted. This relationship can be graphed as a line, which tries to cut through the "middle" of the cloud. This line is called the @vocab{line of best fit}.
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                Do you notice any data points that seem unusually far away from the line? Which animals are those? These points are called @vocab{outliers}, meaning that there is something special about them that makes them different from everyone else. 
                                @activity[#:forevidence (list "HSS.ID.A&1&3")]{
                                    Why might these animals be outliers?
                                }
                        }
                        @teacher{
                                Give students a chance to come up with a few ideas, and share them with the class.
                        }
                }
                @point{
                        @student{
                                Outliers are always interesting: 
                                @itemlist[
                                    @item{
                                        Sometimes they're just random. Maybe Felix just met the right family early, or maybe we find out he lives nearby, got lost and his family came to get him. In that case, we could remove him from our dataset.
                                    }
                                    @item{
                                        Sometimes they can give you a deeper insight into your data. Maybe Felix is a special, popular @italic{breed} of cat, and we discover that our dataset is missing an important column for breed!
                                    }
                                    @item{
                                        Sometimes outliers are the points we are looking for! What if we wanted to know which restaurants are a good value, and which are rip-offs? We could make a scatterplot of restaurant prices vs. reviews, an outlier that's high above the rest of the points would be a restaurant whose reviews are @italic{unusually good} for the price. An outlier way below the cloud would be a really bad deal.
                                    }
                                ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{ 
                                @activity[#:forevidence (list "8.SP.1-4&1&2" "S-ID.5-6&1&3" "S-ID.5-6&1&4")]{
                                    For practice, try making scatter plots (or labeled scatter plots) for each of the following relationships. If you see any outliers, try to explain them!
                                    @itemlist[
                                                @item{
                                                        The @code{age} of an animal vs the @code{weight} of the animal
                                                }
                                                @item{
                                                        The @code{pounds} of an animal vs the number of @code{weeks} to be adopted
                                                }
                                                @item{
                                                        The @code{pounds} vs the number of @code{legs} it has.
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                Debrief, showing the plots on the board. Make sure students see plots for which there is no relationship, like the last one!
                        }
                }
                @point{
                        @student{
                                Of course, it might not make sense to group different animals together in one plot! What if we wanted to see the relationship between @code{age} and @code{weeks} for just the dogs in our database?

                                @activity[#:forevidence (list "8.SP.1-4&1&2" "S-ID.5-6&1&3" "S-ID.5-6&1&4")]{
                                        Turn to @worksheet-link[#:name "Age-v-Weeks-Dogs"] in your workbook, and complete the Table Plan there. When you're done, try making a scatter plot for a different subset of your data.
                                }
                        }
                        @teacher{

                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Correlations and Predictors"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "S-ID.5-6" "Data 3.1.2" "Data 3.1.3")
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
                                @bannerline{Correlations have @italic{direction}.}
                                @itemlist[
                                    @item{ If the cloud slopes up, there may be a @italic{positive correlation}. }
                                    @item{ If the cloud slopes down, there may be a @italic{negative correlation}. }
                                ]
                                Do you see a correlation in the age-vs-weeks scatter plot? If so, is it positive or negative? What correlations, if any, did you see in the other scatterplots you created?
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                You've already learned three ways to find the "center" of a dataset in one dimension: the mean, the median and the mode all represent a way to collapse a bunch of points on a number line into a single, summary number. If the "center" of points on a number line is a single point, what is the "center" of points in a @italic{two-dimensional} cloud? 
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                What we need to do is find a @italic{line} - called a @vocab{predictor} - that is at the center of this cloud. Each point exerts a little bit of "pull" on the line, with points above the line yanking it up and points below the line dragging it down. Points that are really far away - our @vocab{outliers} - pull the line harder than those that are close to the line. The slope of the line will be positive or negative depending on whether or not the correlation is positive or negative. Given a value on the x-axis, this line allows us to "predict" what the corresponding value on the y-axis might be. This allows us to make inferences about a population, based on a sample of that population.
                                @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2" "Data 3.1.3&1&3" "Data 3.1.3&1&4"  "Data 3.1.3&1&5")]{
                                    Turn to @worksheet-link[#:name "Drawing-Predictors"], and do your best to draw a @vocab{predictor} through each of the scatter plots on the left.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bannerline{Correlations have @italic{strength}.}
                                @itemlist[
                                    @item{ If the cloud is tightly packed, there may be a @italic{strong correlation}. }
                                    @item{ If the cloud is really spread out, there may be a @italic{weak correlation}. }
                                    @item{ If the points are all over the place, there may be @italic{no correlation}. }
                                ]
                                @activity[#:forevidence (list "S-ID.5-6&1&3" "S-ID.5-6&1&4" "Data 3.2.1&1&2" "Data 3.2.1&1&6")]{
                                    For each predictor you drew on @worksheet-link[#:name "Drawing-Predictors"], determine the direction and strength of the correlation by circling the words that describe it. 
                                }
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                @bannerline{Correlation does NOT imply causation.}
                                If two quantities are @italic{correlated}, it doesn't mean that one @italic{causes} the other! For example, suppose a study found that there was a strong correlation between the average per-person consumption of chicken and the amount of oil imported by the US. Those two values have similar patterns, but there is no causal relationship between them!
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                What correlations do you think there are in your dataset? Would you like to investigate a subset of your data to find those correlations? 
                                @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                                    Brainstorm a few possible correlations that you might expect to find in your dataset, and make some scatter plots to investigate.
                                }
                        }
                        @teacher{
                                Have students share back their correlations, and @italic{why} they expect to find them.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                                    Turn to @worksheet-link[#:name "Correlations-My-Dataset"], and list three correlations you'd like to search for.
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
                              After looking at the scatter plot for our animal shelter, do you still agree with the claim on @worksheet-link[#:name "Cuter-Adoption"]? Perhaps you need more information, or to see the analysis broken down separately by animal. 
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                              You've started to look for correlations in your dataset, and now you know how to create scatter plots to visualize them. But how do we know if a correlation is @italic{strong enough} to be useful? Eyeballing charts isn't good enough! In the next Unit, you'll learn how to calculate the strength of a correlation, and you'll investigate the correlations in your research that you mapped out here.
                        }
                        @teacher{

                        }
                }
        ]
  }
}
