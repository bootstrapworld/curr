#lang curr/lib

@title{Unit 9: Writing Up Results}

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
                                              @code{.row-n, .order-by, .filter, .build-column, num-sqr, mean, median, modes, bar-chart, pie-chart, scatter-plot, labeled-scatter-plot, lr-plot, labeled-lr-plot} 
                                                ""))]{
  @unit-descr{
      Students write a scaffolded research paper, pulling output from their programs and their students workbooks to create a coherent narrative.
  }
}
@unit-lessons{

  @lesson/studteach[
     #:title "Introduction"
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
                                Being able to talk about and understand linear regression is really important. It can be easy to misinterpret results, or to be seduced by the fancy-sounding phrase "linear regression"! As Data Scientists, you should be able to look at a chart and see if it really backs up the claim. Turn to @worksheet-link[#:name "Fake-News"] and see if you can spot what's wrong with each claim!
                        }
                        @teacher{

                        }
                }
        ]
  }

 @lesson/studteach[
     #:title "Writing Up Your Findings"
     #:duration "flexible"
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
                                Throughout this course, you've been learning new methods of visualizing data, measuring center, and searching for correlations and meaning. You've had a chance to explore your dataset throroughly, and become an expert on the ins, outs, and outliers within it. What have you found so far? Turn back to @worksheet-link[#:name "Findings-My-Dataset"], and share your most interesting finding with the students sitting nearby.
                        }
                        @teacher{
                                Have students share back some of their findings. Challenge them to use precise language, addressing the direction and strength of their correlations and use r-squared in their explanations.
                        }
                }
                @point{
                        @student{
                                Almost every unit in your student workbook has information about your analysis. It's time to take those pages and write them up as a formal research paper!
                                @activity[#:forevidence (list )]{
                                      @itemlist[
                                          @item{ Open the @(hyperlink "https://docs.google.com/document/d/1Pq-b6rFHDu78t5fCP6rBpEINivWraS3d-JND-QaBtfk" "sample research paper" ) }
                                          @item{ Select "Make a copy" from the File menu }
                                          @item{ Write in your name(s) and change the title }
                                      ]
                                }
                        }
                        @teacher{
                                Make sure students are doing following these steps carefully!
                        }
                }
                @point{
                        @student{
                                In the Research Paper, you'll find sections that correspond to pages in your workbook that are about your dataset. 
                                @activity[#:forevidence (list )]{
                                      For each page, write up your findings in the Research Paper. You should include tables, charts and graphs, along with paragraphs that explain each one. Make sure to @italic{write down your thinking}, so that another Data Scientist could understand why you performed your analysis.
                                }
                        }
                        @teacher{
                                At this point, students are done! Have students present their findings to one another, or host a Data Science Fair!
                        }
                }
        ]
  }
}

