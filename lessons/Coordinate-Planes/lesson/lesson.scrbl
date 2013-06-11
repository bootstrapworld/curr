#lang curr/lib

@declare-tags[management]

@lesson/studteach[
     #:title "Coordinate Planes"
     #:duration "15 minutes"
     #:overview "Students must use the Cartesian plane to describe the location of characters in a picture"
     #:learning-objectives @itemlist[@item{Learn and practice the coordinate system}]
     #:product-outcomes @itemlist[@item{Students identify the coordinates of characters in a picture}]
     #:standards @itemlist[@item{}]
     #:materials @itemlist[@item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Dog"] and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
                            @item{Student Workbooks, and something to write with}]
     #:preparation @itemlist[@item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
        ]{
  @points[
     @point{@student{@bitmap{images/1.1.png} How does a computer know where to draw something on a screen? Suppose you had this picture of a dog on your screen and you were talking to a friend on the phone about what it looks like. How would you tell her @italic{exactly} where the Dog is? Would you just say "it's kind of on the right-hand side of the screen", or would you be more specific? What if you could use a ruler?}
            @teacher{@management{Have students discuss this. If time allows, have a student leave the room and let other students come up with ways to write down where the dog is on the board. Then remove the dog, call in the other student, and have the class direct them using only what they've written down.}}
            }
      @point{@student{@bitmap{images/1.3.png} We can use a number line to figure out exactly how far something is from one side of the screen. For our videogame, we will place the numberline so that the screen runs from 0 (on the left) to 640 (on the right). We can take the image of the NinjaCat, stick it anywhere on the line, and now we can all agree that the cat is standing at 5, 6, or any other number on our line. Number lines can also have negative numbers, so we can put NinjaCat off the left edge of the screen at -100, or off the right edge at 800 or 900.}
              @teacher{Try positioning the characters at different places on the line, and have students tell you what their coordinates are. Try giving them verbal descriptions (e.g. "The center of the screen", "Off the righthand side of the screen", etc.) and have them translate those into coordinates.}
              }
      @point{@student{A computer screen, however, has two dimensions. How would your friend know how close to the top or bottom of the screen to draw the dog? We'll need a number line for both left-and-right measurements, and up-and-down measurements.}
              @teacher{@management{Draw a second number line}}
              }
      @point{@student{The first line is called the x-axis, which runs from left to right. The second line, which runs up and down, is called the y-axis. A 2-dimensional @italic{coordinate} consists of both the x- and y-locations on the axes.}
              @teacher{@management{stick NinjaCat at (4,6)}}
              }
      @point{@student{@bitmap{images/1.2.png} <UPDATE IMAGE WITH LABELED AXES> Here's a sample grid, with NinjaCat drawn at a certain position on that grid. What is NinjaCat's position on the x-axis? To find out, we just drop a line down from where NinjaCat is, and read the position on the number line. What is her position on the y-axis?}
              @teacher{A coordinate represents a single point, and an image is (by definition) many points. Some students will whether a character's coordinate refers to the center of the image, or one of the corners. In this particular program, the center serves as the coordinate - but other programs may use another location. The important point in discussion with students is that there is flexibility here, @italic{as long as the convention is used consistently}. @management{If time allows, invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations.}}
              }
      @point{@student{When we write down these coordinates, we always put the x before the y (just like in the alphabet!). Most of the time, you'll see coordinates written like this: (200, 50) meaning that the x-coordinate is 200 and the y-coordinate is 50.}
              @teacher{}
              }
      @point{@student{@activity{What is the coordinate for the lower left-hand corner of the screen? What about the lower right-hand corner? The center? What part of the screen will NinjaCat be, if she's placed at (640, 0)? Can you think of a coordinate that puts her off the screen?}}
              @teacher{}
              }
      @point{@student{Depending on how a character moves, their position might change only along the x-axis, only along the y-axis, or both. Look back to the table you wrote in the workbook (@worksheet-link[#:page 1 #:lesson "Ninja-Cat-Demo" #:name "How-Does-Ninja-Cat-Work"]). Can NinjaCat move up and down in the game? Can she move left and right? So what's changing: her x-coordinate, her y-coordinate, or both? What about the clouds? Do they move up and down? Left and right? Both?}
              @teacher{@management{}}
              }
      
      @point{@student{@activity{Fill in the rest of the table, identifying what is changing for each of your characters.}}
              @teacher{@management{}}
              }
      
      @point{@student{@activity{Turn to @worksheet-link[#:page 2 #:name "Ninja-Cat-Coordinates"] in your game planning workbook, and look at the project sheet that has a picture of the NinjaCat game. What are the coordinates at the bottom-left corner of the screen? Top-right? Center? For practice, label the coordinates at the midpoint of @italic{each side} of the screen, then label the coordinates of each of the characters.}}
              @teacher{@management{}}
              }
               ]
   }