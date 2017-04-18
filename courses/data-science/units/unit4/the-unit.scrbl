#lang curr/lib

@title{Unit 4: Table Operations Part 1}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to their first examples of operations that consume and produce tables.  Students will select columns from tables, and order columns from tables.  They will also reason about what it means to order different types of data.}
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
                            It turns out there is a way to do that: with the @vocab{select} operator.  @code{select}
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
                            The @code{select} expression will take the column names given 
                            (in this case, @code{name}, @code{party}) from the specified table @code{presidents}, 
                            and create a new table with just those columns.                  
                    }
                    @teacher{
                            The benefits of using the @code{select} operation are mostly for the programmer: 
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
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
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
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
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
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
            @point{
                    @student{
                                                        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                                                    
                    }
                    @teacher{
                                                 
                    }
            }
        ]
   }
}

