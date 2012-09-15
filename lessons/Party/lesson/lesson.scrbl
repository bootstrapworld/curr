#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
@item{Now that we know how to define our own structs, let's define another one. Instead of working in an autobody shop, this time we're going to be party planners. We need to be able to use data structs to represent each party that we're planning, keeping track of their location, theme, and number of guests. As with the five parts of auto, write location, theme and guests onto the board, with space for their respective types.}
@item{What datatype could we use to represent the location of the party? How about a string?}
@item{The name of the theme? Like "50s"? Or "laser tag"? String. How about the guests? Number.}
@item{So how would we write the next line on page 13? ";a party is a ______"}
@item{Now let's fill out the next bit. Look above, at how you did it for auto. What were the three parts of a party? location, theme and guests. Take twenty seconds to finish that page.}
@item{When I say go, turn on your monitors and open the party planner file. At the top of the definitions window, take a look at the first two lines. Do they match what you have written?}
@item{Take a minute and define your own party struct. No matter what it is, make sure that it has the right types of things in the right order.}
@item{5, 4, 3, 2, 1, monitors off. Let's write some more contracts....turn to your contracts sheet. Which function did we use to make a party? make-party. What would its contract be?}
@item{Which function did we use to get the model out of an auto? How did we get the color out of an auto? So how would you get the location out of the party? party-location}
@item{Which other two functions can we write, now that we've defined our party struct? Can you write their contracts?}
@item{Now let's write some functions using our party struct. Remember, we're party planners, so we need to be able to change information for each party. Turn to page 14. Let's do the first one together. Here's your problem statement: Write a function called RSVP, which takes in a party and adds one to their number of guests.}
@item{Alright, so what's the name of the function? Domain? Range? Nice. Write the contract and purpose statement on your page.}
@item{What's the next step in the Design Recipe? Examples. Let's write one for the party "Halloween". How would we start our example?}
@item{Okay, now we're stuck. Think for a moment about what we need to get back...what do we need to make? A party.}
@item{Which function do we use to make a party?  }
@item{What do we want to happen to the location? Does the location change at all? No, of course not. So how do we get the location out of the party? }
@item{What about the theme? If someone news RSVPs, do they suddenly start have to make it a christmas party? No. What should we write? }
@item{Lastly, what did we say happens to their guests, when we RSVP? Their guest list goes up by one. }]}