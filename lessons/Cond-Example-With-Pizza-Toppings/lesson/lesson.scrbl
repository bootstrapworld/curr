#lang curr/lib
@declare-tags[pedagogy selftaught group]

@lesson[#:title "Pizza Toppings" 
        #:duration "30 min"
        #:prerequisites "Intro-to-Booleans"]{
        @(hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "Intro to Cond Part 1")
        @(hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY" "Intro to Cond Part 2")
        @itemlist/splicing[
                 @item{Turn to the Design Recipe on @worksheet-link[#:page 23 #:name "Design-Recipe-Cost"] and grab a Design Recipe Worksheet.}
                 @item{Suppose we've been hired by Luigi's Pizza to write a function that tells us the cost of different pizza pies. Let's use the design recipe to write this function.}
                 @pedagogy{@item{Have a student read the problem statement.}}
                 @pedagogy{@item{I need a volunteer to be our function. Pick someone, and copy the contract as they answer. What is your name? cost Your Domain? String Your Range? Number. 
                                      
                                      @code{; cost: String -> Number}}}
                 @tag[selftaught]{@item{@think-about[#:question "What is the name of this function? the domain? the range?"
                                                     #:answer @code{; cost: String -> Number}]}}
                 @pedagogy{@item{Can someone from the class tell me how we should call this function? For example, "cost' cheese'!" What will cost produce? Let's try this with other toppings...}}
                 @tag[selftaught]{@item{@think-about[#:question "How do we call this function and what does it produce?"
                                                                                                                         #:answer "We call this function through 'cost cheese' and it produces the price"]}}
                 @item{Now it's time to write down some examples. @pedagogy{Can anyone raise their hands and tell me what I'd write?} @code{(EXAMPLE (cost "cheese") 9.00)}}
                 @item{@think-about[#:question @list{What are some other examples for @code{cost}? What changes between them?}
                                    #:answer "The topping and the price returned! Make sure you label those."]}
                 @item{Do you notice something odd here? This is the first time that we've ever circled something in the second of the examples, which wasn't also circled in the first part. The price that's being produced changes, but the function never takes in the price!}
                 @item{That's a hint that something special is going on, but let's see how much father the Design Recipe can take us...}
                 @item{@think-about[#:question "Now for the Function Header. What do I write here?"
                                    #:answer @code{(define (cost topping))}]}
                 @item{The Function Body is next. But now we don't know what to write! We know that our examples behave differently from one another -- sometimes we want to return 9.00, other times it's 10.50, etc. So what do we do? Well, we could fill in all off those results. Let's do that...  @pedagogy{Make a large, 2-column table under the Function Header.}
                       
                       @tt{(}@code{define (cost topping)}
                       @build-table/cols['() 
                                         '(()
                                           ("10.50" "9.00" "11.25" "10.25"))
                                         (lambda (r c) (para (fill-in-the-blank #:id (format "~a" r)))) 2 4]
                       @tt{)}}
                 @item{@think-about[#:question "But how do we know when we want to produce 9.00? 10.50?"
                                    #:answer "When the toppings are cheese and pepperoni"]}      
                 @item{What we want is a way to go down each line, checking to see if the topping is the right one. If it is, we go on to finish the line. If not, we go on to the next one.
                       @itemlist/splicing[
                                @item{@think-about[#:question "What's Domain of our function? (according to the contract)"
                                                   #:answer "String"]}
                                      @item{@think-about[#:question "What's the type of \"pepperoni\"?"
                                                         #:answer "String"]}
                                      @item{@think-about[#:question "What function compares two strings, and gives back a Boolean?"
                                                         #:answer @code{string=?}]}
                                      @item{@think-about[#:question "What's the Racket code that compares the input topping to the string \"pepperoni\"?"
                                                         #:answer @code{(string=? topping "pepperoni")}]}
                                      @item{Now we can write that on our first line, as our first topping check. Can you do the rest?}]}
                 @pedagogy{@item{Have students fill out the rest of the table
                                      @build-table/cols['()
                                                        '(("(string=? topping \"pepperoni\")" 
                                                           "(string=? topping \"cheese\")" 
                                                           "(string=? topping \"chicken\")" 
                                                           "(string=? topping \"broccoli\")") 
                                                          ("10.50" "9.00" "11.25" "10.25")) 
                                                        (lambda (r c) ("")) 2 4]}}
                 @tag[selftaught]{@item{Fill out the rest of the table
                                        @build-table/cols['()
                                                          '(()
                                                            ("10.50" "9.00" "11.25" "10.25"))
                                                          (lambda (r c) (if (= c 0) (para (fill-in-the-blank #:id "cond")) (para ""))) 2 4]}}
                 @item{Each of these rows is called a condition. A condition has a test and a result. The computer goes down the code, one condition at a time, and will evaluate the first result for which the condition is true.}
                 @item{Racket has a special function that lets us tell the computer to do this: cond. To use cond,you put square brackets around each of the branches, and write "cond" at the top:
                       @code[#:multi-line ""]{(define (cost topping)
                                                (cond
                                                  [(string=? topping "pepperoni") 10.50]
                                                  [(string=? topping "cheese")     9.00]
                                                  [(string=? topping "chicken")   11.25]
                                                  [(string=? topping "broccoli")  10.25]))}}
                 @pedagogy{@item{Remind students that computers are very specific and can't make up new answers; we need to tell it what to do in case the user inputs an item that is not in our list. Let's add else. If it's not on the menu, we might still make that pizza for you, but it'll cost you! @code{[else 10000000]}}}
                 @tag[selftaught]{@item{What happens if the topping is not on our list?  Let's add an else statement.  If it's not on our menu, we might still make that pizza for you but it'll cost you!@code{[else 10000000]}}}
                                                                          @;Students must open their files here. 
                 @pedagogy{@item{Have students try it on the computers, adding new items on their own.}}
                 @tag[selftaught]{@item{Try it out for yourself and add your own new items.
                                        @embedded-wescheme[#:id "Strings"
                                                           #:definitions-text "; Try out the pizza example above!"]}}
                 @pedagogy{@item{If you have additional time, and would like to try another Cond challenge, check out the @(lesson-link #:name "Function-Example-Red-Shape" #:label "supplemental activity.")}}      
                 @tag[selftaught]{@item{If you have additional time, and would like to try another @code{cond} challenge, check out the @(lesson-link #:name "Function-Example-Red-Shape" #:label "supplemental activity.")}}]}
                                                    