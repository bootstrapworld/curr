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

                                      What type do the last two expressions produce?
                              }
                      }
                      @teacher{
                              We recommend projecting/displaying what the last two expressions
                              evaluates to with a live coding section.
                      }
                }
                @point{
                      @student{
                              This expression produces a new type, called a @vocab{boolean}.
                              A boolean type can only have two values:  either true, or false.
                              Computer scientists and data scientists use boolean values whenever
                              they are asking yes or no questions of data.  For example, the 
                              expression @code{2 > 1} is asking "is 2 greater than one?".  The 
                              answer is yes, so the computer will produce @code{true}.

                      }
                      @teacher{
                              Ask students to try and put a type to this expression.  Some
                              students may guess String, because the interactions window
                              will print a string of characters.  If they do, point out
                              that what is printed does not have any quotation marks.
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      What do each of these expressions evaluate to?
                                      @itemlist[
                                                @item{
                                                      @code{18 > 18}
                                                }
                                                @item{
                                                      @code{18 >= 18}
                                                }
                                                @item{
                                                      @code{-5 <= 20}
                                                }
                                      ]
                              }

                              Pyret also lets us ask if two Numbers are greater than or equal 
                              to (@code{>=}), or less than or equal to (@code{<=}).  
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              So far we can compare numbers with @code{>, <, <=, >=}.
                              Pyret allows us to ask the question "are these two numbers equal?"
                              with the following operator:  @code{==}

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      What do each of these expressions evaluate to?
                                      @itemlist[
                                                @item{
                                                      @code{-4 == -4}
                                                }
                                                @item{
                                                      @code{3 == 2}
                                                }
                                                @item{
                                                      @code{0 == -8 + 8}
                                                }
                                                @item{
                                                      @code{12 - 4 == -4 + 12}
                                                }
                                      ]

                                      Is there a difference between @code{=} and @code{==}?
                              }
                      }
                      @teacher{
                              @itemlist[
                                    @item{
                                          Ask the students to give you an example of a definition using
                                          @code{=}, binding some number to the variable @code{x}.  Then 
                                          prompt them with the following:  "how would you ask if x is equal to 10".
                                          This will show them that the same syntax can't be overloaded.
                                    }
                                    @item{
                                          You can convince them of this important distinction by having them test
                                          their hypothesis in the interactions window:  after writing @code{x = 4}
                                          in the interactions window, evaluating the expression @code{x = 10} will
                                          produce an error because @code{x} is already defined.   
                                    }
                              ]
                      }
                }
                @point{
                      @student{
                              @itemlist[
                                    @item{
                                          @code{==} is very different from @code{=}!  @code{=} declares a variable
                                          to be equal to some value, whereas @code{==} asks a question:  are these
                                          two things equal?
                                    }
                                    @item{
                                          Pyret also allows you to ask "are these two values NOT equal?" with 
                                          this operator:  @code{<>}.
                                    }
                              ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to TODO in your workbooks, and complete the exercise.  Call 
                                      over the teacher when you have finished the worksheet
                              }
                      }
                      @teacher{
                              The exercise contains challenge questions where students must compare
                              Strings for equality.  Some students may have some intuition about this, but
                              this activity "salts the waters" a discussion of String comparisons.
                      }
                }
                @point{
                      @student{
                              @itemlist[
                                    @item{
                                          The second table has expressions that evaluate to booleans, but they 
                                          are different from other boolean expressions because they compare Strings
                                          for equality.
                                    }
                                    @item{
                                          Strings can only be equal if they are EXACTLY equal, down to every character.
                                          If two strings have the same characters, but one is upper case and the
                                          other is lower case, they are NOT equal!
                                    }
                              ]
                      }
                      @teacher{
                              A very common bug when writing sieve queries is for students to use the incorrect
                              case, or add extra spaces, within the target String.  If students are having 
                              trouble with their programs, or if their sieve queries produce completely empty
                              tables, ask them if their target String is exactly what they want it to be.
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

@lesson/studteach[
     #:title "Sieve, Order, and Select"
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

