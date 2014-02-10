#lang curr/lib

@declare-tags[management]

@title{Unit 2: Contracts, Strings and Images}
@unit-overview/auto[#:lang-table (list "Number" @code{+ - * / sq sqrt expt})]{
@unit-descr{Students are introduced to a set-mapping representation for functions, in which the function object exists as a means of translating points
from a Domain into a Range. Coupled with their understanding of Circles of Evaluation, students generalize their understanding of functions to
include other datatypes, including Strings and Images.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Circles of Evaluation Review"
     #:duration "30 minutes"
     #:overview "Students practice converting arithmetic expressions into Circles of Evaluation, and then converting those into Code."
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "N-Q" "BS-CE")
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1Qn59Fol2tspqOx6XQV88xm-IYsRGY769cb7MQeknSMA/edit?usp=sharing" "Warmup activity sheet").}
                              @item{Student Workbooks, and something to write with.}]
     #:prerequisites (list "Order of Operations")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4")]{Practice the Circles of Evaluation, using the activity sheet on @worksheet-link[#:page 6 #:name "Circles-of-Evaluation-Practice-2"] in your workbook.
                       @itemlist[#:style 'compact
	                         @item{In each row, there is a mathematical expression written on the left-hand column.}
                                 @item{Go through each of these expressions, and draw the Circle of Evaluation for each one in the second column.}
                                 @item{Once you've converted each of them, go to the third column and convert each one into a program that can be entered on the computer. Don't forget to check your parentheses, and to be careful about leaving a space between each input.}]}}
                        @teacher{Make sure students have the opportunity to practice drawing Circles from the outside-in (beginning with a large Circle and filling it in), and from the inside-out (starting with the innermost expression, and building out). @management{This can be done as a team competition, with each round requiring teams of students to fill in each square of the activity sheet. Make sure you review after @bold{every} round, to catch mistakes in understanding early.}}
                        }
                 ]
         }
