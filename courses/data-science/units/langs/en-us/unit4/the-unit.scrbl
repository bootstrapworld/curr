#lang curr/lib

@title{Unit 4: Choosing Your Dataset }

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
     #:title "Choose Your Dataset"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students choose a dataset they are interested in}]
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
                          Now it's time to choose a dataset of your own! Throughout this course, you'll be analyzing this dataset and writing up your findings. As you learn new tools for data science, you'll continue to refine this analysis, answering questions and raising new ones of your own!
                          Take 10 minutes to look through the following datasets, and choose one that interests you:
                          @itemlist[
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1SaR2M6Z-s40UuRg3u1aQU-G1GVdcm0RgHpqQ9LNmSQk" "Movies Dataset") (and the @editor-link[#:public-id "1KaHf2DSd5iJ17UsRd61jljsWR_HqRQY2" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1yHPM-poscv6azh59aMwElfUP67P3fMESorVjtMwsFa0" "School Dataset") (and the @editor-link[#:public-id "1371QVz9uLJKCiX_Q3bR93ZZ5EKhAxZoR" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw" "US Income Dataset") (and the @editor-link[#:public-id "1lVDBQiAze_NjH69rWcFi15ApbNPZWXOk" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg" "US Presidents Dataset") (and the @editor-link[#:public-id "18Ux-O_c78jnZ4cFjTwvaZzaBJOch9cTK" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1lOFsofXJNIMKAM8g4Zn688jIdbAK68ovAnzmfuwFd9M" "Countries of the World Dataset") (and the @editor-link[#:public-id "1V1u_kINuc6PCOWZ0WF7a2oZSLbrzRitg" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1-mrDSjS-rWMdiMAIptFS_PHVUFO06lUpYNCiGkYj51s" "Music") (and the @editor-link[#:public-id "1EHpLimHbsZkSie23Dt-COhTDtNQ0_g1Z" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1HJ6wR4IH9j0hqbaP4OXeChOVMbVMyV0vBMu25NUiw1w" "State Demographics") (and the @editor-link[#:public-id "1okOF06x6_UtMgnM8yi6dIGH6ZfBrpEQM" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/182UAmtxaBjIY3cGB9fy8tsl1q3ZJ0fcP4m38i9Sr5l0" "New York City Restaurant Health Inspections") (and the @editor-link[#:public-id "1HpAIsC_3sDWYgtIj0iwgch81MllIa-Yy" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1F5Q2HwyhrhzMBivKNA2qpgUroqGWpDTUKcF3p82pVDA" "Pokemon Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1h3pCuuc0AchFZidLV-9553kGhpRKyYxP" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/126sJLFP8kenombJx5CtR-9D88jgbI_vKlYq30PWT41g" "IGN Video Game Reviews Dataset") (and the @editor-link[#:public-id "1H3-aDMoCNCJtRoUpJfPFRUy2JuhmBNFJ" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1WMJMNqkwuo1vbL0O_C81BPA-R2TFcLWEMUi7cn_ptow" "2016 Presidential Primary Election Dataset") (and the @editor-link[#:public-id "1U_R0ZoRRvUwKy58m9cgJ6AyDHWW1Oh7-" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1Fyp-h8sSggYPHIpvrtBzSrKGa6bZioy1lMTKIC--RH0" "US Cancer Rates Dataset") (and the @editor-link[#:public-id "1Kd9Zi4Z0jKkyxV7rHCw4nNQqbhgpT2Qi" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/19bmTJd2soUvg6FUDIW546jPtiWOERFm2o9z7TLBNTbc" "Summer Olympic Medals Dataset") (and the @editor-link[#:public-id "1HubbGjtE96e3wt0EZqlVWtKstmyPpDd_" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1ZJ9d4BtF6xOqyBdGgjW-vCeJ7-rOHWIhGMiBNwqCEVo" "Winter Olympic Medals Dataset") (and the @editor-link[#:public-id "1QvKr16tceg0wQ9vLfu-iFiZEpUdw5I2L" "Starter file"] for this dataset)
                                     }

                              @item{
                                @(new-tab "https://docs.google.com/spreadsheets/d/157Bi2kniAJybuV1X_9h4Z6DaZSVPK3vPf697feXcyv8" "MLB Hitting Stats Dataset") (and the @editor-link[#:public-id "1_d80_yLylUXz32QrEsN9EjtHEHJ8gB34" "Starter file"] for this dataset)
                                     }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "1sRPS3wuExqrRE0aw-TnqVv25frjBBwii" "Blank Starter file"]) for your project.
                              }
                          ]
                      }
                      @teacher{
                          Make sure students realize this is a firm commitment! The farther they go in the course, the harder it will be to change datasets.
                      }
                }
                @point{
                      @student{
                          @activity[#:forevidence (list )]{
                              @itemlist[
                                  @item{
                                      Once you've found a Starter file for a dataset that interests you, click "Save a Copy" and save the project to your own account. 
                                  }
                                  @item{
                                      Complete @worksheet-link[#:name "My-Dataset"]. Brainstorm a few questions you would like to ask of this dataset. Be sure to check off the ones that CAN be answered! For the ones that can't, what kind of data would you need?
                                  }
                                  @item{
                                      In the Definitions Area, use @code{.row-n} to define @bold{at least two} values, representing different rows in your table. Call them @code{sample1}, @code{sample2}, and so on.
                                  }
                              ]
                          }
                      }       
                      @teacher{
                      
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Visualizing Quantity"
     #:duration "25 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students make pie and bar charts for their datasets, and write up their findings}]
     #:standards (list "Data 3.1.2")
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
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Try making a bar or pie chart of a column in your dataset, and write up your findings on @worksheet-link[#:name "Visualizing-My-Dataset-1"]. 
                        }
                    }       
                    @teacher{
                        Give students 10-15min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                    }              
              }
              @point{
                    @student{
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Do you notice that the outliers all of something in common? What new questions does this raise? Would you like to change your table by filtering it or building a new column? If so, go deeper into your data, using @worksheet-link[#:name "Blank-Table-Plan-1"] and @worksheet-link[#:name "Blank-Table-Plan-2"] to figure out how you want to change your dataset. Write up your findings on @worksheet-link[#:name "Visualizing-My-Dataset-1"].
                        }
                    }
                    @teacher{
                        Give students 5-10min to make their next set, and have them share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                    }
              }
        ]
  }

  @lesson/studteach[
     #:title "Bar & Pie Charts"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to visualize quantity with Pie and Bar charts}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students answer questions using pie and bar charts}]
     #:standards (list "Data 3.1.3")
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
                              You've now seen two kinds of charts: @vocab{bar chart} and @vocab{pie charts}. Both charts involve quantities and labels: each bar and slice is a measure of a quantitative column, and each one has a label. Both charts help us look at the whole dataset at once, and answer questions about @italic{quantity}. As you've observed, bar charts are great when we want to know exactly "how much" of a thing is contained in a single row. Pie charts, on the other hand, are best when we want to know "what percent" of the thing in our table is contained in a single row.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1Z0jE9BugpJlcuRMlHxpLe9FgToJZoU4m" "new copy"].)
                              }

                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's take a look at their contracts...
                              @code[#:multi-line #t]{
                                    # bar-chart :: (t :: Table, label :: String, value :: String) -> Image
                                    # pie-chart :: (t :: Table, label :: String, value :: String) -> Image
                              }
                              The last two functions first consume the @italic{Table} that we want to look at, and their other arguments tell us @italic{which columns to look at} for both the labels and the values.
                      }
                      @teacher{
                        
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")]{
                                  In the Interactions Area, type @code{pie-chart(animals-table, "name", "age")} and hit Enter. What happens? What happens when you hover over a slice of the pie? These plots are @italic{interactive}! This allows us to experiment with the data before generating the final image. 
                              }
                      }
                      @teacher{
                              Hovering over a pie slice or bar reveals the value or percentage of the whole, and the label.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      @itemlist[
                                              @item{
                                                    Create a bar and pie chart showing the age of every animal in the shelter.
                                              }
                                              @item{
                                                    Create a bar and pie chart showing the weight of every animal in the shelter.
                                              }
                                      ]
                              }
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Table Plan Practice"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students use Table Plans to answer questions using pie and bar charts}]
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
                          @activity[#:forevidence (list )]{
                            Turn to @worksheet-link[#:name "Pie-Dog-Weight"], and read the word problem carefully. Then write a Contract and Purpose Statement for this word problem.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @bitmap{images/pie.png}
                          This time, our Result isn't a Table -- it's an @italic{Image}: a pie chart showing the weights of all the dogs in our shelter. @bold{Note:} When writing a Sample Table, it's okay to skip a few columns and focus on the ones you care about. Keep this in mind for the future!
                          @activity[#:forevidence (list )]{
                              Sketch a pie chart based on your Sample Table. When you're done, move on to defining the function, and fill out the methods to define the table. Do we need to build any columns? Filter any rows? Order the table?
                          }
                      }
                      @teacher{
                          Look to make sure students are drawing the right kind of chart, using the right labels, and have slices that are proportional to the data in their Sample Table.
                      }
                }
                @point{
                      @student{
                          We've got most of our function written:
                          @code[#:multi-line #t]{
                          # pie-dog-weight :: (animals :: Table) -> Number
                          # Consume a table of animals, and produce a pie-chart showing the weight of the dogs
                          fun pie-dog-weight(animals):
                            t = animals.filter(is-dog)     # define the table
                            ...                            # produce our result
                          end
                          }
                          What expression will produce our result? Our purpose statement tells us we need to make a @code{pie-chart}, so we can start there. Which table should we use? Which column gives us our labels? Our values?
                      }
                      @teacher{
                          If there's only one method being used, it's convention to put the method call on the same line as the table.
                      }
                }
                @point{
                      @student{
                          Putting it all together, we get:
                          @code[#:multi-line #t]{
                          # pie-dog-weight :: (animals :: Table) -> Number
                          # Consume a table of animals, and produce a pie-chart showing the weight of the dogs
                          fun pie-dog-weight(animals):
                            t = animals.filter(is-dog)     # define the table
                            pie-chart(t, "name", "pounds") # produce our result
                          end
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity[#:forevidence (list )]{
                              When your teacher has checked your paper, type in this function and try it! @bold{Based on this pie chart, does it look like some dogs are a lot heavier than others, or are the weights @italic{evenly distributed}?}
                          }
                          Not at all! Kujo and Mr. Peanutbutter each take up more than 13% of the total weight, but almost every other dog's share is 7% or less.
                      }
                      @teacher{
                          Hit this point hard. Seeing the pie slices gives us a feel for the @italic{distribution} of the dataset.
                      }
                }
                @point{
                      @student{
                          Up to now, the Sample Table has been provided for you. But for our next Table Plan, you'll need to make one of your own! A good Sample Table should have:
                          @itemlist[
                                @item{
                                    @italic{At least} the columns that matter - whether we'll be ordering or filtering by those columns.
                                }
                                @item{
                                    A good Sample Table has enough rows to be a representative sample of the dataset. If our dataset has a mix of dogs and cats, for example, we want at least one of each in this table.
                                }
                                @item{
                                    A good Sample Table has rows in random order, so that we'll notice if we need to order the table or not.
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
                          @activity[#:forevidence (list )]{
                              @bitmap{images/bar.png}
                              Turn to @worksheet-link[#:name "Bar-Kitten-Adoption"], and fill out the Contract and Purpose Statement. First, we'll provide a name that refers back to our dataset: @code{animals-table}. Then we need to provide a good Sample Table for this word problem. Fill out a good Sample Table and write your result.
                          }
                    }
                    @teacher{
                          Be sure to check the Sample Tables, and even have students trade workbooks and grade each other's Sample Tables.
                    }
              }
              @point{
                    @student{
                          @activity[#:forevidence (list )]{
                              Once your teacher has checked your Sample Table, type in the code for this function and try it out!
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
                     @activity[#:forevidence "BS-IDE&1&1"]{
                            Make sure to save your work.  Hit the Save button in the top left. This will save your program in the code.pyret.org folder within your Google Drive.
                  }
              }
                    @teacher{
                             If your students are working in groups, make sure that each student has access to a version of the program.  Students can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option.
                   }
              }
        ]
  }
}
