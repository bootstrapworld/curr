#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Dissecting a Demo"
     #:duration "10 minutes"
     #:overview "Play a simple game, then take it apart and figure out what's going on in the computer"
     #:learning-objectives @itemlist[@item{Model a simple system}]
     #:product-outcomes @itemlist[@item{In workbooks, students create a data model that describes a simple videogame}]
     #:standards @itemlist[@item{MP.1: Make sense of problems and persevere in solving them}
                            @item{MP.7: Look for and make use of structure}]
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Ninja.rkt file is loaded)}
                              @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        @points[
          @point{@student{Open @(hyperlink "http://www.wescheme.org/run.jsp?publicId=iK7rkNlvcS" "this link") in a new window. When you click "Run", be sure to read the directions at the top of the screen so you know how to play!}
                 @teacher{@management{Show the kids Ninjacat. Be sure to end on a frozen frame of the game, so the whole class can see the same image.}}
                 }
          
          @point{@student{This game is made up of @italic{characters}, each of which has it's own behavior. The Ruby moves from the right to the left, as does the Dog. NinjaCat only moves when you hit the arrow keys, and she can move left, right, up and down. We can figure out how the game works by first understanding about how each character works.}
                 @teacher{}
                 }
          
          @point{@student{ @bitmap{images/1.2.png} Turn to @worksheet-link[#:name "How-Does-Ninja-Cat-Work" #:page 1] in your workbook. Here we have a table, which we'll use to reverse-engineer NinjaCat and see how it works. Fill out thge first column with a complete list of all things in the game.}
                 @teacher{This can be a team activity. Solicit a few examples from students, to make sure they understand what's being listed here: nouns like "the cat", not verbs like "jumping". @management{During this activity, walk around and see how groups are doing. This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }}
                 }
          
          @point{@student{Did you list all four moving characters? What else is in the game? Did you write down the background? The score?}
                 @teacher{@management{Have students come up to the board, and fill in the table with what they've found. If time is short, call on students and have them tell you what to write.}}
                 }
          
          @point{@student{We also need to think about what is @italic{changing} when we play the game. What about the Ruby? Does it get bigger? Does it change color? Does it spin around? The only thing that changes about the Ruby is its position! Everything else about it is the same. What about the Dog? The Cat? Fill in the rest of the second column, listing everything that changes about each character.}
                 @teacher{}
                 }
                            
          @point{@student{Did you notice that the Dog, Ruby, Cloud and Cat only change position, and nothing else? What about the Background - it doesn't change at all, so we can @italic{leave that cell in table black!}. Did you notice the Score changes value? You'll want to add that to your table, too!}
                 @teacher{@management{Quickly fill in the second column on the board. Assign scores.}}
                 }
          ]}