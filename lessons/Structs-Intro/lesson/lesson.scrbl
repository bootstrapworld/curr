#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[@item{Pass out the bags of datatype cards.}
            @item{Now we're going to play a game...but first I'm going to explain the rules. First off, everyone take out all of the cards from the bags, and set them on the table in front of you.}
            @item{Raise your hand if you can tell me what's written on the cards.}
            @item{Right: number, string, image, boolean...but what are these? Datatypes.}
            @item{Here's how this is going to work: I'm going to say something that can be returned by a Racket function, and you're going to hold up a card to show me what datatype it would be. If I were to say age, which would you hold up?}
            @item{Now, there's one very important rule: no matter what I say, you can only hold up one thing.}
            @item{Ready?}
;list shit
            @item{a color}
            @item{a picture of a circle}
            @item{your name}
            @item{whether or not something is correct}
            @item{an x-coordinate}
            @item{your friend's favorite food}
            @item{a picture of ninja cat}
            @item{a set of coordinates}
;list shit
            @item{Wait! How many things are in a set of coordinates? An x and a y. Is that one thing? Is it one number? NO! You can only hold one thing up, but we'd need to show two numbers.}
            @item{Can we use a String to return two numbers? Not if we want to add or subtract! Can we use a Boolean? An Image? None of our data types work!}
            @item{It turns out that Racket has exactly this problem. Every function that you could possibly write or use in Racket can only give back one thing. That is, its range only has one thing in it.}
            @item{We need a new type - something that can hold more than one thing at once. Racket actually has a tool to make such a thing, and it's called a data structure, or "struct" for short.}
            @item{Set aside the two number cards; one for the x and one for the y coordinates. Then pick up your plastic bags.}
            @item{Put the two number cards inside the plastic bag, and then hold it up. How many things are you holding? One!}
            @item{In the same way, complex structs can be defined, in Racket, to hold multiple things. Let's keep going with the game, but keep in mind that you may need to use your "struct bag" for some of these. What if your function was returning:}
;list shit
            @item{the name and the age of a character}
            @item{a flavor of soup, and whether it is hot or not}
            @item{how many pets you have}
            @item{a picture of a shape, with the number of sides and its color}
            @item{a direction that a plane is traveling, and how fast it is going}
;list shit
            @item{Good job guys! Put all of your cards back in the bag and leave it on the table.}]}