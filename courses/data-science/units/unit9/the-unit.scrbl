#lang curr/lib

@title{Unit 9: Extend and Table Plans}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students learn to extend tables with new columns, computed from a previous table's data.}
}
@unit-lessons{
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
                                @activity[#:forevidence "BS-IDEE&1&1"]{
                                        Turn to TODO in your workbook, and complete the exercise.
                                }                     
                        }
                        @teacher{
                                In this activity, students manually compute entries to new columns,
                                based on values in a table's columns that area already filled in.
                        }
                }
                 @point{
                        @student{
                                In this workbook exercise, you've done something very different
                                from what we've learned so far;  you have computed NEW data
                                based on old data in the table.  In the sock exercise, this means
                                creating a new column called @code{price-per-sock}, and filling 
                                in a new value for each row, based on the @code{price} and @code{socks}
                                values in that row.  Creating a new table with an additional column
                                is called @vocab{extending} a table.
                        }
                        @teacher{
                                The students are extending tables "in place" in their workbook 
                                exercises, because this saves paper.  Some students may have a 
                                misconception that extending @code{table-1} means that 
                                evaluating @code{table-1} at the interactions window shows a 
                                table with the extended column.  If this happens, convince them 
                                that @code{extend}, just like the other table queries, always
                                produces a new table.   
                        }
                 }
        ]
   }

@lesson/studteach[
     #:title "Extend in Pyret"
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
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Open the @editor-link[#:public-id "0BxJ2mGqPUGt0Skl3YjQ1aVZON2c" "Unit 9"] template code.  
                                        Hit the run button, then type each of the following into your interactions window:

                                        @itemlist[
                                                @item{
                                                    @code{basketball}
                                                }
                                                @item{
                                                    @code{basketball-extended}
                                                }
                                        ]

                                        Do these outputs match your answers for the workbook exercise?
                                }
                        }
                        @teacher{
                                @itemlist[
                                        @item{
                                                @code{extend} produces a table with a new column, containing data
                                                that is computed by an expression over each row.  It is similar
                                                sieve in that it applies this expression to each row, but is different
                                                because it CREATES data instead of removing it.
                                        }
                                ]                    
                        }
                }
                @point{
                        @student{
                                Let's examine the code used to create the @code{basketball-extended} table:

                                @code[#:multi-line #t]{
                                        basketball-extended = extend basketball using game-1, game-2, game-3:
                                            total: game-1 + game-2 + game-3
                                        end
                                }

                                @itemlist[
                                        @item{
                                                The @code{extend} keyword comes first, just like all other
                                                table queries.
                                        }
                                        @item{
                                                It is followed by the table being extended, in this case @code{basketball}.
                                        }
                                        @item{
                                                Then, the @code{using} keyword, in the same place as the @code{sieve}
                                                commands.  This tells Pyret which columns we will use to extend the table.
                                        }
                                        @item{
                                                Next are the names of the columns being used, followed by a colon @code{:}
                                        }
                                        @item{
                                                The expression on the next line is very special:

                                                @code[#:multi-line #t]{
                                                        total: game-1 + game-2 + game-3
                                                }

                                                We give our new column the name @code{total},
                                                followed by a colon @code{:}, then an expression to compute the value of each
                                                entry in the column.  This expression is the sum 
                                                of a player's points in each game.s
                                        }
                                        @item{
                                                Finally, the query ends like all other table queries;  
                                                with the @code{end} keyword.
                                        }
                                ]
                        }
                        @teacher{
                                We encourage you to question the class individually on what they think is
                                the purpose of each component of the extend query.  Ask "what do the names after
                                the @code{using} keyword are", etc.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Follow the directions in the code for exercise #1, to
                                        extend the @code{stores} table in Pyret.  You should
                                        create a column called @code{price-per-sock}, and 
                                        write an expression to compute it as you did in the
                                        workbook exercise.
                                }
                        }
                        @teacher{
                                This could also be a group activity, where you are live coding
                                and prompting the class to help you write the correct definition.
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Answer each of the following questions by creating
                                        a table with an @code{extend} query:

                                        @itemlist[
                                                @item{
                                                        Which president had the longest
                                                        @code{term-length}?  @code{term-length}
                                                        is defined by @code{year-ended - year-started}.
                                                }
                                                @item{
                                                        Which 3 menu items in @code{nutrition}
                                                        have the highest @code{protein-per-gram}?
                                                        Use the @code{protein, serving-size} columns.
                                                }
                                        ]
                                }
                        }
                        @teacher{
                                Students should uncomment the definitions in code exercises 2, 3
                                to bind @code{presidents-extended} and @code{nutrition-extended}
                                to their answers.
                        }                
                }
        ]
   }

