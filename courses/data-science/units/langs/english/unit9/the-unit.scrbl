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
                @point{
                        @student{
                              You'll be adding to this file as we go, and keeping a written repository of your work and your findings as well. We've created @(hyperlink "https://docs.google.com/document/d/1jbKSecOtdzVO4iJsIPQRLvnwrt8GhqVFyXvnukdT_Xo/edit?usp=sharing" "a Report Starter File") for this Report as well - save a copy to your account, and be sure to @bold{bookmark the page so you can return to it later}.    

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
                                
                        }
                        @teacher{

                        }
                }
        ]
  }
}

