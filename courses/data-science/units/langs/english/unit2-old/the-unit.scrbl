#lang curr/lib

@title{Unit 2: Methods, Tables and Plotting}

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
                                       (list "DataSeries" 
                                              @code{function-plot} 
                                              "")
                                       )]{
  @unit-descr{Is there a relationship between the amount of sugar in a meal, and the number of calories? Do more caloric meals tend to have more sugar? To answer this question, students are introduced to Tables in Pyret, as well as scatter plots as a way of visualizing data. They also deepen their understanding of Lists and Contracts, using methods.}
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
                  Do sugary meals @italic{always} have more calories than meals with less sugar? Do high-calorie meals @italic{always} have a lot of sugar in them?
                    @activity{
                        Turn to @worksheet-link[#:name "Unit-2"]. Take two minutes to write down what you think, and why.
                    }
              }
              @teacher{
                  Give the class a minute for open discussion. The more they are engaged with the question, the more substantial their answers will be.
              }
            }
            @point{
              @student{
                  So far you have learned the fundamentals of writing programs that do work on simple data like Numbers (@code{1, -6, 3.5,} etc.), Strings (@code{"hello", "17",}), Images and Lists (@code{[list: 1, 2, 3]}). As data scientists, we need to write programs that work on complex data like @italic{restaurant menus}, which can have many related parts and contain dozens or millions of entries. A collection of related data that can be grouped and manipulated by a computer is called a @vocab{dataset}. In this unit, you will learn how Pyret works with real-world data, and how to answer data science questions like this one by writing programs over that data.
              }
              @teacher{

              }
            }

        ]

}


  @lesson/studteach[
     #:title "Methods"
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
                        There are also some special functions that work on tables, called @vocab{methods}. Methods are different from @vocab{functions} in a several ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. For example, the @code{.row-n} method has to be called as part of a Table.
                                  }
                                  @item{
                                        @italic{They change the way they behave}, depending on which piece of data they're attached to. One of these lines of code will work, while the other will cause an error:
                                         @code{shapes.row-n(4)} will work if our table has four observations, but fail if there are only two.
                                  }
                                  @item{
                                        @italic{Their contracts are different.} The @code{.row-n} method only exists within the @code{Table} Type, so we can't use its name without also specifying the name of a Table. The contract for a method includes the Type along with the name:
                                         @code[#:multi-line #t]{
                                          <Table>.row-n :: (n :: Number) -> Row
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
            @point{
                  @student{
                        We also have methods for extracting an entire column. For example:
                        @code[#:multi-line #t]{
                            <Table>.column :: (name :: Number) -> List
                        }
                        What is the Name of this method? What is the Domain?
                        @activity{
                            In the Interactions Area, use the @code{.column} method to extract the @code{name} column from your @code{shapes} table. Try extracting other columns, and see what you get.
                        }
                  }
                  @teacher{

                  }
            }
      ]
  }


  @lesson/studteach[
     #:title "Definitions"
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
                            In Pyret, you can define @vocab{names} with the @code{=} sign, just like in math class. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name "x" to be the number "4".
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                            In Pyret, you can name values to make them easier to remember and easy to change. In the Definitions Area, you'll see lots of sample definitions. Let's take a look at a few of them:
                                @code[#:multi-line #t]{
                                    A = 42
                                    B = "buffalo "
                                    C = 2 * 2
                                    D = 42 - A
                                }
                            @bold{Every definition has a name and a value}, and we know that every value has a type. The name is the part to the left of the equals sign, and the value is the part on the right. The value can be simple, like @code{42} and @code{"buffalo "}, or it can be an expression, such as @code{2 * 2}. Definitions can even refer to previous definitions, like @code{D = 42 - A}.
                        }
                        @teacher{

                        }
                }
                @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Turn to @worksheet-link[#:name "Fill-in-Value"] in your workbook. For each definition, come up with a value or expression that matches the given name and type, and write it on the space provided.
                            }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        We've added comments to the starter file, so you can fill in the @vocab{type} of each value being defined. We've already written the name and type for A, B and F. Can you fill in everything else between A and I? 
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        We can also use functions inside definitions. In the Definitions Area, take a look at line 18:
                        @code[#:multi-line #t]{
                            J = num-sqrt(C)   # J :: Number
                        }
                        This definition creates a value called @code{J}, which is the square root of @code{C}. You can see that we've also added a comment, which lists the name and type for this definition.
                        @activity{
                            Fill in the name and type for @code{K} and @code{L}.
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        We can even define new names for @italic{functions themselves}. Take a look at line 24:
                        @code[#:multi-line #t]{
                                M = num-sqrt   # M :: (n :: Number) -> Number
                            }
                        This definition creates a name called @code{J}, which is the square root function @italic{itself}! In the comment, you'll notice that M's type looks different from other types we've seen before. Instead of just being a @code{Number}, @code{String}, @code{List}, or @code{Image}, it has an arrow in it! That's because it's a function, just like @code{num-sqrt}. In fact, @code{M} has the same Domain and Range as @code{num-sqrt} because it's being defined as @code{num-sqrt}.
                        @activity{
                            Fill in the name and type for @code{N}, @code{O} and @code{P}.
                        }
                    }
                    @teacher{
                    
                    }
                }
                @point{
                        @student{
                                Pyret has many, many more functions. Some of these functions are defined as part of the language, and others are defined in extra files that we have to load by hand. The @code{include} line at the top of the file loads one of these files.
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            Two of the functions imported by this file are called @code{function-plot} and @code{draw-plot}. Write them down in your contracts page:
                            @code[#:multi-line #t]{
                                # draw-chart :: (title :: String, ds :: DataSeries) -> Image
                                # function-plot :: (fn :: Number -> Number) -> DataSeries

                            }
                            These contracts have a lot of new information in them, but you can use what you know to reason about them. 
                            @itemlist[
                                @item{What is the Name, Domain and Range of the first function?}
                                @item{What is the Name, and Range of the second function?}
                            ]
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            Even though you haven't seen a @code{DataSeries} before, we can figure out that @code{draw-chart} consumes a String and a @code{DataSeries}, and then produces an Image. The String is the title of a chart, and the resulting Image is the picture of the plot (with that title). You've used your knowledge of contracts to identify that the function also takes in a @code{DataSeries}, but what @italic{is} that? 

                            When you plot a function on your calculator, you can zoom in and out of the resulting graph. Zooming in and out will change the image on the screen, but it doesn't change the data itself. That means you can think about a plot as having two parts: the abstract @italic{data}, and then the settings for how that data is presented. A @code{DataSeries} is the abstract data. You've already seen some functions that may be familiar to you, such as @code{num-sqr} and @code{num-sqrt}. How can we take these functions and build a DataSeries out of them? 
                        }
                        @teacher{
                            You can provide other examples that distinguish data from presentation: the same graph can be shown in any color, or with xMin and xMax shifted by any amount, but the underlying data behind the graph doesn't change!
                        }
                }
                @point{
                        @student{
                            You might notice that every contracts has an arrow separating Domain from Range. @code{function-plot} has an interesting domain: @code{(Number -> Number)}. That means it consumes a @italic{function} that maps from Numbers to Numbers (xs to ys, for example), and returns a @code{DataSeries}. 
                        }
                        @teacher{

                        }
                }
                @point{
                        @student{
                            We can define names for both the DataSeries and the plot:
                            @code[#:multi-line #t]{
                                # define the series and the graph for the function f(x)=√x
                                sqrt-series  = function-plot(num-sqrt)
                                sqrt-graph = draw-chart("f(x)=√x", sqrt-series)
                            }
                            Review: once I've defined an identifier, I can see its value for by clicking Run, then typing in the identifier in the Interactions Area and hitting Enter.

                            Looking at your contracts page, do you see any other functions that we could plot?
                        }
                        @teacher{
                            Have student plot @code{num-sqrt}.
                        }
                }
        ]
  }
