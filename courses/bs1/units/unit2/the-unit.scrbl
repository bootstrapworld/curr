#lang curr/lib

@declare-tags[group management pedagogy selftaught]
@title{Unit 2: Contracts, Strings and Images}
@unit-overview/auto{

@unit-descr{Students are introduced to a set-mapping representation for functions, in which the function object exists as a means of translating points
from a Domain into a Range. Coupled with their understanding of Circles of Evaluation, students generalize their understanding of functions to
include other datatypes, including Strings and Images.}

@(language-table (list "Number" @code{+ - * / sq sqrt expt}))
}


@lesson/studteach[
     #:title "Circles of Evaluation Review"
     #:duration "30 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "A-SSE.1-2" "N-Q" "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Practice the Circles of Evaluation, using the activity sheet on @worksheet-link[#:page 3 #:name "Circles-of-Evaluation-Practice-2"] in your workbooks.
                       @itemlist[@item{In each row, there is a mathematical expression written on the lefthand column.}
                                 @item{Go through each of these expressions, and first draw the Circle of Evaluation for each one.}
                                 @item{Once you've coverted each of them, go to the third column and convert each one into a program that can be entered on the computer. Don't forget to check your parentheses, and to be careful about leaving a space between each input}]}}
                        @teacher{Make sure students have the opportunity to practice drawing Circles from the inside-out (beginning with a large Circle and filling it in), and from the outside-in (starting with the innermost expression, and building out). @management{This can be done as a team competition, with each round requiring teams of students to fill in each square of the activity sheet. Make sure you review after @bold{every} round, to catch mistakes in understanding early.}}
                        }
                 ]
         }

