#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Dissecting a Demo"
        #:duration "10 minutes"
        ]{                 
 @itemlist/splicing[
   @item{Soon you're going to be designing your own games, but it's important to know how a simple game is built before you start designing your own.}
   @item{Let's take a look at a real game, which I've made using the same language and tools that you guys will be learning. When you're done with this class, you'll be able to make something similar.}
   @pedagogy{@item{@demo{Show the kids Ninjacat. Be sure to end on a frozen frame of the game, so the whole class can see the same image.}}}
   @tag[selftaught]{@item{Look at the demo of Ninjacat and click run. @embedded-wescheme[#:id "NinjaCat"
                   #:public-id "vital-grown-eater-shown-crime"
                   #:width "100%"]}}
   @item{Turn to @worksheet-link[#:name "How-Does-Ninja-Cat-Work" #:page 1] in your workbooks. Here we have a table, which we'll use to reverse-engineer NinjaCat and see how it works. @pedagogy{Raise your hand if you can tell me one thing that you saw in the game. Wait until a few hands are up, then call one. Excellent! So we can write that down in our first column.} @tag[selftaught]{What do you see in the game? Write it down.}}
   @tag[(group pedagogy)]{@item{@exercise{In your groups, take one minute to come up with a complete list of all things in the game. Your group will get a point for each thing they can find. Everyone in your group should have this list written down - not just one person! If even one person in your group hasn't written it down, the group doesn't get the point! GO!} 
                                 @bitmap{images/1.1.png}}}
   @tag[selftaught]{@item{@exercise{Take one minute to come up with a complete list of all things in the game. GO!}}}
   @pedagogy{@item{During the minute, walk around and see how groups are doing. This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }}
   @pedagogy{@item{Have groups volunteer some of their answers and write them on the board. When they start listing items in the background, explain that you'll be grouping them all together into "background." Assign scores to the board: "team MIT is tied with team Northeastern!"}}
   @item{Okay, so we've got our list. Now we need to think about what is changing when we play the game. What about the Ruby? Does it get bigger? Does it change color? Does it spin around?}
   @item{The only thing that changes about the Ruby is its position! Everything else about it is the same.}
   @tag[group]{@item{@exercise{In your groups: Take one minute to fill in the second column, for each thing in your game. GO!}}}
   @pedagogy{@item{Again, give a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence, and complete attention.}}
   @pedagogy{@item{Quickly fill in the second column on the board. Assign scores.}}]}

