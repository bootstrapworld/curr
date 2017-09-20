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
     #:title "Tables"
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
            							@build-table/cols[
            										'("city" "population")
            										'(("\"New York\"" "\"Los Angeles\"" "\"Chicago\"" "\"Houston\"" "\"Phoenix\"" "\"Philadelphia\"" "\"San Antonio\"" "\"San Diego\"")
                                ("8500000" "4000000" "2700000" "2300000" "1600000" "1600000" "1500000" "1400000"))
            										 (lambda (r c) (para ""))
            										 2 8
            							]

					}
                    @teacher{
							           Show the students slides with each image of the example table, focusing on the different aspects of tables. Express that each row represents a distinct object, and each entry in a row stores information about that object.
					}
            }
            @point{
          					@student{
          							This is a @vocab{Table} containing information about America's largest cities.  @vocab{Table}s are collections of cells - or "entries", where each @vocab{entry} contains one value.  In most of the tables you will encounter in this class, these values will be of type Number or String.
          					}
                    @teacher{
                        Tables with empty cells will import using the @code{Option} type, in which a column of numbers will display as @code{None} for blank entries, and as @code{Some(n)} for others. None of the provided datasets have blanks, so your students should never have to confront @code{Option} types.
					          }
            }
			      @point{
                    @student{
          							@vocab{Table}s are organized into @vocab{Column}s and @vocab{Row}s.

          							All of the entries in a particular @vocab{column} will contain values that are the same type, and represent the same thing. For example, each entry in the 2rd column represents the population of a city.

          							@build-table/cols[
          										'("population")
          										'(("8500000" "4000000" "2700000" "2300000" "1600000" "1600000" "1500000" "1400000"))
          										 (lambda (r c) (para ""))
          										 1 8
          							]
          					}
                    @teacher{

          					}
            }
			      @point{
                    @student{
          							At the top of our table is the @vocab{header}. Each part of the @vocab{header} is the name of a particular @vocab{Column}. @bold{The header is not a row!}. A table with no data has @italic{no rows}, even though it must still have a header. For example:

          							@build-table/cols[
          										'("city" "population")
          										'()
          										 (lambda (r c) (para ""))
          										 2 0
          							]
          					}
                    @teacher{

          					}
            }
			      @point{
                    @student{
      					        @activity[#:forevidence "BS-IDE&1&1"]{
      				        		Turn to @worksheet-link[#:name "Animals"] in your workbook, and use your knowledge of tables to answer the questions there.
          							}
              			}
                    @teacher{
												
          					}
            }
            @point{
                   @student{
      					 		      Now that you know the basic information about tables, it's time to get some hands on experience with them in Pyret. Pyret allows us to write programs that work on tables, similar to how we write programs that work on Numbers and Strings.
      					   }
                    @teacher{
                    		  In supplemental lessons, students/teachers can load their own tables into Google Sheets, as well as design surveys to populate Google Sheets with data.  However, in the core curriculum this will not be covered;  students will use scaffolded code to work with tables exclusively in Pyret.
    					     }
            }
            @point{
              		@student{
              				@activity[#:forevidence "BS-IDE&1&1"]{
          						    Open up the @editor-link[#:public-id "0BzzMl1BJlJDkWEFpWS1RZ01RZEU" "Unit 2 Starter File"]. Make sure you are signed into your Google account, and click the "Save a Copy" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
              				}
              		}
              		@teacher{

              		}
            }
            @point{
            		    @student{
                            As you learned in Unit 1, Pyret allows us to define names for values and expressions, so that we can refer to them later. Every definition you've seen involves an identifier, followed by the equals sign, and an expression to bind to that name. For example, we can define the identifier @code{name} to be the string @code{"Tara"} by writing
                            @code[#:multi-line #t]{
                                name = "Tara"
                            }
                            Some definitions are more complex than that. What identifiers do you see defined in this file?
                    }
                    @teacher{

                    }
            }
            @point{
                    @student{
                            The definitions area contains code to load two tables from Google Sheets; @code{presidents} and @code{nutrition}.  As you saw at the beginning of the lesson, tables need headers to describe them! The @code{load-table:} block specifies the headers for the table being imported! Each of these @code{load-table:} blocks comes after an @code{=} operator which defines the variable names as these tables.

                        @activity[#:forevidence "BS-IDE&1&1"]{
                              To evaluate a variable, we click Run and type its name into the Interactions Area. We do the same thing if that variable is a Number, a String, or even a Table! Click Run, and type each of these programs into the interactions window, then hit Enter/Return.

                          @itemlist[
                              @item{@code{nutrition}}
                              @item{@code{presidents}}
                              @item{@code{cities}}
                          ]
                        }
            		    }
            		    @teacher{
              				The students should not need to know exactly how the table-loading code.  However, for those that are curious:

              				@itemlist[
              						@item{
              								The @code{include} statement allows Pyret to use a supplementary module which can talk to the Google Sheets API.  This lets students use/apply functions that take data from Google Sheets.
              						}
              						@item{
              								The @code{load-spreadsheet} function applications are what will find particular spreadsheets and their content.  The argument is a String that is a unique ID to a particular Google Sheet.  We have hardcoded these IDs in the scaffolding so that they link to our presidents and nutrition tables.
              						}
              						@item{
              								The @code{load-table} command is what actually loads a table that we can use in the interactions window.  In this expression, each of the column names are enumerated (this establishes what the header contains), and says that the source will be the sheets from the @code{load-spreadsheet} functions applications.
              						}
              				]

              		  }
            }
            @point{
          			@student{
          					You have loaded your first tables into Pyret. These tables contain different data: the first is a table about the presidents of the US, and the second has nutritional information about items on a menu. Before we can dive into all of the cool things you can do with tables, we need to understand the two different kinds of data that can appear in tables: categorical and quantitative.	
          			}
          			@teacher{

          			}
          	}
            @point{
                    @student{
                            Let's take a look at another Table.

                            @build-table/cols[
										'("First" "Last" "Eye-Color" "Height")
										'(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
										  ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
										  ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\"")
										  ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
										 (lambda (r c) (para ""))
										 4 8
							]        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            The first kind of data we will look at is @vocab{Quantitative Data}. Quantitative Data always measures an amount of something. If a question asks "how much" there is of something, the answer will be quantitative data.                  
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Look at the @code{Height} column. If you ask the question "How tall is John Doe?" (in other words, how much height does John Doe have?), the answer is 52.0 inches. Quantitative Data usually has units of measurement; in this case the unit of measurement is inches.                    
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Another important fact is that Quantitative Data can be larger or smaller than other Quantitative Data. For example, if we ask the question "Is John Doe taller than Andrea Garcia?" (in other words, does John Doe have more height than Andrea Garcia), it can be answered by comparing their entries in the height column. John Doe's height is bigger than Andrea Garcia's, so we can say yes, he is taller.
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
            		@student{
                            Now look at the Eye Color column.

                            @build-table/cols[
										'("First" "Last" "Eye-Color" "Height")
										'(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
										  ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
										  ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\"")
										  ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
										 (lambda (r c) (para ""))
										 4 8
							]     
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Can we ask the question "Does John Doe have more eye color than Andrea Garcia?"  No. That question makes no sense! This is the second kind of data we will look at, called @vocab{Categorical Data}. We used Quantitative Data to quantify; to ask "how much" there is of something. We use @vocab{Categorical Data} to ask "which one"? In this case, students are put into the same category if they have the same eye color.                   
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                Let's consider eye color. How many different eye colors are there?  
                            }                   
                    }
                    @teacher{
                            Guide students towards this list: Amber, Blue, Green, Brown, Grey, Hazel.                         
                    }
            }
            @point{
                    @student{
                            So if there are only 6 different natural eye colors, then each value in the column has to be one of these categories. We would say that this column has 6 different possible categories.                     
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Navigate back to your pyret program that loads the @code{nutrition} and @code{presidents} tables.
                                    Then, turn to @worksheet-link[#:name "Presidents-Nutrition"] in your workbook and answer the questions about these two data sets. 
                            }                          
                    }
                    @teacher{
                            This workbook assignment could also become a homework assignment, or be made into a quiz/jeopardy style game.                       
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
                                      You'll be adding to this file as we go, and keeping a written repository of your work and your findings as well. We've created @(hyperlink "https://docs.google.com/document/d/1jbKSecOtdzVO4iJsIPQRLvnwrt8GhqVFyXvnukdT_Xo/edit?usp=sharing" "a starter file") for this Report as well - save a copy to your account, and be sure to @bold{bookmark the page so you can return to it later}.    
                                  }
                                  @item{
                                      Take 5 minutes to fill in your name, and answer questions 1-3 in your Report.
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