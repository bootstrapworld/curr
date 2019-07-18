#lang curr/lib

@title{Unit 2: Questions and Definitions }

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart, bar-chart-raw, pie-chart-raw} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count}
                                              ""))]{
  @unit-descr{
      Students continue to explore the Animals Dataset, and consider the kinds of questions that can be asked about a dataset. They also learn to define values, and to define functions using a structured approach to problem solving called the "Design Recipe". They then use these functions to filter the animals dataset, using methods.
  }
}
@unit-lessons{



  @lesson/studteach[
     #:title "Question Types"
     #:duration "10 minutes"
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
                          Once we have a dataset, we can start asking questions! But how do we know what questions to ask? There's an art to asking the right questions, and good Data Scientists think hard about what kind of questions can and can't be answered.
                           @activity{
                              Turn to back to @worksheet-link[#:name "Animals-Notice-Wonder"] in your Student Workbook, and look at the "Wonder" questions that you wrote about this dataset.
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
                                @bold{Lookup questions} - These can be answered simply by looking up a @italic{single value} in the table and reading it out. Once you find the value, you're done! Examples of lookup questions might be "is Sunflower fixed?" or "How many legs does Felix have?"
                              }
                              @item{
                                @bold{Compute questions} - These can be answered by computing an answer across a @italic{single row or column}. Examples of computing questions might be "how much does the heaviest animal weigh?" or "What is the average age of animals at the shelter?"
                              }
                              @item{
                                @bold{Relate questions} - These ones take the most work, because they require looking for relationships between @italic{multiple columns}. Examples of analysis questions might be "Do cats tend to be adopted faster than dogs?" or "Are older animals heavier than young ones?"
                              }
                          ]
                  }
                  @teacher{
                      Have students come up with questions for each type.
                  }
            }
            @point{
                  @student{
                          Look back at the Wonders you wrote on @worksheet-link[#:name "Animals-Notice-Wonder"]. Are any of these Lookup, Compute, or Relate questions? Circle the question type that's appropriate. Can you come up with additional examples for each type of question?
                  }
                  @teacher{
                          Have students share their questions with the class. Allow time for discussion!
                  }
            }
            @point{
                  @student{
                          Lookup questions are easy to answer: just find the right row and column, and read out the answer! Let's learn how to do this in Pyret...
                  }
                  @teacher{

                  }
            }
        ]
  }

  @lesson/studteach[
     #:title "Row and Column Lookups"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students extend their understanding of function application}]
     #:evidence-statements @itemlist[]
     #:exercises (list )
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
                          Open @editor-link[#:public-id "1PTPxKGyUfsMpy4GzFtYS_JGntiHOL0Yu" "Animals Starter File - Unit 2"], save a copy, and click "Run". This is the same program you saw before, but with one extra line of code. Which line is new, and what do you think it does?
                  }
                  @teacher{

                  }
            }
              @point{
                    @student{
                        Tables have special functions associated with them, called @vocab{Methods}, which allow us to do all sorts of things with those tables. For example, we can get the first data row in a table by using the @code{.row-n} method:
                        @code[#:multi-line #t]{
                            animals-table.row-n(0)
                        }
                        Note: data rows start at zero!
                        @activity{
                            For practice, in the Interactions Area, use the @code{row-n} method to get the second and third data rows.
                        }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                          What is the Domain of @code{.row-n}? What is the Range? Find the contract for this method in your contracts table. A table @vocab{method} is a special kind of function which always operates on a specific table. In our example, we always use @code{.row-n} with the animals table, so the number we pass in is @italic{always} used to grab a particular row from @code{animals-table}.
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                          Pyret also has a way for us to get at individual @italic{columns} of a Row, by using a @italic{Row Accessor}. Row accessors start with a @code{Row} value, followed by square brackets and the name of the column where the value can be found. Here are three examples that use row accessors to get at different columns from the first row in the @code{animals-table}:
                          @code[#:multi-line #t]{
                                  animals-table.row-n(0)["name"]
                                  animals-table.row-n(0)["age"]
                                  animals-table.row-n(0)["fixed"]
                          }
                          @activity[#:forevidence (list "BS-DR.2&1&1")]{
                              How would you get the @code{weeks} column out of the @italic{second} row? The third?
                          }
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Let's get some practice playing with the @code{row-n} method, and row-accessors!
                        @activity{
                           Complete the exercises on @worksheet-link[#:name "Lookup-Animals"].
                        }
                    }
                    @teacher{
                    
                    }
              }
              @point{
                    @student{
                          Tables have other methods too! The @code{.order-by} method consumes a String (the name of the column you want to order) and a Boolean (true for ascending, false for descending). Try typing the following expressions into the Interactions Area. What do you get?
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
                    @teacher{

                    }
              }
      ]
}

  @lesson/studteach[
     #:title "Defining Values"
     #:duration "15 minutes"
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
                        Pyret allows us to define names for values using the @code{=} sign. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name @code{x} to be the value @code{4}. Pyret works the same way, and you've already seen two names defined in this file: @code{shelter-sheet} and @code{animals-table}. We generally write definitions on the left, in the Definitions Area.
                        You can add your own definitions, for example:
                        @code[#:multi-line #t]{
                            my-name = "Maya"
                            sum = 2 + 2
                            img = triangle(10, "solid", "red")
                        }
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
                            With your partner, take turns adding definitions to this file:
                            @itemlist[
                              @item{Define a value with name @code{food}, whose value is a String representing your favorite food}
                              @item{Define a value with name @code{year}, whose value is a Number representing the current year}
                              @item{Define a value with name @code{likes-cats}, whose value is a Boolean that is @code{true} if you like cats and @code{false} if you don't}
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
              @point{
                    @student{
                        Let's get some practice combining Lookups with Value Definitions.
                        @activity{
                           Complete the exercises on @worksheet-link[#:name "Lookup-Shapes"].
                        }
                    }
                    @teacher{
                    
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
                              Let's try finding all the fixed animals by hand. Turn to @worksheet-link[#:name "Animals-Dataset"], and walk down the table one row at a time, putting a check next to each animal that is fixed.
                        }
                        @teacher{
                              Give students 2min to find all the fixed animals they can.
                        }
                }
                @point{
                        @student{
                            What did you do to complete this activity? You went through the table one row at a time, and for @bold{each row} you did a lookup on the @code{fixed} column. Lookups are easy, but they can get really repetitive! 
                            @activity{
                                In the Interactions Area, type the code that will look up if @code{animalA} is fixed or not.
                                Then type the code to look up if @code{animalB} is fixed or not. Repeat for @code{animalC} and @code{animalD}. Suppose I wanted to do this for every animal in the table, just as you did by hand?
                            }
                            This seems really repetitive, doesn't it? We keep typing the same thing over and over, but all that's really changing is the animal. Wouldn't it be great if Pyret had a function called @code{is-fixed}, that would do this for us?
                      }
                      @teacher{
                            Have a student @italic{act out} the @code{is-fixed} function. You give them an animal, and they tell you what they would type to find out if it is fixed.
                      }
                }
                @point{
                      @student{
                            Look back to the Definitions Area, and find the line that starts with @code{fun is-fixed}. This function isn't built into Pyret, but it's @italic{defined} here in the program, so we can use it just as if it were built into the language!
                            @activity{
                                Type @code{is-fixed(animalA)} into the Interactions Area. What did the function do?
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            You already know about the @code{.row-n} and @code{.order-by} methods. But suppose you want to get a table of only animals that have been fixed? Try typing this expression into the Interactions Area. What do you get?
                            @code[#:multi-line #t]{
                                animals-table.filter(is-fixed)
                            }
                      }
                      @teacher{
                            If time allows, ask students to explain what they think is going on.
                      }
                }
                @point{
                      @student{
                            The filter method walks through the table, applying whatever function it was given to each row, and producing a @italic{new table} containing all the rows for which the function returned @code{true}. In this case, we gave it the @code{is-fixed} function, so the new table had only rows for fixed animals.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bannerline{But how do we define functions like this?}
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
                            @bannerline{Step 1: Contract and Purpose} 
                            The first thing we do is write a Contract for this function. You already know a lot about contracts: they tell us the Name, Domain and Range of the function. Our function is named @code{is-fixed}, and it consumes a row from the animals table. It looks up the value in the @code{fixed} column, which will always be a Boolean. A Purpose Statement is just a description of what the function does:
                            @code[#:multi-line #t]{
                              # is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and looks up the value in the fixed column
                            }
                            Since the contract and purpose statement are notes for humans, we add the @code{#} symbol at the front of the line to turn it into a comment.
                      }
                      @teacher{
                        Be sure to check students' contracts and purpose statements before having them move on!
                      }
                }
                @point{
                      @student{
                            @bannerline{Step 2: Write Examples} Examples are a way for us to tell the computer how our function should behave for a @italic{specific} input. We can write as many examples as we want, but they must all be wrapped in an @code{examples:} block and an @code{end} statement. Examples start with the name of the function we're writing, followed by an example input. Suppose we have two animals defined, where @code{animalA} is fixed and @code{animalB} isn't. What work do we have to do on each row to look up whether they are fixed? What is will the result be for each animal?
                            @code[#:multi-line #t]{
                              # is-fixed :: (r :: Row) -> Boolean
                              # Consumes an animal, and looks up the value in the fixed column
                              examples:
                                is-fixed(animalA) is true
                                is-fixed(animalB) is false
                              end
                            }
                      }
                      @teacher{
                            Make sure students understand (1) that @code{is-fixed} came from the Name in our contract, (2) that @code{animalA} and @code{animalB} came from the Domain in our contract, and (3) that the Booleans are determined by whether those animals are fixed or not.
                      }
                }
                @point{
                    @student{
                          @bannerline{Step 3: Define the Function} We start with the @code{fun} keyword (short for "function"), followed by the name of our function and a set of parentheses. This is exactly how all of our examples started, too. But instead of writing @code{animalA} or @code{animalB}, we'll use the @italic{label} from our Domain. Then we add a colon (@code{:}) in place of @code{is}, and write out the work we did to get the answers for our examples. Finally, we finish with the @code{end} keyword.
                          @code[#:multi-line #t]{
                              # is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and looks up the value in the fixed column
                              examples:
                                is-fixed(animalA) is true
                                is-fixed(animalB) is false
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
                            This program is missing examples! Add an examples block in the Definitions Area, using your @code{animalA} and @code{animalB}. Check the Animals Dataset to make sure that your Booleans are correct for @italic{your} animals. If you click "Run", you'll see a report on whether the examples are correct. Make sure both of them pass!
                      }
                      @teacher{
                            Walk around to make sure everyone's examples pass.
                      }
                }
                @point{
                    @student{
                        @activity{
                            Now let's try coming up with a totally new function, and use the Design Recipe to help us write it. 
                            @itemlist[
                              @item{ Solve the word problem at the bottom of @worksheet-link[#:name "Design-Recipe-Lookup"]. } 
                              @item{ Type in the Contract, Purpose Statement, Examples and Definition into the Definitions Area. }
                              @item{ Click "Run", and make sure all your examples pass! }
                              @item{ Type @code{gender(animalA)} into the Interactions Area.} 
                            ]
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        So far, our functions have been pretty simple: they consume a row, and they look up one column from that row as-is. But suppose we want to find out specifically whether or not an animal is a cat, or whether it's young? Let's walk through a more complex Design Recipe together, by turning to @worksheet-link[#:name "Design-Recipe-Compute"].
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.1&2&1" "BS-DR.1&2&2" "BS-DR.1&2" "BS-PL.3&1&1" "BS-PL.3&1&2"  "BS-PL.3&1&3")]{
                          Define a function called @code{is-cat}, which consumes a row from the @code{animals-table} and returns true if the animal is a cat.
                          @itemlist[
                            @item{ Is this a Lookup, Compute or Relate question?}
                            @item{ What is the name of this function? What are its Domain and Range? }
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
                        To find out if an animal is a cat, we look at the @code{species} column and check to see if that value is @italic{equal to} @code{"cat"}. Suppose @code{animalA} is a cat and @code{animalB} is a lizard. What should our examples look like?
                        @code[#:multi-line #t]{
                              # is-cat :: (r :: Row) -> Boolean
                              # Consumes an animal, and compute whether the species is "cat"
                              examples:
                                is-cat(animalA) is true
                                is-cat(animalB) is false
                              end
                            }
                        @activity{ 
                          Write two examples for @italic{your} defined animals. Make sure one is a cat and one isn't!
                        }
                    }
                    @teacher{
                        Have students share their examples.
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
                              # is-cat :: (r :: Row) -> Boolean
                              # Consumes an animal, and compute whether the species is "cat"
                              examples:
                                is-cat(animalA) is true
                                is-cat(animalB) is false
                              end
                              fun is-cat(animal): animal["species"] == "cat"
                              end
                            }
                    }
                    @teacher{
                    
                    }
                }
                @point{
                    @student{
                        @activity{
                          Type this definition - and its examples! - into the Definitions Area, then click "Run" and try using it to filter the @code{animals-table}.
                        }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity{
                            For practice, try solving the word problem for @code{is-young} at the bottom of @worksheet-link[#:name "Design-Recipe-Compute"].
                        }
                    }
                    @teacher{

                    }
                }
        ]
  }

  @lesson/studteach[
     #:title "More About Table Methods"
     #:duration "15 minutes"
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
              @point{
                    @student{
                          Sometimes we want to @italic{add a column} to a table. For example, we could add a boolean column called "young" to the table, which is @code{true} if the animal is less than four years old and @code{false} if it's not. Pyret has another method for this.
                          @code[#:multi-line #t]{
                              animals-table.build-column("young", is-young)
                          }
                          @activity{
                              Type this into the Interactions Area and hit Enter. What did you get back?
                          }
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
                          Congratulations! You've explored the Animals dataset, formulated your own questions and begun to think critically about the connections between data and the questions we ask about it. For the rest of this course, you'll be learning new programming and Data Science skills, practicing them with the Animals dataset and then applying them to your own data.
                    }
                    @teacher{
                          Have students share which dataset they chose, and pick one question they're looking at.
                    }
              }
        ]
  }
}
