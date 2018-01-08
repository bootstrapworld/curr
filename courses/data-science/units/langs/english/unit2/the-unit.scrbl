#lang curr/lib

@title{Unit 2: Defining Values and Functions }

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
    Students choose their dataset, and begin to explore. In the process, they learn how to write their own definitions, first defining static values and then complete functions. They are also introduced to the Design Recipe: a structured approach to solving word problems and defining functions.
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
                            Let's take a look at a real dataset!
                            @activity[#:forevidence (list )]{
                                @itemlist[
                                    @item{
                                        Open the @(hyperlink "https://docs.google.com/spreadsheets/d/19m1bUCQo3fCzmSEmWMjTfnmsNIMqiByLytHE0JYtnQM/" "Animals Spreadsheet") in a new tab. Take a moment to look around. What do you think this table is for?
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
                            Just as you saw with our @code{shapes} example, this code @italic{defines a new table}. This time, it's called @code{animals-table}, and it's loaded from our Google Sheet. On line 12, you can see the names we are giving to each of the columns, called @code{name}, @code{species}, @code{gender}, @code{age}, @code{fixed}, @code{legs}, @code{pounts} and @code{weeks}.
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
                @point{
                      @student{
                            Are cats more popular than dogs? Do older animals take longer to get adopted? What are some questions someone might have about this dataset? Write down three questions you have on @worksheet-link[#:name "Animals-Dataset"].
                      }
                      @teacher{

                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Defining Values"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.3")
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
                        As you've seen, Pyret allows us to define names for values using the @code{=} sign. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name @code{x} to be the value @code{4}. Pyret works the same way, and you've already seen two names defined in this file: @code{shelter-sheet} and @code{animals-table}. We generally write definitions on the left, in the Definitions Area.
                        You can add your own definitions, for example:
                        @code[#:multi-line #t]{
                            name = "Nancy"
                            sum = 2 + 2
                            img = triangle(10, "solid", "red")
                        }
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
                            With your partner, take turns adding definitions to this file:
                            @itemlist[
                              @item{Define a value with name @code{food}, whose value is a String representing your favorite food}
                              @item{Define a value with name @code{year}, whose value is a Number representing the current year}
                              @item{Define a value with name @code{color}, whose value is an Image drawn in your favorite color}
                              @item{Define a value with name @code{likes-cats}, whose value is a Boolean that is true if you like cats and false if you don't}
                            ]
                        }

                  }
                  @teacher{
                          
                  }
            }
            @point{
                  @student{
                        Each row of our @code{animals-table} represents a single animal in our shelter. We can use the @code{get-row} function from yesterday to define values. For example:
                        @code[#:multi-line #t]{
                          mittens = get-row(animals-table, 3) # the Row for Mittens
                        }
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
                            Select two pets from the @code{animals-table} that you would most like to adopt, and two more than you would @italic{least} like to adopt (don't worry, those animals will find homes too!). What rows are they? Define values for each of them, using the pet's names and Rows.
                        }
                  }
                  @teacher{

                  }
            }
      ]
  }

  @lesson/studteach[
     #:title "Defining Functions"
     #:duration "40 minutes"
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
                              Suppose you work at the animal shelter, taking care of all the animals who live there. You want to make sure they're healthy, happy, and find good homes. For each animal, you might want to ask certain questions:
                              @itemlist[
                                @item{When was this animal born?}
                                @item{Has it been fixed?}
                                @item{Is it an adult?}
                                @item{Is it a puppy?}
                              ]
                        }
                        @teacher{
                            Have students brainstorm additional questions!
                        }
                }
                @point{
                      @student{
                            Suppose I want to know what year an animal was born. For each Row, I could subtract the @code{age} column from the current year. We know lots of functions in Pyret that can handle Numbers, Strings, Images and so on, but none that can handle animals! @bold{We need to build our own.}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            To build our own functions, we'll use something called the @bold{Design Recipe}. The Design Recipe is a way to think through the behavior of a function, to make sure we don't make any mistakes with the animals that depend on us! The Design Recipe has three steps, and we'll go through them together for our first function. Turn to page @worksheet-link[#:name "Design-Recipe-1"] in your Student Workbook
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bannerline{Step 1: Contract and Purpose} The first thing we do is write a Contract for this function. You already know a lot about contracts: they tell us the Name, Domain and Range of the function. Our function tells us the year an animal was born, consumes an animal (represented by a @code{Row} in our table), and produces a @code{Number} representing the year. A Purpose Statement is just a description of what the function does:
                            @code[#:multi-line #t]{
                              birth-year :: (animal :: Row) -> Number
                              # Consumes an animal, and produces the year it was born
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bannerline{Step 2: Write Examples} You already know how to write examples for built-in functions, where we write the @italic{answer} we expect to get back. Just as we did before, we start with the name of the function we're writing, followed by an example input. When defining @italic{new} functions, we don't just want to write our answer - we also want to show our work! Let's use one of the pets we defined earlier as an example, and write one example that shows the answer and another that @italic{shows the work} we need to do to get there.
                            @code[#:multi-line #t]{
                              birth-year :: (animal :: Row) -> Number
                              # Consumes an animal and produces the year it was born
                              examples:
                                birth-year(pet1) is 2016                # our answer
                                birth-year(pet1) is 2018 - pet1["age"]  # showing our work
                              end
                            }
                            While both examples here are correct, we want to use the second one that shows our work.
                      }
                      @teacher{
                            Make sure students see that these two examples are @italic{equivalent}. Walk through this first example @italic{carefully}. Make sure students understand where the @code{birth-year} came from the Name in our contract, and that @code{pet1} came from the Domain in our contract. @code{2018 - pet1["age"]} came from our purpose statement, and the label also came from the variable name in our contract.
                      }
                }
                @point{
                      @student{
                            @activity[#:forevidence (list "BS-PL.3&1&2")]{
                                @itemlist[
                                  @item{
                                      Write another example that shows your work in this block, using the @code{pet2} you defined earlier.
                                    }
                                  @item{
                                      In the examples where we show our work, do you notice a pattern? Most of the code for these examples is exactly the same, and only a small bit is changing: @code{pet1} and @code{pet2}.
                                  }
                                  @item{
                                      Circle all of the parts in your example block that are changing.
                                  }
                                  @item{
                                      What does the stuff you circled represent? Are @code{pet1} and @code{pet2} years? Legs? No - they are @italic{animals}! Let's label them...
                                  }
                                ]
                                  
                            }
                      }
                      @teacher{
                            
                      }
                }
                @point{
                    @student{
                          @bannerline{Step 3: Define the Function} After having written our examples, this part is easy! The part of the examples before @code{is} tells us how to begin. We start with the @code{fun} keyword (short for "function"), followed by the name of our function and a set of parentheses. This is exactly how all of our examples started, too. But instead of writing @code{pet1}, we'll use the @italic{label} that we gave it. Then we add a colon (@code{:}) in place of @code{is}, and continue to follow our examples, replacing anything we circled with the label. Finally, we finish with the @code{end} keyword.
                          @code[#:multi-line #t]{
                              birth-year :: (animal :: Row) -> Number
                              # Consumes an animal, and produces the year it was born
                              examples:
                                birth-year(pet1) is 2017  -  pet1["age"]
                                birth-year(pet2) is 2017  -  pet2["age"]
                              end
                              fun birth-year(animal): 
                                2017 - animal["age"]
                              end
                            }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                          Now that we've defined our function, we can click "Run" and actually use it!
                          @activity[#:forevidence (list "BS-PL.3&1&3")]{
                              After you've clicked run, try typing in the following expressions, and see what happens:
                              @code[#:multi-line #t]{
                                  birth-year(pet3)
                                  birth-year(pet4)
                                  birth-year(get-row(animals-table, 8))
                                  birth-year(get-row(animals-table, 11))
                              }
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        Our @code{examples:} block is a helpful way to @italic{check our work}, so we don't make mistakes. Suppose we had a typo in our function definition, and added instead of subtracted:
                        @code[#:multi-line #t]{
                            fun birth-year(animal): 
                              2017 + animal["age"]
                            end
                        }
                        Try making this change to your code, and clicking "Run". What happens?
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        Now that you've walked through the Design Recipe once, it's time to get some practice! This time, you'll have to write the Contract, Purpose Statement, and first example yourself!
                        @activity[#:forevidence (list "BS-PL.3&1&1" "BS-PL.3&1&2"  "BS-PL.3&1&3")]{
                          Use @worksheet-link[#:name "Design-Recipe-1"] to solve the following problems:
                          @itemlist[
                              @item{ 
                                  Define a function called @code{is-cat}, which consumes a Row of the @code{animals-table} and produces @code{true} if its @code{species} is @code{"cat"}.
                              }
                              @item{ 
                                  Define a function called @code{is-kitten}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's a cat less than 2 years old. 
                              }
                          ]
                        }
                    }
                    @teacher{
                          Show students that they can combine all their examples into a single block at the top of the file.
                    }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2"  "BS-DR.2&1&1" "BS-DR.2&1&2")]{
                          Use @worksheet-link[#:name "Design-Recipe-2"] to solve the following problems:
                            @itemlist[
                              @item{ 
                                  Define a function called @code{nametag}, which prints out each animal's name in big red letters.
                              }
                              @item{ 
                                  Define a function called @code{is-fixed}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's an animal that's been fixed. 
                              }
                            ]
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2"  "BS-DR.2&1&1" "BS-DR.2&1&2")]{
                          Use @worksheet-link[#:name "Design-Recipe-2"] to solve the following problems:
                          @itemlist[
                            @item{ 
                                Define a function called @code{sentence}, which consumes a Row of the @code{animals-table} and produces a String containing the animal's name, the string " the ", and the species of the animal. (For example, "Nori the dog"). 
                            }
                            @item{
                                What kind of animal would @italic{you} adopt? Is there a maximum or minimum age? Do you care if the animal has been fixed or not? Write a function called @code{adopt}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's an animal that you would adopt.
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
     #:title "Choose Your Dataset"
     #:duration "25 minutes"
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
                          Throughout this course, you'll be analyzing this dataset and writing up your findings. As you learn new tools for data science, you'll continue to refine this analysis, answering questions and raising new ones of your own!
                          Take 5 minutes to look through the following datasets, and choose one that interests you:
                          @itemlist[
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1SaR2M6Z-s40UuRg3u1aQU-G1GVdcm0RgHpqQ9LNmSQk" "Movies Dataset") (and the @editor-link[#:public-id "1KaHf2DSd5iJ17UsRd61jljsWR_HqRQY2" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1yHPM-poscv6azh59aMwElfUP67P3fMESorVjtMwsFa0" "School Dataset") (and the @editor-link[#:public-id "1371QVz9uLJKCiX_Q3bR93ZZ5EKhAxZoR" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw" "US Income Dataset") (and the @editor-link[#:public-id "1lVDBQiAze_NjH69rWcFi15ApbNPZWXOk" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg" "US Presidents Dataset") (and the @editor-link[#:public-id "18Ux-O_c78jnZ4cFjTwvaZzaBJOch9cTK" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1lOFsofXJNIMKAM8g4Zn688jIdbAK68ovAnzmfuwFd9M" "Countries of the World Dataset") (and the @editor-link[#:public-id "1V1u_kINuc6PCOWZ0WF7a2oZSLbrzRitg" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1-mrDSjS-rWMdiMAIptFS_PHVUFO06lUpYNCiGkYj51s" "Music") (and the @editor-link[#:public-id "1EHpLimHbsZkSie23Dt-COhTDtNQ0_g1Z" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1HJ6wR4IH9j0hqbaP4OXeChOVMbVMyV0vBMu25NUiw1w" "State Demographics") (and the @editor-link[#:public-id "1okOF06x6_UtMgnM8yi6dIGH6ZfBrpEQM" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/182UAmtxaBjIY3cGB9fy8tsl1q3ZJ0fcP4m38i9Sr5l0" "New York City Restaurant Health Inspections") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1HpAIsC_3sDWYgtIj0iwgch81MllIa-Yy" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1F5Q2HwyhrhzMBivKNA2qpgUroqGWpDTUKcF3p82pVDA" "Pokemon Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1h3pCuuc0AchFZidLV-9553kGhpRKyYxP" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/126sJLFP8kenombJx5CtR-9D88jgbI_vKlYq30PWT41g" "IGN Video Game Reviews Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1H3-aDMoCNCJtRoUpJfPFRUy2JuhmBNFJ" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1WMJMNqkwuo1vbL0O_C81BPA-R2TFcLWEMUi7cn_ptow" "2016 Presidential Primary Election Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1U_R0ZoRRvUwKy58m9cgJ6AyDHWW1Oh7-" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1Fyp-h8sSggYPHIpvrtBzSrKGa6bZioy1lMTKIC--RH0" "US Cancer Rates Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1Kd9Zi4Z0jKkyxV7rHCw4nNQqbhgpT2Qi" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/19bmTJd2soUvg6FUDIW546jPtiWOERFm2o9z7TLBNTbc" "Summer Olympic Medals Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1HubbGjtE96e3wt0EZqlVWtKstmyPpDd_" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1ZJ9d4BtF6xOqyBdGgjW-vCeJ7-rOHWIhGMiBNwqCEVo" "Winter Olympic Medals Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1QvKr16tceg0wQ9vLfu-iFiZEpUdw5I2L" "Starter file"] for this dataset)
                                     }

                              @item{
                                @(hyperlink "https://docs.google.com/spreadsheets/d/157Bi2kniAJybuV1X_9h4Z6DaZSVPK3vPf697feXcyv8" "MLB Hitting Stats Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1_d80_yLylUXz32QrEsN9EjtHEHJ8gB34" "Starter file"] for this dataset)
                                     }
                              @item{
                                @(hyperlink "https://docs.google.com/spreadsheets/d/156Q1HxZ-MJvByEKVoIMPmVELtQwiUb3uJEszmkndrMs" "NFL Touchdown Leaders") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1wb4fwcItuACau5j2g0Op_IWTDx9EN4iZ&v=f1d3c87" "Starter file"] for this dataset)
                                     }
                              @item{
                                @(hyperlink "https://docs.google.com/spreadsheets/d/1aVQz1PxO7LYM131LpwJUH_5fjjIF9L0JlhDvR75c5HY" "NFL Quarterback Win/Loss Records") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1k-VFc99jnKJeX6_C_9Horo1RUq7yz9oM&v=f1d3c87" "Starter file"] for this dataset)
                                     }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "1sRPS3wuExqrRE0aw-TnqVv25frjBBwii" "Blank Starter file"]) for your project.
                              }
                          ]
                      }
                      @teacher{

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
                                      Take 5 minutes to fill in your name, and complete @worksheet-link[#:name "My-Dataset"].
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
							             Building functions is a powerful technique, which you'll use throughout the course. Today, you learned how to write functions that work on one row of a table at a time. In the next lesson, you'll learn how to use those functions to loop over an @italic{entire table}, letting us extend, filter, and sort our @code{animals-table}

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
