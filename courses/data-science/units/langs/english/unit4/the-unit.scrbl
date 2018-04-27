#lang curr/lib

@title{Unit 4: Manipulating Tables }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{num-sqrt, num-sqr} 
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
                                       )]{
  @unit-descr{
    Students extend their knowledge of functions to include methods, and learn about Table methods for sorting, filtering and extending Tables. They also learn about chaining method calls together, and how ordering effects the output.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Review"
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
                          In the last lesson, you learned how to define functions of your own using the Design Recipe. You defined a number of functions that work on Rows of the @code{animals-table}. 
                          @activity[#:forevidence (list )]{
                                What are the steps of the Design Recipe?
                          }
              }
                    @teacher{

                    }
            }
            @point{
                    @student{
                          Open @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "Animals Dataset (w/Functions)"] in a new tab, select "Save As" from the file menu, and click "Run". As you scroll through the file, you'll notice functions defined at the top. Some of these functions are similar to the ones you defined earlier, and others are totally new!
                          @activity[#:forevidence (list )]{
                                Open your student workbook to @worksheet-link[#:name "Reviewing-Functions"], and use the code in the Definitions Area to answer the questions there.
                          }
                    }
                    @teacher{
                          Note: one of the examples is failing -- this is @italic{intentional!}
                    }
            }
            @point{
                    @student{
                          The animal shelter might use this dataset in many ways. For example, it might want to see a list of animals ordered from oldest-to-youngest, or a list of names in alphabetical order. The shelter might also want to compute @italic{new columns} for their dataset. For example, they might want a new, numeric column that shows the animals' age in weeks instead of years, or make a new Boolean column showing which animals are dogs over the age of 2.
                          @activity[#:forevidence (list )]{
                              Complete @worksheet-link[#:name "Animals-Plans"] in your Student Workbook.
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
                        You've been calling functions like @code{triangle}, @code{num-sqr} or @code{num-min} for a while now, and the rules are pretty straightforward: at any point, you can just write the name of the function, then pass in one or more arguments inside parentheses. @code{num-sqr(4)} will always evaluate to @code{16}, because the function always works the same way and 4 squared is always 16.

                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                        Pyret also has another kind of procedure, which behaves a little differently. These procedures are called @italic{table methods}. Let's take a look at one table method, and compare it to a function you already know. 
                        @activity[#:forevidence (list )]{
                          Type both of these into the Interactions Area and see what comes out.
                          @code[#:multi-line #t]{
                              get-row(animals-table, 2)
                              animals-table.row-n(2)
                          }
                          Both of these expressions do the same thing, but they are written quite differently. How many differences can you find?
                        }
                  }
                  @teacher{
                        Have students volunteer @italic{as many as they can}. 
                  }
            }
            @point{
                  @student{
                        Table methods are different from @vocab{functions} in three important ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. A method has to be called as part of a Table, and cannot be used on its own. You can write @code{get-row} wherever you like, but @code{.row-n} only works when attached to the name of a Table, separated by a dot.
                                  }
                                  @item{
                                        @italic{Their contracts are different.} The @code{.row-n} method only exists within the @code{Table} Type, so we can't use its name without also specifying the name of a Table. The contract for a method includes the Type along with the name:
                                         @code[#:multi-line #t]{
                                          <Table>.row-n :: (index :: Number) -> Row
                                         }
                                  }
                                  @item{
                                        @italic{They have a "secret" argument.} The following code uses methods and functions to extract the first row of a table. The function takes in two arguments, but the method appears to only take in one. Can you see the secret argument?
                                        @code[#:multi-line #t]{
                                            get-row(t, 0)  # takes in two arguments!
                                            t.row-n(0)     # takes in....one???
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
                        How well do you understand methods? Complete @worksheet-link[#:name "Methods"] in your Student Workbook.
                    }
                    @teacher{
                        Have students discuss their answers to Question 7 - for the expressions that @italic{don't} work, can they explain why?
                    }
            }
      ]
  }

  @lesson/studteach[
     #:title "Ordering Rows"
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
                                Pyret lets you change the order of a table's rows with the @code{order-by} method. Let's take a look at the contract for this method, and an example of that orders the @code{animals-table} by species:
                                @code[#:multi-line #t]{
                                    # <Table>.order-by :: (col :: String, increasing :: Boolean) -> Table
                                    animals-table.order-by("species", true)
                                }
                                You can find the contract for this method written at the back of your Student Workbook, along with all the other contracts.
                                @activity[#:forevidence (list )]{
                                    Type the @code{animals-table.order-by} example into the Interactions Area.
                                    What did you get? What will happen if you change @code{true} to @code{false}? How could you sort the table alphabetically by pet name? In order of oldest-to-youngest?
                                }
                        }
                        @teacher{
                              Pyret has a way to sort by multiple columns as well, but that requires one additional concept that students haven't seen yet. Documentation can be @(hyperlink "https://www.pyret.org/docs/horizon/tables.html#%28part._tables_.Table_order-by-columns%29" "found here").
                        }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  In the Interactions Area, use the @code{.order-by} method to produce a table with all the animals sorted alphabetically by name.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  In the Interactions Area, use the @code{.order-by} method to produce a table sorted according to at least one of the criteria you wrote on page 18.
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Filtering Rows"
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
                              Sometimes we want to create a @italic{subset} of our data. For example, we might want to filter the rows so that we get a table of only the lizards at the shelter! When we want to filter a Table, we can use the @code{.filter} method. The contract for this method is shown below, along with an example expression that filters the @code{animals-table} to show only those who are fixed.
                              @code[#:multi-line #t]{
                                    # <Table>.filter :: (test :: (Row -> Boolean)) -> Table
                                    animals-table.filter(is-fixed)
                              } 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Notice that the Domain for the filter method takes in a single value (@code{test}), but that @code{test} is @italic{also a function!} Pyret lets us pass functions into other functions, just as easily as we pass Numbers, Strings, Booleans or Images.
                              @activity[#:forevidence (list )]{
                                  @itemlist[
                                      @item{ According to the contract for @code{.filter}, what datatype does the @code{test} function consume? }
                                      @item{ What datatype does the @code{test} function produce? }
                                  ]
                              }
                      }
                      @teacher{
                              Proceed with caution here: do a lot of checking for understanding! Suggestion: have one student "act out" the @code{is-fixed} function, and have the class "input" a few rows from the table.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "BS-IDE&1&1" "Data 3.1.1&1&1" "Data 3.1.1&1&2" "Data 3.1.1&1&4")]{
                                  In the Interactions Area, use the @code{.filter} method to produce a table of all the kittens.
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Building Columns"
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
                              Sometimes we want to @italic{add a column} to a Table, and we can use the @code{.build-column} method to do just that. The contract for this method is shown below, along with an example expression that adds a birth-year to the @code{animals-table}.
                              @code[#:multi-line #t]{
                                    # <Table>.build-column :: (col :: String, builder :: (Row -> Value)) -> Table
                                    animals-table.build-column("year", birth-year)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "BS-IDE&1&1" "Data 3.1.1&1&3" "Data 3.1.1&1&4")]{
                                  In the Interactions Area, use the @code{.build-column} method to produce a table that includes a @code{nametag} column, which contains an image of the nametag for each pet.
                              }
                      }
                      @teacher{
                              
                      }
                }
                @point{
                        @student{
                            How well do you know your table methods? Complete @worksheet-link[#:name "Playing-With-Methods"] in your Student Workbook.
                        }
                        @teacher{
                            Have students discuss their answers.
                        }
                }
        ]
  }

  @lesson/studteach[
     #:title "Chaining Methods"
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
                        Table methods can be chained together, so that we can build, filter @italic{and} order a Table. For example:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, ordered by species
                            animals-table.build-column("year", birth-year).filter(is-fixed).order-by("species", true)
                        }
                        This code takes the @code{animals-table}, and builds a new column. According to our Contracts Page, @code{.build-column} produces a new Table, and that's the Table whose @code{.filter} method we use. That method produces @italic{yet another Table}, and we call that Table's @code{order-by} method. The Table that comes back from that is our final result.
                    }
                    @teacher{
                        Suggestion: use different color markers to draw nested boxes around each part of the expression, showing where each Table came from.
                    }
              }
              @point{
                    @student{
                        It can be difficult to read code that has lots of method calls chained together, so we can break them up before each "@code{.}"" to make it more readable. Here's the exact same code, written with line breaks:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, order by species
                            animals-table
                              .build-column("year", birth-year)
                              .filter(is-fixed)
                              .order-by("species", true)
                        }
                    }
                    @teacher{
                    
                    }
              }
              @point{
                    @student{
                          @activity[#:forevidence (list )]{
                              Can you chain these methods together correctly to answer the following questions?
                              @itemlist[
                                  @item{Show a table of only cats, sorted oldest-to-youngest.}
                                  @item{Show a table of only fixed animals, in ascending order of the number of weeks they've been at the shelter}
                                  @item{Show a table of only young animals with a new column called @code{nametag} that shows the image of every animal's nametag.}
                              ]
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
                          Suppose we wanted to build a new column for a table, and then sort by that column. Compare the two lines of code below. Will they both work?
                          @code[#:multi-line #t]{
                              some-table.build-column("total", compute-total).order-by("total")
                              some-table.order-by("total").build-column("total", compute-total)
                          }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                     @activity[#:forevidence "BS-IDE&1&1"]{
                            Make sure to save your work.  Hit the Save button in the top left. This will save your program in the code.pyret.org folder within your Google Drive.
                  }
              }
                    @teacher{
                             If your students are working in pairs/groups, make sure that each student has access to a version of the program.  The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option.  This will allow them to copy a link to the program, then send to their partners in an email/message.
                   }
              }
              @point{
                    @student{
                          @bold{No - the second line will fail!} That's because - just as in math - order of operations matters! In the second line, the first method call will produce an error, because the @code{"total"} column does not exist as part of @code{some-table}. In the first line, first make a @italic{new table} by using @code{build-colum}, and then call @code{order-by} on that table. So how do you know when to use each method? You'll learn that in the next lesson...
                    }
                    @teacher{

                    }
              }
        ]
  }
}
