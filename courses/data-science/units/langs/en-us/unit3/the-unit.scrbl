#lang curr/lib

@title{Unit 3: Looking for Trends }

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
                                       (list "Table"
                                              @code{.row-n, .order-by, .filter}
                                              ""))]{
  @unit-descr{
     In the process, they learn how to write their own definitions, first defining static values and then complete functions. They are also introduced to the Design Recipe: a structured approach to solving word problems and defining functions.
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
                        Open your saved animals-dataset file. You should have several functions defined:
                        @itemlist[
                            @item{ @code{is-fixed} }
                            @item{ @code{gender} }
                            @item{ @code{is-cat} }
                            @item{ @code{is-young} }
                        ]
                        If you didn't have a chance to type them in from your workbook, make sure you do!
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        Can you use the Design Recipe to write a few more functions?
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2"  "BS-DR.2&1&1" "BS-DR.2&1&2")]{
                          Turn to @worksheet-link[#:name "Design-Recipe-3"], and see if you can solve the following word problems:
                            @itemlist[
                              @item{ 
                                  Define a function called @code{nametag}, which prints out each animal's name in big red letters.
                              }
                              @item{ 
                                  Define a function called @code{birth-year}, which consumes a Row of the @code{animals-table} and produces the year the kitten was born.
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
     #:duration "5 minutes"
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
                        It can be difficult to read code that has lots of method calls chained together, so we can break them up before each "@code{.}" to make it more readable. Here's the exact same code, written with each method on it's own line:
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
                          How well do you know your table methods? Complete @worksheet-link[#:name "Playing-With-Methods"] in your Student Workbook to find out!
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
                        Suppose I wanted to get a bar-chart of animal's ages, for only the cats in the shelter, sorted alphabetically by name. How would I do that?
                        @code[#:multi-line #t]{
                            t = animals-table.filter(is-cat).order-by("name")
                            bar-chart(t, "name", "age")
                        }
                        Then I want to get the same bar chart, but now for only the fixed animals, sorted alphabetically by name. How would I do that?
                        @code[#:multi-line #t]{
                            t = animals-table.filter(is-fixed).order-by("name")
                            bar-chart(t, "name", "age")
                        }
                        Then I want to get the same bar chart, but now for only the young animals, sorted alphabetically by name. How would I do that?
                        @code[#:multi-line #t]{
                            t = animals-table.filter(is-young).order-by("name")
                            bar-chart(t, "name", "age")
                        }
                    }
                    @teacher{
                        Have students volunteer this, whenever possible.
                    }
              }
              @point{
                    @student{
                        This is really repetitive, isn't it? We're always doing the same two things:
                        @itemlist[
                          @item{ Define the table - in this case, by filtering and sorting. }
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
                        Table Plans are a lot like the Design Recipe. They start with a Contract and Purpose Statement, but involve different kinds of examples and can often involve @italic{multiple} function definitions. Let's do an example, which ties together all the pieces you've seen before. Suppose it's time to vaccinate all kittens, and the shelter wants a table that includes nametags for all the kittens in alphabetical order. How do we get started?
                    }
                    @teacher{
                        Your students should be @italic{very} comfortable with the Design Recipe before proceeding!
                    }
              }
              @point{
                    @student{
                        @bannerline{Step 1: Contract and Purpose}
                        We're going to build a function that does this for us, and we'll start with the name. Naming is more complex in Table Plans, since we want to name the function according to the most important parts of what it does. Since we're @italic{getting a table} of kittens with nametags, we'll call it @code{sorted-age-bar}. Instead of consuming Rows, this time we're consuming and producing @italic{Tables}. This gives us the following:

                        @code[#:multi-line #t]{
                            # sorted-age-bar :: (animals :: Table) -> Table
                            # consume a table of animals, and produce a bar chart
                            # of their ages, sorted alphabetically
                        }
                    }
                    @teacher{
                        Ask students to volunteer other names - but push them to keep the relevant info as part of the name!
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
                        Only @code{.order-by} is needed!
                    }
              }
              @point{
                    @student{
                        All three methods are needed, so we won't cross anything out. You're already familiar with definitions in Pyret, and that's what we'll use here. Let's start with the name @code{t} for Table.
                        @itemlist[
                            @item{ Are there more columns in our result? No, nothing new gets added. }
                            @item{ Are there fewer rows in our result? No, the whole table get plotted. }
                            @item{ Are the rows ordered? YES! According to our purpose statement, the animals are sorted alphabetically by name. }
                        ]
                        @code[#:multi-line #t]{
                            # sorted-age-bar :: (animals :: Table) -> Table
                            # cConsume a table of animals, and compute a bar chart 
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
                      Drawing arrows from the @code{t} expression on the last line back to the @code{t} definition on the first line would be a good idea here. Make sure students see the connection between "defining the table...and using it"!
                  }
              }
              @point{
                  @student{
                      Once you've typed in the Contract, Purpose and Function Definition, click "Run". How do we use this function? If you look in the @bold{Examples} section, you'll see that the Result is written underneath the expression @code{sorted-age-bar(animals-table)}. That's the code that should give us the result, so let's type it in!
                      @activity[#:forevidence (list "Data 3.1.1&1&1" "Data 3.1.1&1&2")]{
                          Type in the code and hit Enter. Did you get back the same result you expected?
                      }
                  }
                  @teacher{
                  
                  }
              }
        ]
    }

  @lesson/studteach[
     #:title "Looking for Relationships"
     #:duration "15 minutes"
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
                        Why are some animals adopted quickly, while others take a long time? What factors explain why one pet gets adopted right away, and others wait months?
                    }
                    @teacher{
                        Ask the class for theories.
                    }
              }
              @point{
                    @student{
                        One theory is that people adopt smaller animals because they're easier to care for. How could we test that theory? Bar and pie charts are great for showing us how the values of a single column are distributed, but they can't help us see connections between @italic{two} columns.
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Fortunately, Pyret lets us make many kinds of charts, including @vocab{scatter plots}! Here's the contract for @code{scatter-plot}, as well as an example of a scatter plot that examines the relationship between weight and adoption time.
                        @code[#:multi-line #t]{
                            # scatter-plot :: (t :: Table, xs :: String, ys :: String) -> Image
                            scatter-plot(animals-table, "pounds", "weeks") # see if smaller animals get adopted faster
                        }
                        @activity{ Try making a few scatter plots, looking for relationships between columns in the animals-table. }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Another theory is that people adopt younger animals because they are cuter. But cats, dogs, rabbits and tarantulas have very different lifespans! A 5 year old tarantula is still really young, while a 5 year old rabbit is fully grown. With differences like this, it doesn't make sense to put them all on the same chart! To do this analysis, we might have to make several charts, all of which do the same thing but operate on different tables: one for cats, one for dogs, etc.
                        @activity{
                            Turn to @worksheet-link[#:name "Age-Adopted-Scatter"] in your Student Workbook, and practice using a Table Plan write this function! Do you see a trend in the scatterplots for all the animals? For the cats? The young animals? The fixed animals? In which group is this trend the most clear?
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
