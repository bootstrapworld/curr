#lang curr/lib

@title{Unit 5: Choosing Your Dataset }

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
    Students deepen their understanding of Table Plans, learning how to write a good sample table. They also choose their own datasets, and explore them by writing filters and column builders using the Design Recipe.
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
                          @activity[#:forevidence "BS-IDE&1&1"]{
                            Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1eYSZKxTbnnNQ82VJRBA5XEszucdJXZ-W" "new copy"].)
                          }
                    }
                    @teacher{
                            
                    }
            }
            @point{
                @student{
                    @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                        Look at the pie and bar charts on @worksheet-link[#:name "Visualizing-Quantity"], and write down what you notice and wonder. @bold{ Why are some questions easier to answer with one kind of chart or another? }
                    }
                }       
                @teacher{
                    Have students share back. Encourage students to read their observations aloud, to make sure they get practice saying and hearing these observations.
                }              
            }
            @point{
                  @student{
                          You've now seen two kinds of charts for visualizing @italic{categorical} data sets: @vocab{bar charts} and @vocab{pie charts}. We can look at heights of bars or areas of slices to see how all the data values are distributed into various categories. A pie chart is more useful if we want to convey a visual impression of how common or uncommon each category is compared to the @italic{whole group} of values. A bar chart stresses how common or uncommon each category is compared to @italic{one another}. Bar charts also work better when categories involve a progression in size: data gathered about T-Shirt sizes, for example, would make more sense than a pie chart. Finally, pie charts tend to focus on @italic{percentages}, while bar charts may show either @italic{frequencies or percentages}.
                  }
                  @teacher{
                  
                  }
            }
      ]
  }



  @lesson/studteach[
     #:title "Table Plan"
     #:duration "20 minutes"
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
                          So far, you've had a chance to run some simple analyses on the Animals Dataset. You've made charts, written functions using the Design Recipe and then used them with methods to filter rows and build columns. You've used Table Plans to map out your analysis, tying together the Design Recipe and methods.
                      }
                      @teacher{
                          If students need more practice with the Design Recipe, now's the time. Do NOT proceed past this point without making sure they are comfortable writing simple functions.
                      }
                }
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
                @point{
                      @student{
                          @activity[#:forevidence (list )]{
                              @itemlist[
                                  @item{
                                      Once you've found a Starter file for a dataset that interests you, click "Save a Copy" and save the project to your own account. 
                                  }
                                  @item{
                                      Complete @worksheet-link[#:name "My-Dataset"]. Brainstorm a few questions you would like to ask of this dataset. What kinds of questions are they?
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
                            Look at the spreadsheet for your data. What do you @bold{notice}? What do you @bold{wonder}?
                            Write down your noticings and wonderings on @worksheet-link[#:name "Unit-3-Blank"]. 
                          }
                      }
                      @teacher{
                          Have students share back.
                      }
                }
                @point{
                      @student{
                          Think about all the different ways you might want to look at your dataset. Would you want to sort it by one column or another? Filter it into different subsets, like we did with the Animals Dataset? Would you want to build new columns?
                          @activity{
                              @itemlist[
                                  @item{ 
                                      Take a minute to think about how you'd like to experiment with your dataset, and write your plans on @worksheet-link[#:name "Dataset-Plans"]. 
                                  }
                                  @item{
                                      In the Interactions Area, use @code{.order-by} to sort your dataset according to what you wrote on @worksheet-link[#:name "Dataset-Plans"].
                                  }
                                  @item{
                                      In the Definitions Area, use @code{.row-n} to define @bold{at least three} values, representing different rows in your table.
                                  }
                              ]
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              Turn to @worksheet-link[#:name "Filtering-Recipes"], and use the Design Recipe to write the filter functions that you planned out on @worksheet-link[#:name "Dataset-Plans"]. When the teacher has checked your work, type them into the Definitions Area and use the @code{.filter} method to define your new tables.
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
                        @activity[#:forevidence (list "Data 3.1.2&1&1" "Data 3.1.2&1&2" "Data 3.1.2&1&3" "Data 3.1.2&1&4" "Data 3.1.2&1&5")]{
                            Take 10min to make at least one bar and pie chart of columns in one of your tables, and write up your findings on @worksheet-link[#:name "Visualizing-My-Dataset-1"]. 
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
