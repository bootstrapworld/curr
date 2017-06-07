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
                                @activity[#:forevidence "BS-IDE&1&1"]{
                                        Open the TODO Unit 9 template code.  Type each
                                        of the following into your interactions window:

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

}

