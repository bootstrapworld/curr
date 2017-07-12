#lang curr/lib

@title{Unit 2: Lists and Tables}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+, -, *, /, num-sqrt, num-sqr})
                                       (list "String" "n/a")
                                       (list "Image" @code{<Plot>.display()})
                                       (list "Series" @code{function-plot})
                                       (list "Plot" @code{plot}))]{
  @unit-descr{Is there a relationship between the amount of sugar in a meal, and the number of calories? Do more caloric meals tend to have more sugar? To answer this question, students are introduced to Lists and Tables in Pyret, as well as scatter plots as a way of visualizing data}
}
@unit-lessons{

@lesson/studteach[
     #:title "Introduction"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[
                                @item{
                                    Show students the @resource-link[#:path "OpeningQuestions.pdf" #:label "opening questions"], either as a handout or on posters set up around the room.
                                }
                             ]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
            @point{
              @student{
                  A lot restaurants these days publish nutrition information as part of their menu. When you look at these menus, you can find out how many calories each item contains. How much of a role does sugar play in that? Do sugary meals @italic{always} have more calories than meals with less sugar? Do high-calorie meals @italic{always} have a lot of sugar in them? 
                    @activity{
                        Turn to on @worksheet-link[#:name "Unit-2"]. Take two minutes to write down what you think, and why.
                    }
              }
              @teacher{
                  Give the class a minute for open discussion. The more they are engaged with the question, the more substantial their answers will be.
              }
            }
            @point{
              @student{
                  So far you have learned the fundamentals of writing programs that do work on simple data like Numbers (@code{1, -6, 3.5,} etc.) and Strings (@code{"hello", "17",} etc.). As data scientists, we need write programs that work on complex data like @italic{restaurant menus}, which can have many related parts and contain dozens or millions of entries. In this unit, you will learn how Pyret works with real-world data, and how to answer data science questions like this one by writing programs over that data.
              }
              @teacher{

              }
            }

        ]

}

@lesson/studteach[
     #:title "Tablular Data"
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
							           Show the kids slides with each image of the example table, focusing on the different aspects of tables. Express that each row represents a distinct object, and each entry in a row stores information about that object.
					}
            }
            @point{
          					@student{
          							This is a @vocab{table} containing information about students in a fourth grade class.  @vocab{table}s are collections of cells - or "entries", where each @vocab{entry} contains one value.  In most of the tables you will encounter, these values will be of type Number or String.
          					}
                    @teacher{
														 
					          }
            }
			      @point{
                    @student{
          							@vocab{Table}s are organized into @vocab{column}s and @vocab{row}s.
                                      @activity{How many columns does this table have?}

          							All of the entries in a particular @vocab{column} will contain values that are the same type, and represent the same thing. For example, each entry in the 3rd column represents the eye color of a person in the class. 

          							@build-table/cols[
          										'("Eye-Color")
          										'(("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\""))
          										 (lambda (r c) (para ""))
          										 1 8
          							]
          					}
                    @teacher{

          					}
            }
			      @point{
                    @student{
          							The first @vocab{row} in a table is a special row called the @vocab{header row}. Each part of the @vocab{header row} is the name of a particular @vocab{column}.

          							@build-table/cols[
          										'("First" "Last" "Eye-Color" "Height")
          										'()
          										 (lambda (r c) (para ""))
          										 4 0
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
          						    Open up the @editor-link[#:public-id "0BzzMl1BJlJDkZmxmNkliQ3RFZ2s" "Unit 2 Starter File"]. Make sure you are signed into your Google account, and click the "Save a Copy" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
              				}
              		}
              		@teacher{

              		}
            }
            @point{
            		    @student{
                            As you learned in Unit 1, Pyret allows us to define names for values and expressions, so that we can refer to them later. Every definition you've seen involves an identifier, followed by the equals sign, and an expression to bidn to that name. For example, we can define the identifier @code{name} to be string @code{"Tara"} by writing
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
                            The definitions area contains code to load two tables from Google Sheets; @code{presidents} and @code{nutrition}.  As you saw at the beginning of the lesson, tables need header rows to describe them! The @code{load-table:} block specifies the header row for the table being imported! Each of these @code{load-table:} blocks comes after an @code{=} operator which defines the variable names as these tables.

                        @activity[#:forevidence "BS-IDE&1&1"]{
                              To evaluate a variable, we click Run and type its name into the Interactions Area. We do the same thing if that variable is a Number, a String, or even a Table! Click Run, and type each of these programs into the interactions window, then hit Enter/Return.

                          @itemlist[
                              @item{
                                  @code{nutrition}
                              }
                              @item{
                                  @code{presidents}
                              }
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
              								The @code{load-table} command is what actually loads a table that we can use in the interactions window.  In this expression, each of the column names are enumerated (this establishes what the header row contains), and says that the source will be the sheets from the @code{load-spreadsheet} functions applications.
              						}
              				]

              		  }
            }
        ]
   }

