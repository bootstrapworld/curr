import image as I

data Auto:
  | auto(model :: String, hp :: Number, rims :: Number, color :: String, value :: Number)
end

car1 = auto("M5", 480, 28, "black", 50000)
car2 = auto("Prius", 160, 18, "blue", 20000)
car3 = auto("taxi", 2, 20, "pink", 23)

#####################################
fun paint-job(car :: Auto, color :: String) -> Auto:
  doc: "Given an auto and a color, return an auto that has been painted."
  nothing
end

#####################################
fun turbocharge(car :: Auto) -> Auto:
  doc: "Given an auto, return an auto that has 20 more hp than before."
  nothing
end

#####################################
fun pimp(car :: Auto) -> Auto:
  doc: "Put on 30 inch rims, paint it red, double hp, and $10,000 value."
  nothing
end





########################################
# DON'T CHANGE ANYTHING BELOW THIS LINE!
########################################

fun model(car :: Auto) -> I.Image:
  doc: "Prints the model in the bottom left."
  I.text(string-append("   ", car.model), 15, "black")
end

fun value(car :: Auto) -> I.Image:
  doc: "Prints the price of the car in the bottom right."
  I.text(string-append("$", tostring(car.value)), 15, "black")
end

fun top(car :: Auto, scn :: I.Image) -> I.Image:
  doc: "Prints the cabin of the car, which is an outline if value>80000, to represent a convertible."
  roof-startx = 130
  roof-endx = 160
  roof-wdth = roof-endx - roof-startx
  roof-y = 25
  roof-hght = 60 - roof-y
  # Left slope of roof
  h1 = hermite(posn(65, 60), posn(roof-startx - 1, roof-y), posn(0, -100),
    posn(0, 0))
  # Right slope of roof
  h2 = hermite(posn(roof-endx + 1, roof-y), posn(195, 60), posn(0, 0),
    posn(0, 100))
  # Slope for front window
  wfront = hermite(posn(roof-endx - 25, roof-y + 6), posn(190, 55),
    posn(0, 0), posn(50, 100))
  # Slope for rear window
  wrear = hermite(posn(80, 55), posn(roof-startx - 8, roof-y + 6),
    posn(0, -50), posn(50, 0))
  
  fill-hermite-vert(wfront, "cyan", 60,
    fill-hermite-vert(wrear, "cyan", 60,
      fill-hermite-vert(h1, car.color, 60,
        fill-hermite-vert(h2, car.color, 60,
          I.place-image(I.rectangle(roof-wdth, roof-hght, "solid",
              car.color),
            roof-startx + (roof-wdth / 2),
            roof-y + (roof-hght / 2),
            scn)))))
end

fun body(car :: Auto, scn :: I.Image) -> I.Image:
  doc: "Draw the car body into the scene."
  base-x0 = 50 # Left side of base (unsloped part)
  base-x1 = 170 # Right side of base
  base-y = 60
  wdth = base-x1 - base-x0
  # Left slope
  h1 = hermite(posn(40, 60), posn(base-x0 - 1, base-y), posn(0, -100),
    posn(0, 0))
  h2 = hermite(posn(base-x1 + 1, base-y), posn(260, 90), posn(0, 0),
    posn(0, 100))
  I.place-image(I.rectangle(wdth, 60, "solid", car.color),
    base-x0 + (wdth / 2),
    90,
    fill-hermite-vert(h1, car.color, 120,
      fill-hermite-vert(h2, car.color, 120, scn)))  
end

fun draw-car(car :: Auto) -> I.Image:
  doc: "Prints the wheels (which are either going to be black and silver circles, or an image, depending on rim size), as well as the car, flames (if hp>400), and an empty scene."
  I.place-image(I.circle(car.rims, "solid", "silver"), 210, 110,
    I.place-image(I.circle(car.rims, "solid", "silver"), 90, 110,
      I.place-image(I.circle(30, "solid", "black"), 210, 110,
        I.place-image(I.circle(30, "solid", "black"), 90, 110,
          top(car, body(car, I.empty-scene(300, 200)))))))
