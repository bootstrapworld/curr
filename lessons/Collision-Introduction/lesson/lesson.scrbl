#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Introduction" 
        #:duration "10 minutes"
        #:prerequisites "Coordinate-Planes Introducing-the-Design-Recipe Cond-Example-With-Pizza-Toppings"]{
        @itemlist/splicing[@item{Review previous material.}
                  @item{Right now, in your games, what happens when the player collides with another game character? Nothing! We need to write a function change that.}
                  @item{This is going to require a little math.}
                  @; VIDEO FOR SELFTAUGHT?
                  @item{Scroll to the @code{line-length} and @code{collide?} functions in your game files.
                                      @; FILE ALTERNATIVE
                                      }
                  @pedagogy{@item{Suppose I'm the player, moving around up here at the front of the class. Can I have a volunteer come up here and be the Target?}}
                  @pedagogy{@item{Have a volunteer stand up in front of the class, swinging their arms around, helicopter-style.}}
                  @pedagogy{@item{I need to know how far apart I am from the danger, so I'll know when we've collided. Can anyone tell me how far apart we are? Have we collided?}}
                  @pedagogy{@item{Take a step forward. How far are we now? Have we collided? Repeat until you collide.}}
                  @tag[selftaught]{@item{Imagine you have two objects, and they are flying about the room. These objects are pretty glass shapes, and if they collide, they will shatter completely. You are quite worried about your glass toys, and really don't want them to collide. If you know when they will collide, you can put your hand in the way and stop them, but only if you know exactly when they will collide.}}
                  @item{As you can see, it's important to be able to calculate how far apart to characters are, in order to know when they've hit one another.}
                  @item{In one dimension, this is pretty easy. If the characters are on the same line, you just subtract one coordinate from another, and you have your distance. }
                  @pedagogy{@item{Demonstrate this on the board, using a number line. Ask the following questions, filling in the blanks for contract as students give answers:}}
                  @item{@think-about[#:question @list{How many inputs does @code{line-length} take? What is the name of the input? What is the Domain? What is the Range?}
                                     #:answer "Input: two numbers, Domain: numbers, Range: number representing difference between the two numbers"]}
                 @pedagogy{@item{@skit{@itemlist/splicing[
                                                          @item{I'd like to have one volunteer stand up and be our function. Raise your hand if you'd like to volunteer! }
                                                          @item{Your name is now "line-length". Whenever I call your name, I will also give you two numbers, and your job is to tell me the difference between them - just like the code on the board! Let's try one example "line-length twenty ten!" @pedagogy{Your volunteer should reply with "ten."}}
                                                          @item{Raise your hand if you'd like to try! @pedagogy{Run through a few examples}}]}}}
                  @item{@think-about[#:question "What is the name of the second function? How many inputs does it take? What is the name of the input? What's the Domain? What's the Range? "
                                     #:answer "Name: collide?, Input: two numbers, Domain: numbers, Range: boolean"]}
                 @item{@think-about[#:question @list{What does this function do? @pedagogy{Raise your hand if you have an idea.}}
                                    #:answer "Takes in two numbers and passes it in to line-length to calculate the difference and returns a boolean determining whether the two objects have collided (whether the difference is greater than 50)."]}
                 @pedagogy{@item{@skit{@itemlist/splicing[@item{I'd like to have one volunteer stand up and be collide? Raise your hand if you'd like to volunteer!}
                                            @item{Your name is now "collide?". Whenever I call your name, I will also give you two numbers, and your job is to say "true" if the difference between them is greater than five. What will you say if the difference is smaller than five?}
                                            @item{Let's try an example: "collide? ten twenty"! Make sure collide? calls on line-length!. Let's have some more examples...}
                                            @item{Thank you! You can both have a seat now. A round of applause for our brave volunteers!}]}}}
]}