@lesson/studteach[
     #:title "Table Plans"
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
                                The United Nations has hired our class to come up with a report on the
                                world economy.  They want us to compare countries by how productive they are.

                                We have a table with the GDP of each country, which measures a country's economic
                                output.  should we use this to compare each country's economy?  Why might this be a bad idea?
                        }
                        @teacher{
                                Ask the class what they think may be drawbacks to this approach.  Guide the discussion
                                with the fact that countries differ radically in size, so bigger countries will always have
                                higher GDP.
                        }                
                }
                @point{
                        @student{
                                Economics data scientists use something called a @code{gdp-per-capita} to
                                compare countries' productivity.  This is calculated by dividing a country's
                                GDP by population.  This estimates how productive the average citizen of a
                                particular country is.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                The main question that the United Nations wants us to answer is:  "What are
                                the top 5 countries in Asia, in terms of highest GDP per capita?"
                        }
                        @teacher{
                        
                        }                
                }
                @point{
                        @student{
                                We have all the tools to answer this question using the tables operations we have
                                learned!  The next step is to determine which operations we will use.s
                        }
                        @teacher{

                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Turn to page TODO in your workbooks.  For each question that 
                                        you answer "Yes" to, complete the code scaffolding.
                                }
                        }
                        @teacher{
                                In this particular example, the students will say yes and fill out each
                                block of scaffold code.  However, there will be practice examples where the
                                students do not need to use every table query.
                        }                
                }
                @point{
                        @student{
                                @itemlist[
                                        @item{
                                                The worksheet you just completed is called a @vocab{Table Plan}.
                                                A Table Plan consists of 4 questions that you answer when trying
                                                to create a table to answer a bigger question, like the one the UN
                                                assigned to us. 
                                        }
                                        @item{
                                                If you answer yes to the first question, it means you need to 
                                                add code to your program for an @code{extend} query.  Yes
                                                to the second question means you need a @code{sieve} query, 
                                                and so on.
                                        }
                                ]
                                
                        }
                        @teacher{
                        
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        After completing your Table Plan, add all of the code you wrote
                                        to your definitions window.  Then, in your interactions
                                        window, type the name of your final table to answer the UN question.
                                }
                        }
                        @teacher{
                                Students will get lots of practice with Table Plans in the next section.
                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        The UN also wants following information:

                                        @itemlist[
                                                @item{
                                                        A bar chart of the @code{gdp-per-capita}
                                                        for every country in Asia.
                                                }
                                                @item{
                                                        The mean and median @code{gdp-per-capitab}
                                                        values for countries in Asia.
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
     #:title "Table Plan Practice"
     #:duration "40 minutes"
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
                                The table plan provides a fixed sequence of steps to create 
                                tables for problem solving:  the order is always @code{extend}, then
                                @code{sieve}, then @code{order}, then @code{select}.  Many times you
                                won't need to use all of these queries, but following the table plan 
                                will still give you the answer you want.
                        }
                        @teacher{
                                
                        }                
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Open the @editor-link[#:public-id "0BxJ2mGqPUGt0aU5vc25MTWhpemM" "Unit 9 Table Plan Practice"] template file.
                                        For each of the following questions, fill out the corresponding
                                        Table Plan in your workbook, then add the code from your table 
                                        plan to the definitions window.  After finishing each question,
                                        get the teacher to check you off before continuing.
                                }
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        @itemlist[
                                                @item{
                                                        Your uncle is a body builder, and only wants to buy "healthy"
                                                        foods.  Your uncle says a healthy food is food that has less than 80 grams
                                                        of cholesterol.
                                                }
                                                @item{
                                                        Which healthy foods have the highest protein/gram?  Fill out
                                                        the table plan on page TODO, then add your scaffold code to 
                                                        the definitions window.
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
                                        @itemlist[
                                                @item{
                                                        How many years was each Democratic president in office?  Turn to
                                                        page TODO, and fill out the table plan.

                                                }
                                                @item{
                                                        After completing your table plan, make a histogram to find out 
                                                        if more democratic presidents serve between 0 - 4 years, or 4 - 8 years.
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
                                        @itemlist[
                                                @item{
                                                        The table @code{rainfall} stores information about how much rain a particular
                                                        forest is receiving every day.  The @code{day} column contains which day a 
                                                        measurement took place, and the @code{inches-rain} column stores how many
                                                        inches of rain fell that day.
                                                }
                                                @item{
                                                        Make a scatter plot of how much rain fell on each day in the first 99 days.
                                                        Fill out a table plan on page TODO to create the table needed to make this
                                                        scatter plot.
                                                }
                                                @item{
                                                        Is the amount of rain decreasing/increasing/staying the same over these first 99 
                                                        days?  If there is a correlation, plot a line of best fit over this scatter plot.
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
                                        @itemlist[
                                                @item{
                                                        Make a histogram of the per-capita GDP for countries that have universal 
                                                        health care.  Remember that per-capita GDP is defined as @code{gdp / population}.
                                                }
                                                @item{
                                                        Turn to page TODO in your workbook and complete the table plan to create
                                                        the table needed to create this histogram.
                                                }
                                                @item{
                                                        After adding the code from the table plan to your definitions window, 
                                                        calculate the average per-capita GDP for every country.  Based on your histogram,
                                                        do most countries with universal healthcare tend to have higher or lower per-capita GDP
                                                        than the average?
                                                }
                                        ]
                                }
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                                These 4 problems are wildly different, but the Table Plan helps you find the answer to all of the problems!
                                Throughout your future data science studies, you can apply the Table Plan to most tables in order to solve problems.
                        }
                        @teacher{
                        
                        }
                }
        ]
   }

}

