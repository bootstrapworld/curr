import image as I
import world as W

data World:
    # The world is the x position of the dog, the x position of the ruby, and the y position of the cat.
  | world(dogX :: Number, rubyX :: Number, catY :: Number)
end

START = world(0, 600, 240)
NEXT = world(10, 595, 240)

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
  doc: "Place DANGER, TARGET, CLOUD, and PLAYER onto BACKGROUND at the right coordinates."
  I.put-image(PLAYER, 320, w.catY,
    I.put-image(TARGET, w.rubyX, 300,
      I.put-image(CLOUD, 500, 400,
        I.put-image(DANGER, w.dogX, 400, BACKGROUND))))
end

####################
# UPDATING FUNCTIONS
####################

fun update-world(w :: World) -> World:
  doc: "Increase dogX by ten, decrease rubyX by five."
  world(w.dogX + 10, w.rubyX - 5, w.catY)
end

#############
# KEY EVENTS:
#############

fun keypress(w :: World, s :: String) -> World:
  doc: "Make catY respond to key events."
  ask:
    | strings-equal(s, "up") then: world(w.dogX, w.rubyX, w.catY + 10)
    | strings-equal(s, "down") then: world(w.dogX, w.rubyX, w.catY - 10)
    | otherwise: world(w.dogX, w.rubyX, w.catY)
  end
end
  
#################
# TESTS FOR COND:
#################

fun is-off-left(x :: Number) -> Boolean:
  doc: "Checks whether an object has gone off the left side of the screen."
  false
end

fun is-off-right(x :: Number) -> Boolean:
  doc: "Checks whether an object has gone off the right side of the screen."
  false
end

###################################
# big-bang using the START world
# on a tick-event, use update-world
# on a draw-event, use draw-world 
# on a key-event, use keypress
###################################

W.big-bang(START, [list:
  W.on-tick(update-world),
  W.to-draw(draw-world),
    W.on-key(keypress)])
