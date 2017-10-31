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
    Students choose the dataset they are going to explore, and begin their research papers. In the process, they learn how to write their own definitions, first defining static values and then complete functions. They are also introduced to the Design Recipe - a structured approach to solving word problems and defining functions.
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
                            @activity{
                                @itemlist[
                                    @item{
                                        Open the @(hyperlink "https://docs.google.com/spreadsheets/d/19m1bUCQo3fCzmSEmWMjTfnmsNIMqiByLytHE0JYtnQM/" "Animals Spreadsheet") in a new tab. Take a moment to look around. What do you think this table is for?
                                    }
                                    @item{
                                        This is some data from an animal shelter, listing animals that have been adopted. We'll be using this as an example thoughout the course, but you'll be applying what you learn to @italic{a dataset you choose} as well.
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
                            This file contains some new code that you haven't seen before. At the top is the @code{include} line, which imports a library of useful functions for Data Science. After that there's another two @code{include} lines, which import libraries of functions for using Google Sheets, Tables and Images as part of our program:
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
                            Just as you saw with our @code{shapes} example, this code @italic{defines a new table}. This time, it's called @code{animals-table}, and it's loaded from our Google Sheet. On line 11, you can see the names we are giving to each of the columns, called @code{name}, @code{name}, @code{animal}, @code{age}, @code{fixed}, and @code{legs}.
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
                              @item{For each column, is the data quantitative or qualitative? }
                              @item{For each column, what datatype is being used? Numbers? Strings? Images? Booleans? }
                              @item{How could you get row for the animal named "Toggle"? }
                              @item{How could you get the age of the animal named "Togle" from that row? }
                              @item{How could you get the species of the animal named "Fritz"? }
                              @item{How could you get the number of legs of the animal named "Mittens"? }
                            ]
                      }
                      @teacher{
                            Make sure students are comfortable with @code{get-row} and row-accessors (the last four questions) before proceeding. Review with the whole class.
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
                            Are cats more popular than dogs? Do older animals take longer to get adopted? What are some questions you have about this dataset? Write down three questions you have on @worksheet-link[#:name "Animals-Dataset"].
                      }3
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
                        As you've seen Pyret allows us to define names for values using the @code{=} sign. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name @code{x} to be the value @code{4}. Pyret works the same way, and you've already seen two names defined in this file: @code{shelter-sheet} and @code{animals-table}. We generally write definitions on the left, in the Definitions Area.
                        You can add your own definitions, for example:
                        @code[#:multi-line #t]{
                            name = "Nancy"
                            sum = 2 + 2
                            image = triangle(10, "solid", "red")
                        }
                        @activity{
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
                        Each row of our @code{animals-table} represents a single animal in oiur shelter. We can use the @code{get-row} function from yesterday to define values. For example:
                        @code[#:multi-line #t]{
                          mittens = get-row(animals-table, 3) # the Row for Mittens
                        }
                        @activity{
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
                            @bannerline{Step 1: Contract and Purpose} The first thing we do is write a Contract for this function. You already know a lot about contracts: they tell us the Name, Domain and Range of the function. Our function tells us the year an animal was born, consumes an animal (represented by a @code{Row} in our table), and produces a @code{Number} representing the year. A Purpose Statement is just an description of what the function does:
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
                            @bannerline{Step 2: Write Examples} You already know how to write examples for built-in functions, where we write the @italic{answer} we expect to get back. Just as we did before, we start with the name of the function we're writing, followed by an example input. When defining @italic{new} functions, we don't just want to write our answer - we want to show our work! Let's use one of the pets we defined earlier as an example, and write one example that shows the answer and another that @italic{shows the work} we need to do to get there.
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
                            Make sure students see that these two examples are @italic{equivalent}. Walk through this first example @italic{carefully}. Make sure students understand where the @code{birth-year} came from the Name in our contract, and that @code{pet1} came from the Domain in our contract. @code{2017 - pet1["age"]} came from our purpose statement, and the label also came from the variable name in our contract.
                      }
                }
                @point{
                      @student{
                            @activity{
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
                              fun birth-year(animal): 2017 - animal["age"]
                              end
                            }
                    }
                }
                @point{
                    @student{
                          Now that we've defined our function, we can click "Run" and actually use it!
                          @activity{
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
                            fun birth-year(animal): 2017 + animal["age"]
                            end
                        }
                        Try making this change to your code, and clicking "Run". What happens?
                    }
                }
                @point{
                    @student{
                        Now that you've walked through the Design Recipe once, it's time to get some practice! For each of the following problems, use @worksheet-link[#:name "Design-Recipe-1"], @worksheet-link[#:name "Design-Recipe-2"] and @worksheet-link[#:name "Design-Recipe-3"]. This time, you'll have to write the Contract, Purpose Statement, and first example yourself!
                        @itemlist[
                            @item{ 
                                Define a function called @code{is-cat}, which consumes a Row of the @code{animals-table} and produces @code{true} if its @code{species} is @code{"cat"}.
                            }
                            @item{ 
                                Define a function called @code{is-kitten}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's a cat less than 2 years old. 
                            }
                            @item{ 
                                Define a function called @code{nametag}, which prints out each animal's name in big red letters.
                            }
                            @item{ 
                                Define a function called @code{is-fixed}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's an animal that's been fixed. 
                            }
                            @item{ 
                                Define a function called @code{sentence}, which consumes a Row of the @code{animals-table} and produces a String containing the animal's name, the string " the ", and the species of the animal. (For example, "Nori the dog"). 
                            }
                            @item{
                                What kind of animal would @italic{you} adopt? Is there a maximum or minimum age? Do you care if the animal has been fixed or not? Write a function called @code{adopt}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's an animal that you would adopt.
                            }
                        ]
                    }
                    @teacher{
                        Show students that they can combine all their examples into a single block at the top of the file.
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

                                  }
                                  @item{
                                      Take 5 minutes to fill in your name, and complete @worksheet-link[#:name "My-Dataset"].
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