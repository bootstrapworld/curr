#lang curr/lib

@title{Unit 9: Threats to Validity }

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
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       (list "Table"
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart} 
                                                ""))]{
  @unit-descr{
    Students investigate scatter plots as a method of visualizing the relationship between two axes, and begin searching for correlations in their dataset.
  }
}
@unit-lessons{

  

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
     #:title "Closing"
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
                              After looking at the scatter plot for our animal shelter, do you still agree with the claim on @worksheet-link[#:name "Cuter-Adoption"]? Perhaps you need more information, or to see the analysis broken down separately by animal. 
                        }
                        @teacher{
                        
                        }
                }
                @point{
                        @student{
                              You've started to look for correlations in your dataset, and now you know how to create scatter plots to visualize them. But how do we know if a correlation is @italic{strong enough} to be useful? Eyeballing charts isn't good enough! In the next Unit, you'll learn how to calculate the strength of a correlation, and you'll investigate the correlations in your research that you mapped out here.
                        }
                        @teacher{

                        }
                }
        ]
  }
}
