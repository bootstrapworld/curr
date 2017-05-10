#lang curr/lib

@title{Unit 7: Table Operations Part 1}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to their first examples of operations that consume and produce tables.  Students will select columns from tables, and order columns from tables.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Selecting"
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
                            You've just loaded your first tables into Pyret; 
                            Now it's time to learn how you can do interesting things with these tables. 

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Open the @code{unit-2} program you wrote in Unit 2 for this section. 
                                    Save a new version of this file as @code{unit-3}, 
                                    and add each of the code blocks given in this unit to your definitions window.  
                            }              
                    }
                    @teacher{
                                                        
                    }
             }
             @point{
                    @student{
                            The presidents table has 4 columns.
                            The nutrition table has 13, and you have to scroll to the right to see all of the columns. 
                            Some tables you'll encounter will have many more than 13 columns. But what if we only 
                            want to look at two of the columns in a table? 

                            There should be a way to select the columns we care about, and discard the rest.                
                    }
                    @teacher{
                                                 
                    }
             }
             @point{
                    @student{
                            It turns out there is a way to do that: with the @vocab{select} keyword.  @code{select}
                            creates a new table, containing only the columns that the programmer specifies.

                            @code[#:multi-line #t]{
                                    select name, party from presidents end
                            }
                    }
                    @teacher{
                            When demonstrating the @code{select} operation, it may be helpful to do 
                            "live coding", by projecting a screen where you write code into the interactions window,
                            and display the output of the interactions window to the class.                       
                    }
             }
             @point{
                    @student{
                            The @code{select} keyword will choose the column names given 
                            (in this case, @code{name}, @code{party}) from the specified table @code{presidents}, 
                            and create a new table with just those columns.                  
                    }
                    @teacher{
                            The benefits of using the @code{select} keyword are mostly for the programmer: 
                            having less columns does not make it significantly faster to perform operations on the 
                            table, but less columns does make it easier for humans to observe 
                            relations between columns (like in the examples above).          
                    }
             }
             @point{
                    @student{
                            The following code will select only the @code{food, calories} columns from the nutrition table:

                            @code[#:multi-line #t]{
                                    select food, calories from nutrition end
                            }

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to TODO in your workbook, and complete the exercises requiring you to
                                    write and interpret @code{select} statements.
                            }                              
                    }
                    @teacher{
                            @code{select} will be used in combination with @code{order} (and other operations later in the course) 
                            to produce tables that are easier for humans to visually extract relevant information from, 
                            so one exercise that could highlight these benefits is having students race 
                            (everyone tries to beat a time of 3 seconds) to find the 3 foods with highest protein amount, 
                            or what parties Herbert Hoover, Benjamin Harrison, and Millard Fillmore belong to.  When students have to 
                            keep scrolling back and forth to see which values are in entries within the rows they were searching for,
                            they will see the benefits of removing columns with @code{select}.                    
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                            @item{
                                                    In your definitions window, write code to create a new table with the variable name 
                                                    @code{name-and-home} by selecting the @code{name} and @code{home-state} 
                                                    columns from @code{presidents}.  Then type @code{name-and-home} into the interactions area.
                                            }
                                            @item{
                                                    In your definitions window, write code to create a new table with the variable name
                                                    @code{food-and-fat} by selecting the @code{food} and @code{fat} columns from @code{nutrition}.

                                            }

                                    ]
                            }                       
                    }
                    @teacher{
                            Encourage students to think of the interactions area as a playground:  if a student needs
                            to write a definition but don't know exactly how, they should experiment with
                            different expressions in the interactions window until they are satisfied.  THEN
                            they should bind that expression to a variable name in the definitions window.
                    }
             }
        ]
   }
