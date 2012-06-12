#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Pizza Toppings" #:duration "30 min" #:prerequisites "Booleans"]{
   @(hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "Intro to Cond Part 1")
   @(hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY" "Intro to Cond Part 2")
   @itemlist[
        @item{Turn to the Design Recipe on Page 23 and grab a Design Recipe Worksheet.}
        @item{Suppose we've been hired by Luigi's Pizza to write a function that tells us the cost of different pizza pies. Let's use the design recipe to write this function. @tag[pedagogy]{Have a student read the problem statement.}}
        @item{@tag[pedagogy]{I need a volunteer to be our function. Pick someone, and copy the contract as they answer. What is your name? cost Your Domain? String Your Range? Number. @code{; cost: String -> Number}}
              @tag[selftaught]{@think-about[#:question "What is the name of this function? the domain? the range?"
                                             #:answer @code{; cost: String -> Number}]}}
        @item{@tag[pedagogy]{Can someone from the class tell me how we should call this function? For example, "cost' cheese'!" What will cost produce? Let's try this with other toppings...}
             @tag[selftaught]{@think-about[#:question "How do we call this function and what does it produce?"
                                           #:answer "We call this function through \"cost cheese\" and it produces the price"]}}
        @item{Now it's time to write down some examples. @tag[pedagogy]{Can anyone raise their hands and tell me what I'd write?} @code{(EXAMPLE (cost "cheese") 9.00)}}
        @item{@think-about[#:question "What are some other examples for cost? What changes between them? "
                           #:answer "The topping and the price returned! Make sure you label those."]}
        @item{Do you notice something odd here? This is the first time that we've ever circled something in the second of the examples, which wasn't also circled in the first part. The price that's being produced changes, but the function never takes in the price!}
        @item{That's a hint that something special is going on, but let's see how much father the Design Recipe can take us...}
        @item{@think-about[#:question "Now for the Function Header. What do I write here?"
                           #:answer @code{(define (cost topping)}]}
        @item{The Function Body is next. But now we don't know what to write! We know that our examples behave differently from one another -- sometimes we want to return 9.00, other times it's 10.50, etc. So what do we do? Well, we could fill in all off those results. Let's do that...  @tag[pedagogy]{Make a large, 2-column table on under the Function Header.}
             
              TABLE GOES HERE}
       @item{@think-about[#:question "But how do we know when we want to produce 9.00? 10.50?"
                          #:answer "When the toppings are cheese and pepperoni"]}
       @item{What we want is a way to go down each line, checking to see if the topping is the right one. If it is, we go on to finish the line. If not, we go on to the next one.
             @itemlist[
                  @item{@think-about[#:question "What's Domain of our function?(according to the contract)"
                                     #:answer "String"]}
                   @item{@think-about[#:question "What's the type of \"pepperoni\"?"
                                      #:answer "String"]}
                   @item{@think-about[#:question "What function compares two strings, and gives back a Boolean?"
                                      #:answer @code{string=?}]}
                   @item{@think-about[#:question "What's the Racket code that compares the input topping to the string \"pepperoni\"?"
                                      #:answer @code{(string=? topping "pepperoni")}]}
                   @item{Now we can write that on our first line, as our first topping check. Can you do the rest?}]}
       @item{@tag[pedagogy]{Have students fill out the rest of the table} @tag[selftaught]{Fill out the rest of the table}
              
              TABLE GOES HERE}
       @item{Each of these rows is called a condition. A condition has a test and a result. The computer goes down the code, one condition at a time, and will evaluate the first result for which the condition is true.}
       @item{Racket has a special function that lets us tell the computer to do this: cond. To use cond,you put square brackets around each of the branches, and write "cond" at the top:
             @code{(define (cost topping)
  (cond
    [(string=? topping "pepperoni") 10.50]
    [(string=? topping "cheese")     9.00]
    [(string=? topping "chicken")   11.25]
    [(string=? topping "broccoli")  10.25]
  )
)}}
      @item{@tag[pedagogy]{Remind students that computers are very specific and can't make up new answers; we need to tell it what to do in case the user inputs an item that is not in our list. Let's add else. If it's not on the menu, we might still make that pizza for you, but it'll cost you! @code{[else    10000000]}} @tag[selftaught]{What happens if the topping is not on our list?  Let's add an else statement.  If it's not on our menu, we might still make that pizza for you but it'll cost you!@code{[else    10000000]}}}
      @;Students must their files here. 
      @item{@tag[pedagogy]{Have students try it on the computers, adding new items on their own.}@tag[selftaught]{Try it out for yourself and add your own new items.}@embedded-wescheme[#:id "Strings"
                   #:definitions-text ";Try out the pizza example above!"]}
      @item{@tag[(pedagogy selftaught)]{If you have additional time, and would like to try another Cond challenge, check out the @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/SupplementalLessons.html#redshape" "supplemental activity.")}}
       
             ]}