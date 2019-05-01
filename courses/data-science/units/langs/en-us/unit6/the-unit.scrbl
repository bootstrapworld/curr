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
   #:duration "20 minutes"
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
                
      ]
  }

  @lesson/studteach[
     #:title "Chaining Methods"
     #:duration "15 minutes"
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
                        @bannerline{Sample Data Matters!}
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
                          
                    }
                    @teacher{
                    }
              }
              @point{
                    @student{

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
                           
                    }
                    @teacher{
                      
                   }
              }
        ]
  }
}