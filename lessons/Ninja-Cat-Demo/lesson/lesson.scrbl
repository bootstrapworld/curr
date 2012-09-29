#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Dissecting a Demo"
        #:duration "10 minutes"
        ]{                 
 @itemlist/splicing[
   @item{Soon you're going to be designing your own games, but it's important to know how a simple game is built before you start designing your own.@bitmap{images/1.2.png}}
   @item{Let's take a look at a real game, which I've made using the same language and tools that you'll  be learning. When you're done with this class, you'll be able to make something similar. }
   @pedagogy{@item{@demo{Show the kids Ninjacat. Be sure to end on a frozen frame of the game, so the whole class can see the same image.}}}
   @selftaught{@item{Open @(hyperlink "http://www.wescheme.org/view.jsp?publicId=vital-grown-eater-shown-crime" "this link") in a new window. When you click "Run", be sure to read the directions at the top of the screen so you know how to play!}} 
               
   @item{This game, like many others, is made up of @italic{characters}, each of which has it's own behavior. The Ruby moves from the right to the left, as does the Dog. NinjaCat only moves when you hit the arrow keys, and she can move left, right, up and down. We can figure out how the game works by first understanding about how each character works.}
   
   @item{Turn to @worksheet-link[#:name "How-Does-Ninja-Cat-Work" #:page 1] in your workbook. Here we have a table, which we'll use to reverse-engineer NinjaCat and see how it works. @pedagogy{Raise your hand if you can tell me one thing that you saw in the game. Wait until a few hands are up, then call one. Excellent! So we can write that down in our first column.} @tag[selftaught]{What do you see in the game? Write it down.}}
   @item{@exercise{@pedagogy{In your groups: }Take one minute to fill out thge first column with a complete list of all things in the game. @pedagogy{Your group will get a point for each thing they can find. Everyone in your group should have this list written down - not just one person! If even one person in your group hasn't written it down, the group doesn't get the point! GO! }} @bitmap{images/1.1.png}}
   @selftaught{Did you list all four moving characters? What else is in the game? Did you write down the background? The score?}
   @pedagogy{@item{During the minute, walk around and see how groups are doing. This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }
              @item{Have groups volunteer some of their answers and write them on the board. When they start listing items in the background, explain that you'll be grouping them all together into "background." Assign scores to the board: "team MIT is tied with team Northeastern!"}}
   @item{Now take a look at that second column. We need to think about what is @italic{changing} when we play the game. What about the Ruby? Does it get bigger? Does it change color? Does it spin around?}
   @item{The only thing that changes about the Ruby is its position! Everything else about it is the same. What about the Dog? The Cat? Fill in the rest of the second column, listing everything that changes about each character.}
   @item{@exercise{@pedagogy{In your groups: }Take one minute to fill in the second column, for each thing in your game.}}
   @pedagogy{@item{Again, give a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence, and complete attention.}}
   @item{Did you notice that the Dog, Ruby, Cloud and Cat only change position, and nothing else? What about the Background - it doesn't change at all, so we can @italic{leave that cell in table black!}. Did you notice the Score changes value? You'll want to add that to your table, too!}
   @pedagogy{@item{Quickly fill in the second column on the board. Assign scores.}}]}

