#lang curr/lib

@title{Unit 8: Table Operations Part 2}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to booleans and comparisons, and practice using them as predicates to filter over rows in a table.}
}
@unit-lessons{
@lesson/studteach[
     #:title "A Taste of Sieving"
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to TODO in your workbooks and complete the warmup exercise asking questions with tables.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              To answer the questions in this exercise, you needed to look only at the rows that were circled.
                              One of the most important tasks in data science is being able to look only at particular rows in a table,
                              which have information you care about.  For example, when we ask which mammals have 4 legs, we only want 
                              to look at the rows that have mammals.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              It turns out that Pyret lets you create these special tables that keep only the rows you want.  But in 
                              order to do that, we need to learn how to ask questions for each row in code.
                      }
                      @teacher{

                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Booleans and Comparison"
     #:duration "20 minutes"
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      What do each of these expressions evaluate to?
                                      @itemlist[
                                                @item{
                                                      @code{5 + 3}
                                                }
                                                @item{
                                                      @code{4 * 2}
                                                }
                                                @item{
                                                      @code{3 > -2}
                                                }
                                                @item{
                                                      @code{8 < (1 + 1)}
                                                }
                                      ]
                              }
                      }
                      @teacher{
                              We recommend projecting/displaying what the last two expressions
                              evaluates to with a live coding section.
                      }
                }
                @point{
                      @student{
                              @itemlist[
                                      @item{
                                            When evaluated, the last two expressions print @code{true} and @code{false}, respectively.
                                            We haven't written expressions like this before in Pyret, but you may have seen similar ones
                                            in math class. 
                                      }
                                      @item{
                                            The @code{>} operator asks "is what's on the left hand side greater than what's on the right hand side?"

                                      }
                                      @item{
                                            The @code{<} operator asks "is what's on the left hand side less than what's on the right hand side?"
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
                @point{
                      @student{

                      }
                      @teacher{
                      
                      }
                }
        ]
   }

@lesson/studteach[
     #:title "Sieve in Pyret"
     #:duration "20 minutes"
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
}

