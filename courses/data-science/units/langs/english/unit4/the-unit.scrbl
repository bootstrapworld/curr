#lang curr/lib

@title{Unit 3: Manipulating Tables }

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
    Students extend their knowledge of functions to include methods, and learn about Table methods for sorting, filtering and extending Tables. They are also introduced to Table Plans (a structured approach to manipulating tables), and begin manipulating their own datasets.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Review"
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
                  }
                  @teacher{
                  
                  }
              }
              @point{
                  @student{
                      @activity[#:forevidence "BS-IDE&1&1"]{
                          Open the starter file you created for your dataset, and click "Run". In the Interactions Area, type the name of your table so you can see the dataset. Type the names of the two sample rows you defined: @code{sample1} and @code{sample2}.
                      }
                  }
                  @teacher{
                      It is critical that every student have at least two sample rows!
                  }
              }
              @point{
                  @student{
                      @activity[#:forevidence "BS-IDE&1&1"]{
                          Do you remember how to use Table Methods? Do you remember how to use the Design Recipe to build functions? Open to @worksheet-link[#:name "Unit-4-Review"], and complete the activities there.
                      }
                  }
                  @teacher{

                  }
              }
        ]
  }

  @lesson/studteach[
     #:title "Introducing Table Plans"
     #:duration "30 minutes"
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
                        @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "0BzzMl1BJlJDkbnZhbE1QSEE0eEE" "new copy"].)
                        }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Table methods are powerful, and there's an order-of-operations to how they are used. For example, we might want to build a column and then use it to filter or order the table. Therefore, @code{.build-column} always has to come first! To help keep things organized, we can use @bold{Table Plans}. Turn to page @worksheet-link[#:name "Kitten-Tags"].
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
                        We're going to build a function that does this for us, and we'll start with the name. Naming is more complex in Table Plans, since we want to name the function according to the most important parts of what it does. Since we're @italic{getting a table} of kittens with nametags, we'll call it @code{get-kittens-tags}. Instead of consuming Rows, this time we're consuming and producing @italic{Tables}. This gives us the following:

                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                        }
                    }
                    @teacher{
                        Ask students to volunteer other names - but push them to keep the @code{get-} part of the name!
                    }
              }
              @point{
                    @student{
                        @bannerline{Step 2: Examples}
                        This is really similar to writing examples with the Design Recipe, but everything stays on paper. First, we write down a small sample of the @code{animals-table}, called a Sample Table. Then we write a sample result, which we'd get from calling @code{get-kittens-tags} on that Sample Table. For now, we've provided the Starter and Results for you.
                        @itemlist[
                            @item{ Does the Result have our new column? }
                            @item{ Does the Result have only kittens? }
                            @item{ Is the Result in alphabetical order? }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        @bannerline{Step 3: Define the Function}
                        The final step is to define a function that executes our Table Plan. We already know how to start:
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                ...
                            end
                        }
                    }
                    @teacher{
                        Assessment opportunity: students should be able to write this code this based on what they know about the Design Recipe.
                    }
              }
              @point{
                    @student{
                        Table plans include two parts: defining our new table, and producing our result. To define this table, we'll ask ourselves four questions, in order:
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
                        All three are needed.
                    }
              }
              @point{
                    @student{
                        All three methods are needed, so we won't cross anything out. You're already familiar with definitions in Pyret, and that's what we'll use here. Let's start with the name @code{t} for Table.
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                t = animals
                                  .build-column(...)
                                  .filter(...)
                                  .order-by(...)
                            end
                        }
                    }
                    @teacher{
                        It may be helpful to start with all of these methods on one line, and have students see you break them up. Students should be reminded that both forms are valid, but encouraged to use the latter.
                    }
              }
              @point{
                    @student{
                        Now we can fill in those @code{...} sections! 
                        @itemlist[
                          @item{ 
                              For each Row, we know we need to build a column for the nametags: what should that column be called? Do we have a function that takes a Row and produces a nametag?
                          }
                          @item{ 
                              We know we need to filter so that all of our Rows are kittens: Do we have a function that takes a Row and tells us whether or not it is a kitten?
                          }
                          @item{
                              We know we need to order these rows: by what column should we order them? Ascending?
                          }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Filling in these blanks, we get the following code:
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                t = animals  # define the table
                                  .build-column("tags", nametags)
                                  .filter(is-kitten)
                                  .order-by("name", true)
                                ...          # produce the result
                            end
                        }
                        Fortunately, the @code{nametags} and @code{is-kitten} functions are already defined! If we found that we needed to make news ones, however, we could use the Design Recipe to do it.
                    }
                    @teacher{
                        If projecting onto a board, drawing arrows from the function names to their definitions would be really helpful here.
                    }
              }
              @point{
                  @student{
                        The final step in the Table Plan is to produce the result. For now, that result is just the table we defined, @code{t}! (Don't worry, you'll get to more complex results later)
                        @code[#:multi-line #t]{
                            get-kittens-tags :: (animals :: Table) -> Table
                            # get all the kittens, add nametags, and sort by name
                            fun get-kittens-tags(animals):
                                t = animals  # define the table
                                  .build-column("tags", nametags)
                                  .filter(is-kitten)
                                  .order-by("name", true)
                                t            # produce the result
                            end
                        }
                  }
                  @teacher{
                      Drawing arrows from the @code{t} expression on the last line back to the @code{t} definition on the first line would be a good idea here. Make sure students see the connection between "defining the table...and using it"!
                  }
              }
              @point{
                  @student{
                      Once you've typed in the Contract, Purpose and Function Definition, click "Run". How do we use this function? If you look in the @bold{Examples} section, you'll see that the Result is written underneath the expression @code{get-kittens-tags(animals-table)}. That's the code that should give us the result, so let's type it in!
                      @activity[#:forevidence (list "Data 3.1.1&1&1" "Data 3.1.1&1&2")]{
                          Type in the code and hit Enter. Did you get back the same result you expected?
                      }
                  }
                  @teacher{
                  
                  }
              }
              @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.1&1&2" "BS-DR.4&1&1" "BS-DR.4&1&2" "Data 3.1.1&1&1" "Data 3.1.1&1&2" "Data 3.1.1&1&4")]{
                            @itemlist[
                                @item{
                                  Turn to @worksheet-link[#:name "Dogs-by-Age"], and complete the Table Plan. When your teacher has checked your work, type in your code to create the table. @bold{Note:} this time, you'll need to fill in more missing parts of the function definition!
                                }
                                @item{
                                  Turn to @worksheet-link[#:name "Old-Dogs-Diet"], and complete the Table Plan. When your teacher has checked your work, type in your code to create the table. @bold{Note:} this time, you'll need to come up with your own Contract and Purpose!
                                }
                                @item{
                                  Turn to @worksheet-link[#:name "Fixed-Birth"], and complete the Table Plan. When your teacher has checked your work, type in your code to create the table.
                                }
                            ]
                        }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        By now, you've had a chance to use Table Plans and Table Methods to:
                        @itemlist[
                            @item{ Extend data with computed columns }
                            @item{ Filter rows to create @italic{subsets} of data (e.g. "only cats") }
                            @item{ Order rows by a particular column, in ascending or descending order }
                        ]
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Turn to @worksheet-link[#:name "Dataset-Plans"] in your Student Workbook, and fill out questions 3-5.
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
