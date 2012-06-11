#lang curr/lib

@drill{
Hey there, intrepid explorer! You're on a mission to get to Mars to help your Martian friends build a house. Let's go!



@;COORDINATES! Which way?!?!!!
@itemlist[
 @item{Small problem: You don't have a rocket! Luckily, with the power of Racket and @code{put-image} we can build one!
          @itemlist[
           @item{First, you'll need a nice background. @(hyperlink "http://nicebackground.com" "Here's a nice starry background.")} @;get a background image for them
           @item{Next, draw the body of the rocket. @think-about[#:question "Can you think of a good shape to use? How would you code that?"
                                                                 #:answer @list{Use a rectangle! Sample code:  @code{(define body (rectangle 70 100 "solid" "gray"))}}]}
           @item{Now put the body of the rocket on the background. Do you remember the function that does this? 
                 @think-about[#:question "Write the contract of that function."
                              #:answer @code[#:contract "put-image: Image Number Number Image -> Image"]]
                 @think-about[#:question "Now, write the code to put the body on the background."
                              #:answer @code{(put-image body 100 70 background)}           ]}
           @item{Your rocket needs a top! @think-about[#:question "Can you think of a good shape to use? How would you code that?"
                                                                 #:answer @list{Use a triangle! Sample code: @code{(define top (triangle 70 "solid" "red"))}}]}
           @;intermediate variables good or bad?
           @item{@think-about[#:question "Now, put the top on using put-image. Look above at the contract if you forget how to use it."
                              #:answer @code{(put-image top 
                                                  99 150
                                                  (put-image body 100 70 background)}]}
           @item{You have the main shape now. It's time to add some details! How about a window? Or some thrusters?}
           @item{Try to add a circular window so you can gaze at the stars. @think-about[#:question "Write the code for a window."
                                                                                         #:answer (list "Something like " @code{(define window (circle 15 "solid" "blue"))})]
                   @think-about[#:question "Now use put-image to place it on your rocket."
                                #:answer @list{"Your rocket may vary, but for example: " @code{(put-image window
                                                                                                    100 95 
                                                                                                    (put-image top 
                                                                                                         99 150
                                                                                                         (put-image body 100 70 background)}}]}
           @item{Now try to make two small thrusters for the bottom...}
           @item{Congratulations! You now have your rocket and are ready to blast off!}]                                                                           
                                                                         }
 @item{You're now well on your way, and you realize you're hungry. You remember that your friends told you that the moon has smoothies that are out of this world good and decide to stop by. Look at the graph. @think-about[#:question "Where are you?" #:answer "(10,10)"] @think-about[#:question "Where is the moon?" #:answer "(10,40)"] @think-about[#:question "How far away are you?" #:answer "30"] @think-about[#:question "If it takes you 2 minutes to travel a distance of 1 on the graph, how long will it take to get there?" #:answer "60 minutes or 1 hour"] @think-about[#:question "What if you activate the boosters and you travel a distance of 2 every minute?" #:answer "15 minutes"]} 
 @item{You go up to the cashier. You must give him money and fruit, and in return he'll make you a smoothie. This seems like a function! @think-about[#:question "What is its contract?" #:answer @code[#:contract "Money Fruit -> Smoothie"]]}
 @item{Now it's time to travel to Mars. Look at the graph.@think-about[#:question "Where are you?" #:answer "(10,40)"] @think-about[#:question "Where is Mars?" #:answer "(70,50)"] @think-about[#:question "How far away are you?" #:answer "Hm..."]} 
 @item{You've now arrived and met your friends. To build a house, you need materials. @think-about[#:question "Write the contract for house-building." #:answer @list{May vary, depending on materials. For example, @code[#:contract "Wood Nails MartianStone -> House"]}]}
 @item{} 
 #:style 'ordered         
          ]

}
