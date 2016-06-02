import image as I
import world as W

#####################
# NUMBER MANIPULATION
#####################

fun deg2rad(d :: Number) -> Number:
  doc: "Changes degrees into radians."
  (3.1415926 * d) / 180
end

fun rad2deg(d :: Number) -> Number:
  doc: "Changes radians into degrees."
  (180 * d) / 3.1415926
end

######
# DATA
######

data World:
  | world(p1y :: Number, p2y :: Number, p1score :: Number,
      p2score :: Number, ballX :: Number, ballY :: Number,
      ballAngle :: Number, timer :: Number)
end

# STARTING WORLD
START = world(240, 240, 0, 0, 320, 240, deg2rad(num-random(360)), 0)

# GRAPHICS
BACKGROUND = I.put-image(I.rectangle(1, 480, "solid", "white"), 320, 240,
  I.rectangle(640, 480, "solid", "black"))
PADDLE = I.rectangle(5, 25, "solid", "white")
BALL = I.rectangle(8, 8, "solid", "white")

# How fast does the ball move? How hard is the game?
SPEED = 6

# GRAPHICS FUNCTIONS

fun draw-world(w :: World) -> I.Image:
  doc: "Place PADDLE and BALL onto BACKGROUND at the right coordinates."
  I.put-image(BALL, w.ballX, w.ballY,
    I.put-image(PADDLE, 100, w.p1y, # Player One
      I.put-image(PADDLE, 540, w.p2y, # Player Two
        I.put-image(I.text(num-tostring(w.p1score), 30, "white"), 280, 420,
          I.put-image(I.text(num-tostring(w.p2score), 30, "white"), 360,
            420, BACKGROUND)))))
end

####################
# UPDATING FUNCTIONS
####################

fun update-world(w :: World) -> World:
  doc: "What does your update-world function do?"
  ask:
    | is-off-left(w.ballX) then: score2(w)
    | is-off-right(w.ballX) then: score1(w)
    | is-hit-top(w) then: Tcollide(w)
    | is-hit-bottom(w) then: Bcollide(w)
    | is-Lpaddle-collide(w) then: Lcollide(w)
    | is-Rpaddle-collide(w) then: Rcollide(w)
    | otherwise: world(w.p1y, w.p2y, w.p1score, w.p2score,
        update-ballx(w), update-bally(w), w.ballAngle, w.timer + 1)
  end
end

fun update-ballx(w :: World) -> Number:
  doc: "What is the next x position of the ball?"
  w.ballX + (SPEED * num-cos(w.ballAngle))
end

fun update-bally(w :: World) -> Number:
  doc: "What is the next y position of the ball?"
  w.ballX + (SPEED * num-sin(w.ballAngle))
end

fun new-angle() -> Number:
  doc: "Generates a new angle, from 0 to 360, and converts it to radians."
  deg2rad(num-random(360))
end

############
# KEY EVENTS
############

fun keypress(w :: World, s :: String) -> World:
  doc: "What does your keypress function do?"
  ask:
    | strings-equal(s, "up") then: world(w.p1y, w.p2y + 10, w.p1score,
        w.p2score, w.ballX, w.ballY, w.ballAngle, w.timer)
    | strings-equal(s, "down") then: world(w.p1y, w.p2y - 10, w.p1score,
        w.p2score, w.ballX, w.ballY, w.ballAngle, w.timer)
    | strings-equal(s, "w") then: world(w.p1y + 10, w.p2y, w.p1score,
        w.p2score, w.ballX, w.ballY, w.ballAngle, w.timer)
    | strings-equal(s, "s") then: world(w.p1y - 10, w.p2y, w.p1score,
        w.p2score, w.ballX, w.ballY, w.ballAngle, w.timer)
    | otherwise: w
  end
end

###############
# TESTS FOR ASK
###############

fun is-off-left(x :: Number) -> Boolean:
  doc: "Checks whether an object has gone off the left side of the screen."
  x < 10
end

fun is-off-right(x :: Number) -> Boolean:
  doc: "Checks whether an object has gone off the right side of the screen."
  x > 630
end

fun is-hit-top(w :: World) -> Boolean:
  doc: "Has the ball hit the top? Is it residual from the last check?"
  (w.ballY > 476) and (w.timer > 2)
end

fun is-hit-bottom(w :: World) -> Boolean:
  doc: "Has the ball hit the bottom? Is it residual from the last check?"
  (w.ballY < 4) and (w.timer > 2)
end

fun line-length(a :: Number, b :: Number) -> Number:
  doc: "Finds 1D distance."
  if a < b:
    b - a
  else:
    a - b
  end
end

fun is-Lpaddle-collide(w :: World) -> Boolean:
  doc: "Has the ball hit the left paddle? Is it residual from the last check?"
  (line-length(w.ballX, 100) < 5) and
  (line-length(w.ballY, w.p1y) < 20) and
  (w.timer > 3)
end

fun is-Rpaddle-collide(w :: World) -> Boolean:
  doc: "Has the ball hit the right paddle? Is it residual from the last check?"
  (line-length(w.ballX,  540) < 5) and
  (line-length(w.ballY, w.p2y) < 20) and
  (w.timer > 3)
end

#################
# RESULTS FOR ASK
#################

fun Rcollide(w :: World) -> World:
  doc: "What happens when the ball collides with the paddle on the right side of the screen?"
  world(w.p1y, w.p2y, w.p1score, w.p2score, w.ballX, w.ballY,
    deg2rad(180) - w.ballAngle, 0)
end

fun Lcollide(w :: World) -> World:
  doc: "What happens when the ball collides with the paddle on the left side of the screen?"
  world(w.p1y, w.p2y, w.p1score, w.p2score, w.ballX, w.ballY,
    w.ballAngle - deg2rad(180), 0)
end

fun Tcollide(w :: World) -> World:
  doc: "What happens when the ball collides with the top of the screen?"
  world(w.p1y, w.p2y, w.p1score, w.p2score, w.ballX, w.ballY,
    deg2rad(0) - w.ballAngle, 0)
end

fun Bcollide(w :: World) -> World:
  doc: "What happens when the ball collides with the bottom of the screen?"
  world(w.p1y, w.p2y, w.p1score, w.p2score, w.ballX, w.ballY,
    deg2rad(360) - w.ballAngle, 0)
end
    
fun score1(w :: World) -> World:
  doc: "Gives player one a point."
  world(w.p1y, w.p2y, w.p1score + 1, w.p2score, 320, 240, new-angle(),
    w.timer)
end

fun score2(w :: World) -> World:
  doc: "Gives player two a point."
  world(w.p1y, w.p2y, w.p1score, w.p2score + 1, 320, 240, new-angle(),
    w.timer)
end

################################
# big-bang using the START world
# on a tick-event, use update-world
# on a draw-event, use draw-world
# on a key-event, use keypress
################################

W.big-bang(START, [list:
    W.on-tick(update-world),
    W.to-draw(draw-world),
    W.on-key(keypress)])
  