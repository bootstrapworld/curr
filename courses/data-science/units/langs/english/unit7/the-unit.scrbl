#lang curr/lib

@title{Unit 7: Scatter Plots and Correlation }

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
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart} 
                                                ""))]{
  @unit-descr{
    Students investigate scatter plots as a method of visualizing the relationship between two axes, and begin searching for correlations in their dataset.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Introduction"
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
                                "Younger animals are cuter, and therefore get adopted faster". Do you agree with this statement?
                                You now have significant experience asking questions about data sets: You know how to take measures of center, and how to visualize both categorical and quantitative data. Let's use this experience to find out if younger animals really do get adopted faster. First, we'll start with a sample of our dataset: the @code{animals-table}.

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
                                @activity{
                                    Take a few minutes to look through the whole dataset, and see if you agree with the statement. Could any of our visualizations or measures of center herlp us answer this question? Write down your hypothesis on @worksheet-link[#:name "Cuter-Adoption"].
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
                                    @item{ We have visualizations that let us see the @italic{quanitities} in a given column }
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
     #:title "Scatterplots"
     #:duration "30 minutes"
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
                                        Open the @editor-link[#:public-id "0BzzMl1BJlJDkNF9SSWo4UDVaeXc" "Unit 7 Starter File"], Save a Copy and Run the program.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                For each animal in the shelter, there are two datapoints we care about: their @code{age} and the number of @code{weeks} it took to be adopted. We can use these points to plot each animal as a point on the x- and y-axes. Eventually, we'll have a whole cloud of points, which show us the relationship between the two columns for all the animals at the shelter.
                                @activity{
                                    Turn to @worksheet-link[#:name "Make-Scatter-Plot"], and make this cloud using the sample table.
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
                                @activity{
                                    Make a @code{labeled-scatter-plot}, using the animals' names as labels. What happens when you hover over the points?
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bitmap{images/age-vs-weeks.png}
                                Now that we have our scatterplot, what kind of patterns do we see? 
                                @activity{
                                    @itemlist[
                                        @item{ Where are the points clustered? }
                                        @item{ Are there places where the "cloud" is denser than others? }
                                        @item{ Are there any points that "stray from the pack?" Which ones? }
                                        @item{ Does the cloud seem to go up or down as the number of weeks increases? }
                                        @item{ Try to draw a line through the middle of the cloud. }
                                    ]
                                }
                        }
                        @teacher{
                                Suggestion: project the scatter plot at the front of the room, and have students @italic{come up to the plot} to point out their patterns.
                        }
                }
                @point{
                        @student{
                                When we look for patterns in a scatter plot like this, we are looking for @vocab{correlations}. A correlation is just a relationship between two variables. In this case, we're looking for a correlation between an animal's @code{age} and how many @code{weeks} it takes for them to be adopted. This relationships can be graphed as a line, which tries to cut through the middle of the cloud. This line is called the @vocab{line of best fit}.
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                Do you notice any datapoints that seem unusually far away from the line? Which animals are those? These points are called @vocab{outliers}, meaning that there is something special about them that makes them different from everyone else. 
                                @activity{
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
                                        Sometimes they're just random. Maybe Felix just met the right family early, or maybe we find out he just ran away and then his family came to get him. In that case, we could remove him from our dataset.
                                    }
                                    @item{
                                        Sometimes they can give you a deeper insight into your data. Maybe Felix is a special @italic{breed} of cat, and we discover that our dataset is missing an important column for breed!
                                    }
                                    @item{
                                        Sometimes outliers are the points we are looking for! What if we wanted to know which restaurants are a good value, and which are ripoffs? We could make a scatterplot of restaurant prices vs. reviews, an outlier that's high above the rest of the points would be a restaurant whose reviews are @italic{unusually good} for the price. An outlier way below the cloud would be a real ripoff.
                                    }
                                ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{ 
                                @activity{
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

                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to @worksheet-link[#:name "Age-v-Weeks-Dogs"] in your workbook, and complete the Table Plan there. When you're done, try making a scatter plot for a different subset of your data.
                                }
                        }
                        @teacher{

                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "In Search of Correlations"
     #:duration "30 minutes"
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
                                @bannerline{Correlations have @italic{direction}.}
                                @itemlist[
                                    @item{ If the line slopes up, there may be a @italic{positive correlation}. }
                                    @item{ If the line slopes down, there may be a @italic{negative correlation}. }
                                ]
                                Do you see a correlation in this scatter plot? If so, is it positive or negative? What correlations - if any - did you see in the other scatterplots you created?
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bannerline{Correlations have @italic{strength}.}
                                @itemlist[
                                    @item{ If most of the points are close to the line, there may be a @italic{strong correlation}. }
                                    @item{ If many points are away from the line, there may be a @italic{weak correlation}. }
                                    @item{ If the points are all over the place, there may be @italic{no correlation}. }
                                ]
                                @activity{
                                    How could you measure the @italic{strength} of a correlation?
                                }
                        }
                        @teacher{
                                Have students share back their ideas for how to measure strength.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to @worksheet-link[#:name "Grading-Predictors"] in your workbook, by grading different predictor functions on how well they match scatter plots (on a scale of 0="worst fit" to 1="best fit").
                                }

                                Some of these scatter plots showed positive correlations.  Others showed @vocab{negative correlations}: where if one variable increases, the other decreases, and vice versa. There are also examples where the line doesn't appear to have much value as a predictor; in these examples we say there is no correlation.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                What correlations do you think there are in your dataset? Would you like to investigate a subset of your data to find those correlations? 
                                @activity{
                                    Brainstorm a few possible correlations that you might expect to find in your dataset.
                                }
                        }
                        @teacher{
                                Have students share back their correlationship, and @italic{why} they expect to find them.
                        }
                }
                @point{
                        @student{
                                @activity{
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
                              After looking at the scatter plot for our animal shelter, do you stil agree with the claim on @worksheet-link[#:name "Unit-7"]? Perhaps you need more information, or to see the analysis broke down separately by animal. 
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

