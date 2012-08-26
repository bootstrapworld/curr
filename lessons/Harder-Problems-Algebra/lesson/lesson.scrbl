#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Harder Problems"
        #:duration "30 minutes"
        ]{
  @itemlist/splicing[
            @item{Turn to @worksheet-link[#:page 40 #:name "DR3"] in your workbooks.}
            @item{"A rocket leaves Earth, headed for Mars at 80 miles per second. At the exact same time, an asteroid leaves Mars traveling towards Earth, moving at 70 miles per second. If the distance from the Earth to Mars is 50,000,000 miles, how long will it take for them to collide?"}
            @item{What is this problem asking us for? @tag[pedagogy]{The time it takes for the rocket to collide with the asteroid}}
            @item{What we want is a function that will tell us how many seconds until a collision occurs, given how far apart the rocket and asteroid are.}
            @item{What is a good name for this function? Let's use @code{collide}.}
            @item{Take a minute with your partner, and write down the contract for this function. You must have the entire contract written correctly@tag[pedagogy]{ to earn a point}!}
            @tag[pedagogy]{@item{Countdown, assign points, and review.}}
            @item{So what is our Domain? A Number, representing the distance between rocket and asteroid! And our Range? The Number of seconds being counted down before they collide.}
            @item{@code{; collide : Number -> Number}}
            @item{So what comes next? Examples! Let's start with something easy - when the rocket and asteroid have just smashed into each other. How many miles apart are they then? Zero! And many seconds will it take for them to collide? Zero again, because they've already met!}
            @item{@code{; collide : distance -> time}}
            @item{@code{; If they start off d miles apart, how long will it take to collide?}}
            @item{@code{collide(0) = ...}}
            @item{So now we need to figure out what calculations go after the equals sign. Luckily, we have a hint: we know that whatever is it HAS to come out to zero, since we know that they've already collided when they are zero miles apart. If the rocket is going 80 miles/second, and the asteroid is going 70 miles/second, how fast are they approaching each other? @tag[pedagogy]{Let students chew on this.}}
            @item{60 + 70 = 150, so we know that they are getting closer and closer together at a rate of 150 miles per second.}
            @item{This isn't that different from our @code{time} function: we have some speed, and we want to know how much time it will take to go a given distance. So what do we write for our example?}
            @item{@code{; collide : distance -> time}}
            @item{@code{; If they start off d miles apart, how long will it take to collide?}}
            @item{@code{collide(0) = 0/150}}
            @item{Let's do another example, to make sure we've got a handle on this thing. If they're traveling towards each other at 150 miles/second, how long will it take for them to meet if they start out 300 miles apart? (two seconds) How do you know? (300/150 = 2) @tag[pedagogy]{Raise your hand if you can write this as an example. Have students do a few more examples...}}
            @item{@code{; collide : distance -> time}}
            @item{@code{; If they start off d miles apart, how long will it take to collide?}}
            @item{@code{collide(0) = 0/150}}
            @item{@code{collide(300) = 300/150}}
            @item{@code{collide(5000) = 5,000/150}}
            @item{@code{collide(100,000) = 100,000/150}}
            @item{By now, some of you may have already figured out how to get the answer. If so, that's great! But suppose you still weren't sure - who can take us the rest of the way, and write the function? @tag[pedagogy]{Take a volunteer...}}
            @item{@code{; collide : distance -> time}}
            @item{@code{; If they start off d miles apart, how long will it take to collide?}}
            @item{@code{collide(0) = 0/150}}
            @item{@code{collide(300) = 300/150}}
            @item{@code{collide(5000) = 5,000/150}}
            @item{@code{collide(100,000) = 100,000/150}}
            @item{@code{collide(d) = d/150}}
            @item{Sometimes, the Design Recipe will get you to the answer without even having to finish. That's how powerful it is!}
            @item{Open your workbooks to @worksheet-link[#:page 41 #:name "DR4"]. This page and the one after it are wildcards -- you'll have until the end of class to finish them@tag[pedagogy]{, and find out how many points you can get! Are you ready? On your marks, get set, GO}!}
            @tag[pedagogy]{@item{TEACHERS: you can add as many pages as you like to the workbooks, using any algebra problem you like. We recommend using word problems from your students' algebra textbook, or even from your state's standardized test!}}
            ]}
