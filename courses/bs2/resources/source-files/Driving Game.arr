import image as I
import world as W

data Item:
    # lane: Number from one to three.
    # img: Image of vehicle.
    # scale: Scale factor.
    # dist: Distance down road.
    # speed: Speed of vehicle.
    # x: x-coordinate
    # y: y-coordinate
  | item(lane :: Number, img :: I.Image, scale :: Number,
      dist :: Number, speed :: Number, x :: Number, y :: Number)
end

ROAD = I.image-url(
  "http://www.bootstrapworld.org/clipart/Curriculum/ROAD.jpg")
CAR-LEFT = I.scale(0.55, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/MYCARLEFT.png"))
CAR-RIGHT = I.flip-horizontal(CAR-LEFT)
CAR-REAR = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/MYCAR.png"))
CAR1 = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/CAR1.png"))
CAR2 = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/CAR2.png"))
CAR3 = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/CAR3.png"))
CAR4 = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/CAR4.png"))
CAR5 = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/CAR5.png"))
CAR6 = I.scale(0.8, I.image-url(
    "http://www.bootstrapworld.org/clipart/Curriculum/CAR6.png"))
DANGERS = [list: CAR1, CAR2, CAR3, CAR4, CAR5, CAR6]

thing1 = item(1 + num-random(3),
  DANGERS.get(num-random(DANGERS.length())), 10, 250 + num-random(250),
  5 + num-random(8), 60, 60)
thing2 = item(1 + num-random(3),
  DANGERS.get(num-random(DANGERS.length())), 10, 250 + num-random(250),
  5 + num-random(8), 60, 60)

data World:
  | world(img :: I.Image, lane :: Number, timePassed :: Number,
      timer :: Number, item1 :: Item, item2 :: Item)
end

# Starting World:
START = world(CAR-REAR, 2, 0, 0, thing1, thing2)

####################
# GRAPHICS FUNCTIONS
####################

fun draw-world(w :: World) -> I.Image:
  doc: "Place DANGER, TARGET, and PLAYER onto BACKGROUND at the right coordinates."
  ask:
    | is-gameover(w) then:
      I.put-image(I.text(string-append("OH NO! YOU LOST! You drove for ",
            string-append(num-tostring(w.timePassed), " seconds.")), 30,
          "green"),
        500, 400, I.rectangle(1000, 800, "solid", "black"))
    | w.lane == 1 then:
      I.put-image(img-time(w.timer, w), 200, 40,
        I.put-image(image-scale(w.item1), w.item1.x, w.item1.y,
          I.put-image(image-scale(w.item2), w.item2.x, w.item2.y,
            ROAD)))
    | w.lane == 2 then:
      I.put-image(img-time(w.timer, w), 500, 40,
        I.put-image(image-scale(w.item1), w.item1.x, w.item1.y,
          I.put-image(image-scale(w.item2), w.item2.x, w.item2.y,
            ROAD)))
    | w.lane == 3 then:
      I.put-image(img-time(w.timer, w), 800, 40,
        I.put-image(image-scale(w.item1), w.item1.x, w.item1.y,
          I.put-image(image-scale(w.item2), w.item2.x, w.item2.y,
            ROAD)))
  end
end

####################
# UPDATING FUNCTIONS
####################

# What does your update-world do?
fun update-world(w :: World) -> World:
  doc: ""
  ask:
    | is-gameover(w) then: w
    | is-off-bottom(w.item1.y) then:
      world(w.img, w.lane, w.timePassed + 1, w.timer + 1,
        reset-item(w, w.item1), w.item2)
    | is-off-bottom(w.item2.y) then:
      world(w.img, w.lane, w.timePassed + 1, w.timer + 1,
        w.item1, reset-item(w, w.item2))
    | otherwise:
      world(w.img, w.lane, w.timePassed + 1, w.timer + 1,
        move-item(w.item1), move-item(w.item2))
  end
end

# How large should the image be, based on its y-coordinate?
fun image-scale(o :: Item) -> I.Image:
  doc: ""
  I.scale(((o.y / (-5.25)) + 102) / 100, o.img)
end

fun move-item(o :: Item) -> Item:
  doc: "Apply the functions which update distance, x and y coordinates."
  item(o.lane, o.img, o.scale, update-dist(o), o.speed,
    update-x(o), update-y(o))
end

fun update-dist(o :: Item) -> Number:
  doc: "Change the distance, at a rate dependent on the speed of the item."
  o.dist - o.speed
end

fun update-y(o :: Item) -> Number:
  doc: "Uses arctan to approximate a constant speed approach."
  (1000 - (450 * (1 / num-atan(o.dist * (3.1415 / 1100.0)))))
end

fun update-x(o :: Item) -> Number:
  doc: "Update the item's x coordinate, depending on which lane it is in."
  ask:
    | o.lane == 3 then: 925 + ((-4 * o.y) / 5)
    | o.lane == 2 then: 500
    | o.lane == 1 then: 75 + ((4 * o.y) / 5)
  end
end
  
fun reset-item(w :: World, o :: Item) -> Item:
  doc: "Resets the item at the vanishing point (new image, new lane, speed based on time that has passed)"
  item(1 + num-random(3), DANGERS.get(num-random(DANGERS.length())),
    o.scale, 500, 10 + (w.timePassed / 100), update-x(o), update-y(o))
end

############
# KEY EVENTS
############

fun keypress(w :: World, s :: String) -> World:
  doc: "Left and right control the movement of your car between lanes."
  if is-gameover(w):
    world(CAR-LEFT, w.lane, w.timePassed, 0, w.item1, w.item2)
  else:
    ask:
      | strings-equal(s, "left") and (w.lane > 1) then:
        world(CAR-LEFT, w.lane - 1, w.timePassed, 0, w.item1, w.item2)
      | strings-equal(s, "right") and (w.lane < 3) then:
        world(CAR-RIGHT, w.lane + 1, w.timePassed, 0, w.item1, w.item2)
      | otherwise: w
    end
  end
end

################
# TESTS FOR COND
################

fun img-time(timer :: Number, w :: World) -> I.Image:
  doc: "Is the world's timer field greater than 5? If so, you should see the back of the car. If not? Check the world for the appropriately turned image."
  if timer > 5:
    CAR-REAR
  else:
    w.img
  end
end

fun is-off-bottom(y :: Number) -> Boolean:
  doc: "Checks whether an item has gone off the right side of the screen."
  y < 5
end

fun is-lane-collide(w :: World, o :: Item) -> Boolean:
  doc: "Checks whether o.dist is zero and o.lane = car lane."
  (o.dist <= 200) and (o.lane == w.lane)
end

#################
# RESULTS FOR ASK
#################

fun is-gameover(w :: World) -> Boolean:
  doc: "Should the program end?"
  is-lane-collide(w, w.item1) or is-lane-collide(w, w.item2)
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


