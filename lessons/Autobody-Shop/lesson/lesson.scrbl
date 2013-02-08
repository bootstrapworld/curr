#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Autobody Shop"
        #:duration "30 minutes"]{
          @itemlist/splicing[
           @item{Now we know all about how to work with automobiles in Racket. What function makes an auto? @code{make-auto}. And which function draws that auto? @code{draw-auto}. But we don't just want to take an auto and give it right back. I said that we're running an autobody shop! You take people's cars and change them, making them better in some way, and then give them back to the customer. Let's figure out how to do that.}
           @item{Turn to @worksheet-link[#:page 9 #:name "paint-job"] in your workbooks. @tag[pedagogy]{I know that you're really good at the design recipe by now, so I want you to fill out the page as we talk. @pedagogy{Make sure they're able to keep up, and take time to let them write if need be!}}}
           @item{Let's write a function called @code{paint-job}, which changes the color of an automobile.}
           @item{That's our problem statement.}
           @item{What's the first step in the Design Recipe? Contract.}
           @item{What is the name of the function? What does it take in? Remember that we're getting instructions about which color to make it, as well as which auto we're changing the color of! And what do you think our autobody shop is going to give back? What would be the range of @code{paint-job}? @tag[pedagogy]{Write the contract on your page.} What's the purpose statement?}
           @item{What's the next step in the Design Recipe? Examples}
           @item{Let's use the original @code{car1} as an example, and let's turn it purple.}
           @item{What do we write next? If you're stuck, look up at the range of the function@tag[pedagogy]{: raise your hand if you can tell me what I have to give back}. @tag[pedagogy]{That's right! }An auto! And how do I make an auto? }
           @item{The moment I write @code{make-auto}, I immediately know that I have to give it five things: the model, hp, rims, color, and value of that auto. Does the model of the auto change, just because I painted it a different color? No! So how do I get the model out of @code{car1}?}
           @item{The horsepower shouldn't change either with a paint job. So how do I get the hp out of car1? }
           @item{The rim size shouldn't change with a paint job. So how do I get the rims out of car1? }
           @item{What about the color? Does that change in this example? Yes! It should be the string @code{"purple"}.}
           @item{How about the value? Did our problem statement say that the value changes? So how do I get the value out of car1? }
           @pedagogy{@item{Make sure you're copying this down into your notebooks! Give them time to catch up writing.}}
           @item{Let's do another example! This time we want to paint car2 green. What do I write for the first part of the example?} 
           @item{See if you can finish off the rest of this example on your own.}
           @item{What's the next step in the Design Recipe? Definition. @tag[pedagogy]{Since you've done such a good job in your examples, this step becomes easy! }What two things change between these examples? The color and the auto! @tag[pedagogy]{Circle them. }So how many variables will your function need?}
           @item{Write the definition, using the examples to help you. Remember: All you have to do is copy the examples, changing the values to variables!}
           @pedagogy{@item{Okay - are you ready to try one on your own?}}
           @item{Turn to @worksheet-link[#:page 10 #:name "turbocharge"] in your workbooks.@tag[pedagogy]{ Now it's your turn.}}
           @item{When you turbocharge an engine, you get more power out of it. Your bodyshop does a turbocharging job that adds 20 horsepower to any engine, but keeps everything else the same. Write the function @code{turbocharge}.@tag[pedagogy]{You have 10 minutes. GO!}}
           @pedagogy{@item{Walk around the class, helping kids as-needed. Don't forget to count down the minutes! If they finish writing, let them put it into the computer.}}]}
