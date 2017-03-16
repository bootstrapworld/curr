import image as I
import world as W

data World:
    # The world is the x position of the dog.
  | world(dogX :: Number)
end

START = world(0)

BACKGROUND = I.image-url(
  "http://www.bootstrapworld.org/clipart/Curriculum/bg.jpg")
DANGER = I.image-url(
  "http://www.bootstrapworld.org/clipart/Curriculum/dog.png")
TARGET = I.scale(0.3, I.image-url(
  "http://www.bootstrapworld.org/clipart/Curriculum/ruby.png"))
PLAYER = I.image-url(
  "http://www.bootstrapworld.org/clipart/Curriculum/ninja.png")
CLOUD = I.image-url(
  "http://www.bootstrapworld.org/clipart/Curriculum/clouds.png")

####################
# GRAPHICS FUNCTIONS
####################

fun draw-world(w :: World) -> I.Image:
  doc: "Place DANGER onto BACKGROUND at the right coordinates."
  I.put-image(DANGER, 0, 400, BACKGROUND)
end

####################
# UPDATING FUNCTIONS
####################

fun update-world(w :: World) -> World:
  doc: "Increase dogX by ten."
  world(w.dogX + 10)
end

###################################
# big-bang using the START world
# on a tick-event, use update-world
# on a draw-event, use draw-world 
# on a key-event, use keypress
###################################

W.big-bang(START, [list:
  W.on-tick(update-world),
    W.to-draw(draw-world)])
