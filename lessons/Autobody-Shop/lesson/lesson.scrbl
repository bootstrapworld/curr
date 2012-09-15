#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
           @item{Now we know all about how to work with automobiles in Racket. What function makes an auto? make-auto. And which function draws that auto? draw-auto. But we don't just want to take an auto and give it right back. I said that we were opening an autobody shop! You take people's cars and change them, making them better in some way, and then give them back to the customer. Let's figure out how to do that.}
           @item{Turn to page 9 in your workbooks. I know that you're really good at the design recipe by now, so I want you to fill out the page as we talk. Make sure they're able to keep up, and take time to let them write if need be!}
           @item{Let's write a function called paint-job, which changes the color of an automobile.}
           @item{That's our problem statement.}
           @item{What's the next step in the Design Recipe? Contract and Purpose Statement}
           @item{What is the name of the function? What does it take in? Remember that we're getting instructions about which color to make it, as well as which auto we're changing the color of! And what do you think our autobody shop is going to give back? What would be the range of paint-job? Write the contract on your page. What's the purpose statement?}
           @item{What's the next step in the Design Recipe? Examples}
           @item{Let's use the original car1 as an example, and let's make it purple.  }
           @item{What do I write next? If you're stuck, look up at the range of the function: raise your hand if you can tell me what I have to give back. That's right! An auto! And how do I make an auto? }
           @item{The moment I write make-auto, I immediately know that I have to give it five things: the model, hp, rims, color, and value of that auto. Does the model of the auto change, just because I painted it a different color? No! So how do I get the model out of car1? }
           @item{The horsepower shouldn't change either with a paint job! So how do I get the hp out of car1? }
           @item{The rim size shouldn't change with a paint job! So how do I get the rims out of car1? }
           @item{What about the color? Does that change in this example? Yes! It should be the string "purple" }
           @item{How about the value? Did our problem statement say that the value changes? So how do I get the value out of car1? }
           @item{Make sure you're copying this down into your notebooks!Give them time to catch up writing.}
           @item{Let's do another example! This time we want to paint car2 green. What do I write for the first part of my example?} 
           @item{See if you can finish off the rest of his example on your own.}
           @item{What's the next step in the Design Recipe? Definition. Since you've done such a good job in your examples, this step becomes easy! What two things change between these two examples? The color and the auto! Circle them. So how many variables will your function need?}
           @item{Write the definition yourself, using the examples to help you. Remember: All you have to do is copy the examples, changing the values to variables!}
           @item{Okay - are you ready to try one on your own?}
           @item{Turn to page 10 in your workbooks. Now it's your turn.}
           @item{When you turbocharge an engine, you get more power out of it. Your bodyshop does a turbocharging job that adds 20 horsepower to any engine, but keeps everything else the same. Write the function turbocharge - you have 10 minutes. GO!}
           @item{Walk around the class, helping kids as-needed. Don't forget to count down the minutes! If they finish writing, let them put it into the computer.}]}