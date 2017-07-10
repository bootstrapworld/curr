#lang curr/lib

@title{Unit 9: Extending Tables}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students learn to extend tables with new columns, computed from a previous table's data.}
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
                              A while back, we found that a nation's total GDP explained about 30% of the variation in median life expectancy. In other words, our predictor wasn't that great. That's not a surprise: more populous countries will usually have a higher GDP! We're just comparing big countries to small ones, not rich countries to poor ones. Do you think that the GDP @italic{per person} - which is a measure of individual wealth - would be a better indicator?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Turn to @worksheet-link[#:name "Unit-9"] and take two minutes to write down what you think.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              We have our @code{countries} table, but that only tells us the @italic{total} GDP. We need to find a way to add a new column to the table, which is calculated based on other columns. By the end of this lesson, you'll know how to do just that.
                      }
                      @teacher{

                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Extending Tables"
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
                                    Turn to @worksheet-link[#:name "Extending-Tables"] in your workbook, and complete the exercise.
                                }                     
                        }
                        @teacher{
                                In this activity, students manually compute entries to new columns, based on values in a table's columns that area already filled in.
                        }
                }
                 @point{
                        @student{
                                In this workbook exercise, you've done something very different from what we've learned so far:  you computed a new column @italic{based on existing data in the table}.  In the sock exercise, this means creating a new column called @code{price-per-sock}, and filling in a new value for each row, based on the @code{price} and @code{socks} values in that row.  Creating a new table with an additional column is called @vocab{extending} a table.
                        }
                        @teacher{

                        }
                 }
        ]
   }

@lesson/studteach[
     #:title "Extend in Pyret"
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
                                        Open the @editor-link[#:public-id "0BzzMl1BJlJDkR2JlQzdIRXdZemM" "Unit 9 Starter File"], Save a Copy, and Run the program.

                                        @itemlist[
                                                @item{
                                                    What does @code{basketball} evaluate to?
                                                }
                                                @item{
                                                    What does @code{basketball-extended} evaluate to?
                                                }
                                        ]

                                        Do these outputs match your answers for the workbook exercise?
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                @code{extend} produces a table with a new column, containing data that is computed by an expression over each row.  It is similar sieve in that it applies this expression to each row, but is different because it CREATES data instead of removing it.
                                        }
                                ]                    
                        }
                }
                @point{
                        @student{
                                Let's examine the code used to create the @code{basketball-extended} table:

                                @code[#:multi-line #t]{
                                        basketball-extended = extend basketball using game1, game2, game-3:
                                            total: game1 + game2 + game3
                                        end
                                }

                                @itemlist[
                                        @item{
                                                The @code{extend} keyword comes first, since we might want to use our new columns for sieving, sorting or selecting later.
                                        }
                                        @item{
                                                It is followed by the table being extended, in this case @code{basketball}.
                                        }
                                        @item{
                                                Then, the @code{using} keyword, in the same place as the @code{sieve} commands.  This tells Pyret which columns we will use to extend the table.
                                        }
                                        @item{
                                                Next are the names of the columns being used, followed by a colon @code{:}
                                        }
                                        @item{
                                                The expression on the next line is very special:

                                                @code[#:multi-line #t]{
                                                        total: game1 + game2 + game3
                                                }

                                                We give our new column the name @code{total}, followed by a colon @code{:}, then an expression to compute the value of each entry in the column.  This expression is the sum of a player's points in each game.s
                                        }
                                        @item{
                                                Finally, the query ends like all other table queries; with the @code{end} keyword.
                                        }
                                ]
                        }
                        @teacher{
                                We encourage you to question the class individually on what they think is the purpose of each component of the extend query.  Ask "what do the names after the @code{using} keyword are", etc.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        In your Definitions Area, follow the directions in the code for the first exercise, to extend the @code{stores} table in Pyret.  You should create a column called @code{price-per-sock}.
                                }
                        }
                        @teacher{
                                This could also be a group activity, where you are live coding and prompting the class to help you write the correct definition.
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Which 3 menu items in @code{nutrition} have the highest @code{sodium-per-gram}? Use the @code{sodium} and @code{serving-size} columns to write @code{extend} query that will answer this question.
                                }
                        }
                        @teacher{
                        }                
                }
        ]
   }

