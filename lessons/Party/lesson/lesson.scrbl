#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "The Party Struct"
        #:duration "30 minutes"]{
          @itemlist/splicing[
@item{Now that we know how to define our own structs, let's define another one. Instead of working in an autobody shop, this time we're going to be party planners. We need to be able to use data structs to represent each party that we're planning, keeping track of their location, theme, and number of guests. @pedagogy{As with the five parts of auto, write location, theme and guests onto the board, with space for their respective types.}}
@item{What datatype could we use to represent the location of the party? How about a string?}
@item{The name of the theme? Like @code{"50s"}? Or @code{"laser tag"}? String. How about the guests? Number.}
@item{So how would we write the next line on page 13? @code{;a party is a ______}}
@item{Now let's fill out the next bit. Look above, at how you did it for auto. What were the three parts of a party? location, theme and guests. @tag[pedagogy]{Take twenty seconds to finish that page.}}
@item{@pedagogy{When I say go, turn on your monitors and open the party planner file.}@tag[selftaught]{Open up the party planner file.} At the top of the definitions window, take a look at the first two lines. Do they match what you have written?}
@item{Take a minute and define your own party struct. No matter what it is, make sure that it has the right types of things in the right order.}
@item{@pedagogy{5, 4, 3, 2, 1, monitors off. }Let's write some more contracts: turn to your contracts sheet. Which function did we use to make a party? @code{make-party}. What would its contract be?}
@item{Which function did we use to get the model out of an auto? How did we get the color out of an auto? So how would you get the location out of the party? @code{party-location}.}
@item{Which other two functions can we write, now that we've defined our party struct? Can you write their contracts?}
@item{Now let's write some functions using our party struct. Remember, we're party planners, so we need to be able to change information for each party. Turn to @worksheet-link[#:page 14 #:name "RSVP"]. @tag[pedagogy]{Let's do the first one together. }Here's your problem statement: Write a function called @code{RSVP}, which takes in a party and adds one to its number of guests.}
@item{Alright, so what's the name of the function? Domain? Range? Write the contract and purpose statement on your page.}
@item{What's the next step in the Design Recipe? Examples. Let's write one for the party "Halloween". How would we start our example?}
@code[#:multi-line #t]{(EXAMPLE (RSVP "Halloween")....)}
@item{Okay, now we're stuck. Think for a moment about what we need to get back...what do we need to make? A party.}
@item{Which function do we use to make a party?  }
@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween)
	(make-party	.....))}
@item{What do we want to happen to the location? Does the location change at all? No, of course not. So how do we get the location out of the party? }
@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween)
	(make-party	(party-location Halloween)
		.....))}
@item{What about the theme? If someone new RSVPs, do they suddenly start have to make it a christmas party? No. What should we write? }
@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween)
	(make-party	(party-location Halloween)
	            (party-theme Halloween)
		.....))}
@item{Lastly, what did we say happens to their guests, when we RSVP? Their guest list goes up by one. }
@code[#:multi-line #t]{(EXAMPLE (RSVP Halloween)
	(make-party	(party-location Halloween)
		    (party-theme Halloween)
		    (+ (party-guests Halloween) 1)))}
@item{Now, on @worksheet-link[#:page 15 #:name "relocate"], here's your next problem: Write a function called relocate, which takes in a party and the location that it's moving to, and makes a new party at that location. Go through each part of the design recipe: contract, examples, definition.}]}