end

fun draw-auto(car :: Auto) -> I.Image:
  doc: "Draws the scene with the given images and scenes."
  I.place-image(model(car), 10, 170,
    I.place-image(value(car), 200, 170,
      draw-car(car)))
end

# Represents a cubic Hermite curve, defined by two endpoints and two end tangents.
data Hermite:
  | hermite(p0 :: Posn, p1 :: Posn, t0 :: Posn, t1 :: Posn)
end

data Posn:
  | posn(x, y)
end

fun draw-hermite(h :: Hermite, c :: String, scn :: I.Image) -> I.Image:
  doc: "Draws the scene with the given hermite, drawn in the given color."
  draw-hermite-helper(h, c, 0, 1, 0.05, scn)
end

fun draw-hermite-helper(h :: Hermite, c :: String, tcur :: Number,
    tmax :: Number, stepsize :: Number, scn :: I.Image) -> I.Image:
  doc: "Draws a hermite function over interval T, with 0 <= T <= 1. T increases by given step-size."
  pos = get-pos-at(h, tcur)
  if (tcur > tmax):
    scn
  else: # Draw point recursively on the rest of the curve.
    I.place-image(I.rectangle(2, 2, "solid", c), pos.x, pos.y,
      draw-hermite-helper(h, c, tcur + stepsize, tmax, stepsize, scn))
  end
end

fun fill-hermite-vert(h :: Hermite, c :: String, y :: Number,
    scn :: I.Image) -> I.Image:
  doc: "Fills vertically with a solid color, between a hermite and a given y-coordinate."
  # Step size should be equivalent to the number of pixels in x.
  dist = num-abs(h.p0.x - h.p1.x)
  fill-hermite-vert-helper(h, c, y, 0, 1, 1 / dist, scn) # Use helper to draw each point.
end

fun fill-hermite-vert-helper(h :: Hermite, c :: String, y :: Number,
    tcur :: Number, tmax :: Number, stepsize :: Number,
    scn :: I.Image) -> I.Image:
  doc: "Draws a hermite function over interval T, with 0 <= T <= 1. T increases by given step-size."
  pos = get-pos-at(h, tcur)
  height = num-max(y - pos.y, 0)
  if tcur > tmax:
    scn
  else: # Draw point recursively on the rest of the curve.
    I.place-image(I.rectangle(2, height, "solid", c), pos.x,
      pos.y + (height / 2),
      fill-hermite-vert-helper(h, c, y, tcur + stepsize, tmax,
        stepsize, scn))
  end
end

fun get-pos-at(h :: Hermite, t :: Number) -> Posn:
  doc: "Returns the coordinates of a hermite cubic at a given t, over the interval 0 <= t <= 1."
  # Defined based on Hermite curve formula.
  a0 = h.p0
  a1 = h.t0
  a2 = pos-add(scalar-product(h.p0, -3),
    pos-sub(scalar-product(h.p1, 3),
      pos-add(scalar-product(h.t0, 2),
        h.t1)))
  a3 = pos-add(
    pos-add(pos-sub(scalar-product(h.p0, 2), scalar-product(h.p1, 2)),
      h.t0),
    h.t1)
  
  pos-add(a0, pos-add(scalar-product(a1, t), pos-add(
        scalar-product(a2, t * t),
        scalar-product(a3, t * t * t))))
end

# POSN HELPER FUNCTIONS

fun scalar-product(pos :: Posn, n :: Number) -> Posn:
  doc: "Returns the scalar product of a posn."
  posn(pos.x * n, pos.y * n)
end

fun pos-add(p1 :: Posn, p2 :: Posn) -> Posn:
  doc: "Returns the addition of two posns."
  posn(p1.x + p2.x, p1.y + p2.y)
end

fun pos-sub(p1 :: Posn, p2 :: Posn) -> Posn:
  doc: "Returns the difference of two posns."
  posn(p1.x - p2.x, p1.y - p2.y)
end