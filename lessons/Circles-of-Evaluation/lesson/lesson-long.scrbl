#lang curr/lib
@(require 2htdp/image)

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Circles of Evaluation"]{
   @bitmap{images/Circle45.png}
    
   @itemlist/splicing[
   @item{What is the value of the stuff in the circle? We know we're adding, so we start with the plus sign. Then we add 5 and 4 on either side. But are we adding (5 + 4) or (4 + 5)? Does it matter for this example?}
   @item{What if we were using the 'minus' function (-)? It would certainly matter what number was being subtracted from the other!}
   @exercise{@think-about[
         #:question "How many possible answers are there for a circle using subtraction?"
         #:answer "There are two possible answers. For an example, if you put a 3, 5, and '-' sign in the Circle of Evaluation, you can either have 3 - 5, which is -2, or you can have 5 - 3, which is 2."]}
   @item{We need to improve our Circle of Evaluation, so we don't run into this problem. Let's use the two solutions we came up with: @itemlist/splicing[
      @item{all circles have one function @bitmap{images/1.5.png}}
      @item{it matters in what order the arguments are written-We will always read and compute inputs from @bold["left to right"].}]}
      @item{We'll separate the function from the inputs by drawing a line between them: the function is above the line, the inputs are below.}
      @item{If a complete circle evaluates to a number, and numbers go inside circles, why not try putting circles inside circles?}
   @item{@exercise{How do we compute the circle above? Well, our new rule tells us to look at the left first: what is the value of 6? Now we look at the right: that's a new circle, so we have to evaluate that first. The left-hand side has us adding 4 and 5, which evaluates to 9. Now we have two numbers to evaluate.}}
         @tag[selftaught]{@think-about[
         #:question "What are we doing to 6 and 9?"
         #:answer "Multiply them to get 54."]}
   @item{We write this expression in Racket the same way. We always put parens before a function and after its inputs. In order to apply this function, we need to compute the left side and then the right. The left side is the number 6, so we can just write that in. @code{(* 6 ____)}}
   @item{The right side happens to be another Circle of Evaluation (more parens), so we apply the same rules there: write the function and then look at the left and the right. These are numbers, so we can write them in directly. @code{(* 6 (+ 4 5))}}
   @item{@exercise{Try writing this in the Interactions window, and hit "enter". What did you end up with? Now try writing in the complex example we used. Did you get the same answer?
                  @embedded-wescheme[#:id "Circles of Evaluation"
                                                      #:definitions-text "; enter in your equations down in the interactions window to test the result"]}}
   @item{@think-about[#:question @list{Try to come up with more examples - can you figure out how to subtract three numbers?}
                      #:answer "One example would be to subtract 1, 2, and 3. There are multiple ways to do this. You can do 1 - (2 - 3) which yields 0 or 3 - (2 - 1) which yields 2."]}
   @item{We can't put three numbers in only one circle, because there's no way to tell the computer which two numbers should be subtracted first. Is it (2 - 3) - 5, or 2 - (3 - 5)?}
   @item{For more practice with Circles of Evaluation, there are several excercises provided on @worksheet-link[#:page 4 #:name "Circles-of-Evaluation-Practice"] of the student workbook.}]}
