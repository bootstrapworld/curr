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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay} 
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
                          In the last lesson, you learned how to define functions of your own using the Design Recipe. You defined a number of functions that work on Rows of the @code{animals} table. 
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
                        You've been calling functions like @code{triangle}, @code{num-sqr} or @code{num-min} for a while now, and the rules are pretty straightforward: at any point, you can just write the name of the function, then pass in one or more arguments inside parentheses. @code{num-sqr(4)} will always evaluate to @code{16}, because the function always works the same way and 4 squared is always 16.

                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                        Pyret also has another kind of procedure, which behaves a little differently. These procedures are called @vocab{table methods}. Let's take a look at one table method, and compare it to a function you already know. 
                        @activity{
                          Type both of these into the Interactions Area and see what comes out.
                          @code[#:multi-line #t]{
                              animals.row-n(2)
                              get-row(animals, 2)
                          }
                          Both of these expressions do the same thing, but they are written quite differently. How many differences can you spot?
                        }
                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                        Table methods are different from @vocab{functions} in a two important ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. A method has to be called as part of a Table, and cannot be used on it's own. You can write @code{get-row} wherever you like, but @code{.row-n} only works when attached to the name of a Table, separated by a dot.
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
                        How well do you understand methods? Turn to @worksheet-link[#:name "Methods"] in your Student Workbook, and see how many questions you can answer.
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
                                Pyret lets you change the order of a table's rows with the @code{order-by} method. Let's take a look at the contract for this method, and an example of that orders the animals table by species:
                                @code[#:multi-line #t]{
                                    # <Table>.order-by :: (col :: String, ascending :: Boolean) -> Table
                                    animals.order-by("species", true)
                                }
                                You can find the contract for this method written at the back of your Student Workbook, along with all the other contracts.
                                @activity{
                                    Type the @code{animals.order-by} example into the Interactions Area.
                                    What did you get? What will happen if you change @code{true} to @code{false}? How could you sort the table alphabetically by pet name? In order of oldest-to-youngest?
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
                              When we want to filter a Table, we can use the @code{.filter} method. The contract for this method is shown below, along with an example expression that filters the @code{animals} table to show only young pets.
                              @code[#:multi-line #t]{
                                    # <Table>.filter :: (test :: (Row -> Boolean)) -> Table
                                    animals.filter(young-pets)
                              } 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              Notice that the Domain for the filter method takes in a single value (@code{test}), but that @code{test} is @italic{also a function!}. Pyret lets us pass functions into other functions, just as easily as we pass Numbers, Strings, Booleans or Images.
                              @activity{
                                  @itemlist[
                                      @item{ According to the contract for @code{.filter}, what dataype does the @code{test} function consume? }
                                      @item{ What dataype does the @code{test} function produce? }
                                  ]
                              }
                      }
                      @teacher{
                              Proceed with caution here: do a lot of checking for understanding!
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  In the Interactions Area, use the @code{.filter} method to produce a table of all the animals at the shelter that are dogs that have been fixed. Hint: you'll need to use one of the functions defined at the top of the file!
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  In the Interactions Area, use the @code{.filter} method to produce a table of all the animals That you would adopt.
                              }
                      }
                      @teacher{

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
                              Sometimes we want to @italic{add a column} to a Table, and we can use the @code{.build-column} method to do just that. The contract for this method is shown below, along with an example expression that adds a birth-year to the @code{animals} table.
                              @code[#:multi-line #t]{
                                    # <Table>.build-column :: (builder :: (Row -> Value)) -> Table
                                    restaurants-filtered = restaurants.build-column(year-born)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  In the Interactions Area, use the @code{.build-column} method to produce a table that includes a @code{nametag} column, which contains an image of the nametag for each pet.
                              }
                      }
                      @teacher{
                              
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