#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 10: Bridging to Algebra}

@overview{
@unit-descr{
Students translate from Racket into Algebra, and back. They then apply the Design Recipe to solve common word 
problems from Algebra texts.}

@objectives[@item{Take what they've learned in the programming domain, and apply it to the algebraic domain.}
            ]

@product-outcomes[
            @item{Students rewrite their games in Algebraic notation and solve algebra problems.}]

@state-standards

@length-of-lesson[90]
@tag[pedagogy]{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook") folders - in pairs! - with names on covers.}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, basic skills, course calendar)}
           @item{Language Table (see below)}
           @item{Open the Algebra Translation [] file on students' computers, but turn the monitors off.}
           ]}

@preparation[@item{Write agenda on board}
             @item{"Algebra Translation" [@resource-link[#:path "source-files/Algebra.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=s2s0tkTgeF" "WeScheme")] preloaded on students' machines, with monitors off.}]
            

@(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or}))
}
@lesson[#:title "Introduction"
        #:duration "5 minutes"
        ]{
  @itemlist/splicing[
            @item{So here we are, at the final unit of Bootstrap.}
            @item{You've learned a lot about computer programming, and you've used many of the concepts you've picked up along the way to build your videogames.}
            @item{It turns out that these concepts show up in a lot of places outside of this class, too. If you take another programming class, for example, you will still find yourself using functions and variables. You will still find yourself wrestling with Numbers, Strings, Images, and Booleans. If there is one thing I hope you take with you, it is the Design Recipe.}
            @item{Today we're going to explore how the Design Recipe can be used for a totally different class -- Algebra.}
            @item{It turns out that math is actually a programming language! Arithmetic (adding, subtracting, multiplying and dividing) is just like in circles of evaluation, where you could use functions but didn't know how to define them.}
            @item{Algebra, on the other hand, is where you start defining functions and start using them to solve problems. You've been doing this with code throughout the entire class!}
             ]}


@lesson[#:title "Defining Values"
        #:duration "10 minutes"
        ]{
  @itemlist/splicing[
            @pedagogy{@item{For this activity write all Racket expressions on one side of the board, and all algebra expressions on the other.}}
            @item{In our programming language, we defined values this way: @code{(define x 4)}}
            @item{I can even define values in terms of values that came before: @code{(define y (+ x 10))}}
            @item{I want a volunteer who can define another value for me.} @pedagogy{@item{Copy their answers as you go. Encourage students to define values in terms of other ones.}}
            @item{In math class, you define values using the equals sign: @code{x = 4}}
            @pedagogy{@item{Write this on the other side of the board.}}
            @item{And, as with our programming language, you can define values in terms of other values: @code{y = x + 10}}
            @item{Turn to page 35 in your workbooks. You will see a bunch of value definitions written in code - take 2 minutes to convert this into math. GO!}
            
            ]}

@lesson[#:title "Defining Functions"
        #:duration "20 minutes"
        ]{
  @itemlist/splicing[
            @pedagogy{@item{Write a simple function on the board:}}
            @item{@code{(define (f x) (+ x 1))}}
            @item{You also know how to define functions like this one. 
                  @tag[pedagogy]{Raise your hand if you can tell me the name of this function?}}

            @item{How many variables does it take? What is the name of that variable?}
            @item{What does the function do to the variable @code{x}?}
            @item{Can you define a function @code{g}, which takes in a variable @code{q} and multiplies it by 20.}
            @pedagogy{@item{Have students define 2-3 other, simple functions.}}
            @item{Can you explain what this function does?}
            @item{To translate these functions into algebra, we do something similar to what we did with the values. 
                  We remove the @code{define}, and replace it with an equals sign: @code{f(x) = x + 1}}
            @item{Who can translate the function @code{g}?}
            @item{@code{g(q) = q * 6}}

            @pedagogy{@item{Have students translate the rest of the functions, listed on @worksheet-link[#:page 37 #:name "Functions"].}}
            @item{Okay, so you're pretty good at translating from code to math. Do you think you can translate from math back into code?}
            @pedagogy{@item{1...2...3 Monitors ON!!!}}
            @item{On your computers, there are five examples of functions written in algebra. Under each one, I want you to convert the algebraic function into code. @tag[pedagogy]{You will have five minutes - GO!}}

            @pedagogy{@item{Countdown, review as needed.}}
            ]}
                         


@lesson[#:title "Design Recipe"
        #:duration "30 minutes"
        ]{
  @itemlist/splicing[
            @item{Of course, the real power of programming isn't how well you know the language. It's about how well you can use it to solve problems! In this class, you've leared about a powerful tool that helps you take word problems on paper and turn them into functions on the computer: the Design Recipe!}
            @item{It turns out that the Design Recipe can also be used to help you solve word problems in algebra, too!}
            @item{Just like we have in the past, we're going to test out your Design Recipe skills...but this time, you'll be using it with Algebra, instead of Code.}
            @item{For Round 1, let's take a problem you've seen before, and walk through it the way we would in an algebra class. Turn to @worksheet-link[#:page 36 #:name "DR"] in your workbooks.} 
            @item{"A rocket is flying from Earth to Mars at 80 miles per second. Write a function that describes the distance @code{D} the rocket has traveled, as a function of time @code{t}."}
            @item{Where do we start? @tag[pedagogy]{Give students some time to think, or make suggestions.}}
            @item{Well, we want to write a function - so what's the first step in the Design Recipe? We need to make a contract!}
            @item{Every contract has three parts. What are they?}            
            @item{As usual, the first two parts of the contract sometimes have hints to them in the problem itself. Take a minute, and see if you @tag[pedagogy]{and your partner} can underline the hints for the Name and Domain of this function.}
            @item{So what did you find? The problem wants us to find out the distance the rocket has traveled. So we could call the function @code{Distance}, or @code{D} for short. Sometimes we can choose our own name, and sometimes the problem tells us which name it wants. Does this one tell us whether it should be @code{D} or @code{Distance}?}
            @item{What about the Domain? What kind of thing goes into the distance function? Is it how many people are on the rocket? How many stops it makes? Did anybody find the hint in the word problem?}
            @item{It's the number of seconds the rocket has been traveling! What about the Range? What kind of thing is distance? It's the number of miles the rocket has traveled! In algebra, we can actually be a little more descriptive than in programming, so we can simply write @code{; D : seconds -> miles} } 
            @item{Let's also make a little note to ourselves, to remind us of what this function is all about.}
            @item{@code{; D : seconds -> miles} }
            @item{@code{; A rocket travels 80 miles every second: how far it gone?}}
            @item{@tag[pedagogy]{Raise your hand: } Can you tell me the next step in the Design Recipe?}
            @item{We need to give examples for the function. On the computer, we would start out by writing @code{(EXAMPLE...)}, followed by an example of using @code{d} with some number of hours and then the code that gives us a distance. In Algebra, we don't need to write the word @code{EXAMPLE}, but everything else we know still applies.}
            @item{Suppose the rocket has been traveling for just one second. That means our distance function @code{D} has what for an input? One! What would I write if it had been traveling for three seconds? Ten? @tag[pedagogy]{Write these on the board as students answer...}}            
            @item{@code{; D : seconds -> miles}}
            @item{@code{; A rocket travels 80 miles every second: how far it gone?}}
            @item{@code{D(1)  = ...}}
            @item{@code{D(3)  = ...}}
            @item{@code{D(10)  = ...}}
            @item{When the rocket has been moving for a second, how many miles has it gone?}
            @pedagogy{@item{Have students discuss, and explain their answers. Fill in the table as you go.}}
            @item{@code{; D : seconds -> miles}}
            @item{@code{; A rocket travels 80 miles every second: how far it gone?}}
            @item{@code{D(1)  = 80*1}}
            @item{@code{D(3)  = 80*3}}
            @item{@code{D(10)  = 80*10}}            
            @item{Can you come up with more examples?}
            @item{Okay, so now we've done some examples. @tag[pedagogy]{Raise your hand if you can tell me what we do next?}}
            @item{Now we circle everything that's changed! In this case, that's just the second number - the one thay gets multiplied by 80. What we need now is a good variable name. What does that number mean? Think back to what was underlined on your paper, when we talked about what goes into the function. What should we call it?}
            @pedagogy{@item{By now, students should be able to figure out the variable name themselves. However, it's worth pointing out that some word problems (like this one!) will tell students what to call the variable.}}
            @item{Okay, so we've got our contract, our examples, and our variable name. We're ready to define the function! Just as we always have, we copy our examples - replacing the circles items with the variable names.}
            @item{@code{D(t) = 80*t}}
            @item{For Round 2, I'm going to give you a slightly different problem, and see if you can figure out how to write the function. Turn to @worksheet-link[#:page 37 #:name "DR2"] in your workbooks.}
            @item{"A rocket is traveling from Earth to Mars at 80 miles per second. Write a function that describes the time the rocket has been traveling, as a function of distance."}

            @item{Take a minute @tag[pedagogy]{with your partner}, and see if you can underline all the hints in this word problem.}

            @pedagogy{@item{If necessary, point out that this is the same relationship between distance and time as before, only now we want be able to see the relationship from the opposite direction: time in terms of distance, rather than distance in terms of time.}}
            @item{What's the first step? Write the contract!}
            @item{@code{; time : miles -> seconds}}
            @item{What comes next? We write the function, right? NO! We need to write some examples!}
            @pedagogy{@item{Have students volunteer some examples, making sure they are written in algebra (students may choose their own function name)}}
            @item{@code{; time : miles -> seconds}}
            @item{@code{; A rocket travels 80 miles every second: how long has it been flying?}}
            @item{@code{time(0) = 0/80}}
            @item{@code{time(100) = 100/80}}
            @item{@code{time(80) = 80/80}}
            @item{@code{...}}
            @item{Now see if you can finish this off with your partner, choosing your variable name and then writing out the function. If you can complete this step in two minutes, your team will earn a point. Ready, set...GO!}
            @pedagogy{@item{Countdown, assign points, and review.}}
            @item{Once your function is set up, it's easy to just plug in values and get answers back. With most word problems, the hard part is setting up the function in the first place.}
            @item{Luckily, the Design Recipe makes setting up that function a lot easier! We've just used it to set up two different functions, which could be used to give us answers in terms of distance or time.}
            @item{Suppose we had a word problem that wanted to know how far the rocket traveled in 6 seconds: which one would we use? What if we wanted to know how long it takes for the rocket to go a thousand miles? What if I knew the train left at 1pm, and I wanted to know what time it arrives in Chicago, 800 miles away? Would I want my time function, or my distance function? @tag[pedagogy]{Have students explain their answers to each.}}
            @item{Let's make it more interesting...}
            
            
            
            
            ]}


@lesson[#:title "Harder Problems"
        #:duration "30 minutes"
        ]{
  @itemlist/splicing[
            @item{Turn to @worksheet-link[#:page 38 #:name "DR3"] in your workbooks.}
            @item{"A rocket leaves Earth, headed for Mars at 80 miles per second. At the exact same time, an asteroid leaves Mars traveling towards Earth, moving at 70 miles per second. If the distance from the Earth to Mars is 50,000,000 miles, how long will it take for them to collide?"}
            @item{What is this problem asking us for? @tag[pedagogy]{The time it takes for the rocket to collide with the asteroid}}
            @item{What we want is a function that will tell us how many seconds until a collision occurs, given how far apart the rocket and asteroid are.}
            @item{What is a good name for this function? Let's use @code{collide}.}
            @item{Take a minute with your partner, and write down the contract for this function. You must have the entire contract written correctly@tag[pedagogy]{ to earn a point}!}
            @pedagogy{@item{Countdown, assign points, and review.}}
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

            @item{Open your workbooks to @worksheet-link[#:page 39 #:name "DR4"]. This page and the one after it are wildcards -- you'll have until the end of class to finish them@tag[pedagogy]{, and find out how many points you can get! Are you ready? On your marks, get set, GO}!}
            @pedagogy{@item{TEACHERS: you can add as many pages as you like to the workbooks, using any algebra problem you like. We recommend using word problems from your students' algebra textbook, or even from your state's standardized test!}}

            ]}

@copyright[]