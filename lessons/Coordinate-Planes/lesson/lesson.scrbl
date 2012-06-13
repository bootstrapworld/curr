#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Coordinate Planes"
        #:duration "15 minutes"
        ]{
 
@itemlist/splicing[
  @item{What is a position? Suppose you were telling your friend about this picture on the phone. How would you tell her exactly where the Dog is? @tag[pedagogy]{(Have students discuss.)}}
  @item{Just like your friend on the phone, computers need to know exactly where something is in order to draw it on the screen. To do this, they use a coordinate system.}
  @tag[pedagogy]{@item{(Draw a number line, with 10 tick marks).}}
  @item{You've all seen number lines before, right? There are a bunch of evenly spaced markings on the line, and each one represents a number. A number line is actually a really simple coordinate system, which lets you find points in one dimension! For example, we can take our little cutout of NinjaCat, stick him anywhere on the line, and now we can all agree that he's sitting at 5, 6, or any other number on our line. Number lines can also have negative numbers, so we can put NinjaCat at -2, -8, or even 0.}
  @item{Our game has two dimensions, and we'll need a number line for both. Let's call our first line, which runs from left to right the x-axis, and the new line, which runs up and down the y-axis. Now we have a grid, and we can stick NinjaCat anywhere on the grid. Let's do a quick example: 
            @exercise{@itemlist[@tag[pedagogy]{@item{Draw a second number line and add NinjaCat at (4,6)}}
                      @item{What is NinjaCat's position on the x-axis? To find out, we just drop a line down from where NinjaCat is, and read the position on the number line. He's at 4.}
                      @item{What is his position on the y-axis?}=
                      @tag[pedagogy]{@item{If time allows, invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations.}}]}}
  @item{When we write down these coordinates, we always put the x before the y (just like in the alphabet!). Most of the time, you'll see coordinates written like this: (200, 50) meaning that the x-coordinate is 200 and the y-coordinate is 50.}
  @item{On the computer, the screen is all the parts of the grid from 0 to 640 on the x-axis, and 0 to 480 on the y-axis. @tag[pedagogy]{Superimpose the screen over your coordinate plane.}}
  @item{@think-about[#:question "What is the coordinate for the lower left-hand corner of the screen? What about the lower right-hand corner? The center?"
                     #:answer "Lower left: (0,0), lower right:(640,0), center:(320,240)" ]}
  @item{@think-about[#:question "Can you think of a coordinate that puts NinjaCat on the left-hand side of the screen? The top?"
                     #:answer "Many possible answers: for example, (0,100) puts NinjaCat on the left, and (120,480) puts NinjaCat on the top."]}
  @item{@think-about[#:question "Can you think of a coordinate that puts him off the screen?"
                     #:answer "Many possible answers: for example, (1000,1000). If the x coordinate is above 640 or below 0, or if the y coordinate is above 480 or below 0, NinjaCat will be off the screen." ]}]}

