#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Booleans" 
        #:duration "5 minutes"]{
      
   @itemlist/splicing[
       @item{@(video-link (hyperlink "http://www.youtube.com/watch?v=X7gAXxpBhUo" "Video Lesson: Intro to Booleans"))}
       @item{We're going to play a quick game, called "True or False." @selftaught{When I say a lie, I want you to type in "False" and when it is not a lie, you type in "True".} @pedagogy{I'm going to make some statements, and I want you to call out "True" or "False", depending on whether or not I'm lying.}}
       @pedagogy{@item{Give some simple boolean statements such as "I am holding a red pen", "I am a boy" etc.}}
       @selftaught{@item{
                         You are a boy. @fill-in-the-blank[#:id "introbool1"]
                                        You are using a computer. @fill-in-the-blank[#:id "introbool2"]
                                        You have red hair. @fill-in-the-blank[#:id "introbool3"]
                                        }}
      @item{So far, our language can only add, subtract, multiply and divide numbers. It can't compare them or decide whether something is true or false! We'll be adding the power of comparison to our language today.}
      @item{What would DrRacket say is the value of the following pieces of code? 
            @code{(+ 1 4), (/ 4 2), (- 0 9), (< 3 4)}}
      @item{With the exception of the last one, all the above are Numbers. We can solve any of those expressions using our language. Why isn't the last one a number? What is it?}
      @item{The expression @code{(< 3 4)} is a test. It is either true or false that 3 is less than 4. @code{<} is another function, just like + and string-length. Can you guess what other tests are available?}
      @item{@exercise{Try using them to compare numbers. What values do you get back? (Use Circle of Evaluation)
             @code[#:multi-line #t]{(> 0 5)
                                    (= 1 9)
                                    (<= 2 2)
                                    (string=? "dog" "cat")}}
             @selftaught{embedded-wescheme[#:id "bool"
                               #:interactions-text ""]}}
      @pedagogy{@item{Have students explain what each of these tests does.}}
      @item{As you have found, there are only two values that can be returned from a test: true or false. These values are a very special category, called "Booleans". Let there be Booleans!}
      @pedagogy{@item{Model one of the contracts for a Boolean function, then have them guess the rest.}}
      @item{Try filling out all of the contracts for these in your notes. For example: @code{; Number Number -> Boolean}}
      @item{Booleans are really important in videogames - you can use them to test if someone's health is down to zero, or if they've bumped into a wall. Without booleans, there are no tests, and the game can't ever react to changes.}
      @item{Let's try making a function that uses booleans.}]}