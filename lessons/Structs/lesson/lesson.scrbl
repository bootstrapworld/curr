#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Structs"]{

@itemlist/splicing[
   @tag[pedagogy]{@item{Display one student's code on the projector, and draw the class's attention to the update-danger function.}}
   @tag[pedagogy]{@item{Write the contract for update-danger on the board. 
                        @code[#:contract "update-danger : Number -> Number"
                              #:purpose "takes in object's x-coordinate and returns the next one"]}}
   @tag[selftaught]{@item{Remember update-danger ? Here is its contract. @code[#:contract "update-danger : Number -> Number"
                              #:purpose "takes in object's x-coordinate and returns the next one"]}}
   @item{Right now, update-danger takes in the object's x-coordinate and produces the next x-coordinate for the object. This allows our object to move left or right, but does not allow it to move up and down or along the diagonal.}
   @item{What if I wanted the object to move on the diagonal instead. For example...
       @itemlist/splicing[
         @tag[pedagogy]{@item{Draw a screen, add and label a point for the object}}
         @tag[selftaught]{@item{Look at the following picture. INSERT SELFTAUGHT PICTURE}} 
         @item{Suppose my object is sitting in the center of our screen at (320, 240). I want it to move diagonally so both the x and y increase by 10. What would the new coordinates be?}        
         @tag[pedagogy]{@item{Have students discuss this and then write in the new coordinate.}}
         ]}
   @tag[pedagogy]{@item{What would have to change about our function?}}
   @tag[selftaught]{@item{@think-about[#:question "What would have to change about our function?" #:answer "We would have to find some way to return both the x and y values."]}}
   @tag[pedagogy]{@item{Allow students to discuss this and try to guide the discussion towards the importance of returning both an x- and a y-coordinate.}}
   @item{The problem is, a function can only return one value. What is that value, according to our contract? A number! So we have to choose whether that number stands for a new x-coordinate or a new y-coordinate, but it can't stand for both.}
   @item{However, Racket actually allows us to create new kinds of data that can contain more than one thing. These kinds of data are called structs, and a struct can be made up of any combination of data you can imagine!}
   @tag[pedagogy]{@item{Monitors off!}}
   @tag[pedagogy]{@item{Open a new blank program on the projector.}}
   @item{One kind of struct that is useful to us is called a position, which Racket abbreviates posn.}
   @item{A position contains two numbers: an x- and a y-coordinate.}
   @item{Suppose I wanted to make a position with the coordinates 10, 40. In the Interactions window: I can make this position by typing @code{(make-posn 10 40)}. 
                                                                               @tag[pedagogy]{How do you think I would make a position at 400, -50?} 
          @tag[selftaught]{@think-about[#:question "How do you think I would make a position at 400, -50?" #:answer @code{(make-posn 400 -50)}]}}
   @item{Let's return to simple values for a moment. If I type the number 4, what will happen when I hit Enter? @tag[pedagogy]{Students guess that you will get 4 back. That's right! }I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{What if I type the string @code{"hello"}, and hit Enter? What will I get back? @tag[pedagogy]{Students guess that you will get "hello" back. That's right! } I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{What about the Boolean @code{true}? What will I get back my hit Enter? @tag[pedagogy]{Students guess that you will get true back. That's right! } I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{Now, what do you think will happen if I type in @code{(make-posn 400 -50)}
 and hit enter?}
   @item{@tag[pedagogy]{Allow students to brainstorm. Hit enter, and then remind them: }I get back exactly the value I typed in, because values evaluate to themselves.}
   @item{The moral of the story is, Structs are Values, just like Numbers, Strings, Booleans and Images.}
  @tag[pedagogy]{@item{Have students turn their monitors on and practice making posns for different coordinates. Can they make a posn for each of the four corners of their game screen?}}
  @tag[selftaught]{@item{@think-about[#:question "Can you make a posn for each of the four corners of your game screen?" #:answer @code{
                                  (make-posn 0 0)
                                  (make-posn 640 0)
                                  (make-posn 640 480)
                                  (make-posn 0 480)}]}}
   @item{Let's look back at our example - can you make a posn for the original position of the object? @think-about[#:question "What about the new position?" #:answer @code{(make-posn 330 250)}]}
   @item{Everything we know about Racket still applies, so I could also write this as:
@code{(make-posn (+ 320 10) (+ 240 10))}}
   @tag[pedagogy]{@item{Grab a Design Recipe Worksheet}}
   @tag[selftaught]{Get a Design Recipe worksheet @worksheet-link[#:page 34 #:name "design-recipe"]}
   @item{The problem with returning a number is that we could only update the X or Y coordinate. But if we return a Posn instead, we can update BOTH.}
   @item{How should our contract change? The Domain is two numbers, and the Range should be a Posn, instead of a number.}
   @item{What about our examples? Well, we've already got one of them on the board. @code{(update-danger 320 240)} should give us back a @code{(make-posn (+ 320 10) (+ 240 10))}.}
   @item{Can you write another example, using a different starting x and y?}
   @item{What should our function header be, so it matches our new contract? And what about the function body?}
   @tag[pedagogy]{@item{Have students click 'run' - the game should run as normal, except for their object moving in two dimensions! Then once students have gotten their objects to move in two dimensions, ask them how they might modify the update-target and update-projectile functions to do the same.}}
   @tag[selftaught]{@item{Click run- the game should run as normal, except your object will move in two dimensions!}}
   @item{What about update-player? How does the contract need to change to allow the player to move in two dimensions? The function header?}
   @item{Right now, both branches of the cond statement return numbers. We need to fix that so they return posns instead. Remember that the x-coordinate isn't changing at all, so these posns should only be adding to or subtracting from the y-coordinate.}
   @item{But suppose we would like the player to also move left and right. How could we add branches for the "left" and "right" keys?}
   @tag[pedagogy]{@item{Allow students to fiddle with this code. When they are done, they should have solid, two-dimensional movement for all of their game characters.}}
   @tag[selftaught]{@item{Fiddle around with your code until all of your objects have two-dimensional movement!}}
   @item{If you want your other characters to move in 2-dmensions, you can look to @worksheet-link[#:page 34 #:name "design-recipe"] and @worksheet-link[#:page 35 #:name "design-recipe"] to think about how to convert the rest of your game to use Posns.}
   
                 
                 
                 
                 
                 ]}
    
   
   