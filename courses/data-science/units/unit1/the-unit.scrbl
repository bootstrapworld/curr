#lang curr/lib

@title{Unit 1: Introduction to Pyret}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to the Pyret development, and fundamental syntactic elements of the Pyret language: values, expressions, operations, and functions.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Programs, Values & Errors"
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
                            Welcome to Bootstrap Data Science Lite. In this course, 
                            you'll learn how to ask and answer questions about data.  The process 
                            of learning from data is called @vocab{Data Science}.  Data science techniques 
                            are used by scientists, business people, politicians, sports analysts, 
                            and hundereds of other different fields to ask and answer questions about data.
                    }
                    @teacher{
                            Motivate relevance of data science by using examples that
                            relate to student interests.  Here are some examples:
                            @itemlist[
                                    @item{@(hyperlink "http://motherboard.vice.com/read/a-data-scientists-emoji-guide-to-kanye-west-and-taylor-swift" "Emojis")}
                                    @item{@(hyperlink "https://mic.com/articles/131092/these-students-are-using-data-science-to-predict-which-rap-songs-will-become-hits#.0d3wkhxQE" "Pop Music")}
                                    @item{@(hyperlink "http://www.kdnuggets.com/2016/06/politics-analytics-trump-clinton-sanders-twitter-sentiment.html"  "Election Analysis")}
                                    @item{@(hyperlink "http://fivethirtyeight.com/" "Polling")}
                                    @item{@(hyperlink "http://games.espn.com/fba/tools/projections" "Predicting Sports Performance")}
                                    @item{@(hyperlink "http://www.salon.com/2015/07/18/how_big_data_can_help_save_the_environment_partner/" "Environmental")}
                            ]
                    }
             }
             @point{
                    @student{
                            In order to ask questions from data, you will use a @vocab{programming language}.  
                            Just like any language (English, Spanish, French), programming 
                            languages have their own vocabulary and grammar that you will need to learn.  
                            The language you'll be learning for data science is Pyret, which lets you ask 
                            and answer questions quickly from very large data sets.
                    }
                    @teacher{
                            Set expectations for the class.  This course is an introduction to
                            programming and data science, so some of the questions students want
                            to answer may be out of scope.  However, this course will give students
                            a foundation to answer their more complicated questions later in their 
                            data science education. 
                    }
            }
             @point{
                    @student{
                            Begin by opening the @editor-link["code.pyret.org editor"].  Hit the log in button, and sign in with your
                            Google account information, then choose "Start Coding".
                    }
                    @teacher{
                            Each student (or pair of students) should have a Google Account.    
                    }
             }
             @point{
                    @student{
                            @bitmap{images/wireframeIDE.png}This screen is called the @vocab{editor}, and it looks something
                            like the diagram you see here. There are a few buttons at the top, but most of the screen is 
                            taken up by two large boxes: the @vocab{Definitions area} on the left and the 
                            @vocab{Interactions area} on the right.


                            For now, we will only be writing programs in the Interactions area.
                    }
                    @teacher{
                            The Definitions area is where programmers define values and functions in their program, 
                            while the Interactions area allows them to experiment with those values and functions. 
                            This is analogous to writing a series of function definitions on a blackboard, and having 
                            student evaluate expressions using those function on scrap paper. As students are not yet 
                            defining values of their own, it is not important that students understand this distinction 
                            right now.  For now, we will work only with the Interactions area.
                    }
             }
             @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{Begin by typing @code{4} into the Interactions area, then hit 
                                        Return.  You should see the value 4 appear on 
                                        the next line in the Interactions area.
                            }

                            Congratulations, you've written your first program!  Yes, really.  When a program
                            is run, the editor will turn that program into a @vocab{value}.  Values are how the computer represents
                            data.  In this case, the editor's job is easy because the program is already a value!  When we hit Run,
                            we @vocab{evaluate} the program, which is another way of saying "give me the value that is produced by
                            this program".
                    }
                    @teacher{

                    }
             }
             @point{
                    @student{
                            @itemlist[
                                @item{
                                     Type 10 in the Interactions area and hit "Return".  Now the 
                                     value @code{10} appears in the Interactions area.
                                }
                                @item{
                                    Try evaluating numbers, like @code{10345017}, or negative 
                                    numbers, like @code{-2}. Is there a limit to how big a number can be?
                                    What happens if you write a decimal? What happens when you click on
                                    a decimal, like @code{0.75}? You get a new type of number, a 
                                    fraction, like @code{3/4}.
                                }
                            ]
                    }
                    @teacher{
                            The editing environment evaluates all fractions and returns them as decimals by default. This can be
                            surprising to students at first, so you may want to take a moment to explain what's going on, and 
                            show them that these decimals can be converted back to fractions just by clicking on them.  The 
                            environment uses standard annotations for repeating, non-terminating decimal expressions and 
                            properly handles expressions like @math{(\sqrt -1)}.  If you want to work with those kinds of 
                            numbers in your class, enter them to get familiar with how they appear in the Interactions area.             
                    }
             }
             @point{
                    @student{
                            All values that a computer program can produce have a @vocab{type}.  Each of the values 
                            produced by the programs you just wrote are Numbers.  Another fundamental type is @vocab{String}.  A String
                            is a sequence of characters (letters, numbers, symbols) in between a pair of quotation marks @code{""}.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    @itemlist[
                                            @item{
                                                 Begin by typing @code{"Ahoy, World!"} into the Interactions area, then hit 
                                                 Return.  You should see the value "Ahoy, World!" appear on 
                                                 the next line in the Interactions area.
                                            }
                                            @item{
                                                 Try to type your name within a pair of quotation marks, then hit Return.
                                            }
                                            @item{
                                                 What happens when you leave off the second quotation mark?  Type this
                                                 code into the Interactions area and hit Return: @code{"I love writing programs}
                                            }
                                    ]
                            }
                    }
                    @teacher{
                            
                    }
             }
             @point{
                    @student{
                            Notice when you leave off the second quotation mark, @code{"I love writing programs} is NOT
                            printed on the next line;  instead, we get a big red box.  This big red box is an @vocab{error message}.
                            The editor gives us error messages when a program can't be properly evaluated.


                            Don't worry, you have NOT broken the computer!  Running into error messages is a natural part of
                            programming;  they exist so that you can change your code to help the computer understand it.  In the case above,
                            without the second quotation mark the computer can't figure out when the end of the String is, which makes
                            evaluation impossible.

                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Fix the error described in the error messages by typing @code{"I love writing programs"}
                                    and hitting the Return key.
                            }
                    }
                    @teacher{
                            It is crucial to encourage students to read error messages and debug their code.  Often, when a student
                            encounters an error message for the first time, they will throw their hand up and tell the teacher 
                            "I did something wrong".  When helping students with this, make sure to ask questions about the answer 
                            rather than fixing code for them.
                    }
             }
        ]
   }

@lesson/studteach[
     #:title "Expressions & Operations"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{Make sure each student (or pair of students) has a Google Account}]
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
        ]
   }

@lesson/studteach[
     #:title "Identifiers & Variables"
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
     #:title "Function Definition & Application"
     #:duration "30 minutes"
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
     #:title "Closing"
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

										}
                    @teacher{

										}
             }
        ]
   }
}


