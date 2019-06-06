#lang curr/lib

@title{Unit 6: Advanced Analysis }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{+, -, *, /, num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat, string-contains} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay, bar-chart, pie-chart, bar-chart-raw, pie-chart, raw, histogram} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{count, .row-n, .order-by, .filter, mean, median, mode}
                                              ""))]{
  @unit-descr{
     Students continue practicing the Design Recipe, and learn how to build and transform columns in a table. They also learn how to chain methods together, and define more sophisticated subsets. Finally, they consider the concept of trust and testing - how do we know if a particular analysis is trustworthy?
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
                      Take a minute to look back at the @resource-link[#:path "OpeningQuestions.pdf" #:label "opening questions"] you saw at the beginning of the class, and choose another one that interests you.
                      @activity[#:forevidence (list "6.SP.1-3&1&1")]{
                        Using what you know now, what information would you need to collect in order to answer it? What subsets would you need to create? What analysis would you need to perform?
                      }
                    }
                    @teacher{
                      Debrief as a class.         
                    }
            }
            @point{
                  @student{
                      @activity{
                        @itemlist[
                          @item{ What kinds of displays and charts have you learned about so far? }
                          @item{ What does each kind of display tell us about a dataset? }
                          @item{ When would you use each kind of display? }
                        ]
                      }
                  }
                  @teacher{
                      Spend some time on this - let students discuss amongst themselves, and facilitate as necessary.
                  }
            }
      ]
  }

  @lesson/studteach[
     #:title "Chaining Methods"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn the syntax for chaining methods together}]
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
                        Table methods can be chained together, so that we can build, filter @italic{and} order a Table. For example:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, ordered by species
                            animals-table.build-column("label", nametag).filter(is-fixed).order-by("species", true)
                        }
                        This code takes the @code{animals-table}, and builds a new column. According to our Contracts Page, @code{.build-column} produces a new Table, and that's the Table whose @code{.filter} method we use. That method produces @italic{yet another Table}, and we call that Table's @code{order-by} method. The Table that comes back from that is our final result.
                    }
                    @teacher{
                        Suggestion: use different color markers to draw nested boxes around each part of the expression, showing where each Table came from.
                    }
              }
              @point{
                    @student{
                        It can be difficult to read code that has lots of method calls chained together, so we can add a line-break before each "@code{.}" to make it more readable. Here's the exact same code, written with each method on its own line:
                        @code[#:multi-line #t]{
                            # get a table with the nametags of all the fixed animals, order by species
                            animals-table
                              .build-column("label", nametag)
                              .filter(is-fixed)
                              .order-by("species", true)
                        }
                    }
                    @teacher{
                    
                    }
              }
              @point{
                    @student{
                        @bannerline{Order matters: Build, Filter, Order.}
                        Suppose we want to build a column and then use it to filter our table. If we use the methods in the wrong order (trying to filter by a column that doesn't exist yet), we might wind up crashing the program. Even worse, the program might @italic{work}, but produce results that are incorrect! 
                        @bannerline{When chaining methods, it's important to build first, then filter, and then order.}
                    }
                    @teacher{
                    
                    }
              }
              @point{
                      @student{
                          How well do you know your table methods? Complete @worksheet-link[#:name "Chaining-Methods"] and @worksheet-link[#:name "Chaining-Methods2"] in your Student Workbook to find out.
                      }
                      @teacher{
                          Have students discuss their answers.
                      }
              }
        ]
  }


  @lesson/studteach[
     #:title "Confirming Analysis"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn how to define functions using Table Plans}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students define functions that sort, filter, or extend the animals table}]
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.4" "Data 3.1.1")
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
                        Data Analysis is often used to make @italic{predictions} based on some sample data. For example, we might look at the Animals Dataset and try to make predictions about @italic{other} animal shelters based on that sample. But if the sample dataset doesn't represent the full population, those predictions can be wrong - and sometimes, really @italic{really} wrong!
                        @itemlist[
                            @item{ 
                              Uber and Google are making self-driving cars, which use artificial intelligence to interpret sensor data and make predictions about whether a car should speed up, slow down, or slam on the brakes.  This AI is trained on a lot of sample data, which it learns from. What might be the problem if the sample data only included roads in California?
                            }
                            @item{
                              Law enforcement in many towns has started using facial-recognition software to automatically detect whether someone has a warrant out for their arrest. A lot of facial-recognition software, however, has been trained on sample data containing mostly white faces. As a result, it has gotten really good at telling white people apart, but @(hyperlink "http://www.theweek.co.uk/95383/is-facial-recognition-racist" "often can't tell the difference between people who aren't white"). Why might this be a problem? 
                            }
                            @item{
                              Why might it be a bad thing to only test medicines only on men (or only on women), before prescribing them to the general public?
                            }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        @bannerline{Sample Data Matters!}
                        A good Sample Table should be @italic{representative} of the population, and @italic{relevant} to what's being analyzed.
                        @itemlist[
                              @item{
                                  @italic{At least} the columns that matter - whether we'll be ordering or filtering by those columns.
                              }
                              @item{
                                  A good Sample Table has enough rows to be a representative sample of the dataset. If our dataset has a mix of dogs and cats, for example, we want at least one of each in this table.
                              }
                              @item{
                                  A good Sample Table has rows in mostly random order, so that we'll notice if our analysis winds up sorting them.
                              }
                        ]
                    }
                    @teacher{

                    }
              }
              @point{
                    @student{
                        Sample Tables can also be used to @italic{verify} that a certain analysis is correct. For example: suppose you've been given a function that is supposed to filter a table and @italic{show only the cats}. If you test it on a Sample Table that only has cats to begin with, will that tell you whether or not the function works?
                    }
                    @teacher{
                        You'll need a table with cats and non-cats.
                    }
              }
              @point{
                    @student{
                        @activity{
                            Suppose you have a function that takes in a table of animals and shows @italic{only the kittens}. What would your Sample Table need to have in order to verify this function?
                        }
                    }
                    @teacher{
                        You'll need a table with cats and non-cats, as well as cats under the age of 2.
                    }
              }
              @point{
                    @student{
                        @activity{
                            Suppose you have a function that takes in a table of animals and shows @italic{only the kittens}, sorted in ascending order by weight. What would your Sample Table need to have in order to verify this function?
                        }
                    }
                    @teacher{
                        You'll need a table with cats and non-cats, as well as cats under the age of 2, with the rows ordered randomly.
                    }
              }
              @point{
                    @student{
                        Turn to @worksheet-link[#:name "Trust-but-Verify"] in your student workbook. On each page, you've been given a function called @code{fixed-cats} and a description of what it @italic{claims to do}.
                        @activity{
                          List the names of the animals that you would use in a Sample Table to verify whether the function works as-advertised. When you've finished, open the @editor-link[#:public-id "1VVz4l0P6GLwbcpYyAGYJuRgBxj69R52Z" "Trust-but-Verify"] Starter File. There are three versions of @code{fixed-cats} here. Are they all correct? If not, which ones are broken?
                        }
                    }
                    @teacher{
                      Debrief with the class.
                    }
              }
              @point{
                    @student{
                          @activity{
                            Turn to @worksheet-link[#:name "Trust-but-Verify2"]. Using the same Starter File, construct a Sample Table and figure out which (if any) of the functions are correct!
                          }
                    }
                    @teacher{
                      Debrief with the class.
                    }
              }
        ]
    }

  @lesson/studteach[
     #:title "Rolling up our sleeves"
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
                        Use this time to continue your analysis, and try using Method Chaining to make your code simpler or easier to read. For example, now you can chain together two simple filter functions instead of having to write a third one!
                    }
                    @teacher{
                        
                   }
              }
        ]
  }
}