@lesson/studteach[
     #:title "Strings and Images"
     #:duration "20 minutes"
     #:overview "Students extend the Circle of Evaluation metaphor to include new functions and datatypes."
     #:learning-objectives @itemlist[@item{Students will be able to use functions that produce Images}
                                     @item{Students will understand the concept of datatype}
                                     @item{Students will understand that each value has a datatype}
				     @item{Students will understand that datatypes describe a function's inputs and outputs}
                                    ]
     #:evidence-statements @itemlist[@item{When given Circles of Evaluation for novel expression, functions and datatypes, students will be able to apply the rules for converting Circles of Evaluation into code}
                                     @item{Students will be able to identify what each argument to an image-producing function means}
                                     @item{Students will be able to write expressions that generate simple images (triangles, circle, stars, etc)}
                                     @item{Given a value, students will be able to identify its datatype}
                                     @item{Given an expression, students will be able to identify the datatype it will evaluate to}
                                     @item{Students will be able to distinguish between types and values}]
     #:product-outcomes @itemlist[@item{Students will enter (evaluate) expressions for generating Strings and Images}]
     #:exercises (list (make-exercise-locator "Strings-and-Images" "many-types-coe-to-code1"))
     #:standards (list "N-Q" "BS-PL.1" "BS-PL.2")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Student Workbooks, and something to write with.}]
     #:prerequisites (list "Intro to Programming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[          
            @point{@student{The Circles of Evaluation are a powerful tool, and can be used for much more than just numbers. Consider the Circle of Evaluation shown here. @sexp{(star 50 "solid" "red")}
                             @itemlist[@item{What is the name of the function being used?}
                                        @item{How many arguments are being given to that function?}
                                        @item{What do you think this function will do?}]
                             The same rules you used to convert a Circle of Evaluation into code still apply. Here is the code for that Circle: @sexp[#:form "code"]{(star 50 "solid" "red")}
                             }
                    @teacher{Students are not expected to know all the answers here - the goal is for them to apply what they know about Circles to a novel expression, and discuss for themselves what they think it might mean. Ask them to justify their answers, and to explain why they think they are correct. Linking this back to earlier examples of Circles of Evaluation may be useful.}
                    }
             @point{@student{@activity[#:forevidence "BS-PL.1&1&2"]{Type this code into the Interactions window, and hit "Return". What did you get back?
                                       @itemlist[@item{What does the @code{star} function do?}
                                                  @item{Type the expression again, but this time use a much larger number in place of @code{50}. What does the first argument tell the computer?}
                                                  @item{Type the expression again, this time using @code{"outline"} in place of @code{"solid"}, being careful to keep the quotation marks! What does the second argument tell the computer?}
                                                  @item{Now replace @code{"red"} with something else (again, keep the quotation marks!). What does the third argument tell the computer?}]
                                       @editor-link[#:interactions-text "(star 50 \"solid\" \"red\")"
                                                    "Try it out!"]
                                       } 
                             }
               
                     @teacher{This activity is designed to get students @italic{playing} with new terms and concepts, so they develop their own model for what's going on. At this point, it is NOT essential that students understand every last component of the code. If you need to give away lots of code snippets, that's ok - just get them playing!}
                     }
             @point{@student{There's an entirely new @vocab{type} of value being used in these expressions: @code{"solid"} and @code{"red"} are examples of a completely new datatype, called a @vocab{String}.  
                             @bannerline{A String is anything between quotation marks.} 
                             When you first learned about values, you saw that a program can be nothing more than a value, such as a number.  If you type a number into the interactions window, for example, it evaluates to itself.  To remind yourself of this, try evaluating @code{716} in the Interactions window:
                                          @editor-link[#:interactions-text "716"
                                                    "Load and run this example."]
                                          Since Strings are values too, the value @code{"red"} is also a perfectly valid program! Just like number values, strings will evaluate to themselves.
                                          @activity[#:forevidence "BS-PL.1&1&1"]{Try entering different Strings into the Interactions window. What happens if you put quotes around multiple words? Around Numbers?}
                                       }
                     @teacher{Students should see Strings as an analog to Numbers: a different type of value, but one that is still a simple program that evaluates to itself and can be passed as an argument to a function.  Note that the Number 42 and the String "42" are different values!  You could add the Number 42 to another number, but you cannot add the String "42" to another number.}
                     }
             @point{@student{This expression also included a new @vocab{function} called @code{star}. Just as the addition function @code{+} takes in two Numbers, @code{star} takes in @italic{a Number and two Strings}, and produces a new type of data, called an @vocab{Image}.
                            @activity[#:forevidence "BS-PL.1&1&1"]{What is the datatype of each of the values listed below -- Number, String or Image? 
                                      @itemlist[@item{@code{42}}
                                                 @item{@code{"Hi, mom!"}}
                                                 @item{@code{9273482.42}}
                                                 @item{@bitmap{images/TriangleImage.png}}
                                                 @item{@code{"84729"}}
                                                 @item{@code{"Strings and Numbers are two different datatypes"}}
                                                 @item{@bitmap{images/coffee-cup.png}}]
                                                 }}
                     @teacher{Students have now seen three datatypes: Numbers, Strings and Images. You'll want to make sure students can correctly identify examples of each one.}
                     }
             @point{@student{You've also seen expressions that @vocab{produce} values, such as @code{(* 16 4)}, which produces a Number. Other expressions, however, can produce Strings or Images. 
                             @activity[#:forevidence "BS-PL.1&1&2"]{What datatype will each of the expressions listed below evaluate to?
                                      @itemlist[@item{@code{(/ (+ 7 2) 3)}}
                                                 @item{@code{(star 500 "solid" "purple")}}
                                                 @item{@code{(star (+ 1 3) "outline" "blue")}}
                                                 @item{@code{(- (* 4 2) (+ 1 0))}}
                                                 ]}
                             @activity[#:forevidence "BS-M&1&3"]{Some of the items listed below are @vocab{types}, while others are @vocab{values}. Can you tell the difference?
                                       @itemlist[@item{792.24}
                                                 @item{String}
                                                 @item{"hi, mom!"}
                                                 @item{"91"}
                                                 @item{Number}
                                                 @item{Image}
                                                 @item{102}
                                                 ]}
                             }
                     @teacher{For added practice, have students identify the type of each argument in each of those expressions. Going Further - If time allows, you can go further into @lesson-link[#:name "Manipulating-Images" #:label "Manipulating Images"] or @lesson-link[#:name "Making-Flags" #:label "Making Flags"].}
                     }
             ]}
@lesson/studteach[
     #:title "Contracts"
     #:duration "35 minutes"
     #:overview "Students learn to describe functions and their behavior, using formalisms including Contracts (Domain and Range) and Datatypes."
     #:learning-objectives @itemlist[@item{Students will start to write and use Contracts, which summarize the name, range, and domain of a function}
                                     @item{Students will learn how to use a function based on the information in its Contract}
                                    ]
     #:evidence-statements @itemlist[@item{Given an expression, students will be able to identify the name of the function being used}
                                      @item{Given an expression, students will be able to identify how many arguments are used}
                                      @item{Given a value, students will be able to identify its type}
                                      @item{Students will be able to identify the parts of a contract}
                                      @item{Students will be able to distinguish between contracts and function calls}
                                      @item{Given an example of a function being applied, students will be able to write a contract for that function}]
     #:product-outcomes @itemlist[@item{Students will write down Contracts for arithmetic expressions, as well as several image-producing expressions}]
     #:exercises (list (make-exercise-locator "Contracts" "id-expr-pieces1")
		       (make-exercise-locator "Contracts" "match-contracts-exprs1"))
     #:standards (list "BS-PL.2" "BS-IDE" "N-Q" "F-IF.1-3")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                              @item{Student Workbooks, and something to write with}]
     #:prerequisites (list "Intro to Programming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{You've already seen several functions that take in two Numbers, such as @code{+}, and @code{-}. Meanwhile, @code{star} takes in a Number and two Strings.  Different functions therefore take in different inputs.  We therefore need a way to refer to the kinds of inputs that a function expects.
                        @bannerline{The Domain of a function is the data that the function expects.}
                        @activity[#:forevidence (list "F-IF.1-3&1&1")]{Why is it helpful to know the @vocab{Domain} of a function?}
                        By keeping a list of all the functions in a language, and their Domains, programmers can easily look up how each function is used. However, it's also important to keep track of what each function produces! For example, a program wouldn't use @code{star} if they were trying to produce a Number, because @code{star} only produces Images.
                        @bannerline{The Range of a function is the data that the function produces.}
                        Domains and Ranges help programmers write better code, by preventing silly mistakes and giving themselves hints about what to do next. A programmer who wants to use @code{star} can look up the Domain and immediately know that the first input has to be a Number (like @code{100}), without having to remember it each time. Instead of writing a single value there, a programmer could write a whole expression, like @code{(* 25 4)}. We know this code will return an appropriate value (Number) by looking at the Range for @code{*}; therefore, the result of @code{*} can be used in place of any Number value.}
                        @teacher{Domain and Range are critical concepts. They can be reinforced by modifying a simple expression (such as @code{(+ 1 2)}), asking questions at every step. For example, we know that @code{+} takes two Numbers, which is why 1 and 2 are used in the example. However, each of those values could be replaced by @italic{another expression} -- as long as that expression evaluates to a Number. Have students systematically replace each value with an expression, asking them to justify their replacement using the Domain and Range of each function.}
                        }
                 @point{@student{When programmers write down the Domains and Ranges of each function, they write what are called @vocab{contracts}, to keep track of what each function needs.
                 @bannerline{A Contract has three parts: the Name, Domain and Range of a function.}
                 The contract for @code{star} is:
                 @code[#:multi-line ""]{; star: Number String String -> Image}
                 This means that the @vocab{Name} of the function is @code{star}, that it takes in a Number and two Strings as its Domain, and produces an Image as the Range. We use types instead of values when we write a Contract, because we want to be more general: a star could be of any size, so the Domain for @code{star} specifies that the first argument could be @italic{any Number}. If we think of a language as a collection of lego pieces, the Contracts are like the tabs and slots that tell us how each piece can connect.}
                     @teacher{}
                     }
             @point{@student{Contracts are sufficiently important and useful that we should keep a list of them somewhere.  The front page of your workbook contains a sheet labeled "Contracts".  Write the contract for @code{star} in the first row of your contracts table.}
                    @teacher{Common mistakes when students first write down contracts include: writing values (such as @code{"red"}) instead of types (such as "String") and forgetting arguments.  Read your students' contracts carefully, as they often indicate misconceptions that will persist and affect them later on.}}
             @point{@student{Here is the contract for a new function:
                 @code[#:multi-line ""]{; rectangle: Number Number String String -> Image}
                 @activity[#:forevidence (list "BS-PL.2&1&1")]{@itemlist[@item{What is the @vocab{Name} of this function?}
                                      @item{How many things are the @vocab{Domain} of this function?}
                                      @item{What is the type of each thing in the Domain?}
                                      @item{What is the @vocab{Range} of this function?}
                                      ]}
                 A Contract tells you exactly how to use the function, by writing its Name and then using @vocab{values} for each of the arguments in the @vocab{Domain}. Here is an example of an expression, written to use @code{rectangle}:
                 @editor-link[#:interactions-text "(rectangle 100 50 \"solid\" \"blue\")"
                                                  "Load and run this example."]}
                     @teacher{Have students experiment with changing the argument values, always drawing attention back to the Domain.}
                     }
             @point{@student{By writing down the Contracts for our functions, we can easily look back to see how they are used.
                             @activity[#:forevidence (list "BS-PL.2&1&1" "F-IF.1-3&1&1")]{The Contract for @code{+} is shown below.
                                       @code[#:multi-line ""]{; +: Number Number -> Number}                
                                       Can you write the Contract for @code{*}, @code{-}, @code{/} and @code{sqrt}?}}
                     @teacher{}
                     }
             @point{@student{Now that you know how to use a Contract to write an expression, here are the Contracts for several new functions that produce Images:
                             @code[#:multi-line ""]{; ellipse:  Number Number String String -> Image
                                                    ; triangle: Number String String        -> Image
                                                    ; circle:   Number String String        -> Image}
                             @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&3")]{See if you can figure out how to use these new functions to draw other shapes!  Here's an example to get you started:
                             @editor-link[#:interactions-text "(ellipse 150 40 \"outline\" \"black\")"
                                                  "Load and run this example."]}
                             }
                     @teacher{You should start pushing students to write more sophisticated expressions, replacing Number values with entire expressions (e.g. @code{(star (* 10 5) "solid" "purple")}). Students should be comfortable looking at an entire subexpression as a single argument to the surrounding function. @management{You may wish to force students to write these Contracts into their notebooks BEFORE allowing them to play with them. Be careful about letting students rush to the keys without first taking notes!}}
                     }
             @point{@student{Here is an expression that uses a very interesting function: @code{(bitmap/url "http://bootstrapworld.org/images/icon.gif")}.  This function takes in the URL of any image you can find online, and will produce that image so that you can use it in your program.
                             @activity[#:forevidence (list "BS-PL.2&1&1")]{@itemlist[@item{What are the three parts of a Contract?}
                                                  @item{What is the Name of this new function?}
                                                  @item{How many things are in its Domain?}
                                                  @item{What is the Domain of this function?}
                                                  @item{What will this expression evaluate to?}]}                             
                             }
                     @teacher{If you want to have students practice using @code{bitmap/url}, it is recommended that you use an image search-engine, such as @(hyperlink "https://images.google.com" "Google Images") or @(hyperlink "http://www.bing.com/images" "Bing Images"). Make sure that students know how to get the URL for the image itself, @italic{not the URL of the web page that contains the image.}}
                     }
               @point{@student{Contracts help programmers write code, so it's always a good idea to write down contracts for each function you see. 
                               @activity[#:forevidence (list "BS-PL.2&1&2" "F-IF.1-3&1&1")]{Can you figure out the contract for a function, just by looking at some sample code? Look at the code below, and see if you can write the @vocab{Name}, @vocab{Domain} and @vocab{Range} for the function being used.
                                         @editor-link[#:interactions-text "(text \"Bootstrap\" 30 \"purple\")"
                                                  "Load and run this example."]
                                         Make sure you don't confuse the @vocab{Contract} for a function with code! Some of the items listed below are Contracts, but others are just examples of those functions being used. Can you tell which is which?
                                         @itemlist[@item{@code{; triangle : Number String String -> Image}}
                                                    @item{@code{(triangle 100 "outline" "blue")}}
                                                    @item{@code{(square (+ 200 5) "solid" "red")}}
                                                    @item{@code{; square : Number String String -> Image}}]}
                                         }
                       @teacher{}
                       }
                @point{@student{Sometimes, we make mistakes when we write code, and we use a value that violates the contract.  Fortunately, the computer identifies such cases and provides @vocab{error messages} to help us find and correct the problem.  An error message highlights the code containing the error and explains where the computer found a problem.  
                       @activity[#:forevidence (list "BS-IDE&1&2")]{For each of the following incorrect expressions, look at the code 
				 and see if you can figure out what is wrong about it.  Then, type the 
				 code into the Interactions Window and see what error message you get.  
				 Does the error identify the same problem that you did? 
                                 @itemlist[@item{@code{(+ 4 "hi")}}
                                           @item{@code{("hi" + "mom")}}
                                           @item{@code{(* (+ 4 5) "pizza")}}
                                           @item{@code{(star "solid" "red" 40)}}
                                           @item{@code{(star "40" "solid" "red")}}
                                           @item{@code{(star 40 "red" "solid")}}
                                           @item{@code{(star 40 "solid" "yelow")}}
                                           @item{@code{(star (* 4 10) "blue")}}
                                           @item{@code{(cirle 25 "outline" "blue")}}
                                          ]}}
                       @teacher{Controlled practice with error messages helps students gain confidence in dealing with them later on.  It is fine if students don't spot the errors for themselves at first, though having students explain the problems in their own words should reinforce correct use of these functions later in the course.}}
             ]}
       
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
        @points[@point{@student{This lesson expanded Circles of Evaluations, expressions, and code to include Strings and Images (as well as Numbers).  You learned that everything you knew about functions on Numbers also works on Strings and Images (which will make your programs more interesting).  You also learned how to use the Image functions to create your own images, and how to use existing Images in your programs (through @code{bitmap/url}.)}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                @point{@student{In the next unit, you'll learn how to create your own functions to save work in writing expressions (this will turn out to be an essential part of writing a game).  You'll also start customizing your game with images for the elements in your game design.}
                       @teacher{}}
                        ]}
}