@lesson/studteach[
     #:title "Body Building"
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
                                Now let's get some practice using @code{extend} queries with our Table Plans! Turn to @worksheet-link[#:name "Body-Building"], and read the word problem carefully. 
                                @activity{
                                    @itemlist[
                                        @item{
                                            On a sheet of scrap paper, sketch a sample Start and End Table to make sure you have a clear picture of what you need to do.
                                        }
                                        @item{
                                            Now start your table plan: do you need to add any new columns to the table? Yes! We need to add a @code{protein-per-gram} column, which is computed using the @code{protein} and @code{serving-size} columns. Write the @code{extend} query to do this.
                                        }
                                        @item{
                                            Do we need to get rid of any rows? Yes! We want to keep only the rows that have a @code{protein-per-gram} higher than .12. Write the @code{sieve} query to do this.
                                        }
                                        @item{
                                            Do the rows need to be any particular order? It's not clear from the word problem, so we can choose: do we skip this step, or should we order them so your aunt can immediately see which food is best?
                                        }
                                        @item{
                                            Do we have any unecessary columns? Yes! All we care about are the @code{name}, @code{calories}, and @code{protein-per-gram} columns. Write the @code{select} query to do this.
                                        }
                                        @item{
                                            Once you're done with your Table Plan, program your queries in the Definitions Area, under "4. Body Building".
                                        }
                                    ]
                                }
                        }
                        @teacher{
                            Debrief and review with the class.
                        }
                }
                @point{
                        @student{
                                @activity{
                                        On page @worksheet-link[#:name "Query-Reference"], write down what an @code{order} query is for.
                                }
                        }
                        @teacher{
                            Have some student volunteer what they wrote.
                        }
                }
        ]
}

@lesson/studteach[
     #:title "Term-Length"
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
                                How common is it for a president to serve two terms? We'd like to see a histogram comparing 1-term vs. 2-term presidents. The length of a term is defined by @math{year_{ended} - year_{started}}. 
                                @activity{
                                    @itemlist[
                                        @item{
                                            Turn to page @worksheet-link[#:name "Term-Length"], and read the word problem carefully.
                                        }
                                        @item{
                                            Complete the Table Plan to create the table you'll need.
                                        }
                                        @item{
                                            Extract the columns you'll need to create the histogram
                                        }
                                        @item{
                                            Define the histogram series, and then plot the histogram. If you've forgotten how to make a historgram series, a plot, or how to draw the plot, don't forget to refer back to your contracts page!
                                        }
                                    ]
                                }
                        }
                        @teacher{

                        }
                }
        ]
}

@lesson/studteach[
     #:title "Economic Indicators"
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
                                 Economics data scientists use something called a @code{gdp-per-capita} to compare countries' productivity.  This is calculated by dividing a country's GDP by population.  This estimates how productive the average citizen of a particular country is. 
                                @bannerline{@math{GDP_{per-capita} = \frac{GDP}{population}}}
                        }
                        @teacher{
                                Have students calculate this by hand for one or two countries in the @code{countries} table.
                        }                
                }

                @point{
                        @student{
                                The United Nations has hired our class to come up with a report on the Africa's economy.  They want us to investigate whether population size or per-capita GDP is the @italic{more significant predictor} for median life expectancy.
                                @activity{
                                    @itemlist[
                                        @item{
                                            Turn to page @worksheet-link[#:name "GDP-v-Pop-Plan"], and read the word problem carefully.
                                        }
                                        @item{
                                            Complete the Table Plan to create the table you'll need.
                                        }
                                        @item{
                                            Extract the columns you'll need to create the scatterplots and @vocab{predictor functions} for @bold{both relationships}: "population v. life expectancy" and "per-capita-GDP v. life expectancy".
                                        }
                                        @item{
                                            Define the two scatterplot series, and then plot them both.
                                        }
                                        @item{
                                            Define your predictor functions and r-squared values. Plot your predictor functions on top of your scatterplots, and use the r-squared values to determine which predictor better explains median life expectancy.
                                        }
                                    ]
                                }
                        }
                        @teacher{
                        
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        The UN also wants following information:

                                        @itemlist[
                                                @item{
                                                        A bar chart of the @code{gdp-per-capita} for every country in Africa.
                                                }
                                                @item{
                                                        The mean and median @code{gdp-per-capita} values for countries in Africa.
                                                }
                                        ]

                                        Add code to your definitions window to answer these questions.
                                }
                        }
                        @teacher{

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
                            @activity{
                              Open the @editor-link[#:public-id "0BzzMl1BJlJDkM0dQODJZVHBVSjQ" "Sieve Syntax Errors"] file, and see if you can fix all the bugs you find. Once you're done, uncomment each query by removing the hash sign (@code{#}) and click Run.
                            }
                        }
                        @teacher{

                        }
                }
                @point{
                    @student{
                        Take a few minutes and record your findings on @worksheet-link[#:name "Unit-9"]. Do your findings match your hypothesis? What new questions does this raise?
                    }
                    @teacher{

                    }
                }
        ]
  }

}