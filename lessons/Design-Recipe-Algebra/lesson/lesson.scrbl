#lang curr/lib

@declare-tags[pedagogy selftaught group]

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
            @tag[pedagogy]{@item{Have students discuss, and explain their answers. Fill in the table as you go.}}
            @item{@code{; D : seconds -> miles}}
            @item{@code{; A rocket travels 80 miles every second: how far it gone?}}
            @item{@code{D(1)  = 80*1}}
            @item{@code{D(3)  = 80*3}}
            @item{@code{D(10)  = 80*10}}            
            @item{Can you come up with more examples?}
            @item{Okay, so now we've done some examples. @tag[pedagogy]{Raise your hand if you can tell me what we do next?}}
            @item{Now we circle everything that's changed! In this case, that's just the second number - the one thay gets multiplied by 80. What we need now is a good variable name. What does that number mean? Think back to what was underlined on your paper, when we talked about what goes into the function. What should we call it?}
            @tag[pedagogy]{@item{By now, students should be able to figure out the variable name themselves. However, it's worth pointing out that some word problems (like this one!) will tell students what to call the variable.}}
            @item{Okay, so we've got our contract, our examples, and our variable name. We're ready to define the function! Just as we always have, we copy our examples - replacing the circles items with the variable names.}
            @item{@code{D(t) = 80*t}}
            @item{For Round 2, I'm going to give you a slightly different problem, and see if you can figure out how to write the function. Turn to @worksheet-link[#:page 37 #:name "DR2"] in your workbooks.}
            @item{"A rocket is traveling from Earth to Mars at 80 miles per second. Write a function that describes the time the rocket has been traveling, as a function of distance."}

            @item{Take a minute @tag[pedagogy]{with your partner}, and see if you can underline all the hints in this word problem.}

            @tag[pedagogy]{@item{If necessary, point out that this is the same relationship between distance and time as before, only now we want be able to see the relationship from the opposite direction: time in terms of distance, rather than distance in terms of time.}}
            @item{What's the first step? Write the contract!}
            @item{@code{; time : miles -> seconds}}
            @item{What comes next? We write the function, right? NO! We need to write some examples!}
            @tag[pedagogy]{@item{Have students volunteer some examples, making sure they are written in algebra (students may choose their own function name)}}
            @item{@code{; time : miles -> seconds}}
            @item{@code{; A rocket travels 80 miles every second: how long has it been flying?}}
            @item{@code{time(0) = 0/80}}
            @item{@code{time(100) = 100/80}}
            @item{@code{time(80) = 80/80}}
            @item{@code{...}}
            @item{Now see if you can finish this off with your partner, choosing your variable name and then writing out the function. If you can complete this step in two minutes, your team will earn a point. Ready, set...GO!}
            @tag[pedagogy]{@item{Countdown, assign points, and review.}}
            @item{Once your function is set up, it's easy to just plug in values and get answers back. With most word problems, the hard part is setting up the function in the first place.}
            @item{Luckily, the Design Recipe makes setting up that function a lot easier! We've just used it to set up two different functions, which could be used to give us answers in terms of distance or time.}
            @item{Suppose we had a word problem that wanted to know how far the rocket traveled in 6 seconds: which one would we use? What if we wanted to know how long it takes for the rocket to go a thousand miles? What if I knew the train left at 1pm, and I wanted to know what time it arrives in Chicago, 800 miles away? Would I want my time function, or my distance function? @tag[pedagogy]{Have students explain their answers to each.}}
            @item{Let's make it more interesting...}
            
            
            
            
            ]}

