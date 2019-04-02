#lang curr/lib

@title{Unit 3: Exploring Datasets }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat, string-contains} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{==, <, >, <=, >=, string-equal} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter}
                                              ""))]{
  @unit-descr{
      Students learn to prepare for analyzing a new dataset by considering logical subsets of that data. They begin with the Animals Dataset, and then apply what they've learned to a dataset of their own choosing. In the process, they practice using the Design Recipe to create filter functions, and come up with questions they wish to explore.
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
     #:standards (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")
     #:materials @itemlist[]
     #:preparation @itemlist[
        @item{Computer for each student (or pair), with access to the internet}
        @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbooks"], and something to write with}]
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
                        @activity{
                           Take 10m and write a function @code{is-dog}, then type it into the Definitions Area.
                        }
                    }
                    @teacher{

                    }
                }
        ]
  }

  @lesson/studteach[
     #:title "Making Subsets"
     #:duration "20 minutes"
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
                        Data Science is all about making predictions based on data. Suppose we want to survey Americans and try to predict our next president will be. Obviously, it would take too long to ask everyone who they're voting for! Instead, pollsters try to take a @italic{sample} of Americans, and generalize the opinion of the sample to estimate how Americans as a whole feel.
                        @activity{
                            @itemlist[
                              @item{
                                Would it be problematic to only call voters who are registered Democrats? To only call voters under 25? To only call regular churchgoers? Why or why not?
                              }
                              @item{
                                Suppose we wanted to ask women how they feel about a particular issue. Should we still make sure we're surveying men, too? Why or why not?
                              }
                            ]
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        As you can see, sampling is a complicated issue! Depending on the question we want to answer, sometimes it makes sense to carve out a subset of the data (e.g. - calling only women), and sometimes it makes sense to aim for a random sample. In this Unit, we'll be practicing what you learned about writing functions, and then using the @code{.filter} method to create subsets.
                    }
                    @teacher{

                    }
                }
                @point{                      
                      @student{
                          @bannerline{ 
                              Make subsets first!
                          }
                          Data Scientists don't always know what the interesting questions are right away. So whenever they explore a dataset, one of the first things do is define some logical subsets, just to have them handy later. Someone looking at our animals dataset might want to consider "just the lizards" or "just males".
                          @activity{
                              What subsets make sense for the animals dataset? Turn to @worksheet-link[#:name "My-Dataset-Subsets"] and write down some ideas, as well as the code that would tell you if a single animal is in that subset.
                          }
                      }
                      @teacher{
                          Collect student responses, and write them on the board. 
                      }
                }
                @point{
                      @student{
                          Sometimes we want to create a table that's just a @italic{random sample} of an existing table. Type the following code into the Definitions Area (left-hand side of your screen), and click "Run".
                          @code[#:multi-line #t]{
                              small-sample = random-rows(animals-table,  5)
                              large-sample = random-rows(animals-table, 30)
                          }
                          @activity{
                              @itemlist[
                                  @item{
                                    What do you get when you evaluate @code{small-sample} in the Interactions Area? @code{large-sample}?
                                  }
                                  @item{
                                    What is the contract for @code{random-rows}? What does the function do?
                                  }
                              ]
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          We already know how to define values, and how to filter a dataset. So let's define some subsets, in addition to the random samples we just made:
                          @code[#:multi-line #t]{
                              dogs  = animals-table.filter(is-dog)
                              cats  = animals-table.filter(is-cat)
                              fixed = animals-table.filter(is-fixed)
                              young = animals-table.filter(is-young)
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          We can make a pie-chart showing how many of each species is in the shelter, by writing
                          @code[#:multi-line #t]{
                            pie-chart(count(animals-table, "species"), "value", "count")
                          }
                          @activity{
                            Which of our subsets do you think will give us @italic{the most accurate approximation} of the original chart?
                            @code[#:multi-line #t]{
                              pie-chart(count(dogs, "species"), "value", "count")
                              pie-chart(count(cats, "species"), "value", "count")
                              pie-chart(count(fixed, "species"), "value", "count")
                              pie-chart(count(young, "species"), "value", "count")
                              pie-chart(count(small-sample, "species"), "value", "count")
                              pie-chart(count(large-sample, "species"), "value", "count")
                            }
                            Compare the charts you get from each of these. Which one is the most representative of the whole population? Why?
                          }
                      }
                      @teacher{

                      }
                }
      ]
  }


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
                                  Movies (@(new-tab "https://docs.google.com/spreadsheets/d/1ldK-Xte5xCAPd6hz2wreBaJzuw-voe4q6ui9QkFGz8w" "Dataset") | @editor-link[#:public-id "1jn4q9ZXJ643Rmk0sQ443CLaTIF2vAN38" "Starter file"])
                              }
                              @item{
                                  Schools (@(new-tab "https://docs.google.com/spreadsheets/d/1XeeyAuF_mtpeCw2HVCKjvwW1rreNvztoQ3WeBlEaDl0" "Dataset") | @editor-link[#:public-id "1SA8ENBl0ayfyxoFHSUpMJ-PPiSxzipS3" "Starter file"])
                              }
                              @item{
                                  US Income (@(new-tab "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw/" "Dataset") | @editor-link[#:public-id "1qSK5KX7cfwM4c6XtJFg5gPcVp9OBSbOU" "Starter file"])
                              }
                              @item{
                                  US Presidents (@(new-tab "https://docs.google.com/spreadsheets/d/1Frt37-nBHHxvJVBKzKLRD3kbjPLhc8CYUaIlNeNWl94" "US Presidents Dataset") | @editor-link[#:public-id "1oDxvkNZqK7qrxKqw_c6WenSWMKDSe_nt" "Starter file"])
                              }
                              @item{
                                  Countries of the World (@(new-tab "https://docs.google.com/spreadsheets/d/19VoYxPw0tmuSViN1qFIkyUoepjNSRsuQCe0TZZDmrZs" "Dataset") | @editor-link[#:public-id "14TwfS8kvwEgQRsl2CTzyLyN9uKwbDYTu" "Starter file"])
                              }
                              @item{
                                  Music (@(new-tab "https://docs.google.com/spreadsheets/d/1Yzo8GuGhMDVNyAI5OacmKZ53xJplZbXF5FT6Lwitp0w" "Dataset") | @editor-link[#:public-id "1UUvwXUMWAEWSlWF1ST4BvQOrUpyxqgwh" "Starter file"])
                              }
                              @item{
                                  New York City Restaurant Health Inspections (@(new-tab "https://docs.google.com/spreadsheets/d/1inK0kq8bNeN1vYbx0HpNZ8xHOp5pmP2FoLcfK9pQhJI" "Dataset") | @editor-link[#:public-id "1hiXWzF06SmgaF_r8DlQrzBm4e96Xpm9_" "Starter file"])
                              }
                              @item{
                                  Pokemon Characters (@(new-tab "https://docs.google.com/spreadsheets/d/1S8jf4Qf94TJKGLCcTA-Fqn4YXE7dGf_PIxv5MUeUPVo" "Dataset") | @editor-link[#:public-id "1zxltGamxQ07jwz24ZGzRwOi8STPi5rcq" "Starter file"])
                              }
                              @item{
                                  IGN Video Game Reviews (@(new-tab "https://docs.google.com/spreadsheets/d/1Ss221kjz2WJUsTlxK7TcnsXLPoSbnfUKv-JP8gCiGRw" "Dataset") | @editor-link[#:public-id "1i9ZlsGccUJ08ralo1FPgRjFALAZNnetr" "Starter file"])
                              }
                              @item{
                                  2016 Presidential Primary Election (@(new-tab "https://docs.google.com/spreadsheets/d/1fgIREXT5lAaAPWqrNP3S191ID_ecoXDjBe_gAC00-M4" "Dataset") | @editor-link[#:public-id "11_Ogov1gClfqHC5JBDh9mnzni66SyurS" "Starter file"])
                              }
                              @item{
                                  US Cancer Rates (@(new-tab "https://docs.google.com/spreadsheets/d/1Fyp-h8sSggYPHIpvrtBzSrKGa6bZioy1lMTKIC--RH0" "Dataset") | @editor-link[#:public-id "1rpGtXWTPZltkcAmIsB_2S8DYAaD5-VwU" "Starter file"])
                              }
                              @item{
                                  US State Demographics (@(new-tab "https://docs.google.com/spreadsheets/d/1AwoBUlqGbrE77gdjd8tOIPrVO9Vmzs6YB1zLVmJkM7M" "Dataset") | @editor-link[#:public-id "1YNYMgohYCkYq76xERwYyX1Vw3zmxk_vu" "Starter File"])
                              }
                              @item{
                                  Sodas (@(new-tab "https://docs.google.com/spreadsheets/d/15n0dLqBWffE2JNOmYHcvavqMwvHXpy5_UyZfT3Q7pfs" "Dataset") | @editor-link[#:public-id "1vWLU4hkojnMrq4omDnS50vB4Fwxv5YmA" "Starter file"])
                              }
                              @item{
                                  Cereals (@(new-tab "https://docs.google.com/spreadsheets/d/1y3AoywSnyGpu-QmmEwKvW-xstZ6B9JhH5gTUx5XYTo4" "Dataset") | @editor-link[#:public-id "1YT-DLYzptb6_SzQ0fgo51jgd_D_iZolw" "Starter file"])
                              }
                              @item{
                                  Summer Olympic Medals (@(new-tab "https://docs.google.com/spreadsheets/d/1YgM_-06BWTbm0J4853OFSX7LY9OpY4IyflVB9WN57_o" "Dataset") | @editor-link[#:public-id "1sksPktTVvid4iCPY0HRt7zau6zb5-2Lp" "Starter file"])
                              }
                              @item{
                                  Winter Olympic Medals (@(new-tab "https://docs.google.com/spreadsheets/d/1LoDnM1aP7bUyPXN7i_U0pDMFsRrX1WjzL0P8nOb2tuo" "Dataset") | @editor-link[#:public-id "1o7AVBM2YFbcho3L5wgFK_3NuP-VUrmIF" "Starter file"])
                              }
                              @item{
                                MLB Hitting Stats (@(new-tab "https://docs.google.com/spreadsheets/d/1xjC1XZWACvQtfwHdGk_BlE2jm4aleMADHTt6PEocCjg" "Dataset") | @editor-link[#:public-id "1ZqtQdMEL6hLsnsrnHaS-lKumDErd6wcy" "Starter file"])
                              }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "1jJioYONDaN3qx5VHFTHHy2U62kBvTu5t" "Blank Starter file"]) for your project.
                              }
                          ]
                      }
                      @teacher{
                          Make sure students realize this is a firm commitment! The farther they go in the course, the harder it will be to change datasets.
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Exploring Your Dataset"
     #:duration "40 minutes"
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
                          @activity{
                            @itemlist[
                              @item{
                                Look at the spreadsheet for your data. What do you @bold{notice}? What do you @bold{wonder}? Complete @worksheet-link[#:name "My-Dataset"].
                              }
                              @item{
                                Turn to @worksheet-link[#:name "My-Dataset"], and come up with at least two Lookup Questions, two Compute Questions, and two Relate Questions. You may already have some from your "wonder" section on @worksheet-link[#:name "My-Dataset"]. 
                              }
                              @item{
                                In the Definitions Area, use @code{random-rows} to define @bold{at least three} tables of different sizes: @code{small-sample}, @code{medium-sample}, and @code{large-sample}.
                              }
                              @item{ 
                                Take a minute to think about how you'd like to experiment with your dataset, and write your plans on @worksheet-link[#:name "My-Dataset-Subsets"]. 
                              }
                              @item{
                                In the Definitions Area, use @code{.row-n} to define @bold{at least three} values, representing different rows in your table.
                              }
                            ]
                          }
                      }
                      @teacher{
                          Have students share back.
                      }
                }
                @point{
                      @student{
                          @activity{
                              Turn to @worksheet-link[#:name "Filtering-Recipes"], and use the Design Recipe to write the filter functions that you planned out on @worksheet-link[#:name "My-Dataset-Subsets"]. When the teacher has checked your work, type them into the Definitions Area and use the @code{.filter} method to define your new subset tables.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Choose one categorical column from your dataset, and try making a bar or pie-chart for the whole table. Now try making the same chart for each of your subsets. Which was the most accurate?
                        }
                    }       
                    @teacher{
                        Have students share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
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
                          Congratulations! You've explored the Animals dataset, formulated your own and begun to think critically about how questions and data shape one another. For the rest of this course, you'll be learning new programming and Data Science skills, practicing them with the Animals dataset and then applying them to your own data.
                    }
                    @teacher{
                          Have students share which dataset they chose, and pick one question they're looking at.
                    }
              }
        ]
  }
}
