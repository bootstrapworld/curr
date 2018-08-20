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
                            Open your "Animals Dataset (w/Functions)" file. (If you do not have this file, or if something has happened to it, you can always make a @editor-link[#:public-id "1mhIjMpk3PM6D9EeY8-6VI95kDLVAPFy5" "new copy"].)
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
                          You've now seen two kinds of charts for visualizing @italic{quantity}: @vocab{bar charts} and @vocab{pie charts}. Both charts involve quantities and labels: each bar and slice is a measure of a quantitative column, and each one has a label. Both charts help us look at the whole dataset at once, and answer questions about @italic{quantity}. As you've observed, bar charts are great when we want to know exactly "how much" of a thing is contained in a single row. Pie charts, on the other hand, are best when we want to know "what percent" of the thing in our table is contained in a single row.
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
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1SaR2M6Z-s40UuRg3u1aQU-G1GVdcm0RgHpqQ9LNmSQk" "Movies Dataset") (and the @editor-link[#:public-id "18y_TnH69lbvT1lQVh5k-cTEB9aVHaame" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1yHPM-poscv6azh59aMwElfUP67P3fMESorVjtMwsFa0" "School Dataset") (and the @editor-link[#:public-id "1419VGxyYjd3XDPbgObUa-LMufZe3KDZa" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw" "US Income Dataset") (and the @editor-link[#:public-id "1VylyurhJru_0g3C3ne3SK04j16bGYbEW" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg" "US Presidents Dataset") (and the @editor-link[#:public-id "1HHKNnHAdY1BuDrjAJmjVhchPaV77YKk9" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1lOFsofXJNIMKAM8g4Zn688jIdbAK68ovAnzmfuwFd9M" "Countries of the World Dataset") (and the @editor-link[#:public-id "1ONLmATLi5r6GA9nGPx50I9pWA3ZCx2OA" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1-mrDSjS-rWMdiMAIptFS_PHVUFO06lUpYNCiGkYj51s" "Music") (and the @editor-link[#:public-id "1f6yqemcHqLkQzmhYILuTMxL3m4qhTvX0" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1HJ6wR4IH9j0hqbaP4OXeChOVMbVMyV0vBMu25NUiw1w" "State Demographics") (and the @editor-link[#:public-id "1KvMTb2mQrpUL9DSe675t-1DpNr5J1CO5" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/182UAmtxaBjIY3cGB9fy8tsl1q3ZJ0fcP4m38i9Sr5l0" "New York City Restaurant Health Inspections") (and the @editor-link[#:public-id "12jtxwxPNSrdhA4a1YZ4RNzw-I8HPXzD6" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1F5Q2HwyhrhzMBivKNA2qpgUroqGWpDTUKcF3p82pVDA" "Pokemon Characters") (and the @editor-link[#:public-id "1h3pCuuc0AchFZidLV-9553kGhpRKyYxP" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/126sJLFP8kenombJx5CtR-9D88jgbI_vKlYq30PWT41g" "IGN Video Game Reviews Dataset") (and the @editor-link[#:public-id "1H3-aDMoCNCJtRoUpJfPFRUy2JuhmBNFJ" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1WMJMNqkwuo1vbL0O_C81BPA-R2TFcLWEMUi7cn_ptow" "2016 Presidential Primary Election Dataset") (and the @editor-link[#:public-id "1gy32BVXdlyS1KqZ5pXcqg5APbJoqZsWJ" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1Fyp-h8sSggYPHIpvrtBzSrKGa6bZioy1lMTKIC--RH0" "US Cancer Rates Dataset") (and the @editor-link[#:public-id "1phjRq-YMs8ceo0vJE8iWQZeigBtb1QBU" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/19bmTJd2soUvg6FUDIW546jPtiWOERFm2o9z7TLBNTbc" "Summer Olympic Medals Dataset") (and the @editor-link[#:public-id "1kOV5CEDMl622am-BGa2oZxQxRsthYQA8" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1ZJ9d4BtF6xOqyBdGgjW-vCeJ7-rOHWIhGMiBNwqCEVo" "Winter Olympic Medals Dataset") (and the @editor-link[#:public-id "1r_aCTPYC9y1GVcqCEoB1_EGdPITqIMKZ" "Starter file"] for this dataset)
                                     }

                              @item{
                                @(new-tab "https://docs.google.com/spreadsheets/d/157Bi2kniAJybuV1X_9h4Z6DaZSVPK3vPf697feXcyv8" "MLB Hitting Stats Dataset") (and the @editor-link[#:public-id "1cyBkKP9SzKwsDJD4C7XOx51qjbetTMBs" "Starter file"] for this dataset)
                                     }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "1eiT69ktb7vXndMd63K68WB5DACJfoWeN" "Blank Starter file"]) for your project.
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