@lesson/studteach[
     #:title "Quantitative and Categorical Data"
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
        					You have loaded your first tables into Pyret. These tables contain different data: the first is a table about the presidents of the US, and the second has nutritional information about items on a menu. Before we can dive into all of the cool things you can do with tables, we need to understand the two different kinds of data that can appear in tables: categorical and quantitative.	
        			}
        			@teacher{

        			}
        	}
            @point{
                    @student{
                            Let's take another look at the first example table we saw in Unit 2.

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
                            The first kind of data we will look at is @vocab{Quantitative Data}. @vocab{Quantitative Data} always measures an amount of something. If a question asks "how much" there is of something, the answer will be quantitative data.                  
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
     #:title "Extracting Lists from Tables"
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
                              Tables are 2-dimensional collections of data, but we often want to ask 1-dimensional questions of them. For example, if we ask "what is the lowest amount of sodium on the menu", or "What is biggest serving size possible", these are questions that @italic{only involve one column at a time}.  We need some way of looking at each column individually in our programs.  In other words, we often want to get 1-dimensional data @bold{out of of a 2-dimensional table}.

                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              The @vocab{extract} operation does just that!

                              @code[#:multi-line #t]{
                                  sodium-list = extract sodium from nutrition end
                              }

                              @activity{What is the name of the identifier being defined here? What do you think its value is?}
                              After running this program, typing @code{sodium-list} into the interactions window and hitting Return gives us the following list: @code{[list: 480, 680, 820, 360, 1300, 790, 160, 150, 680, 130]}.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's examine this line of code, piece by piece.

                              @itemlist[
                                      @item{
                                            @code{extract} tells Pyret that we want to take a particular column out of a table. 
                                      }
                                      @item{
                                            After the @code{extract} keyword, we choose the name of 1 column we want 
                                            to see as a list.  In this case, it is the @code{sodium} column.
                                      }
                                      @item{
                                            Then, the @code{from} keyword, which indicates which table we are extracting the column from.  Following this is the table name, which is @code{nutrition}.
                                      }
                                      @item{
                                            Finally, an @code{end} keyword tells Pyret that our line of code involving a table is done.
                                      }
                              ]


                      }
                      @teacher{
                              This is the first example of an expression that consumes a table that students will need to write for themselves.  These expressions (@code{extract, sieve, select, order}, and @code{extend}) have fundamentally different syntax than programs they have seen with arithmetic or function application.
                      }
                }
                @point{
                      @student{
                              @vocab{Lists} are a new type, and we write the type of a list in terms of it's contents. For example, a List of Numbers would be of type @code{List<Number>}. How do you think you would write the type for a List of Strings?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                              @item{
                                                    Define a list called @code{state-list} containing the @code{state} column from @code{presidents}.
                                              }
                                              @item{
                                                    Define a list called @code{calories-list} containing the @code{calories} column from @code{nutrition}.
                                              }
                                              @item{
                                                    Define a list called @code{sugar-list} that contains the @code{sugar} column from @code{nutrition}.
                                              }
                                      ]
                                      Notice that these Lists contain just one type of data: either only Strings, or only Numbers.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            In what ways are Lists different from Tables? Tables are 2-dimensional, while Lists are 1-dimensional. Tables also have a @italic{header row}, which associates a name with each column. Lists, on the other hand, have no header.  

                            However, List do share some qualities with tables. They have multiple entries, and those entries are in a specific @italic{order}. They can also be filled with either quantitative or categorical data. In the next lesson, we'll learn about functions that let us ask questions of lists, to help us look for ways to measure a set of data.
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
                          Do foods with more sugar tend to have more calories? Now that we have calories and sugar extracted as lists, we can plot these data points and find out! Once again, we'll want to include the @code{plot-list} file, and all the functions defined within it. This time, instead of using @code{function-plot} we'll use @code{scatter-plot}, which takes in two lists of numbers. 
                          @code[#:multi-line #t]{
                            sugar-v-calories = scatter-plot(calories-list, sugar-list)
                          }
                          What do you think the contract is for @code{scatter-plot}? Copy it down into your Contracts page. Once we've created the series, it's time to plot it. 
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          There are lots of ways to customize a @code{Plot}, and you can combine options by chaining them together:
                          @code[#:multi-line #t]{
                            plot1 = plot(sugar-v-calories)
                            plot2 = plot(sugar-v-calories).title("Calories and Sodium")
                            plot3 = plot(sugar-v-calories).title("Calories and Sodium").x-max(600)
                            plot4 = plot(sugar-v-calories).title("Calories and Sodium").x-max(600).y-max(400)
                          }
                      }       
                      @teacher{
                          The options you can share with your students at this time are @code{x-min}, @code{y-min}, @code{x-max}, @code{y-max}, @code{title}. The full set can be found in the @(hyperlink "https://www.pyret.org/docs/latest/plot.html#%28part._plot_.Plot.Options%29" "Pyret Documentation").
                      }
                }
              @point{
                  @student{
                          @activity{
                            Use the @code{plot} function to draw this scatter plot. What do you notice about this plot? Is there a relationship between sugar and calories? Take two minutes and write your answer on on @worksheet-link[#:name "Unit-2"] - does this support your hypothesis or not?
                            @bold{What other kinds of relationships can you find in these tables?}
                          }
                          Later on in this class, you'll learn how to plot many kinds of data, and how to search for trends and relationships like this one!

                      }
                      @teacher{
                          Have the class debrief their findings. Did anyone's mind change after looking at the data? Is the data convincing or not? Why or why not?
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
                          Now that you've had a chance to look at a few tables, it's time to choose a dataset of your own! Thoughout this course, you'll be analyzing this dataset and writing up your findings. As you learn new tools for data science, you'll continue to refine this analysis, answering questions and raising new ones of your own!
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
							             Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you answer more complex questions, and in greater detail.

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