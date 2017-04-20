#lang curr/lib

@title{Unit 3: Classifying Data}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students learn to differentiate categorical and quantitative data.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Classifying Data"
     #:duration "5 minutes"
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
							You have loaded your first tables into Pyret. These tables contain different data: the first is a table about the presidents of the US, and the second has nutritional information about items on a menu. Before we can dive into all of the cool things you can do with tables, we need to understand the two different kinds of data that can appear in tables: categorical and quantitative.					
					}
                    @teacher{
														
					}
             }
        ]
   }

@lesson/studteach[
     #:title "Quantitative Data"
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
                            Let's take another look at the first example table we saw in Unit 2.

                            @build-table/cols[
                                        '("First" "Last" "Color" "Height")
                                        '(("John" "Jane" "Javon" "Angela" "Jack" "Dominique" "Sammy" "Andrea")
                                          ("Doe" "Smith" "Jackson" "Enriquez" "Thompson" "Rodriguez" "Carter" "Garcia")
                                          ("Green" "Brown" "Brown" "Hazel" "Blue" "Hazel" "Blue" "Brown")
                                          ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
                                         (lambda (r c) (para ""))
                                         4 8
                            ]                      
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            The first kind of data we will look at is @vocab{Quantitative Data}. @vocab{Quantitative Data} always 
                            measures an amount of something. If a question asks "how much" 
                            there is of something, the answer will be quantitative data.                  
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Look at the Height (inches) column.  

                            If you ask the question "How tall is John Doe?" (in other words, how much 
                            height does John Doe have?), the answer is 52.0 inches. Quantitative Data usually has 
                            units of measurement; in this case the unit of measurement is inches.                    
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Another important fact is that Quantitative Data can be larger or smaller than other 
                            Quantitative Data. For example, if we ask the question "Is John Doe taller than Andrea Garcia?" 
                            (in other words, does John Doe have more height than Andrea Garcia), it can be answered by 
                            comparing their entries in the height column. John Doe's height is bigger than Andrea Garcia's, 
                            so we can say yes, he is taller.                   
                    }
                    @teacher{
                                                        
                    }
            }
        ]
   }
@lesson/studteach[
     #:title "Categorial Data"
     #:duration "15 minutes"
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
                            Now look at the Eye Color column.

                            @build-table/cols[
                                        '("First" "Last" "Color" "Height")
                                        '(("John" "Jane" "Javon" "Angela" "Jack" "Dominique" "Sammy" "Andrea")
                                          ("Doe" "Smith" "Jackson" "Enriquez" "Thompson" "Rodriguez" "Carter" "Garcia")
                                          ("Green" "Brown" "Brown" "Hazel" "Blue" "Hazel" "Blue" "Brown")
                                          ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
                                         (lambda (r c) (para ""))
                                         4 8
                            ]      
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Can we ask the question "Does John Doe have more eye color than Andrea Garcia?"  No. 
                            That question makes no sense! This is the second kind of data we will look at, called @vocab{Categorical Data}. 
                            We used Quantitative Data to quantify; to ask "how much" there is of something. 
                            We use @vocab{Categorical Data} to ask "which one"?
                            In this case, students are put into the same category if they have the same eye color.                   
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Let's consider eye color. How many different eye colors are there?  
                            }                   
                    }
                    @teacher{
                            Guide students towards this list: Amber, Blue, Green, Brown, Grey, Hazel.                         
                    }
            }
            @point{
                    @student{
                            So if there are only 6 different natural eye colors, then each value in the 
                            column has to be one of these categories. We would say that this 
                            column has 6 different possible categories.                     
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Open your @(hyperlink "https://drive.google.com/" "google drive") and open 
                                    the @code{unit-2} file which has the first two tables you've loaded into Pyret. 
                                    Then turn to TODO in your workbook and answer the questions about these two data sets. 
                            }                          
                    }
                    @teacher{
                                                        
                    }
            }
        ]
   }

@lesson/studteach[
     #:title "Rules of Thumb"
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
                            Knowing the difference between categorical and quantitative is an important part 
                            of data analysis, because (as you will see in the next couple units) there are 
                            different ways to learn from & visualize these two kinds of data.                   
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            If you are ever trying to figure out if data is categorical or quantitative, ask 
                            yourself: is this data measuring an amount of something? Does it make sense to 
                            add/subtract values in this column? If yes, then it is quantitative. 
                            Otherwise, it's categorical.                   
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            If a column contains numbers, it is usually quantitative, but not always! For example, a column containing zip codes is categorical, because zip codes are not measuring an amount of anything.                
                    }
                    @teacher{
                            Quantitative data may be continuous (no fixed number of possible values) or discrete (a fixed number of values). For example, a column containing scores for a test with two questions has 3 possible values: 0, 50, or 100. However, this is still quantitative and not categorical because the values are measuring an amount (the amount of correctness)                     
                    }
            }
            @point{
                    @student{
                            Being able to distinguish different kinds of data (categorical vs. quantitative) will be 
                            important because these different kinds of data are used to ask and 
                            answer questions in different ways.          
                    }
                    @teacher{
                                                        
                    }
            }
        ]
   }
}

