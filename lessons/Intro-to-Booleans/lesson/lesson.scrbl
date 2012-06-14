#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Booleans" 
        #:video @(hyperlink "http://www.youtube.com/watch?v=X7gAXxpBhUo" "Intro to Booleans")  @(hyperlink "http://www.youtube.com/watch?v=kcBfXGziAQA" "Boolean Contracts") 
#:duration "5 minutes"]{
   
   @itemlist/splicing[
       @item{We're going to play a quick game, called "True or False."}
       @item{When I say a lie, I want you to @tag[(pedagogy group)]{yell out } @tag[selftaught]{type in } "False" and when it is not a lie, you  @tag[(pedagogy group)]{yell out } @tag[selftaught]{type in } "True"}
       @tag[pedagogy]{@item{Give some simple boolean statements such as "I am holding a red pen", "I am a boy" etc.}}
       @tag[selftaught]{@item{
                              You are a boy. @fill-in-the-blank[#:id "T/F"]
                              You are using a computer. @fill-in-the-blank[#:id "T/F"]
                              You have red hair. @fill-in-the-blank[#:id "T/F"]
                              }}
      @item{So far, our language can only add, subtract, multiply and divide numbers. It can't compare them or decide whether something is true or false! We'll be adding the power of comparison to our language today.}
      @item{What would DrRacket say is the value of the following pieces of code? @code{(+ 1 4), (/ 4 2), (- 0 9), (< 3 4)}}
      @item{With the exception of the last one, all the above are Numbers. We can solve any of those expressions using our language. Why isn't the last one a number? What is it?}
      @item{The expression @code{(< 3 4)} is a test. It is either true or false that 3 is less than 4. @code{<} is another function, just like + and string-length. There are several more tests we can do}
      @item{@exercise{Try using them to compare numbers. What values do you get back? (Use Circle of Evaluation)
             @code{(> 0 5)
(= 1 9)
(<= 2 2)
(string=? "dog" "cat")}}}
      @tag[pedagogy]{@item{Have students explain what each of these tests does.}}
      @item{As you have found, there are only two values that can be returned from a test: true or false. These values are a very special category, called "Booleans". Let there be Booleans!}
      @tag[pedagogy]{@item{Model one of the contracts for a Boolean function, then have them guess the rest.}}
      @tag[selftaught]{@item{Try filling out all of the contracts for these in your notes. For example: @code[#:contract "Number Number -> Boolean"]}}
      @item{Booleans are really important in videogames - you can use them to test if someone's health is down to zero, or if they've bumped into a wall. Without booleans, there are no tests, and the game can't ever react to changes.}
      @item{Let's try making a function that uses booleans.}]}