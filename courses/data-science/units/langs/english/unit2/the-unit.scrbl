#lang curr/lib

@title{Unit 2: Validity and Analysis }

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
      Students are introduced to the Animals dataset, consider the kinds of questions that can be asked of the dataset, and learn about threats to validity while examining claims. Finally, they choose their dataset, and come up with questions of their own.
  }
}
@unit-lessons{


  @lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
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
                            Now, let's take a look at a real dataset!
                            @activity[#:forevidence (list )]{
                                @itemlist[
                                    @item{
                                        Open the @(new-tab "https://docs.google.com/spreadsheets/d/19m1bUCQo3fCzmSEmWMjTfnmsNIMqiByLytHE0JYtnQM/" "Animals Spreadsheet") in a new tab. Take a moment to look around. What do you think this table is for?
                                    }
                                    @item{
                                        This is some data from an animal shelter, listing animals that have been adopted. We'll be using this as an example throughout the course, but you'll be applying what you learn to @italic{a dataset you choose} as well.
                                    }
                                    @item{
                                        Open up the @editor-link[#:public-id "0BzzMl1BJlJDkYkhKMG51VlRiWk0" "Animals Dataset"] starter file in a new tab. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
                                    }
                                ]
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            This file contains some new code that you haven't seen before. As with our Shapes file, we have a few @code{include} lines which import useful libraries for our course. This time, we also include a library that lets us work with Google Sheets:
                            @code[#:multi-line #t]{
                              include gdrive-sheets
                              include tables
                              include image
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            On line 9, the @code{load-spreadsheet} function is used to load our animal shelter spreadsheet from Google Drive, and give that file a name: @code{shelter-sheet}. After that, we see the following code:
                            @code[#:multi-line #t]{
                              # load the 'pets' sheet as a table called animals
                              animals-table = load-table: name, species, age, fixed, legs
                                source: pets-sheet.sheet-by-name("pets", true)
                              end
                            }
                            Just as you saw with our @code{shapes} example, this code @italic{defines a new table}. This time, it's called @code{animals-table}, and it's loaded from our Google Sheet. You can see the names we are giving to each of the columns, called @code{name}, @code{species}, @code{gender}, @code{age}, @code{fixed}, @code{legs}, @code{pounts} and @code{weeks}. (We could use any names we want for these columns, but it's always a good idea to pick names that make sense!)
                      }
                      @teacher{
                            Have students look back at the column names in the Google Sheet, and in the @code{load-table} function. Point out that they refer to the same columns, even though they have different names!
                      }
                }
                @point{
                      @student{
                            Click "Run", and type @code{animals-table} into the Interactions Area to see what this table looks like.
                            @itemlist[
                              @item{How many columns does this table have?}
                              @item{For each column, is the data quantitative or categorical? }
                              @item{For each column, what datatype is being used? Numbers? Strings? Images? Booleans? }
                              @item{How could you get row for the animal named "Toggle"? }
                              @item{How could you get the age of the animal named "Toggle" from that row? }
                              @item{How could you get the species of the animal named "Fritz"? }
                              @item{How could you get the number of legs of the animal named "Mittens"? }
                            ]
                      }
                      @teacher{
                            Use the last four questions to review @code{get-row} and row-accessors (introduced in Unit 1) before proceeding. Review with the whole class.
                      }
                }
                @point{
                      @student{
                            Turn to @worksheet-link[#:name "Animals-Dataset"] in your Student Workbook, and fill in the table in Question 2.
                      }
                      @teacher{

                      }
                }
        ]
  }

   @lesson/studteach[
     #:title "What can you answer?"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about different categories of questions}]
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
                          Once we have a dataset, we can start answering questions! But how do you know what questions to ask? There's an art to asking the right questions, and good Data Scientists think hard about what kind of questions can and can't be answered.
                  }
                  @teacher{
                          Have students brainstorm some questions they might ask of the animals table.
                  }
            }
            @point{
                  @student{
                          Most questions can be broken down into one of three categories:
                          @itemlist[
                              @item{
                                @bold{Lookup questions} - These can be answered simply by looking up a particular value in the table and reading it out. Once you find the value, you're done! Examples of lookup questions might be @italic{"is Sunflower fixed?"} or @italic{"How many legs does Felix have?""}.
                              }
                              @item{
                                @bold{Compute questions} - These can be answered by computing an answer across an entire row or column. Examples of computing questions might be @italic{"what is the heaviest animal?"} or @italic{"What is the average age of animals at the shelter?"}.
                              }
                              @item{
                                @bold{Analyze questions} - These ones take the most work, because they require looking for patterns and trends across @italic{multiple} rows or columns. Examples of analysis questions might be @italic{"Do cats tend to be adopted faster than dogs?"} or @italic{"Are older animals heavier than young ones?"}.
                              }
                          ]
                  }
                  @teacher{
                      Have students come up with lots of questions under each category.
                  }
            }
            @point{
                  @student{
                          On the bottom of @worksheet-link[#:name "Animals-Dataset"], there are a list of questions that we might have about the animals at the shelter. Can all of them be answered by this dataset?
                          @activity{
                              Take 5 minutes to discuss the questions, and put a check mark next to the ones that CAN be answered by this dataset. 
                              @itemlist[
                                  @item{ For the ones that can, which kind of question are they? }
                                  @item{ For ones that can't, what data is missing? }
                              ]
                          }
                  }
                  @teacher{
                          Have students share their findings with the class. Allow time for discussion!
                  }
            }
            @point{
                  @student{
                          Being able to figure out what @italic{can} and @italic{can't} be answered by a dataset is an important skill. 
                          @activity{
                            Turn to @worksheet-link[#:name "What-Can-You-Answer"] to practice. For the questions you CAN answer: what kind of question are they?
                          }
                  }
            }
        ]
  }

   @lesson/studteach[
     #:title "Threats to Validity"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[@item{Students learn about threats to validity, such as sample size, confounding variables, etc.}]
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
                          @bannerline{Survey says: "People prefer cats to dogs"}
                          As good Data Scientists, the staff at the animal shelter is constantly gathering data about their animals, their volunteers, and the people who come to visit. But just because they @italic{have} data doesn't mean the conclusions they draw from it are correct! For example: suppose they surveyed 1,000 cat-owners and found that 95% of them thought cats were the best pet. Could they really claim that people generally prefer cats to dogs?
                  }
                  @teacher{
                          Have students share back what they think. The issue here is that cat-owners are not a representative sample of the population, so the claim is invalid.
                  }
            }
            @point{
                  @student{
                          There's more to data analysis than simply collecting data and crunching numbers. In the example of the cat-owning survey, the claim that "people prefer cats to dogs" is @bold{invalid} because the data itself wasn't representative of the whole population (of course cat-owners are partial to cats!). This is just one example of what are called @vocab{Threats to Validity}.
                  }
                  @teacher{

                  }
            }
            @point{
                  @student{
                          @activity{
                              On this page @worksheet-link[#:name "Threats-to-Validity-1"] and @worksheet-link[#:name "Threats-to-Validity-2"], you'll find four different claims backed by four different datasets. Each one of those claims suffers from a serious threat to validity. Can you figure out what those threats are?
                          }
                          
                  }
                  @teacher{
                          Give students time to discuss and share back. @bold{Answers:} The dog-park survey is not a random sample, the dogs are friendlier towards whomever is giving them food, etc.
                  }
            }
            @point{
                  @student{
                          Life is messy, and there are @italic{always} threats to validity. Data Science is about doing the best you can to minimize those threats, and to be up front about what they are whenever you publish a finding. When you do your own analysis, make sure you include a discussion of the threats to validity!
                  }
                  @teacher{

                  }
            }
        ]
  }


  @lesson/studteach[
     #:title "Choose Your Dataset"
     #:duration "30 minutes"
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
                                  @(new-tab "https://docs.google.com/spreadsheets/d/1F5Q2HwyhrhzMBivKNA2qpgUroqGWpDTUKcF3p82pVDA" "Pokemon Dataset") (and the @editor-link[#:public-id "1h3pCuuc0AchFZidLV-9553kGhpRKyYxP" "Starter file"] for this dataset)
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
                                      Take 5 minutes to fill in your name, and complete the top half of @worksheet-link[#:name "My-Dataset"].
                                  }
                                  @item{
                                      In the Definitions Area, use @code{get-row} to define @bold{at least two} values, representing different rows in your table. Call them @code{sample1}, @code{sample2}, and so on.
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
                              On the bottom of @worksheet-link[#:name "My-Dataset"], brainstorm a few questions you would like to ask of this dataset. Be sure to check off the ones that CAN be answered! For the ones that can't, what kind of data would you need? What threats to validity might be a part of this dataset? 
                            }
                            
                      }
                      @teacher{}
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
                          Congratulations! You've explored the Animals dataset, chosen your own and begun to think critically about threats to validity and how questions and data shape one another. For the rest of this course, you'll be learning new programming and Data Science skills, practicing them with the Animals dataset and then applying them to your own.
                    }
                    @teacher{
                          Have students share which dataset they chose, and pick one question they're looking at.
                    }
              }
        ]
  }
}