@lesson/studteach[
     #:title "Methods"
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
                        You've already seen one kind of collection, in the form of Lists. Lists are ways of grouping pieces of data, one after another. In addition to being more complex than simpler datatypes, and List values even have special functions, called @vocab{methods} that we can use to manipulate them.
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                        Suppose we have a list of names (@code{[list: "Emma", "Ed", "Shriram", "Kathi"]}), and we want to just get the first name (@code{"Emma"}). In Pyret, all Lists have a built-in function called @code{get}, which consumes an index and produces whatever value is at that index. Here is how we would use it:
                        @code[#:multi-line #t]{
                            [list: "Emma", "Ed", "Shriram", "Kathi"].get(0)
                        }
                        Note: in most programming languages, indexes start at zero. What index would we use to get "Kathi" from this list? "Shriram"? "Ed"?
                    }
                    @teacher{

                    }
            }
            @point{
                  @student{
                          @vocab{Methods} are different from @vocab{functions} in a several ways:

                          @itemlist[
                                  @item{
                                        @italic{They are called differently}. For example, the @code{.get} method has to be called as part of a List.
                                  }
                                  @item{
                                        @italic{They change the way they behave}, depending on which piece of data they're attached to. One of these lines of code will work, while the other will cause an error:
                                         @code[#:multi-line #t]{
                                            [list: 10, 20, 30].get(2)
                                            [list: "a", "b"].get(2)
                                         }
                                  }
                                  @item{
                                        @italic{Their contracts are different.} The @code{.get} method only exists within the @code{List} Type, so we can't use its name without also specifying the name of a List. The contract for a method includes the Type along with the name:
                                         @code[#:multi-line #t]{
                                          <List>.get :: (index :: Number) -> Any
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
                          Tables also have their own methods. If we want to get a particular Row from a Table, we can use the @code{.row-n} method, whose contract is:
                          @code[#:multi-line #t]{
                            <Table>.row-n :: (index :: Number) -> Row
                          }
                          As with Lists, Rows are indexed starting from zero, so get the first three Rows from the @code{presidents} Table, we would use:
                          @code[#:multi-line #t]{
                            presidents.row-n(0)
                            presidents.row-n(1)
                            presidents.row-n(2)
                          }
                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                      @activity{
                          @itemlist[
                              @item{Get the 7nd Row from the @code{presidents} table}
                              @item{Get the 2nd Row from the @code{nutrition} table}
                          ]
                      }
                  }
            }
            @point{
                  @student{
                          Now that we have a method that lets us grab an individual row of a table, we need a method that lets us grab a @italic{column}. Fortunately, Pyret has just that:
                          @code[#:multi-line #t]{
                            <Table>.column :: (col :: String) -> List
                          }
                  }
                  @teacher{
                          
                  }
            }
            @point{
                  @student{
                          Suppose we want to get the @code{sodium} column out of @code{nutrition}:
                          @code[#:multi-line #t]{
                              nutrition.column("sodium")
                          }
                          Running this program gives us the following list: @code{[list: 480, 680, 820, 360, 1300, 790, 160, 150, 680, 130]}.
                  }
                  @teacher{
                  
                  }
            }
            @point{
                  @student{
                      @activity[#:forevidence "BS-IDE&1&1"]{
                          Let's get some practice using the @code{.column()} method.
                          @itemlist[
                                  @item{Extract the @code{home-state} column from @code{presidents}.}
                                  @item{Extract the @code{calories} column from @code{nutrition}.}
                                  @item{Extract the @code{sugar} column from @code{nutrition}.}
                          ]
                      }
                  }
                  @teacher{

                  }
            }
        ]
  }

  @lesson/studteach[
     #:title "Scatterplots"
     #:duration "15 minutes"
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
                          A lot of restaurants these days publish nutritional information as part of their menu - how could we use this data to answer our topic question about sugar and calories? When we ask "do sugary foods have more calories?", we are asking about a @italic{relationship} between two variables: the amount of sugar in a meal, and the number of calories in that meal. In math class, relationships are usually black-and-white. The equation @math{y = 2x} says that the @math{y} is @italic{always} twice as much as @math{x}. But in the real world, relationships aren't quite so simple!
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          We can represent each menu item as a point on a graph, where the x-axis is the amount of sugar and the y-axis is the number of calories. The two lists we've defined represent our x's (the amount of sugar) and our y's (the number of calories). Each item gives us a single point on the graph. Will these points have to fit perfectly on a single line?
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bitmap{images/scatter.png}
                          In the last lesson, you used @code{function-plot} to generate a DataSeries from a mathematical function. But to plot all of these data points, we're going to use the @code{scatter-plot} function, which takes in two lists of numbers as the xs and ys. 
                          @code[#:multi-line #t]{
                          # sugar-cal-series :: DataSeries
                          sugar-cal-series = scatter-plot(
                            nutrition.column("sugar"),
                            nutrition.column("calories"))
                          }
                          What do you think the contract is for @code{scatter-plot}? Copy it down into your Contracts page. Once we've created the DataSeries, it's time to plot it: @code{draw-chart("Sugar v. Calories", sugar-cal-series)}. 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                            These data points don't look like they're on a neat line at all! However, the "cloud" of points does seem to shift upwards farther along the x-axis. That suggests that as sugar increases, calories tend to increase as well. Scatterplots are helpful because they allow us to search for trends in "messy" data like this. Take two minutes and write your answer on @worksheet-link[#:name "Unit-2"] - does this support your hypothesis or not?
                          }
                          Later on in this class, you'll learn how to plot many kinds of data, and how to search for trends and relationships like this one!

                      }
                      @teacher{
                          Have the class debrief their findings. Did anyone's mind change after looking at the data? Is the data convincing or not? Why or why not? If there's time, have students plot other columns in the table.
                      }
              }
        ]
 }       

  @lesson/studteach[
     #:title "Choose Your Dataset"
     #:duration "15 minutes"
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
                          Now that you've had a chance to look at a few tables, it's time to choose a dataset of your own! Throughout this course, you'll be analyzing this dataset and writing up your findings. As you learn new tools for data science, you'll continue to refine this analysis, answering questions and raising new ones of your own!
                          Take 5 minutes to look through the following datasets, and choose one that interests you:
                          @itemlist[
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1SaR2M6Z-s40UuRg3u1aQU-G1GVdcm0RgHpqQ9LNmSQk" "Movies Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkbktKVk1zeEhNUXM" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1yHPM-poscv6azh59aMwElfUP67P3fMESorVjtMwsFa0" "School Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkVFdlemN1UmZiR0U" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw" "US Income Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkMUxuWXNsRThBMG8" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg" "US Presidents Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkNENhLXZPa1dnT28" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1lOFsofXJNIMKAM8g4Zn688jIdbAK68ovAnzmfuwFd9M" "Countries of the World Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkVTJfZDhKeGRKa3c" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1-mrDSjS-rWMdiMAIptFS_PHVUFO06lUpYNCiGkYj51s" "Music") (and the @editor-link[#:public-id "0BzzMl1BJlJDkR00tVGE0OEJJR2c" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1HJ6wR4IH9j0hqbaP4OXeChOVMbVMyV0vBMu25NUiw1w" "State Demographics") (and the @editor-link[#:public-id "0BzzMl1BJlJDkRVU1QWpNVVpoTzg" "Starter file"] for this dataset)
                              }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "0BzzMl1BJlJDkX0tnU0J1cTVaOHc" "Blank Starter file"]) for your project.
                              }
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              @itemlist[
                                  @item{
                                      Once you've found a Starter file for a dataset that interests you, click "Save a Copy" and save the project to your own account. 
                                  }
                                  @item{
                                      You'll be adding to this file as we go, and keeping a written repository of your work and your findings as well. We've created @(hyperlink "https://docs.google.com/document/d/1jbKSecOtdzVO4iJsIPQRLvnwrt8GhqVFyXvnukdT_Xo/edit?usp=sharing" "a Report Starter File") for this Report as well - save a copy to your account, and be sure to @bold{bookmark the page so you can return to it later}.    
                                  }
                                  @item{
                                      Take 5 minutes to fill in your name, and fill out the "About Your Data" section in your Report.
                                  }
                              ]
                          }
                      }       
                      @teacher{
                          See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Report") to see an exemplar of student work.
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