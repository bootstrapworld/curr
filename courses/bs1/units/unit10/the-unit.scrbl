#lang curr/lib

@declare-tags[management]
@title{Unit 10: Bridging to Algebra}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Boolean" @code{= > < string=? and or}))]{
@unit-descr{Students translate from Racket into Algebra, and back. They then apply the Design Recipe to solve common word problems from Algebra texts.}
}

@lesson/studteach[
     #:title "Connecting to Algebra (Defining Variables)"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{"Algebra Translation" [@resource-link[#:path "source-files/Algebra.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=s2s0tkTgeF" "WeScheme")] preloaded on students' machines, with monitors off.}]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{@student{In our programming language, we define values this way: 
                             @bannerline{@code[#:multi-line #t]{(define x 4)
                                                                (define y (+ 4 9))
                                                                (define z (* x 2))}}
                             Values can be fixed (like the first example), the result of an expression (the second), or even be defined in terms of other variables (the third). We can do the same things in algebra:
                             @bannerline{@math{x = 4}
                                          @math{y = 4+9}
                                          @math{z = x \times 2}}
                             @activity{Convert the following three Algebra definitions into Racket definitions:
                                       @itemlist[@item{@math{dollars = 16.50}}
                                                 @item{@math{feet = 2 \times 3}}
                                                  @item{@math{inches = feet \times 12}}]
                                       }}
                     @teacher{For this activity write all Racket expressions on one side of the board, and all algebra expressions on the other. You'll want to line them up as closely as possible, to reinforce the connection between the two languages.}
                     }
            @point{@student{@activity{Turn to @worksheet-link[#:page 35 #:name "Translating Value Definitions"] page 35 in your workbooks. You will see a bunch of value definitions written in code - take 2 minutes to convert this into math. GO!}}
                    @teacher{}
                    }
            ]}

@lesson/studteach[
     #:title "Connecting to Algebra (Defining Functions)"
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
      ]{@points[@point{@student{You've seen many functions defined in Racket, for example: 
                                @code{(define (f x) (+ x 1))}
                        @activity{@itemlist[@item{What is the name of this function?}
                                             @item{How many variables does it take?}
                                             @item{What is the name of the variable(s)?}
                                             @item{What does this function do to the variable @code{x}?}
                                             @item{Define a function @code{g}, which takes in a variable @code{q} and multiplies it by 20.}]}}
                        @teacher{Make sure students understand that the function is named @italic{f}, and not "fx" or "f of x". Have students practice other function definitions, to make sure they're comfortable translating a verbal description into Racket syntax.}
                        }
                 @point{@student{To translate these functions into algebra, we do something similar to what we did with the values. Here is the same function @code{g}, written in algebra syntax: @math{f(x) = x + 1}                                                                                                      @activity{Translate the function @code{g} into algebra, using the translation of @code{f} as a model. Once that is complete try defining a function @math{h}, which takes in a variable @code{x} and divides it by 2.}}
                         @teacher{Have students practice this translation with a few other functions, again translating from a verbal description (rather than Racket syntax).}}
                 @point{@student{@activity{Translate the rest of the functions, listed on @worksheet-link[#:page 35 #:name "Functions"].}}
                         @teacher{}
                         }]
         }
                         


@lesson/studteach[
     #:title "Connecting to Algebra (Design Recipe)"
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
      ]{@points[@point{@student{The real power of programming isn't how well you know the language. It's about how well you can use it to solve problems! You've leared about a powerful tool that helps you take word problems on paper and turn them into functions on the computer: the @vocab{Design Recipe}! It turns out that the Design Recipe can also be used to help you solve word problems in algebra, too!
@activity{Turn to @worksheet-link[#:page 36 #:name "DR"] in your workbooks, read the word problem careflly, and write down the contract for the fuction:
                  @italic{"A rocket is flying from Earth to Mars at 80 miles per second. Write a function that describes the distance @math{D} the rocket has traveled, as a function of time @math{t}}."
                  }}
                        @teacher{}
                        }
                 @point{@student{The distance a rocket travels is measured in numbers of miles, and time is measured in numbers of seconds. This gives us the contract: 
                                 @bannerline{@math{distance : Number \rightarrow Number}}
                                 Just as before, the Contract gives us a strong hint about how to write the Examples. Here is one Example, written in Racket code:  @code{(EXAMPLE (distance 5) (* 5 80))}  Here's the same example, written in algebra: @math{distance(5) = 5 \times 80}
                                 @activity{Write two additional Examples for this function, using Algebraic notation.}
                                 }
                         @teacher{Point out that the Contract hasn't changed @italic{at all} between Racket and Algebra. @management{If students are struggling with the change in syntax, let them first write the Examples in Racket, and then convert them to Algebra by following the model shown here.}}
                         }
                 @point{@student{As before, a function's variables can be identified by writing two Examples, and looking at what changes between them.
                                 @activity{Using the Examples you've written, identify the variable(s) for the function. Then define the function @italic{using Algebraic syntax}.}}
                         @teacher{}
                         }
                 @point{@student{The Design Recipe helps transition from a written description of a function into a formal definition, 
                                 @bannerline{@math{distance(4) = 4 \times 80}
                                              @math{distance(7) = 7 \times 80}
                                              @math{distance(t) = t \times 80}}}
                         @teacher{}}
                 @point{@student{@activity{Turn to @worksheet-link[#:page 37 #:name "DR2"] in your workbooks, read the word problem, and write down the Contract for the function described there: @italic{"A rocket is traveling from Earth to Mars at 80 miles per second. Write a function that describes the time the rocket has been traveling, as a function of distance."}
                                                   }}
                         @teacher{Point out that this is the same relationship between distance and time as before, @bold{only now we want be able to see the relationship from the opposite direction}: time in terms of distance, rather than distance in terms of time.}
                         }
            @point{@student{Once we have the Contract, it's easy to write Examples:
                            @math{time : miles \rightarrow seconds}
                            @activity{Use the Contract to write two Examples for this function, then identify the variable(s) for the function. 
                                      @itemlist[@item{How many variables does this function have?}
                                                 @item{Name the variable(s).}
                                                 @item{Define this function, using Algebraic syntax.}]}}
                    @teacher{}
                    }
            @point{@student{Once your function is set up, it's easy to just plug in values and get answers back. @italic{With most word problems, the hard part is setting up the function in the first place.} Luckily, the Design Recipe makes setting up that function a lot easier! We've just used it to set up two different functions, which could be used to give us answers in terms of distance or time. Defining functions is like building tools, which you can to solve simple problems or combine together to solve more complex ones.
                    @activity{Suppose you wanted to know how far the rocket traveled in 6 seconds: which of the two functions here would you use? What if you wanted to know how long it takes for the rocket to go a thousand miles?}}
            @teacher{Ask students to identify which function they would use to answer a variety of different questions.}
            }]
}

@lesson/studteach[
     #:title "Connecting to Algebra (Challenge Problems)"
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
                 ]{@points[@point{@student{@activity{Turn to @worksheet-link[#:page 38 #:name "DR3"] in your workbooks, read the word problem carefully: @italic{"A rocket leaves Earth, headed for Mars at 80 miles per second. At the exact same time, an asteroid leaves Mars traveling towards Earth, moving at 70 miles per second. If the distance from the Earth to Mars is 50,000,000 miles, how long will it take for them to collide?"}
                                                    @itemlist[@item{What are the facts that the problem @bold{gives you}?}
                                                               @item{What is the problem @bold{asking you for}?}
                                                               @item{Use your answers to complete the following sentence: "Given ____, write a function that produces ____."}
                                                               @item{If such this function existed, what would be a good name for it?}]}}
                                   @teacher{Ultimately, the problem is asking students about a functional relationship between distance and collision-time.}
                                   }
                            @point{@student{If we had a function that computed collision-time, it would be easy to answer this question just by plugging in the distance between the Earth and Mars. Rather than start worrying about setting up an equation, you can use the Design Recipe to build the function itself!
                                            @activity{Write down the contract for this function, then write two Examples using different distances.}}
                                    @teacher{}
                                    }
                            @point{@student{By now, you've got the contract for this function and a good purpose statement:
                                            @bannerline{@math{collide : distance \rightarrow  time}
                                                         @math{collide(0) = ...}}}
                                    @teacher{}
                                    }
                             @point{@student{So now we need to figure out what calculations go after the equals sign. Luckily, we have a hint: we know that whatever is it HAS to come out to zero, since we know that they've already collided when they are zero miles apart. 
                                             @activity{If the rocket is going 80 miles/second, and the asteroid is going 70 miles/second, @italic{how fast are they approaching each other?}}}
                                     @teacher{}
                                     }
                             @point{@student{@math{60 + 70 = 150}, so we know that they are getting closer and closer together at a rate of 150 miles per second. This isn't that different from our @code{time} function: we have some speed, and we want to know how much time it will take to go a given distance. So what do we write for our example?
                                              @bannerline{@math{collide(0) = 0/150}}
                                              @activity{Write two Examples of your own using different distances, then define the function so it works with any distance.}}
                                     @teacher{Sometimes, the Design Recipe will get you to the answer without even having to finish. That's how powerful it is!}
                                     }
                             @point{@student{@activity{Open your workbooks to @worksheet-link[#:page 39 #:name "DR4"], and practice using the Design Recipe to solve other problems.}}
                                     @teacher{You can add as many pages as you like to the workbooks, using any algebra problem you like. We recommend using word problems from your students' algebra textbook, or even from your state's standardized test!}}]
}

@copyright[]