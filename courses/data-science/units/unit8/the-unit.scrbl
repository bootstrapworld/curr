#lang curr/lib

@title{Unit 8: Booleans, Comparison, and Sieve}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+, -, *, /, num-sqrt, num-sqr})
                                       (list "String" "n/a")
                                       (list "Image" @code{draw-plot, draw-plots})
                                       (list "Series" @code{function-plot, scatter-plot, bar-chart, pie-chart, freq-bar-chart, histogram})
                                       (list "List" @code{extract, mean, median, mode, modes})
                                       (list "Table" @code{select, order}))]{  @unit-descr{Students are introduced to booleans and comparisons, and practice using them as predicates to write sieve queries.}
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
                              China is an economic superpower. It's is one of the world's largest economies, and has tremendous growth each year. But Japan is also one of the world's largest economies - how much of Asia's total GDP does @italic{China} generate, compared to the other Asian countries? How could you answer this question?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                  Turn to @worksheet-link[#:name "Unit-8"] and take two minutes to write down what you think.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @bitmap{images/sieve.png}
                              We have our @code{countries} table, which lists @italic{every} country in the world and shows their GDP. But to answer this question, we need to learn two new things:
                              @itemlist[
                                  @item{
                                      How to write code that @italic{checks} if a country is in Asia.
                                  }
                                  @item{
                                      How to write a query that uses that check, so that we can generate a table showing only countries in Asia. Essentially, we want to create a @italic{filter} that traps all the rows we want - getting rid of the ones we don't.
                                  }

                              ]
                      }
                      @teacher{

                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Booleans and Comparison"
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
                              Let's start with our first item: how to write Boolean expressions.
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      What do you think each of these expressions evaluate to?
                                      @itemlist[
                                                @item{
                                                      @code{5 + 3}
                                                }
                                                @item{
                                                      @code{4 * 2}
                                                }
                                                @item{
                                                      @code{3 > -2}
                                                }
                                                @item{
                                                      @code{8 < (1 + 1)}
                                                }
                                      ]

                                      What type do the last two expressions produce?
                              }
                      }
                      @teacher{
                              We recommend projecting/displaying what the last two expressions evaluates to with a live coding section.
                      }f
                }
                @point{
                      @student{
                              The last two expressions produce a new type, called a @vocab{Boolean}. A Boolean type can only be one of two values: @code{true}, or @code{false}. Computer scientists and data scientists use Boolean values whenever they are asking @bold{yes or no questions} of data. For example, the expression @code{2 > 1} is asking the question "is 2 greater than one?". The answer is yes, so the computer will produce @code{true}.
                      }
                      @teacher{
                              Some students may confuse @code{true} and @code{false} for Strings, because "true and false are words". Point out that what is printed does not have any quotation marks, and only Strings are in quotes!
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      What do each of these expressions evaluate to?
                                      @itemlist[
                                                @item{
                                                      @code{18 > 18}
                                                }
                                                @item{
                                                      @code{18 >= 18}
                                                }
                                                @item{
                                                      @code{-5 <= 20}
                                                }
                                                @item{
                                                      @code{-4 == -4}
                                                }
                                                @item{
                                                      @code{3 == 2}
                                                }
                                                @item{
                                                      @code{(-8 + 8) == 0}
                                                }
                                                @item{
                                                      @code{(12 - 4) == (-4 + 12)}
                                                }
                                      ]

                                      Is there a difference between @code{=} and @code{==}?
                              }
                      }
                      @teacher{
                              You can point out the difference between definitions (@code{=}) and equality expressions (@code{==}) by writing @code{x = 4} in the Interactions Area, and then evaluating the expression @code{x = 10}. This will produce an error because @code{x} is already defined, while @code{x == 10} will produce @code{false}.
                      }
                }
                @point{
                      @student{
                              @itemlist[
                                    @item{
                                          @code{==} is very different from @code{=}, which @italic{defines} a variable to be equal to some value, whereas @code{==} asks a question: are these two things equal?
                                    }
                                    @item{
                                          Pyret also allows you to ask "are these two values NOT equal?" with this operator: @code{<>}.
                                    }
                              ]
                      }
                      @teacher{

``                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Booleans-Comparison"] in your workbooks, and complete the exercise. Call over the teacher when you have finished the worksheet
                              }
                      }
                      @teacher{
                              The exercise contains challenge questions where students must compare Strings for equality. Some students may have some intuition about this, but this activity "salts the waters" with a discussion of String comparisons.
                      }
                }
                @point{
                      @student{
                              @itemlist[
                                    @item{
                                          The second table has expressions that evaluate to booleans, but they are different from other boolean expressions because they compare Strings for equality.
                                    }
                                    @item{
                                          Strings can only be equal if they are EXACTLY equal, down to every character. If two strings have the same characters, but one is upper case and the other is lower case, they are NOT equal!
                                    }
                                    @item{
                                          How might the last expression (@code{continent == "Asia"}) be useful to us, if we want to find out how China's GDP stacks up compared to other Asian countries?
                                    }
                              ]
                      }
                      @teacher{
                              A very common bug when writing sieve queries is for students to use the incorrect case, or add extra spaces, within the target String. If students are having trouble with their programs, or if their sieve queries produce completely empty tables, ask them if their target String is exactly what they want it to be.
                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Sieve Queries"
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
                              Now that we know how to write Boolean expressions, we can start using them inside our queries. A "sieve" is a tool used to separate gold from worthless dirt, and we use the @code{sieve} operator to separate the rows we care about from the ones we don't.
                      }
                      @teacher{
                              @italic{"Why not call it filter?"} Sometimes we use filters to @italic{keep} stuff we like, and other times we use it to @italic{remove} stuff we dislike. Sieve might be a strange word, but there's no ambiguity about "keeping the gold"!
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open the @editor-link[#:public-id "0BzzMl1BJlJDkNkEtSXdzeXUyMGs" "Unit 8 Starter File"], Save a Copy, and Run the program.

                                      @itemlist[
                                            @item{
                                                  Type @code{restaurants} into the Interactions Area.
                                            }
                                            @item{
                                                  Type @code{restaurants-sieved} into the Interactions Area.
                                            }
                                      ]
                                      What is different about these two tables?
                              }
                      }
                      @teacher{
                              Guide students' discussion towards these points:
                              @itemlist[
                                    @item{
                                          @code{restaurants-sieved} has fewer rows
                                    }
                                    @item{
                                          All of the restaurants in @code{restaurants-sieved} have a rating greater than or equal to 4.0
                                    }
                              ]
                      }
                }
                @point{
                      @student{
                              Let's explore this query piece by piece:
                              @code[#:multi-line #t]{
                                    restaurants-sieved = sieve restaurants using rating:
                                        rating >= 4
                                    end
                              }

                              @itemlist[
                                    @item{
                                          Every @code{sieve} query starts with the same keyword: @code{sieve}.
                                    }
                                    @item{
                                          Next we name the table we want to sieve.  In this case, it is the @code{restaurants} table.
                                    }
                                    @item{
                                          After the table name comes the keyword @code{using}, which tells Pyret what columns are being used to ask a question of each row.
                                    }
                                    @item{
                                          Then we give the names of each column being used, followed by a colon @code{:}. In this case we are only using one column, which is the @code{rating} column.
                                    }
                                    @item{
                                          On the next line is the most important part: this is a @vocab{boolean} expression that asks the question "is the restaurant's rating at least 4.0?". Notice that we can use the column name the same way we can use a variable, within this expression.
                                    }
                                    @item{
                                          Finally, like all table queries, we finish with the @code{end} keyword.
                                    }
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                          @item{
                                              Complete the next three excersises in the Definitions Area: Low-Calorie, CA Presidents, and Asian Countries.
                                          }
                                          @item{
                                              On page @worksheet-link[#:name "Query-Reference"], write down what a @code{sieve} query is for.
                                          }
                                      ]
                              }
                      }
                      @teacher{
                              Warning: When attempting the @code{presidents-sieved} problem, some students will probably run into a bug if they're not careful about capitalization!
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "3-Step Table Plans"
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
                          @code{sieve} queries will now become the first step in our Table Plan. Before we worry about ordering or selecting, we'll ask whether or not we want to drop any rows from our dataset. If the answer is no, we can skip ahead to ordering. But if it's yes, we'll write that @code{sieve} query first.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              Turn to @worksheet-link[#:name "3-Step-Plan-1"] in your workbook, and fill in the Table Plan that will solve the Word Problem and get you from the start table to the end table. When you're done, type your solution queries into the Definitions Area under "Recent Title/Area".
                          }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                          @activity{
                              Sometimes it's obvious what your end table will have to look like, but a lot of the time you'll need to figure that out for yourself. For practice, turn to @worksheet-link[#:name "3-Step-Plan-2"] and read the Word Problem @italic{carefully}. This time, you'll have to fill in the end table yourself, before you start your table plan! When you're done, type your solution queries into the Definitions Area under "Title and Overseas".
                          }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                          Data scientists often have to work with enormous tables, containing thousands or even millions of rows! When figuring out your table plan, it's helpful to create just a small "starter table" so you can think things through. But what makes a good starter table?
                          @itemlist[
                              @item{
                                  A good starter table contains @italic{at least} the columns that matter - whether we'll be ordering, selecting, or sieving by those columns.
                              }
                              @item{
                                  A good starter table has enough rows to be a representative sample of the dataset.
                              }
                              @item{
                                  A good starter table has rows in truly random order, so that we'll notice if we need to order the table or not.
                              }
                              @item{
                                  A good starter table has a representative sample of rows from our full table. For example, a starter table based on @code{presidents} isn't very good if it only has Democratic presidents, or only presidents from the 1800s. That's a sampling bias that makes it harder to realize what we need to @code{sieve} by!
                              }
                          ]
                          @activity{
                              It will take some practice for you to get good at making Starter Tables, but you can start by identifying @italic{bad} ones! turn to @worksheet-link[#:name "Bad-Starter-Tables"], and write down what's wrong with each of these tables.
                          }
                      }
                      @teacher{
                      
                      }
                }
                @point{
                    @student{
                        @activity{
                              Turn to @worksheet-link[#:name "3-Step-Plan-3"] and read the Word Problem. This time you'll need to come up with a good starter table @italic{and} end table! When you're done, type your solution queries into the Definitions Area under "Asian GDPs".
                        }

                    }
                    @teacher{

                    }
               @point{
                    @student{
                        Now it's time to return to our original question: how much of Asia's total GDP does @italic{China} generate, compared to the other Asian countries? 

                        @activity{
                            Use the table you've created to generate a chart, showing the GDP of every country in Asia.
                        }
                    }
                    @teacher{
                        Some students will likely use pie, bar charts, or perhaps something else for this - point out the differences, and ask the class to discuss the pros and cons of each chart!
                    }
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
                              Open the @editor-link[#:public-id "0BzzMl1BJlJDkSXNaU185LVZ3VE0" "Sieve Syntax Errors"] file, and see if you can fix all the bugs you find. Once you're done, uncomment each query by removing the hash sign (@code{#}) and click Run.
                            }
                        }
                        @teacher{

                        }
                }
                @point{
                    @student{
                        Take a few minutes and record your findings on @worksheet-link[#:name "Unit-8"]. Do your findings match your hypothesis? What new questions does this raise?
                    }
                    @teacher{

                    }
                }
        ]
  }
}