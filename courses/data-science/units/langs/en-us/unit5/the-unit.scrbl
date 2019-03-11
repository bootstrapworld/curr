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
