#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introducing Structs"
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