#lang curr/lib

@title{Unit 7: Visualizing Relationships }

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart, bar-chart-raw, pie-chart-raw, histogram} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter, mean, median, mode}
                                              ""))]{
  @unit-descr{
    Students investigate scatter plots as a method of visualizing the relationship between two variables, and begin searching for correlations in their dataset.
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
                          Why are some animals adopted quickly, while others take a long time? What factors explain why one pet gets adopted right away, and others wait months?
                      }
                      @teacher{
                          Ask the class for theories.
                      }
                }
                @point{
                      @student{
                          @bannerline{Theory 1: smaller animals get adopted faster because they're easier to care for} 
                          How could we test that theory? Bar and pie charts are great for showing us how the frequency of a categorical column. Histograms and box plots are great for showing us the shape and distribution of a quantitative column. But none of these displays will help us see connections @italic{between} two columns. 
                      }
                      @teacher{

                      }
                }
                @point{
                        @student{
                                @activity[#:forevidence (list "Data 3.1.1&1&4" "Data 3.1.1&1&5")]{
                                    Take a few minutes to look through the whole dataset, and see if you agree with the statement. Could any of our visualizations or measures of center help us answer this question? Write down your hypothesis on @worksheet-link[#:name "Smaller-Adoption"], and how we could use this dataset to see if you're right.
                                }
                        }
                        @teacher{
                                Encourage students to discuss openly before writing.
                        }
                }
                @point{
                        @student{
                                We've got a lot of tools in our toolkit that help us think about an entire @italic{column} of a dataset:
                                @itemlist[
                                    @item{ We have ways to find measures of center and spread for a given column. }
                                    @item{ We have visualizations that let us see the @italic{shape} of values in a quantitative column }
                                    @item{ We have visualizations that let us see the @italic{frequencies} a categorical column }
                                ]
                                What column is this question asking about?
                        }
                        @teacher{
                                Use this as an opportunity to review what these measures and visualizations are. Redirect students back to their contracts page! Point out that this question is asking about both @code{pounds} and @code{weeks}.
                        }
                }
                @point{
                        @student{
                                This question is asking about @italic{two columns} in our dataset. Specifically, it's asking @bold{if there is a relationship} between @code{pounds} and @code{weeks}. Fortunately, there are other tools that let us visualize a relationship between two quantitative columns!
                        }
                        @teacher{
                                If time allows, ask students how we might visualize this relationship.
                        }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list)]{
                                Open your "Animals Starter File". (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1gaYAyYhvlKBm6VJuvJDcnoINBw76pL-L" "new copy"].)
                              }
                              For each animal in the shelter, there are two data points we care about: how many @code{pounds} they weight, and the number of @code{weeks} it took to be adopted. We can use these points to plot each animal as a point on the x- and y-axes. Eventually, we'll have a whole cloud of points, which show us the relationship between the two columns for all the animals at the shelter.
                              @activity[#:forevidence (list "S-ID.1-4&1&1")]{
                                  Complete @worksheet-link[#:name "Create-Scatter-Plot"] in your Student Workbook.
                              }
                      }
                      @teacher{
                              Suggestion: divide the full table up into sub-lists, and have a few student plot 3-4 animals on the board. This can be done collaboratively, resulting in a whole-class scatterplot!
                      }
                }
        ]
  }



  @lesson/studteach[
     #:title "Scatter Plots"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.4" "Data 3.1.1")
     #:materials @itemlist[]
     #:preparation @itemlist[@item{}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
              @point{
                    @student{
                        Here's the contract for Pyret's @code{scatter-plot} function, as well as an example of a scatter plot that examines the relationship between weight and adoption time. Notice that the contract is written as a @italic{comment} - the @code{#} symbol means it's just a note for humans.
                        @code[#:multi-line #t]{
                            # scatter-plot :: (t :: Table, labels :: String, xs :: String, ys :: String) -> Image
                            scatter-plot(animals-table, "name", "pounds", "weeks")
                        }
                        @activity{ Try making a few scatter plots, looking for relationships between columns in the animals-table. }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        @bannerline{Theory 2: Younger animals get adopted faster because they are cuter} 
                        But cats, dogs, rabbits and tarantulas have very different lifespans! A 5 year old tarantula is still really young, while a 5 year old rabbit is fully grown. With differences like this, it doesn't make sense to put them all on the same scatter plot. To do this analysis, we might have to make several displays, each for a different subset.
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
                                    @item{ Can you see a 'cloud' around which the points are clustered? }
                                    @item{ Are there places where the "cloud" is denser than others? }
                                    @item{ Does the number of weeks to adoption seem to go up or down as the age increases? }
                                    @item{ Are there any points that "stray from the pack?" Which ones? }
                                ]
                            }
                    }
                    @teacher{
                            Suggestion: project the scatter plot at the front of the room, and have students @italic{come up to the plot} to point out their patterns.
                    }
                }
                @point{
                    @student{
                            If we see a straight-line pattern in the cloud of scatter plot points, this suggests the variables could be related in a certain way. Do the two variables' values tend to increase or decrease together, or does one go down as the other goes up? We'd also like to know if one variables tells us a lot or a little about the other's values. A single number called a @vocab{correlation} can provide us with both pieces of information.
                    }
                    @teacher{
                            
                    }
                }
                @point{
                    @student{
                            In this case, we're looking for a correlation between @code{pounds} and @code{weeks}. This relationship can be graphed as a line, which tries to cut through the "middle" of the cloud. This line is called the @vocab{line of best fit}, and it turns out to be really useful for making predictions. For example, we can use the line to predict how long a new dog would wait at the shelter, if the dog weighs 68 pounds.
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
                                    Sometimes they're just random. Maybe Felix just met the right family early, or maybe we find out he lives nearby, got lost and his family came to get him. In that case, we might need to do some deep thinking about whether or not it's appropriate to remove him from our dataset.
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
                                For practice, try making scatter plots for each of the following relationships. If you see any outliers, try to explain them!
                                @itemlist[
                                            @item{
                                                    The @code{age} of an animal vs the @code{pounds} of the animal
                                            }
                                            @item{
                                                    The @code{legs} of an animal vs the number of @code{weeks} to be adopted
                                            }
                                            @item{
                                                    The @code{age} vs the number of @code{legs} it has.
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
                                    Try making scatter plots for that relate @code{age} to @code{weeks}, for each of the subsets you've defined from the animals table. Does the relationship appear stronger in some of the subsets than others? Why?
                            }
                    }
                    @teacher{

                    }
                }
        ]
  }

  @lesson/studteach[
     #:title "Correlations and Predictions"
     #:duration "40 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to interpret scatterplots, and talk about strength and direction  of correlation}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[
        @item{Students describe correlations in the animals dataset}
        @item{Students describe correlations in their chosen dataset}
      ]
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
                                    @item{ A @italic{positive correlation} means that the variable on the y-axis increases as the variable on the x-axis goes up. For example, "the older the animal, the more weeks it generally takes to get adopted". }
                                    @item{ A @italic{negative correlation} means that the variable on the y-axis decreases as the variable on the x-axis goes down. For example, "the longer an animal is at the shelter, the less they generally weigh." }
                                ]
                                Do you see a correlation in the pounds-vs-weeks scatter plot? If so, is it positive or negative? What correlations, if any, did you see in the other scatterplots you created?
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                You've already learned three ways to find the "center" of a dataset in one dimension: the mean, the median and the mode all represent a way to collapse a bunch of points on a number line into a single, summary number. If the "center" of points on a number line is a single point, what is the "center" of points in a @italic{two-dimensional} cloud, which cluster around a line? 
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                What we need to do is find a @italic{line} - called a @vocab{line of best fit}, or a "regression line" - that is at the center of this cloud. Each point exerts a little bit of "pull" on the line, with points above the line yanking it up and points below the line dragging it down. Points that are really far away - our @vocab{outliers} and our influential observations - pull the line harder than those that are close to the line. The slope of the line will be positive or negative depending on whether or not the correlation is positive or negative. Given a value on the x-axis, this line allows us to "predict" what the corresponding value on the y-axis might be. This allows us to make inferences about a population, based on a sample of that population.
                                @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2" "Data 3.1.3&1&3" "Data 3.1.3&1&4"  "Data 3.1.3&1&5")]{
                                    Turn to @worksheet-link[#:name "Drawing-Predictors"], and do your best to draw a @vocab{line of best fit} through each of the scatter plots on the left.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @bannerline{Correlations have @italic{strength}.}
                                @itemlist[
                                    @item{ If the cloud is tightly packed, there is a @italic{strong correlation}. }
                                    @item{ If the cloud is loosely scattered, there is a @italic{weak correlation}. }
                                    @item{ If the points are all over the place, with no tendency to rise or fall from left to right, there may be @italic{no correlation}. }
                                ]
                                @activity[#:forevidence (list "S-ID.5-6&1&3" "S-ID.5-6&1&4" "Data 3.2.1&1&2" "Data 3.2.1&1&6")]{
                                    For each line you drew on @worksheet-link[#:name "Drawing-Predictors"], determine the direction and strength of the correlation by circling the words that describe it. 
                                }
                        }
                        @teacher{
                                
                        }
                }
                @point{
                        @student{
                                @bannerline{Correlation does NOT imply causation.}
                                If two quantities are @italic{correlated}, it doesn't mean that one @italic{causes} the other! For example, a study found that there is a strong correlation between the number of people who become tangled in their own bedsheets each year is correlated with the amount of cheese consumed that year. It happens that both of those values have been increasing over the past decade, but there is no causal relationship between them!
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
                              After looking at the scatter plot for our animal shelter, do you still agree with the claim on @worksheet-link[#:name "Smaller-Adoption"]? Perhaps you need more information, or to see the analysis broken down separately by animal. 
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                              You've started to look for correlations in your dataset, and now you know how to create scatter plots to visualize them. But how do we know if a correlation is @italic{strong enough} to be useful? Eyeballing charts isn't good enough! In the next Unit, you'll learn how to calculate a correlation, and get a feel for strength of a relationship based on a single number. You'll investigate the correlations in your research that you mapped out here.
                        }
                        @teacher{

                        }
                }
        ]
  }
}
