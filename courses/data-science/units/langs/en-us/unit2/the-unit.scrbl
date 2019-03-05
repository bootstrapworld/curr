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
                                       (list "Table"
                                              @code{.row-n}
                                              ""))]{
  @unit-descr{
      Students are introduced to the Animals dataset, practice making some charts of the data, and consider the kinds of questions that can be asked about a dataset. They also learn to define values, and to define functions using a structured approach to problem solving called the "Design Recipe". They then use these functions to filter the animals dataset.
  }
}
@unit-lessons{


  @lesson/studteach[
     #:title "The Animals Dataset"
     #:duration "15 minutes"
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
                                        Open up the @editor-link[#:public-id "1gaYAyYhvlKBm6VJuvJDcnoINBw76pL-L" "Animals Starter File"] in a new tab. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
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
                              # load the 'pets' sheet as a table called animals-table
                              animals-table = load-table: name, species, age, fixed, legs
                                source: pets-sheet.sheet-by-name("pets", true)
                              end
                            }
                            Just as you saw with our @code{shapes} example, this code @italic{defines a new table}. This time, it's called @code{animals-table}, and it's loaded from our Google Sheet. You can see the names we are giving to each of the columns, called @code{name}, @code{species}, @code{gender}, @code{age}, @code{fixed}, @code{legs}, @code{pounds} and @code{weeks}. (We could use any names we want for these columns, but it's always a good idea to pick names that make sense!)
                      }
                      @teacher{
                            Have students look back at the column names in the Google Sheet, and in the @code{load-table} function. Point out that they refer to the same columns, even though they have different names!
                      }
                }
                @point{
                      @student{
                            Click "Run", and type @code{animals-table} into the Interactions Area to see what this table looks like.
                            @itemlist[
                              @item{How many column variables does this table have?}
                              @item{For each column variable, is the data quantitative or categorical? }
                              @item{For each column variable, what datatype is being used? Numbers? Strings? Images? Booleans? }
                            ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                            Turn to @worksheet-link[#:name "Animals-Dataset"] in your Student Workbook, and fill in the table for Question 2.
                          }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            You already know about the @code{.row-n} method, which consumes a number and produces a row from a table. But tables have other methods too! The @code{.order-by} method consumes a String (the name of the column you want to order) and a Boolean (true for ascending, false for descending). Try typing the following expressions into the Interactions Area. What do you get?
                            @code[#:multi-line #t]{
                                animals-table.order-by("name", true)
                                animals-table.order-by("age", false)
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            What is the Domain of @code{.order-by}? What is the Range? Find the contract for this method in your contracts table, and make sure it makes sense!
                      }
                }
                @point{
                      @student{
                          @activity[#:forevidence (list "Data 3.1.3&1&1" "Data 3.1.3&1&2")]{
                            Make at least one bar-chart and at least one pie-chart, using columns from the @code{animals-table}. What do you notice? What do you wonder?
                          }
                      }
                      @teacher{
                        Have students share their noticings and wonderings. Ideally, at least one student will wonder if there's a way to make charts using only a @italic{subset} of the data!
                      }
                }
                @point{
                      @student{
                          You may already be wondering if there's a way to make charts using only a @italic{subset} of the rows in a table. For example: what if we want to make a bar chart showing only the ages of the cats at the shelter? To do this, we need to learn how to write functions of our own, which can tell us if an animal is a cat or not, fixed or not, and so on.
                      }
                }
        ]
  }


  @lesson/studteach[
     #:title "Defining Values"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about value definitions in Pyret}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students define several row values from the animals table}]
     #:standards (list "BS-PL.3&1&1")
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
                        As you've seen, Pyret allows us to define names for values using the @code{=} sign. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name @code{x} to be the value @code{4}. Pyret works the same way, and you've already seen two names defined in this file: @code{shelter-sheet} and @code{animals-table}. We generally write definitions on the left, in the Definitions Area.
                        You can add your own definitions, for example:
                        @code[#:multi-line #t]{
                            name = "Maya"
                            sum = 2 + 2
                            img = triangle(10, "solid", "red")
                        }
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
                            With your partner, take turns adding definitions to this file:
                            @itemlist[
                              @item{Define a value with name @code{food}, whose value is a String representing your favorite food}
                              @item{Define a value with name @code{year}, whose value is a Number representing the current year}
                              @item{Define a value with name @code{likes-cats}, whose value is a Boolean that is true if you like cats and false if you don't}
                            ]
                        }

                  }
                  @teacher{
                          
                  }
            }
            @point{
                  @student{
                        Each row of our @code{animals-table} represents a single animal in our shelter. We can use the @code{row-n} method to define values. Type the following lines of code into the Definitions Area and click "Run":
                        @code[#:multi-line #t]{
                          animalA = animals-table.row-n(1)
                          animalB = animals-table.row-n(10)
                        }
                        What happens when you evaluate @code{animalA} in the Interactions Area?
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
                            Define @italic{at least two} additional values to be animals from the @code{animals-table}, called @code{animalC} and @code{animalD}.
                        }
                  }
                  @teacher{

                  }
            }
      ]
  }

  @lesson/studteach[
     #:title "Question Types"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn about different categories of questions}]
     #:evidence-statements @itemlist[]
     #:exercises (list (make-exercise-locator/file "Question-Types" "What-can-you-answer" "What can you answer?"))
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
                           @activity{
                              Turn to @worksheet-link[#:name "Animals-Dataset"] in your Student Workbook, and write down your own questions under section 3.
                          }
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
                                @bold{Lookup questions} - These can be answered simply by looking up a particular value in the table and reading it out. Once you find the value, you're done! Examples of lookup questions might be @italic{"is Sunflower fixed?"} or @italic{"How many legs does Felix have?"}
                              }
                              @item{
                                @bold{Compute questions} - These can be answered by computing an answer across an entire row or column. Examples of computing questions might be @italic{"what is the heaviest animal?"} or @italic{"What is the average age of animals at the shelter?"}
                              }
                              @item{
                                @bold{Analyze questions} - These ones take the most work, because they require looking for patterns and trends across @italic{multiple} rows or columns. Examples of analysis questions might be @italic{"Do cats tend to be adopted faster than dogs?"} or @italic{"Are older animals heavier than young ones?"}
                              }
                          ]
                  }
                  @teacher{
                      Have students come up with lots of questions under each category.
                  }
            }
            @point{
                  @student{
                          To the right of the questions you wrote on @worksheet-link[#:name "Animals-Dataset"], fill in the the @italic{type of question} you are asking. Is it a Lookup, Compute, or Analyze question?
                  }
                  @teacher{
                          Have students share their findings with the class. Allow time for discussion!
                  }
            }
            @point{
                  @student{
                          Lookup questions are easy to answer: just find the right row and column, and read out the answer! You learned how to do lookups in Pyret in Unit 1. This time, let's practice lookups using value definitions, where each row is defined separately.
                          @activity{
                              Complete the activity on @worksheet-link[#:name "Lookup-Animals"].
                          }
                  }
            }
        ]
  }

  @lesson/studteach[
     #:title "Defining Functions"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to define functions using the Design Recipe}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students define several functions over rows from the animals table}]
     #:standards (list "BS-PL.3&1&2" "BS-PL.3&1&3" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2" "BS-PL.3")
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
                                @item{What kind of animal is it?}
                                @item{Has it been fixed?}
                                @item{When was it born?}
                                @item{Is it a kitten?}
                              ]
                        }
                        @teacher{
                            Have students brainstorm additional questions!
                        }
                }
                @point{
                      @student{
                            Lookups are easy, but they can get really repetitive! 
                            @activity{
                                In the Interactions Area, type the code that will look up if @code{animalA} is fixed or not.
                                Then type the code to look up if @code{animalB} is fixed or not. Repeat for @code{animalC} and @code{animalD}. Suppose I wanted to do this for every animal in the table?
                            }
                            This seems really repetitive, doesn't it? We keep typing the same thing over and over, but all that's really changing is the animal. Wouldn't it be great if Pyret had a function called @code{is-fixed}, that would do this for us?
                      }
                      @teacher{
                            Have a student @italic{act out} the @code{is-fixed} function. You give them an animal, and they tell you what they would type to find out if it is fixed.
                      }
                }
                @point{ 
                      @student{
                            @activity{
                                @itemlist[
                                    @item{ What is the name of our function? }
                                    @item{ What type of data did we have to give it? }
                                    @item{ What type of data did it give us back? }
                                ]
                            }
                            Unfortunately, Pyret doesn't have a function like this. But it has something even better: it lets us @italic{define new functions of our own!}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            To build our own functions, we'll use a series of steps called the @bold{Design Recipe}. The Design Recipe is a way to think through the behavior of a function, to make sure we don't make any mistakes with the animals that depend on us! The Design Recipe has three steps, and we'll go through them together for our first function. 
                            @activity{
                              Turn to page @worksheet-link[#:name "Design-Recipe-Lookup"] in your Student Workbook.
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bannerline{Step 1: Contract and Purpose} The first thing we do is write a Contract for this function. You already know a lot about contracts: they tell us the Name, Domain and Range of the function. Our function tells us if an animal is fixed or not, so we'll call it @code{is-fixed}. It consumes an animal (represented by a @code{Row} in our table), and look up the value in the @code{fixed} column. A Purpose Statement is just a description of what the function does:
                            @code[#:multi-line #t]{
                              # is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and looks up the value in the fixed column
                            }
                      }
                      @teacher{
                        Be sure to check students' contracts and purpose statements before having them move on!
                      }
                }
                @point{
                      @student{
                            @bannerline{Step 2: Write Examples} Examples are a way for us to tell the computer how our function should behave for a @italic{specific} input. We can write as many examples as we want, but they must all be wrapped in an @code{examples:} block and an @code{end} statement. Examples start with the name of the function we're writing, followed by an example input. Let's use some two pets we defined earlier for our first example.
                            @code[#:multi-line #t]{
                              # is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and looks up the value in the fixed column
                              examples:
                                is-fixed(animalA) is animalA["fixed"]
                                is-fixed(animalB) is animalB["fixed"]
                              end
                            }
                      }
                      @teacher{
                            Make sure students understand (1) that @code{is-fixed} came from the Name in our contract, (2) that @code{sasha} and @code{fritz} came from the Domain in our contract, that (3) @code{animalA["fixed"]} came from our purpose statement, and the label also came from the variable name in our contract.
                      }
                }
                @point{
                      @student{
                            Why didn't we just write @code{true} or @code{false} after the @code{is}? In programming, just like in any other class, it's more important to @italic{show your work} than to just write down the answer. This helps programmers organize their thinking, and can be a useful way of fixing bugs later on. (If you never wrote down what you were thinking, how will you know where you went wrong?)
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @activity[#:forevidence (list "BS-PL.3&1&2")]{
                                @itemlist[
                                  @item{
                                      In the examples where we show our work, do you notice a pattern? Most of the code for these examples is exactly the same, and only a small bit is changing: @code{animalA} and @code{animalB}.
                                  }
                                  @item{
                                      Circle all of the parts in your example block that are changing.
                                  }
                                  @item{
                                      What does the stuff you circled represent? Are @code{animalA} and @code{animalB} years? Legs? No - they are @italic{animals}! Let's label them...
                                  }
                                ]
                                  
                            }
                      }
                      @teacher{
                            
                      }
                }
                @point{
                    @student{
                          @bannerline{Step 3: Define the Function} After having written our examples, this part is easy! The part of the examples before @code{is} tells us how to begin. We start with the @code{fun} keyword (short for "function"), followed by the name of our function and a set of parentheses. This is exactly how all of our examples started, too. But instead of writing @code{mittens}, we'll use the @italic{label} that we gave it. Then we add a colon (@code{:}) in place of @code{is}, and continue to follow our examples, replacing anything we circled with the label. Finally, we finish with the @code{end} keyword.
                          @code[#:multi-line #t]{
                              # is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and looks up the value in the fixed column
                              examples:
                                is-fixed(animalA) is animalA["fixed"]
                                is-fixed(animalB) is animalB["fixed"]
                              end
                              fun is-fixed(animal): animal["fixed"]
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
                                  is-fixed(animalA)
                                  is-fixed(animalB)
                                  is-fixed(animals-table.row-n(8))
                                  is-fixed(animals-table.row-n(11))
                              }
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        Our @code{examples:} block is a helpful way to @italic{check our work}, so we don't make mistakes. Suppose we made a mistake in our function definition, and accessed the wrong column:
                        @code[#:multi-line #t]{
                            fun is-fixed(animal): animal["age"]
                            end
                        }
                        When we click "Run", the computer will tell us that our examples don't match the definition! It will literally @italic{check your work for you!}
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity{
                            For practice, try solving the word problem at the bottom of @worksheet-link[#:name "Design-Recipe-Lookup"].
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        So far, our functions have been pretty simple: they consume a row, and they produce one column from that row as-is. But suppose we want to @italic{compute} with that value, to find out specifically whether or not an animal is a cat, or whether it's young? Let's walk through a more complex Design Recipe together, by turning to @worksheet-link[#:name "Design-Recipe-Compute"].
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.1&2&1" "BS-DR.1&2&2" "BS-DR.1&2" "BS-PL.3&1&1" "BS-PL.3&1&2"  "BS-PL.3&1&3")]{
                          Define a function called @code{is-cat}, which consumes a row from the @code{animals-table} and returns true if the animal is a cat.
                          @itemlist[
                            @item{ Is this a lookup, compute or analyze question?}
                            @item{ What is the name of this function? What are it's Domain and Range? }
                            @item{ Is Sasha a cat? @italic{What did you do to get that answer?} }
                          ]
                        }
                    }
                    @teacher{
                        Have students explain their thinking carefully, step-by-step. Repeat this with other animals.
                    }
                }
                @point{
                    @student{
                        To find out if an animal is a cat, we look at the @code{species} column and check to see if that value is @italic{equal to} @code{"cat"}. This gives us out first example:
                        @code[#:multi-line #t]{
                              # is-cat :: (animal :: Row) -> Boolean
                              # Consumes an animal, and compute whether the species is "cat"
                              examples:
                                is-cat(animalA) is animalA["species"] == "cat"
                              end
                            }
                        @activity{ Add a second example. }
                    }
                    @teacher{
                        Have students share their examples. Point out that the code is the same for all examples, aside from the name of the animal being tested.
                    }
                }
                @point{
                    @student{
                        Just we've done before, let's look at our examples and circle the things that are changed from one to the other.
                        @itemlist[
                          @item{ Do all our examples use @code{is-cat}? }
                          @item{ Do all our examples use the same inputs? }
                          @item{ Do all our examples look at the same column? }
                          @item{ Do all our examples compare that column value to "cat"? }
                        ]
                        @activity{ What label should we use here? }
                    }
                    @teacher{
                        Make sure students realize that the label is specified in the Domain.
                    }
                }
                @point{
                    @student{
                        As before, we'll use the pattern from our examples to come up with our definition.
                        @itemlist[
                          @item{ What is the function name? }
                          @item{ What is the name of the variable(s)? }
                          @item{ What do we do in the body in the function? }
                        ]
                        @code[#:multi-line #t]{
                              # is-cat :: (animal :: Row) -> Boolean
                              # Consumes an animal, and compute whether the species is "cat"
                              examples:
                                is-cat(animalA) is animalA["species"] == "cat"
                                is-cat(animalB) is animalB["species"] == "cat"
                              end
                              fun is-cat(animal): animal["species"] == "cat"
                              end
                            }
                    }
                }
                @point{
                    @student{
                        @activity{
                          Type this definition - and its examples! - into the Definitions Area, then click "Run" and try using it.
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity{
                            For practice, try solving the word problem at the bottom of @worksheet-link[#:name "Design-Recipe-Compute"].
                        }
                    }
                    @teacher{

                    }
                }
        ]
  }

  @lesson/studteach[
     #:title "Filtering Tables"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "Data 3.1.1")
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
                          You already know about the @code{.row-n} and @code{.order-by} methods. But suppose you want to get a table of only cats? Or a table of only animals that have been fixed? Try typing these expressions into the Interactions Area. What do you get?
                          @code[#:multi-line #t]{
                              animals-table.filter(is-fixed)
                              animals-table.filter(is-cat)
                              bar-chart(animals-table.filter(is-fixed))
                          }
                    }
                    @teacher{
                          If time allows, ask students to explain what they think is going on.
                    }
              }
              @point{
                    @student{
                          Find the contract for @code{.filter} in your contracts page. The @code{.filter} method is taking in a @italic{function}, calling it on every row in the table, and producing a new table with only the rows for which it returns @code{true}.
                          @activity[#:forevidence (list "Data 3.1.1&1&1" "Data 3.1.1&1&2")]{
                              Try using the @code{gender} function to filter. What happens?
                          }
                          Notice that the Domain for @code{.filter} says that @code{test} must be a function (that's the arrow), which consumes a @code{Row} and produces a @code{Boolean}. If the function we pass in produces anything else, we'll get an error.
                    }
                    @teacher{
                          If time allows: have them make a pie chart using a table of @italic{only cats}, or a bar chart of @italic{only the animals that have been fixed}.
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