@lesson/studteach[
     #:title "Ordering"
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
                            Let's look again at our favorite 4th grade class. This time, we have 3 columns: 
                            First name, Last name, and the students' grades on the most recent test.

                            @build-table/cols[
                                        '("first" "last" "test-grade")
                                        '(("John" "Jane" "Javon" "Angela" "Jack" "Dominique" "Sammy" "Andrea")
                                          ("Doe" "Smith" "Jackson" "Enriquez" "Thompson" "Rodriguez" "Carter" "Garcia")
                                          ("82" "86" "88" "76" "81" "93" "79" "91"))
                                         (lambda (r c) (para ""))
                                         3 8
                            ]

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                            @item{
                                                 Who had the highest score on the test?
                                            }
                                            @item{
                                                 What are the names of the top 4 scorers?

                                            }

                                    ]
                            }
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            When we answer this question, we have to look through every row in the table to figure 
                            out what the top 4 scores are, then the names of the students with those scores. 
                            The next operation we will see is @vocab{ordering}. @vocab{Ordering} is sorting all of the rows in a 
                            table in a meaningful way, using one of the columns in particular. 
                            Data scientists will often order tables so that they are easier to search through.                    
                    }
                    @teacher{
                                     
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Create a new table with these same students as rows, 
                                    but the rows are ordered by test scores in descending order.
                            }                        
                    }
                    @teacher{
                            @itemlist[
                                    @item{
                                         Have the students tell you what to write in each cell of the new table.
                                         Make them explain why certain information should stay in the same row as others 
                                         (i.e. 'Jane' and 'Smith' stay in the same row since they belong to the same person).    
                                    }
                                    @item{
                                         Alternatively, you can cut out sheets of paper to represent as rows, or
                                         drag each row as an image around on a screen, and have students direct
                                         you in ordering the rows for them.
                                    }
                            ]
                    }
            }
            @point{
                    @student{
                            @build-table/cols[
                                        '("first" "last" "test-grade")
                                        '(("Dominique" "Andrea" "Javon" "Jane" "John" "Jack" "Sammy" "Angela")
                                          ("Rodriguez" "Garcia" "Jackson" "Smith" "Doe" "Thompson" "Carter" "Enriquez")
                                          ("93" "91" "88" "86" "82" "81" "79" "76"))
                                         (lambda (r c) (para ""))
                                         3 8
                            ]                  
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                            This table we just created is the classroom table ordered by @code{test-grade}
                            in @vocab{descending} order. It is in descending order by test grade because 
                            the test grades start high at the top of the table, and get lower further in the table.                       
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Now create a new table with these rows in @vocab{ascending} order by @code{test-grade};
                                    the values in the test grade column should start low, and get larger further in the table.
                            }

                            @build-table/cols[
                                        '("first" "last" "test-grade")
                                        '(("Angela" "Sammy" "Jack" "John" "Jane" "Javon" "Andrea" "Dominique")
                                          ("Enriquez" "Carter" "Thompson" "Doe" "Smith" "Jackson" "Garcia" "Rodriguez")
                                          ("76" "79" "81" "82" "86" "88" "91" "93"))
                                         (lambda (r c) (para ""))
                                         3 8
                            ]           
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                            Data scientists don't just order tables by columns with numbers in them: 
                            tables can be ordered by Strings too. Recall from Unit 1 that String "apple" is
                            considered less than "banana", because "apple" comes before "banana" alphabetically.
                            We can use this fact to order tables by columns with Strings as well!
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Here's the classroom table in ascending order by the first name column.

                            @build-table/cols[
                                        '("first" "last" "test-grade")
                                        '(("Andrea" "Angela" "Dominique" "Jack" "Jane" "Javon" "John" "Sammy")
                                          ("Garcia" "Enriquez" "Rodriguez" "Thompson" "Smith" "Jackson" "Doe" "Carter")
                                          ("91" "76" "93" "81" "86" "88" "82" "79"))
                                         (lambda (r c) (para ""))
                                         3 8
                            ]

                            This new table is the classroom table in alphabetical order by the first name column. 
                            Data scientists treat alphabetical order to be ascending order for Strings.             
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Now create a new table with these rows in reverse alphabetical order by @code{first} name.
                                    Is this ascending or descending order?
                            }

                            Your table should look like this:

                            @build-table/cols[
                                        '("first" "last" "test-grade")
                                        '(("Sammy" "John" "Javon" "Jane" "Jack" "Dominique" "Angela" "Andrea")
                                          ("Carter" "Doe" "Jackson" "Smith" "Thompson" "Rodriguez" "Enriquez" "Garcia")
                                          ("79" "82" "88" "86" "81" "93" "76" "91"))
                                         (lambda (r c) (para ""))
                                         3 8
                            ]
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to TODO in your workbook and complete the exercises for ordering tables.
                            }                   
                    }
                    @teacher{
                                                 
                    }
            }
        ]
   }
