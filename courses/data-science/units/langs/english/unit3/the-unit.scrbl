#lang curr/lib

@title{Unit 3: Manipulating Tables }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, star, draw-chart...} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       )]{
  @unit-descr{
    Students extend their knowledge of functions to include methods, and learn about Table methods for sorting, filtering and extending Tables. They are also introduced to Table Plans (a structured approach to manipulating tables), and begin manipulating their own datasets.
  }
}
@unit-lessons{

@lesson/studteach[
     #:title "Review"
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
                          In the last lesson, you learned how to define functions of your own using the Design Recipe. You defined a number of functions that work on Rows of the @code{pets} table. 
                          @activity{
                                What are the steps of the Design Recipe?
                          }
              }
                    @teacher{

                    }
            }
            @point{
                    @student{
                          Open the Unit 3 Starter File, select "Save As" from the file menu, and click "Run". As you scroll through the file, you'll notice functions defined at the top. Some of these functions are similar to the ones you defined earlier.
                          @activity{
                                Open your student workbook to @worksheet-link[#:name "Unit-3"], and use the code in the Definitions Area to answer the questions there.
                          }
                    }
                    @teacher{

                    }
            }

        ]

}

@lesson/studteach[
     #:title "Introducing Methods"
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
                        There are also some special functions that work on tables, called @vocab{methods}. Methods are different from @vocab{functions} in a several ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. A method has to be called as part of a Table, and cannot be used on it's own.
                                  }
                                  @item{
                                        @italic{They change the way they behave}, depending on which piece of data they're attached to. One of these lines of code will work, while the other will cause an error:
                                         @code{shapes.row-n(4)} will work if our table has four observations, but fail if there are only two.
                                  }
                                  @item{
                                        @italic{Their contracts are different.} The @code{.row-n} method only exists within the @code{Table} Type, so we can't use its name without also specifying the name of a Table. The contract for a method includes the Type along with the name:
                                         @code[#:multi-line #t]{
                                          <Table>.row-n :: (index :: Number) -> Row
                                         }
                                  }
                          ]


                  }
                  @teacher{
                          This method v. function distinction is subtle, and it's worth spending some time walking through it carefully.
                  }
            }
            @point{
                    @student{
                        @activity{
                            In the Interactions Area, practice pulling out each of the obervations in your Table using the @code{.row-n} method.
                        }
                    }
                    @teacher{

                    }
            }
      ]
  }

@lesson/studteach[
     #:title "Ordering Rows"
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
                                Pyret lets you change the order of a table's rows with the @code{order-by} method. The contract for this method is:
                                @code[#:multi-line #t]{
                                    <Table>.order-by :: (col :: String, ascending :: Boolean) -> Table
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
                                                        Can we order the movies table by the second word in the title? If not, why?
                                                }
                        
                                                @item{
                                                        In the Definitions Area, complete the next two exercises: "Salt Order" and "Population Order".
                                                }
                                                @item{
                                                        Complete the word problems on @worksheet-link[#:name "Order-Plan"].
                                                }
                                        ]
                                        Test your code by hitting the Run button and typing the new variable names into the interactions window.
                                }                       
                        }
                        @teacher{
                              Pyret has a way to sort by multiple columns as well, but that requires one additional concept that students haven't seen yet. Documentation can be @(hyperlink "https://www.pyret.org/docs/horizon/tables.html#%28part._tables_.Table_order-by-columns%29" "found here").
                        }
                }
        ]
}


@lesson/studteach[
     #:title "Filtering Rows"
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
                              When we want to filter a Table, we can use the @code{.filter} method. The contract for this method is shown below, along with an example expression that filters the @code{restaurants} table to show only highly-rated restaurants.
                              @code[#:multi-line #t]{
                                    # <Table>.filter :: (test :: (Row -> Boolean)) -> Table
                                    restaurants-filtered = restaurants.filter(high-rating)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Complete the next three excersises in the Definitions Area: Define new functions to solve Low-Calorie, CA Presidents, and Asian Countries.
                              }
                      }
                      @teacher{
                              Warning: When attempting the @code{presidents-filtered} problem, some students will probably run into a bug if they're not careful about capitalization!
                      }
                }
        ]
  }

@lesson/studteach[
     #:title "Building Columns"
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
                              Sometimes we want to @italic{add a column} to a Table, and we can use the @code{.build-column} method to do just that. The contract for this method is shown below, along with an example expression that filters the @code{restaurants} table to show only highly-rated restaurants.
                              @code[#:multi-line #t]{
                                    # <Table>.build-column :: (builder :: (Row -> Value)) -> Table
                                    restaurants-filtered = restaurants.build-column(high-rating)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Complete the next three excersises in the Definitions Area: Define new functions to solve Low-Calorie, CA Presidents, and Asian Countries.
                              }
                      }
                      @teacher{
                              Warning: When attempting the @code{presidents-filtered} problem, some students will probably run into a bug if they're not careful about capitalization!
                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Table Plans"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
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
                           Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you to answer more complex questions, and in greater detail.

                     @activity[#:forevidence "BS-IDE&1&1"]{
                            Make sure to save your work.  Hit the Save button in the top left. This will save your program in the code.pyret.org folder within your Google Drive.
                  }
              }
                    @teacher{
                             If your students are working in pairs/groups, make sure that each student has access to a version of the program.  The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option.  This will allow them to copy a link to the program, then send to their partners in an email/message.
                   }
              }
        ]
   }
}