@lesson/studteach[
     #:title "Strings and Images"
     #:duration "20 minutes"
     #:overview "Students extend the Circle of Evaluation metaphor to include new functions and datatypes."
     #:learning-objectives @itemlist[@item{When given Circles of Evaluation that for novel expression, functions and datatypes, students will be able to apply the rules for converting Circles of Evaluation into Code.}
                                      @item{Students will be able to identify what each argument to an image-producing function means}
                                      @item{Students will be able to write expressions that generate simple images (triangles, circle, stars, etc)}
                                      @item{Given a value, students will be able to identify it's datatype.}
                                      @item{Given an expression, students will be able to identify the datatype it will evaluate to.}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "A-SSE.1-2" "N-Q" "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[          
            @point{@student{@bitmap{images/StarCircleOfEvaluation.png}The Circles of Evaluation are a powerful tool, and can be used for much more than just numbers. Consider the Circle of Evaluation shown here.
                             @itemlist[@item{What is the name of the function being used?}
                                        @item{How many arguments are being given to that function?}
                                        @item{What do you think this function will do?}]
                             The same rules you used to convert a Circle of Evaluation into code still apply. Here is the code for that Circle: @bannerline{@code{(star 50 "solid" "red")}}
                             }
                    @teacher{Students are not expected to know all the answers here - the goal is for them to apply what they know about Circles to a novel expression, and discuss for themselves what they think it might mean. Ask them to justify their answers, and to explain why they think they are correct. Linking this back to earlier examples of Circles of Evaluation may be useful.}
                    }
             @point{@student{@activity{Type this code into the Interactions window, and hit "Return". What did you get back?
                                       @itemlist[@item{What does the @code{star} function do?}
                                                  @item{Try typing it again, but this time use a much larger number in place of @code{50}. What does the first argument tell the computer?}
                                                  @item{Try typing the expression, this time using @code{"outline"} in place of @code{"solid"}, being careful to keep the quotation marks! What does the second argument tell the computer?}
                                                  @item{Now replace @code{"red"} with something else (again, keep the quotation marks!). What does the third argument tell the computer?}]
                                       @embedded-wescheme[#:id "ImagePlayground1"                                             
                                                                   #:height 150
                                                                   #:hide-toolbar? #t
                                                                   #:hide-project-name? #t
                                                                   #:hide-footer? #t
                                                                   #:hide-definitions? #t
                                                                   #:interactions-text "(star 50 \"solid\" \"red\")"]
                                       } 
                             }
               
                     @teacher{This activity is designed to get students @italic{playing} with new terms and concepts, so they develop their own model for what's going on. At this point, it is NOT essential that students understand every last component of the code. If you need to give away lots of code snippets, that's ok - just get them playing!}
                     }
             @point{@student{There's an entirely new type of value being used in these expressions: @code{"solid"} and @code{"red"} are examples of a completely new datatype, called a @vocab{String}.  @bannerline{@bold{A String is anything written inside quotation marks.}} When you first learned about @vocab{values}, you saw that a program can be nothing more than a value, such as a number. Look at the example below, in which the @vocab{value} @code{716} evaluates to itself:
                                          @embedded-wescheme[#:id "StringIntro"                                             
                                                                   #:height 50
                                                                   #:hide-toolbar? #t
                                                                   #:hide-project-name? #t
                                                                   #:hide-footer? #t
                                                                   #:hide-definitions? #t
                                                                   #:interactions-text "716"]
                                          Since Strings are values too, the @vocab{value} @code{"red"} can be used as well. Just like number values, strings will evaluate to themselves.
                                          @activity{Try entering different Strings into the Interactions window. What happens if you put quotes around multiple words (@code{"like this"}), or around Numbers (like @code{"42"})?}
                                       }
                     @teacher{Students should see Strings as an analog to Numbers: a different type of value, but one that behaves according to the same rules.}
                     }
             @point{@student{This expression also included a new @vocab{function} called @code{star}. Just as the addition function (@code{+}) takes in two Numbers, @code{star} takes in @italic{a Number and two Strings}, and produces a new datatype, called an @vocab{Image}.
                            @activity{What is the datatype of each of the values listed below -- Number, String or Image? 
                                      @itemlist[@item{@code{42}}
                                                 @item{@code{"Hi, mom!"}}
                                                 @item{@code{9273482.42}}
                                                 @item{@bitmap{images/TriangleImage.png}}
                                                 @item{@code{"84729"}}
                                                 @item{@code{"  "}}
                                                 @item{@bitmap{images/coffee-cup.png}}]
                                                 }}
                     @teacher{Students have now seen three datatypes: Numbers, Strings and Images. You'll want to make sure students can correctly identify examples of each one.}
                     }
             @point{@student{You've also seen expressions that @vocab{produce} values, such as @code{(* 16 4)}, which produces a Number. Other expressions, however, can produce Strings or Images. 
                             @activity{What datatype will each of the expressions listed below evaluate to?
                                      @itemlist[@item{@code{(/ (+ 7 2) 3)}}
                                                 @item{@code{(star 500 "solid" "purple")}}
                                                 @item{@code{(star (+ 1 3) "outline" "blue")}}
                                                 @item{@code{(- (* 4 2) (+ 1 0))}}
                                                 ]}}
                     @teacher{For added practice, have students identify the type of each argument in each of those expressions. Going Further - If time allows, you can go further into @lesson-link[#:name "Manipulating-Images" #:label "Manipulating Images"] or @lesson-link[#:name "Making-Flags" #:label "Making Flags"].}
                     }
             ]}
            
          
@lesson/studteach[
     #:title "Contracts and Purpose Statements"
     #:duration "45 minutes"
     #:overview "Students learn to describe functions and their behavior, using formalisms including Contracts (Domain and Range), Datatypes and Purpose Statements."
     #:learning-objectives @itemlist[@item{Given an expression, students will be able to identify the name of the function being used}
                                      @item{Given an expression, students will be able to identify how many arguments are used}
                                      @item{TODO: Given a value, students will be able to identify it's type}
                                      @item{TODO: Students will be able to distinguish between types and values}
                                      @item{TODO: Students will be able to identify the parts of a contract}
                                      @item{TODO: Students will be able to distinguish between contracts and examples}
                                      @item{TODO: Students will articulate the reason for writing purpose statements}
                                      @item{TODO: Given an example of a function being applied, students will be able to write a contract and purpose statement}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "A-SSE.1-2" "N-Q" "MP.1" "MP.4" "MP.6" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{There are many functions available in our language, which can draw all kinds of shapes. The mix of arguments each function takes in is called the @vocab{Domain}, while the data it produces is called the @vocab{Range}. For example, the function @code{+} takes in two Numbers as its Domain, and produces a single Number as its Range. Each image function takes a slightly different Domain, with some taking one Number and two Strings, and others taking two Numbers and two Strings, etc. It can be easy to forget the Domains for each function! Programmers use special notes, called @vocab{contract} to keep track of what each function needs.
                 @bannerline{A Contract specifies the Name, Domain and Range of a function.}
                 The contract for @code{star} is:
                 @code[#:multi-line ""]{; star: Number String String -> Image}
                 This means that the @vocab{Name} of the function is @code{star}, that it takes in a Number and two Strings as its Domain, and produces an Image as the Range. We use types instead of values when we write a Contract, because we want to be more general: a star could be of any size, so the Domain for @code{star} specifies that the first argument could be any Number.}
                     @teacher{This is a core concept in the curriculum, and you will want to make sure that students are comfortable with the terminology and the concept.}
                     }
             @point{@student{Here is the contract for a new function:
                 @code[#:multi-line ""]{; rectangle: Number Number String String -> Image}
                 @activity{@itemlist[@item{What is the @vocab{Name} of this function?}
                                      @item{How many things are the @vocab{Domain} of this function?}
                                      @item{What is the type of each of the things in the Domain?}
                                      @item{What is the @vocab{Range} of this function?}
                                      ]}
                 A Contract tells you exactly how to use the function, by writing it's Name and then using @vocab{values} for each of the argument it the @vocab{Domain}. Here is an example of an expression, written to use @code{rectangle}.
                 @embedded-wescheme[#:id "ImagePlayground2"                                             
                                         #:height 150
                                         #:hide-toolbar? #t
                                         #:hide-project-name? #t
                                         #:hide-footer? #t
                                         #:hide-definitions? #t
                                         #:interactions-text "(rectangle 100 50 \"solid\" \"blue\")"]}
                     @teacher{Have students change these values, always drawing attention back to the Domain.}
                     }
             @point{@student{By writing down the Contracts for our functions, we can easily look back to see how they are used.
                             @activity{The Contract for @code{+} is shown below. Can you write the Contract for @code{*}, @code{-}, @code{/} and @code{sqrt}?}}
                     @teacher{Pay close attention to student use of types in their Contracts, rather than values. Students should not be writing actual Numbers or Strings anywhere here.}
                     }
             @point{@student{Now that you know how to use a Contract to write an expression, here are the Contracts for several new Image-producing functions:
                             @code[#:multi-line ""]{; ellipse: Number Number String String -> Image
                                                    ; triangle: Number String String -> Image
                                                    ; circle: Number String String -> Image
                                                    ; text: String Number String -> Image}
                             @activity{See if you can figure out how to use them to draw other shapes!
                             @embedded-wescheme[#:id "ImagePlayground3"                                             
                                         #:height 150
                                         #:hide-toolbar? #t
                                         #:hide-project-name? #t
                                         #:hide-footer? #t
                                         #:hide-definitions? #t
                                         #:interactions-text "(ellipse 150 40 \"outline\" \"black\")"]}
                             }
                     @teacher{You should start pushing students to write more sophisticated expressions, replacing Number values with entire expressions (e.g. @code{(star (* 10 5) "solid" "purple")}). Students should be comfortable looking at an entire subexpression as a single argument to the surrounding function. @management{You may wish to force students to write these Contracts into their notebooks BEFORE allowing them to play with them. Be careful about letting students rush to the keys without first taking notes!}}
                     }
             ]}
@pedagogy{
@lesson[#:title "Closing"
        #:duration "5 minutes"]{
    @pedagogy{@itemlist[@item{Who can tell us one thing we learned today?}
                             @item{Who saw someone else in the class do something great?}
                             @item{Cleanup, dismissal.}]}

    @tag[selftaught]{@itemlist[@item{Think about what you learned today.}
                               @item{Remember contracts and how to make them.}
                               @item{Think of strings and what differentiates a string from a different type.}
                               @item{Think about images and what goes into creating an image.}
                               @item{Have an awesome day!}]}
}
}

@copyright[]
