#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Autos"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Suppose you want to open up an autobody shop. You take people's cars and trick them out, giving them paint jobs, turbo-charging them, etc.}
                 @item{What type of thing is an auto? Is it a number? String? Image? Boolean? Of course not. You could not describe all of the important things about an automobile with any one of those things. However, we could say that we care about a couple of things in our shop that can be described with these types. @pedagogy{Start a list on the board, with the variable name on one side, and the type on the other}}
                 @item{First...the model of the car. That could be like..."Prius", "H2", "XTerra", or something else. What type would that be?}
                 @item{How about how many horsepowers my car has? How large the rims are? What color it is? The value, that the car is worth?}
                 @item{@tag[pedagogy]{Write on the board:} @itemlist/splicing[
                                                              @item{model: String}
                                                                   @item{horsepower: Number}
                                                                   @item{rims: Number}
                                                                   @item{color: String}
                                                                   @item{value: Number}]}
                 @item{These are the only things that we're going to keep track of in an auto, but you can imagine how we would extend it to include other things.}
                 @item{Now that you have a bit more information about them, what data type could we use for this auto? A struct! This is the very first time that we're going to use structs...but they're going to play a HUGE part in your game. Let's take a look at how this works.}
                 @pedagogy{@item{Have students open the Autobody Shop file.}}
                 @pedagogy{@item{Raise your hand if you can read the line beginning with @code{define car1}. Have one student read the line aloud, while you write the definition on the board.}}
                 @tag[pedagogy]{Read the line beginning with @code{define car1}.}
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
                 @code{(define new-car ( .....))}
                 @item{Now what function do I use to make an auto? @code{make-auto}.}
                 @code{(define new-car (make-auto ...))}
                 @item{Which thing comes first in making my auto? @tag[pedagogy]{Check your contracts sheet if you don't remember: you wrote this down for a reason! @pedagogy{Have them walk you through the definition of @code{new-car}...for example:}}}
                 @code{(define new-car (make-auto "Taurus" 300 20 "white" 5000))}
                 @item{Now when we type @code{new-car} into the interactions window, what do you expect to happen? Hit run and try it out. @tag[pedagogy]{Take a minute with your partner, and define}@tag[selftaught]{Define} two new variables@tag[pedagogy]{--one for each of your favorite cars}. Call them [yourname]-car (@code{nathan-car}, @code{sam-car}, @code{jill-car}, etc). It can be any kind of car that you want, as long as your struct has the right types in the right orders!}
                 @item{You can see what your cars look like by using the function we've provided for you at the bottom of the screen. It's called @code{draw-auto}, and it takes an auto as input and gives you back an Image with your car in it. @pedagogy{Give them a few minutes to define and draw cars.}}
                 ]}
