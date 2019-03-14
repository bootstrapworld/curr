#lang curr/lib

@title{Unit 9: Advanced Analysis }

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart, histogram} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter, mean, median, mode}
                                              ""))]{
  @unit-descr{
     Students continue practicing the Design Recipe, and learn how to build and transform columns in a table. They also learn how to chain methods together, and define more sophisticated subsets. Finally, they are are introduced to Table Plans.
  }
}
@unit-lessons{

@lesson/studteach[
   #:title "Review"
   #:duration "25 minutes"
   #:overview ""
   #:learning-objectives @itemlist[]
   #:evidence-statements @itemlist[]
   #:product-outcomes @itemlist[]
   #:standards (list "BS-DR.1" "BS-DR.2" "BS-PL.3")
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
                        Let's practice the Design Recipe by writing other kinds of functions
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2"  "BS-DR.2&1&1" "BS-DR.2&1&2")]{
                          Turn to @worksheet-link[#:name "Design-Recipe-3"], and see if you can solve the following word problems:
                            @itemlist[
                              @item{ 
                                  Define a function called @code{nametag}, which prints out each animal's name in big red letters.
                              }
                              @item{ 
                                  Define a function called @code{birth-year}, which consumes a Row of the @code{animals-table} and produces the year the animal was born.
                              }
                            ]
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        When your teacher has checked your work, add these two functions at the bottom of your Definitions Area, save your work, and click Run.
                    }
                }
        ]
  }


  @lesson/studteach[
     #:title "Building Columns"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to compute new columns in Pyret}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students extend the animals table using functions they've defined earlier}]
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
                              Sometimes we want to @italic{add a column} to a Table, and we can use the @code{.build-column} method to do just that. The contract for this method is shown below, along with an example expression that adds a "label" column to the @code{animals-table} using your @code{nametag} function.
                              @code[#:multi-line #t]{
                                    # <Table>.build-column :: (col :: String, builder :: (Row -> Value)) -> Table
                                    animals-table.build-column("label", nametag)
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "BS-IDE&1&1" "Data 3.1.1&1&3" "Data 3.1.1&1&4")]{
                                  In the Interactions Area, use the @code{.build-column} method to produce a table that includes a @code{born} column, which contains the year each animal was born.
                              }
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                          @activity{
                              Turn to @worksheet-link[#:name "Building-Recipes"], and use the Design Recipe to write the builder functions that you planned out on @worksheet-link[#:name "Dataset-Plans"]. When the teacher has checked your work, type them into the Definitions Area.
                          }
                      }
                      @teacher{
                          It's okay if the functions they design aren't useful - this is for practice.
                      }
                }
                @point{
                      @student{
                          Now try building columns for your own dataset.
                          @activity{
                              Turn to @worksheet-link[#:name "Building-Recipes"], and use the Design Recipe to write the builder functions that you planned out on @worksheet-link[#:name "Dataset-Plans"]. When the teacher has checked your work, type them into the Definitions Area.
                          }
                      }
                      @teacher{
                          It's okay if the functions they design aren't useful - this is for practice.
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Chaining Methods"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn the syntax for chaining methods together}]
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
                            animals-table.build-column("label", nametag).filter(is-fixed).order-by("species", true)
                        }
                        This code takes the @code{animals-table}, and builds a new column. According to our Contracts Page, @code{.build-column} produces a new Table, and that's the Table whose @code{.filter} method we use. That method produces @italic{yet another Table}, and we call that Table's @code{order-by} method. The Table that comes back from that is our final result.
                    }
                    @teacher{
                        Suggestion: use different color markers to draw nested boxes around each part of the expression, showing where each Table came from.
                    }
              }
              @point{
                    @student{
                        It can be difficult to read code that has lots of method calls chained together, so we can add a line-break before each "@code{.}" to make it more readable. Here's the exact same code, written with each method on its own line:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, order by species
                            animals-table
                              .build-column("label", nametag)
                              .filter(is-fixed)
                              .order-by("species", true)
                        }
                    }
                    @teacher{
                    
                    }
              }
              @point{
                      @student{
                          How well do you know your table methods? Complete @worksheet-link[#:name "Playing-With-Methods"] in your Student Workbook to find out.
                      }
                      @teacher{
                          Have students discuss their answers.
                      }
              }
              @point{
                    @student{
                        @bannerline{Order matters.}
                        Suppose we want to build a column and then use it to filter our table. If we use the methods in the wrong order (trying to filter by a column that doesn't exist yet), we might wind up crashing the program. Even worse, the program might @italic{work}, but produce results that are incorrect! When chaining methods, it's important to build first, then filter, and then order. 
                        @italic{ So how do we know when we need which method, and in what order? }
                    }
              }
              @point{
                    @student{
                        Sample Tables are about a lot more than checking our code. They can also be about checking the inferences we make in our analysis! Data Analysis is often used to make @italic{predictions}, and if the sample dataset is bad those predictions can be wrong - and sometimes, really @italic{really} wrong!
                        @itemlist[
                            @item{ 
                              Uber and Google are making self-driving cars, which use artificial intelligence to interpret sensor data and make predictions about whether a car should speed up, slow down, or slam on the brakes.  This AI is trained on a lot of sample data, which it learns from. What might be the problem if the sample data only included roads in California?
                            }
                            @item{
                              Law enforcement in many towns has started using facial-recognition software to automatically detect whether someone has a warrant out for their arrest. A lot of facial-recognition software, however, has been trained on sample data containing mostly white faces. As a result, it has gotten really good at telling white people apart, but @(hyperlink "http://www.theweek.co.uk/95383/is-facial-recognition-racist" "often can't tell the difference between people who aren't white"). Why might this be a problem? 
                            }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        @bannerline{Sample Data Mattters!}
                        Up to now, the Sample Table has been provided for you. But for our next Table Plan, you'll need to make one of your own! A good Sample Table should have:
                        @itemlist[
                              @item{
                                  @italic{At least} the columns that matter - whether we'll be ordering or filtering by those columns.
                              }
                              @item{
                                  A good Sample Table has enough rows to be a representative sample of the dataset. If our dataset has a mix of dogs and cats, for example, we want at least one of each in this table.
                              }
                              @item{
                                  A good Sample Table has rows in apparently random order, so that we'll notice if we need to order the table or not.
                              }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                  @student{
                        @activity[#:forevidence (list )]{
                              It will take some practice for you to get good at making Sample Tables, but you can start by identifying @italic{bad} ones! turn to @worksheet-link[#:name "Bad-Sample-Tables"], and write down what's wrong with each of these tables.
                        }
                  }
                  @teacher{
                        If you're teaching a math or statistics class, go deeper to discuss sampling techniques and sample errors.
                  }
              }
              @point{
                  @student{
                        Can you come up with a good sample table of your own? 
                        @activity{
                          Turn to @worksheet-link[#:name "pie-pounds-young"]. Here is a mostly-complete Table Plan, but it's missing some important parts! Complete this table plan by filling in the Contract, constructing a good sample table, and drawing the result.
                        }
                  }
              }
        ]
  }


  @lesson/studteach[
     #:title "Table Plans"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to define functions using Table Plans}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students define functions that sort, filter, or extend the animals table}]
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
                        Suppose you wanted to get a bar-chart of animal's ages, for a subset containing only the cats in the shelter, sorted alphabetically by name. How would you do that?
                        @code[#:multi-line #t]{
                            cats = animals-table.filter(is-cat).order-by("name", true)
                            bar-chart(t, "name", "age")
                        }
                        Then you want to get the same bar chart, but now for only the fixed animals, sorted alphabetically by name. How would you do that?
                        @code[#:multi-line #t]{
                            fixed = animals-table.filter(is-fixed).order-by("name", true)
                            bar-chart(t, "name", "age")
                        }
                        Then you want to get the same bar chart, but now for only the young animals, sorted alphabetically by name. How would you do that?
                        @code[#:multi-line #t]{
                            young = animals-table.filter(is-young).order-by("name", true)
                            bar-chart(t, "name", "age")
                        }
                    }
                    @teacher{
                        Encourage your students to tell you this code before they see it.
                    }
              }
              @point{
                    @student{
                        This is really repetitive, isn't it? We're always doing the same two things:
                        @itemlist[
                          @item{ Define the subset - in this case, by filtering and sorting. }
                          @item{ Do something with it - in this case, make a bar chart. }
                        ] 
                        Wouldn't it be great if Pyret had a function that just took in a table of animals, and did these things for us? This seems like a problem we've seen before, back when we defined functions like @code{gender} or @code{nametag}: whenever we have the same code written over and over, we can use functions to save us the effort!
                    }
                    @teacher{
                    
                    }
              }
              @point{
                    @student{
                        Rather than rewrite the same method chain for every table, we can define a function that consumes an entire table and does the work for us. That way we can write the method chain once, and re-use it over and over. We can modify the Design Recipe slightly to help us keep our method order straight, turning it into something called a @bold{Table Plan}. Turn to page @worksheet-link[#:name "Sorted-Age-Bar"].
                    }
                    @teacher{
                        Table Plans are like the Design Recipe, but for manipulating tables. They enforce a @italic{way of thinking}, which is important for your students.
                    }
              }
              @point{
                    @student{
                        Table Plans are a lot like the Design Recipe. They start with a Contract and Purpose Statement, but involve different kinds of examples and can often involve @italic{multiple} function definitions. Let's use our filtered bar chart as an example, which ties together all the pieces you've seen before.
                    }
                    @teacher{
                        Your students should be @italic{very} comfortable with the Design Recipe before proceeding.
                    }
              }
              @point{
                    @student{
                        @bannerline{Step 1: Contract and Purpose}
                        We're going to build a function that does this for us, and we'll start with the name. Naming is more complex in Table Plans, since we want to name the function according to the most important parts of what it does. Since we're getting an alphabetically-sorted bar chart of their ages, we'll call it @code{sorted-age-bar}. Instead of consuming Rows, this time we're consuming and producing @italic{Tables}. This gives us the following:

                        @code[#:multi-line #t]{
                            # sorted-age-bar :: (animals :: Table) -> Table
                            # consume a table of animals, and produce a bar chart
                            # of their ages, sorted alphabetically
                        }
                    }
                    @teacher{
                        Ask students to volunteer other names - but push them to keep the relevant info as part of the name.
                    }
              }
              @point{
                    @student{
                        @bannerline{Step 2: Examples}
                        This is really similar to writing examples with the Design Recipe, but everything stays on paper. First, we write down a small sample of the @code{animals-table}, called an Example Table. This example should contain all of the @italic{relevant} columns, and enough rows to give us an idea for how the function should work. Then, on the righthand side, we write or sketch what we expect to get back.
                        @itemlist[
                            @item{ What columns do we care about? }
                            @item{ In the Interactions Area, how would you @italic{use} this function, passing in the @code{example-table}? }
                            @item{ What would @code{sorted-age-bar(table)} evaluate to? }
                        ]
                        In this case, we care about the name and age columns. According to our contract we would need to call the function's name and pass in only a table. According to the purpose statement, typing @code{sorted-age-bar(example-table)} into the Interactions Area should give us a bar chart of all the animal's ages, sorted by name.
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        @bannerline{Step 3: Define the Function @italic{in two parts}}
                        The final step is to define a function that executes our Table Plan. We'll do this in two parts. First, we'll define a table by applying our methods to the input. Then, we'll do something with that table to produce a result. We already know how to start:
                        @code[#:multi-line #t]{
                            # sorted-age-bar :: (animals :: Table) -> Table
                            # Consume a table of animals, and compute a bar chart 
                            # showing their ages, in alphabetical order
                            fun sorted-age-bar(animals):
                                ...         # define the table
                                ...         # produce the result
                            end
                        }
                    }
                    @teacher{
                    }
              }
              @point{
                    @student{
                        To define this table, we'll ask ourselves three questions, in order:
                        @itemlist[
                            @item{ 
                              Does our Result have more columns than our Sample Table? If so, we'll need to use @code{.build-column}. 
                            }
                            @item{ 
                              Does our Result have fewer rows than our Sample Table? If so, we'll need to use @code{.filter}. 
                            }
                            @item{ 
                              Does our Result have its rows in some order? If so, we'll need to use @code{.order-by}.
                            }
                        ]
                        @activity[#:forevidence (list "Data 3.1.1&1&2" "Data 3.1.1&1&4")]{
                            If the answer to any of these questions is "no", @italic{cross out that line in the template}.
                        }
                    }
                    @teacher{
                        Only @code{.order-by} is needed.
                    }
              }
              @point{
                    @student{
                        All three methods are needed, so we won't cross anything out. You're already familiar with definitions in Pyret, and that's what we'll use here. Let's start with the name @code{t} for Table.
                        @itemlist[
                            @item{ Are there more columns in our result? No, nothing new gets added. }
                            @item{ Are there fewer rows in our result? No, the whole table get plotted. }
                            @item{ Are the rows ordered? YES. According to our purpose statement, the animals are sorted alphabetically by name. }
                        ]
                        @code[#:multi-line #t]{
                            # sorted-age-bar :: (animals :: Table) -> Table
                            # Consume a table of animals, and compute a bar chart 
                            # showing their ages, in alphabetical order
                            fun sorted-age-bar(animals):
                                t = animals # define the table
                                  .order-by("name", true)
                                ...         # produce the result
                            end
                        }
                    }
                    @teacher{
                        It may be helpful to start with the table definition all on one line, and have students see you break it up to accommodate chaining. Students should be reminded that both forms are valid, but encouraged to use the latter.
                    }
              }
              @point{
                  @student{
                        Now that we have our new table, @code{t} defined, what do we need to do with it? According to our purpose statement, we need to @italic{make a bar chart}.
                        @code[#:multi-line #t]{
                            # sorted-age-bar :: (animals :: Table) -> Table
                            # Consume a table of animals, and compute a bar chart 
                            # showing their ages, in alphabetical order
                            fun sorted-age-bar(animals):
                                t = animals # define the table
                                  .order-by("name", true)
                                bar-chart(t, "name", "age") # produce the result
                            end
                        }
                  }
                  @teacher{
                      Drawing arrows from the @code{t} expression on the last line back to the @code{t} definition on the first line would be a good idea here. Make sure students see the connection between "defining the table...and using it".
                  }
              }
              @point{
                  @student{
                      Once you've typed in the Contract, Purpose and Function Definition, click "Run". How do we use this function? If you look in the @bold{Examples} section, you'll see that the Result is written underneath the expression @code{sorted-age-bar(animals-table)}. That's the code that should give us the result, so let's type it in.
                      @activity[#:forevidence (list "Data 3.1.1&1&1" "Data 3.1.1&1&2")]{
                          Type in the code and hit Enter. Did you get back the same result you expected?
                      }
                  }
                  @teacher{
                  
                  }
              }
              @point{
                    @student{
                        @activity{
                            Turn to page @worksheet-link[#:name "Fixed-Weeks-Box"], and complete the Table Plan you find there. You'll need to come up with your own sample table this time: what columns will you need? What rows matter?
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
                           Building functions is a powerful technique, which you'll use throughout the course. Today, you learned how to write functions that work on one row of a table at a time. In the next lesson, you'll learn how to use those functions to loop over an @italic{entire table}, letting us extend, filter, and sort our @code{animals-table}

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