@lesson/studteach[
     #:title "Ordering in Pyret"
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
                            Pyret lets you change the order of a table's rows with the @code{order} expression.
                            For example, the code below will create a table listing the foods by the 
                            value in the sodium column in descending order:

                            @code[#:multi-line #t]{
                                    order nutrition:
                                        sodium descending
                                    end
                            }

                            Here, foods that have larger values in the sodium column will be closer to the top, 
                            and foods with smaller values in the sodium column will be closer to the bottom.    
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            To order the table by a column with Strings, we use the same keywords descending 
                            or ascending. The following code will order the presidents table by the 
                            presidents first names alphabetically.

                            @code[#:multi-line #t]{
                                    order presidents-table:
                                        name ascending
                                    end
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
                                                Can we order the presidents table by the presidents' last names? Why not?
                                            }
                                            @item{
                                                The column nth contains a number representing the chronological order of the 
                                                presidents (i.e. George Washington is the 1st president so the value of 
                                                George Washington's nth column is 1. 

                                                Order the @code{presidents} table by the nth column in ascending order. 
                                                What are the political parties of the first 5 presidents?
                                            }
                                            @item{
                                                Order the @code{nutrition} table by the protein values, in descending order. 
                                                What are the 3 foods with the highest amount of protein?
                                            }

                                    ]
                            }                
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Notice how similar these two questions are. 
                            Both of them involve ordering the table by a column X to figure out which rows 
                            have the highest/lowest value for X. With this new ordered table, it's easy 
                            to see the top 5 presidents, or the top 3 proteiny foods.              
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                            The @code{order} keyword allow us to reorganize the 
                            entries of a table so that we can more easily answer these kinds of questions:

                            @itemlist[
                                    @item{
                                            What rows have the highest value in a particular column?
                                    }
                                    @item{
                                            What rows have the lowest value in a particular column? 
                                    }
                            ]               
                    }
                    @teacher{
                                                        
                    }
            }
        ]
   }

@lesson/studteach[
     #:title "Combining Expressions"
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
                            Order is a very useful keyword, and it's even more useful when you combine it with select!

                            @code[#:multi-line #t]{
                                    name-and-home-state = 
                                        select name, home-state from presidents end

                                    order name-and-home-state:
                                        name descending
                                    end
                            }

                            Here we first make a variable @code{name-and-home-state}, which is a new table containing
                            only the @code{name, home-state} columns from @code{presidents}.  Then, we use a second 
                            command to @code{order} this new table.             
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            This example uses 2 steps to create the table in the end.  You will use this strategy
                            of having multiple steps, where each step binds a variable to a table command, to 
                            create new tables for answering data science questions.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                            @item{
                                                    Select @code{food, serving-size} from the @code{nutrition} table, 
                                                    and @code{order} this new table by the @code{food} column in ascending order.
                                            }
                                            @item{
                                                    Select @code{name, party} from the @code{presidents} table, 
                                                    and @code{order} this new table by the @code{party} column in descending order.
                                            }
                                    ]
                            }
                    }
                    @teacher{
                                                 
                    }
            }
        ]
   }


}

