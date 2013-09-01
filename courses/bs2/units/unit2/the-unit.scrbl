#lang curr/lib

@title{Unit 2: Introduction to Data Structures}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students discover the need for data structures, and practice defining them, making examples, and writing functions that produce them.}

@objectives[@item{Students will deepen their understanding of function definitions and the Design Recipe}
            @item{Students will understand the limitations of atomic datatypes}
            @item{Students will write complex functions that consume, modify and produce structures}
          ]

@product-outcomes[
          @item{Students identify real-world behaviors that require data structures}
          @item{Students make use of a complex data structure: auto}
          @item{Students define variables bound to autos}
          @item{Students write code that extracts each field from those autos}
          @item{Students define functions that produce an auto}
          ]
                
@state-standards
                
@length-of-lesson[90]

@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{Structs bags: plastic bags containing eight cards (2 labeled "number", 2 "string", 2 "image", and 2 "boolean")}
           @item{The Autos file [Autos.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=P7qS37u1ZH" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]



}

@lesson/studteach[#:title "Review"
        #:duration "20 minutes"]{
          @itemlist/splicing[@pedagogy{@item{Welcome back! You guys did a great job on the review in our last session, and I think you're starting to get good at the design recipe again.}}
           @item{@tag[pedagogy]{Let's quickly walk through one example as a class, and then we'll have a competition. }Turn to  @worksheet-link[#:page 7 #:name "double-radius"] in your workbook. @pedagogy{Use a projector, so kids can see the function being written on the computer: }}
           @item{Write a function called @code{double-radius}, which takes in a radius and a color. It produces an outlined circle of whatever color was passed in, whose radius is twice as big as the input.}
           @item{Step 1: Contract and Purpose Statement @itemlist/splicing[
                 @item{Okay, what's the name of the function? double-radius! We know it takes in a radius and a color, so what is double-radius's domain? A number and a string! And what do you think the range is? Image! And what does it do? Can you tell me in English?}
@code[#:multi-line #t]{; double-radius: Number String -> Image
; makes an outlined circle that's twice the radius}]}
           @item{Step 2: Examples @itemlist/splicing[
                 @item{In your workbook, you will need to write at least two examples of how someone would use this function, and then what those expressions should become.} 
                 @item{How would someone else use @code{double-radius}?}
                 @item{We can look at the contract we just wrote to figure it out! We know that the name is @code{double-radius}, so we can call it using that name. If I write @code{(double-radius 50 "pink")}, describe the circle I should get back.}
           @item{Outline, 100, pink. And how would I make that circle, using Racket code?}
           @item{Can you give another example, and tell me what circle I'd get back?}
           @item{What is changing?? Circle everything that's different between the second part of these two examples: the size! @pedagogy{(write the name, to label it)}}
@code[#:multi-line #t]{(EXAMPLE (double-radius 50 "pink")
(circle (* 50 2) "outline" "pink"))

(EXAMPLE (double-radius 918 "orange")
(circle (* 918 2) "outline" "orange"))}]}
           
           @item{Step 3: Definition @itemlist/splicing[
           @item{How do we start our definition? @code{define}! Then we look back at our examples for help.}
           @item{What's the name of the function? How many variables do we have? How do you know? It's in the contract!}
           @item{The variables are circled, because they change from example to example; now we need to name them. What did this variable represent? Right, the size! We already labeled it.}
           @item{Now we can just copy one of our examples, and replace the changing thing with our variable! We didn't really have to do any work at all! }
           @code[#:multi-line #t]{(define (double-radius radius color)
(circle (* radius 2) "solid" color))}]}
           @item{@tag[pedagogy]{Okay, are you ready to try one on your own?} Turn to @worksheet-link[#:page 8 #:name "double-width"] in your workbooks.}
           @pedagogy{@item{I'm going to read the problem statement, and as soon as I'm done I'm going to start the timer. You'll have 5 minutes to finish this. Do not skip a step!! Once you're done, ask one of us to check your work. If they give you the OK, you can turn your monitors on and type in the code. Any questions?}
           @item{Here's the problem: }}
           @item{Write a function called @code{double-width}, which takes in a height and a color. The function produces a solid rectangle, which is whatever height and color were passed in. And its width? Its width is twice the height.}
           @pedagogy{@item{Review the solution as a class.}}]}

@lesson/studteach[#:title "Introducing Structs"
        #:duration "10 minutes"]{
          @itemlist/splicing[@pedagogy{@item{Pass out the bags of datatype cards.}}
            @pedagogy{@item{Now we're going to play a game...but first I'm going to explain the rules. First off, everyone take out all of the cards from the bags, and set them on the table in front of you.}}
            @item{Raise your hand if you can tell me what's written on the cards.}
            @item{Right: number, string, image, boolean...but what are these? Datatypes.}
            @item{Here's how this is going to work: I'm going to say something that can be returned by a Racket function, and you're going to hold up a card to show me what datatype it would be. If I were to say age, which would you hold up?}
            @item{Now, there's one very important rule: no matter what I say, you can only hold up one thing. Ready?}
            @tag[selftaught]{For each of the things below, figure out which datatype you would use to represent it in Racket:}
            @itemlist/splicing[@item{a color}
                               @item{a picture of a circle}
                               @item{your name}
                               @item{whether or not something is correct}
                               @item{an x-coordinate}
                               @item{your friend's favorite food}
                               @item{a picture of ninja cat}
                               @item{a set of coordinates}]
            @item{Wait! How many things are in a set of coordinates? An x and a y. Is that one thing? Is it one number? NO! @tag[pedagogy]{You can only hold one thing up, but we'd need to show two numbers.}}
            @item{Can we use a String to return two numbers? Not if we want to add or subtract!} 
            @item{Can we use a Boolean? An Image? None of our data types work!}
            @item{It turns out that Racket has exactly this problem. Every function that you could possibly write or use in Racket can only give back one thing. That is, its range only has one thing in it.}
            @item{We need a new type - something that can hold more than one thing at once. Racket actually has a tool to make such a thing, and it's called a data structure, or "struct" for short.}
            @pedagogy{@item{Set aside the two number cards; one for the x and one for the y coordinates. Then pick up your plastic bags.}}
            @pedagogy{@item{Put the two number cards inside the plastic bag, and then hold it up. How many things are you holding? One!}}
            @tag[selftaught]{@item{Now imagine that you've put the two numbers that you're using to describe the x and y into a box. If you were to hold up the box, you'd only be holding one thing!}}
            @item{In the same way, complex structs can be defined, in Racket, to hold multiple things. @tag[pedagogy]{Let's keep going with the game, but keep in mind that you may need to use your "struct bag" for some of these.}@tag[selftaught]{Let's do some more, but remember that you might need a "struct" to group things together.} What if your function was returning:}
            @itemlist/splicing[@item{the name and the age of a character}
                               @item{a flavor of soup, and whether it is hot or not}
                               @item{how many pets you have}
                               @item{a picture of a shape, with the number of sides and its color}
                               @item{a direction that a plane is traveling, and how fast it is going}]
            @pedagogy{@item{Good job guys! Put all of your cards back in the bag and leave it on the table.}}]}
                                

@lesson/studteach[#:title "Autos"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Suppose you want to open up an autobody shop. You take people's cars and trick them out, giving them paint jobs, turbo-charging them, etc.}
                 @item{What type of thing is an auto? Is it a number? String? Image? Boolean? Of course not. You could not describe all of the important things about an automobile with any one of those things. However, we could say that we care about a couple of things in our shop that can be described with these types. @pedagogy{Start a list on the board, with the variable name on one side, and the type on the other}}
                 @item{First...the model of the car. That could be like..."Prius", "H2", "XTerra", or something else. What type would that be?}
                 @item{How about how much horsepower my car has? How large the rims are? What color it is? The value, that the car is worth?}
                 @item{@tag[pedagogy]{Write on the board:} @itemlist/splicing[
                                                              @item{model: String @bitmap{images/car1.png}}
                                                                   @item{horsepower: Number}
                                                                   @item{rims: Number}
                                                                   @item{color: String}
                                                                   @item{value: Number}]}
                 @item{These are the only things that we're going to keep track of in an auto, but you can imagine how we would extend it to include other things.}
                 @item{Now that you have a bit more information about them, what data type could we use for this auto? A struct! This is the very first time that we're going to use structs...but they're going to play a HUGE part in your game. Let's take a look at how this works.}
                 @pedagogy{@item{Have students open the Autobody Shop file.}}
                 @pedagogy{@item{Raise your hand if you can read the line beginning with @code{define car1}. Have one student read the line aloud, while you write the definition on the board.}}
                 @code{(define car1 (make-auto "M5" 480 28 "black" 50000))}
                 @item{As you can see here, it's really easy to make this auto struct! We have a bit of code which tells the computer which order everything goes in...and we'll talk about that next class. For now, I want you to look at this new function: @code{make-auto}. @tag[pedagogy]{Let's flip to our contracts sheet and write it down.}}
                 @item{What is the name of the function? @code{make-auto}. How about the domain? How many things are in the domain? Five. They are, in fact, the five things that we have already listed@tag[pedagogy]{ on the board}. So what is in the domain of make-auto? String, Number, Number, String, Number.}
                 @pedagogy{@item{Unlike our struct bags, here the order is important, so be sure to write it down correctly. In fact, why don't you use another line to denote what each of these means...the first string is model, the next number is hp, etc. Give them a moment to write down something that looks like this:}}
                 @code[#:multi-line #t]{; make-auto : String Number Number String Number -> ___________________
; Model, hp, rims, color, value}
                 @tag[selftaught]{@item{Remember, order matters, so don't mix them around!}}
                 @item{Okay, so we have the name and the domain. What's the last part of the contract?}
                 @item{So what is the range? It's a struct, but what type of struct is it? Take a look at the name of the function, and have a guess. An auto. }
                 @item{Later we're going to talk about how to make your own structs...Racket obviously doesn't have autos built into it, so later we'll see what part of this code makes it work.}
                 @item{When I type @code{car1} into the interactions window and hit enter, what do you think I'll get back? Click run, and then try it out.}
                 @item{Does this make sense? What happened when we typed a number into the interactions window? We got that same number back! What about strings? Images? Booleans? Right! If we don't do anything to our input...if we don't use any function on it...we get back exactly what we put in! We put in an auto, and we got back that auto.}
                 @item{Let's define another car; we can call it @code{new-car}. To start, how will I define this variable?}
                 @code{(define new-car ( .....))} @bitmap{images/car3.png}
                 @item{Now what function do I use to make an auto? @code{make-auto}.}
                 @code{(define new-car (make-auto ...))}
                 @item{Which thing comes first in making my auto? @tag[pedagogy]{Check your contracts sheet if you don't remember: you wrote this down for a reason! @pedagogy{Have them walk you through the definition of @code{new-car}...for example:}}}
                 @code{(define new-car (make-auto "Taurus" 300 20 "white" 5000))}
                 @item{Now when we type @code{new-car} into the interactions window, what do you expect to happen? Hit run and try it out. @tag[pedagogy]{Take a minute with your partner, and define}@tag[selftaught]{Define} two new variables@tag[pedagogy]{--one for each of your favorite cars}. Call them [yourname]-car (@code{nathan-car}, @code{sam-car}, @code{jill-car}, etc). It can be any kind of car that you want, as long as your struct has the right types in the right orders!}
                 @item{You can see what your cars look like by using the function we've provided for you at the bottom of the screen. It's called @code{draw-auto}, and it takes an auto as input and gives you back an Image with your car in it. @pedagogy{Give them a few minutes to define and draw cars.}}
                 ]}

@lesson/studteach[#:title "Accessor Functions"
        #:duration "5 minutes"]{
          @itemlist/splicing[ 
            @item{Suppose you want to get the model OUT of @code{new-car}. The computer has a function for that, called @code{auto-model}. I can type @code{(auto-model new-car)} and get out @code{"Taurus"}. @pedagogy{Show this on the board.}}
            @item{I want you to practice taking the model out of your autos. Take @tag[pedagogy]{a minute and pull }the model out of EVERY auto you have, using @code{auto-model}}
            @item{@tag[pedagogy]{Flip back to your contract sheets. }What's the first part of a contract? The name! So what's the name of this function? @code{auto-model}}
            @item{What's the second part? The Domain! What do you think the domain is for auto-model? It's an auto!}
            @item{And finally, what's the third part? The Range! So what's the range of auto-model? A string!}
            @item{Write the contract for @code{auto-model} on your contract sheet. What do you think the contract for @code{auto-hp} is? Write it down too!}
            @item{@tag[pedagogy]{Take two minutes and write}@tag[selftaught]{Write} down the contracts for @code{auto-rims}, @code{auto-color} and @code{auto-value}. @tag[pedagogy]{When you show me that you've written them, you can}@tag[selftaught]{Now} try them out on your autos.}]}

@lesson/studteach[#:title "Autobody Shop"
        #:duration "25 minutes"]{
          @itemlist/splicing[
           @item{Now we know all about how to work with automobiles in Racket. What function makes an auto? @code{make-auto}. And which function draws that auto? @code{draw-auto}. But we don't just want to take an auto and give it right back. I said that we're running an autobody shop! You take people's cars and change them, making them better in some way, and then give them back to the customer. Let's figure out how to do that.}
           @item{Turn to @worksheet-link[#:page 9 #:name "paint-job"] in your workbooks. @tag[pedagogy]{I know that you're really good at the design recipe by now, so I want you to fill out the page as we talk. @pedagogy{Make sure they're able to keep up, and take time to let them write if need be!}}}
           @item{Let's write a function called @code{paint-job}, which changes the color of an automobile.}
           @item{That's our problem statement.}
           @item{What's the first step in the Design Recipe? Contract.}
           @item{What is the name of the function? What does it take in? Remember that we're getting instructions about which color to make it, as well as which auto we're changing the color of! And what do you think our autobody shop is going to give back? What would be the range of @code{paint-job}? @pedagogy{Write the contract on your page.} What's the purpose statement?}
           @item{What's the next step in the Design Recipe? Examples!}
           @item{Let's use the original @code{car1} as an example, and let's turn it purple.}
           @item{What do we write next? If you're stuck, look up at the range of the function@pedagogy{: raise your hand if you can tell me what I have to give back}. @pedagogy{That's right! }An auto! And how do I make an auto? }
           @item{The moment I write @code{make-auto}, I immediately know that I have to give it five things: the model, hp, rims, color, and value of that auto. Does the model of the auto change, just because I painted it a different color? No! So how do I get the model out of @code{car1}?}
           @item{The horsepower shouldn't change either with a paint job. So how do I get the hp out of car1? }
           @item{The rim size shouldn't change with a paint job. So how do I get the rims out of car1? }
           @item{What about the color? Does that change in this example? Yes! It should be the string "purple".}
           @item{How about the value? Did our problem statement say that the value changes? So how do I get the value out of car1? }
           @pedagogy{@item{Make sure you're copying this down into your notebooks! Give them time to catch up writing.}}
           @item{Let's do another example! This time we want to paint car2 green. What do I write for the first part of the example?} 
           @item{See if you can finish off the rest of this example on your own.}
           @item{What's the next step in the Design Recipe? Definition. @pedagogy{Since you've done such a good job in your examples, this step becomes easy! }What two things change between these examples? The color and the auto! @pedagogy{Circle them. }So how many variables will your function need?}
           @item{Write the definition, using the examples to help you. Remember: All you have to do is copy the examples, changing the values to variables!}
           @pedagogy{@item{Okay - are you ready to try one on your own?}}
           @item{Turn to @worksheet-link[#:page 10 #:name "turbocharge"] in your workbooks.@tag[pedagogy]{ Now it's your turn.}}
           @item{When you turbocharge an engine, you get more power out of it. Your bodyshop does a turbocharging job that adds 20 horsepower to any engine, but keeps everything else the same. Write the function @code{turbocharge}.@pedagogy{You have 10 minutes. GO!}}
           @pedagogy{@item{Walk around the class, helping kids as-needed. Don't forget to count down the minutes! If they finish writing, let them put it into the computer.}}]}


@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Who can tell us one thing we learned today?}       
  @item{Who saw someone else in the class do something great?}
  @item{Cleanup, dismissal}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
