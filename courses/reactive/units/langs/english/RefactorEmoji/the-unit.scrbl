#lang curr/lib

@title{Drawing An Emoji}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       )]{

@unit-descr{Beginning with a working program, students refactor the code to be more readable, and practice using drawing functions in Pyret}
}
@unit-lessons{
@lesson/studteach[#:title "Refactoring Code to Draw an Emoji"
        #:duration "40 minutes"
        #:overview "Students practice reading and using functions which produce images, and learn about refactoring code to change the format, but not the result"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students refactor existing code to make an emoji image}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVR184UFVZZFNYSTA" "Robot Emoji"] file preloaded on student machines}
                                @item{The @editor-link[#:public-id "0B9rKDmABYlJVb2FMTGJCWlRzUHc" "Emoji Refactoring"] file preloaded on student machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[
        @point{@student{One of the most common tasks software developers find themselves performing is @vocab{refactoring} code. This means taking code that is already working and complete, and cleaning it up: adding comments, removing unnecessary expressions, and generally making their code more readable and useable by others. Refactoring does @italic{not} change the behavior of the program, only the appearance of the code. For instance, a messy expression like: 
                        @code[#:multi-line #t]{ (((4 * 4) + (3 / (8 - 6))) * (9 * 9)) * (1 + 1)}
                        could be refactored into:
                         @code[#:multi-line #t]{((num-sqr(4) + (3 / 2)) * num-sqr(9)) * 2}
                         Both expressions return the same value, but the second is much more readable. Refactoring can involve using existing functions (such as @code{num-sqr} in the example above) or writing new functions to perform small tasks.}
	       @teacher{}}

         @point{@student{Open the @editor-link[#:public-id "0B9rKDmABYlJVR184UFVZZFNYSTA" "Robot Emoji"] file and press 'Run'. In this file, there are two versions of the same program written by different students.
                         @activity{Take a look at the definitions in this file, and, with your partner, discuss what you notice. Which student's code is easiest to read and understand? Which formatting do you like better? If you were collaborating on a project with another programmer, which version of this code would you rather to receive, and why?}}
                 @teacher{Discus with students the differences in documentation, formatting, and organization of the two versions of the emoji code.}}
         
         @point{@student{Next, we're going to practice refactoring an existing program that draws an image.
                         @activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVb2FMTGJCWlRzUHc" "Emoji Refactoring"] file and click "Run".}
                         This code draws an image of a simple face emoji. Without changing the final image produced, can you see any opportunities to edit the code to make it more readable?
                         @activity{Refactor the code provided. This could include adding comments, more space betwen expressions, or simplifying the existing expressions. Once finished, write one more expression to create a smaller (emoji-sized) version of the original image.}}
                 @teacher{This activity can be done individually or as a class, with students giving suggestions for refactoring code projected at the front of the room. Once the refactoring is completed, students can practice using image functions to create an emoji of their own.}}
			
       
]}}
