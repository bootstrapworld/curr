;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Autos) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")

; an auto is a (make-auto String Number Number String Number)
(define-struct auto (model hp rims color value))

; define your cars here: model, horsepower, rims, color and price
(define car1 (make-auto "M5" 480 28 "black" 50000))
(define car2 (make-auto "Prius" 160 18 "blue" 20000))
(define car3 (make-auto "taxi" 2 20 "pink" 23))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; paint-job : Auto String -> Auto
; given an auto and a color, return an auto that has been painted






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; turbocharge : Auto -> Auto
; given an auto, return an auto that has 20 more hp than before








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; pimp : Auto -> Auto
; put on 30" rims, paint it red, double hp, and $10,000 value


















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DON'T CHANGE ANYTHING BELOW THIS LINE! ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTS - Images and Scenes

;; model : Auto -> Image
;;prints the model in the bottom left
(define (model car)
  (text (string-append "   " (auto-model car)) 15 'black))

;;value : Auto -> Image
;;prints the price of the car in the botttom right
(define (value car) 
  (text (string-append "$" (number->string (auto-value car))) 15 'black))

;;top : Auto -> Image
;;prints the "cabin" of the car, which is an outline if value>80000
;;to represent a convertible
(define (top car scn) 
  (let* ((roof-startx 130)
         (roof-endx 160)
         (roof-wdth (- roof-endx roof-startx))
         (roof-y 25)
         (roof-hght (- 60 roof-y))
;;Left slope of roof
         (h1 (make-hermite (make-posn 65 60)
                           (make-posn (- roof-startx 1) roof-y)
                           (make-posn 0 -100)
                           (make-posn 0 0)))
;;Right slope of roof
         (h2 (make-hermite (make-posn (+ roof-endx 1) roof-y)
                           (make-posn 195 60)
                           (make-posn 0 0)
                           (make-posn 0 100)))
;;Slope for front window
         (wfront (make-hermite (make-posn (- roof-endx 25) (+ roof-y 6))
                           (make-posn 190 55)
                           (make-posn 0 0)
                           (make-posn 50 100)))
  
  ;;Slope for rear window
         (wrear (make-hermite (make-posn 80 55)
                           (make-posn (- roof-startx 8) ( + roof-y 6))
                           (make-posn 0 -50)
                           (make-posn 50 0))))
   
    ;;Draw windows
    (fill-hermite-vert wfront "cyan" 60
                       (fill-hermite-vert wrear "cyan" 60
                       (fill-hermite-vert
                        h1 (auto-color car) 60 
                        (fill-hermite-vert 
                         h2 (auto-color car) 60 
                         ;;Fill in the space between the windows
                         (place-image 
                          (rectangle ( - roof-endx roof-startx) (- 60 roof-y) "solid" (auto-color car))
                          (+ roof-startx (/ roof-wdth 2))
                          (+ roof-y (/ roof-hght 2))
                          scn)))))))

;;Draw the car body into the scene
;;body: Auto Scene -> Scene
(define (body car scn)
  (let*((base-x0 50) ;;Left side of base (unsloped part)
        (base-x1 170) ;;Right side of base
        (base-y 60)
        (wdth (- base-x1 base-x0))
        ;;Left slope
        (h1 (make-hermite (make-posn 40 60)
                                   (make-posn (- base-x0 1) base-y)
                                   (make-posn 0 -100)
                                   (make-posn 0 0)))
          ;;Right slope
        (h2 (make-hermite (make-posn (+ base-x1 1) base-y)
                                   (make-posn 260 90)
                                   (make-posn 0 0)
                                   (make-posn 0 100))))
  
  (place-image (rectangle wdth 60 "solid" (auto-color car))
               (+ base-x0 (/ wdth 2))
               90 (fill-hermite-vert 
                       h1 
                       (auto-color car)
                       120
                      (fill-hermite-vert 
                       h2 
                       (auto-color car)
                       120
                       scn)))))
                                         

  ;;(rectangle 130 50 (if (> (auto-value car) 80000) "outline" "solid") (auto-color car)))

;;wheels?+car+MTscene: Auto -> Scene
;;prints the wheels (which are either going to be black and silver circles, or an image, depending on rim size)
;;as well as the car
;;as well as flames (if hp>400)
;;and an empty scene
(define (wheels?+car+MTscene car)
  (place-image (circle (auto-rims car) "solid" "silver")
               210 110
               (place-image (circle (auto-rims car) "solid" "silver")
                            90 110
                            (place-image (circle 30 "solid" "black")
                                         210 110
                                         (place-image (circle 30 "solid" "black")
                                                      90 110
                                                                   (top car (body car (empty-scene 300 200))))))))

; draw-car: Auto -> Scene
; draws the scene with the given images and scenes
(define (draw-auto a)
 
#|
  (place-image (model a)
               10 170
               (place-image (value a)
                            200 170
                            (place-image (top a)
                                         130 50
                                         (wheels?+car+MTscene a)))))
|#
(place-image (model a)
               10 170
               (place-image (value a)
                            200 170
                       ;;     (place-image (top a)
                        ;;                 130 50
                                         (wheels?+car+MTscene a))))



;;A hermite is a (make-hermite Posn Posn Posn Posn)
;;Represents a cubic Hermite curve, defined by two endpoints and two end tangents
(define-struct hermite (p0 p1 t0 t1))

;;Draws the scene with the given hermite, drawn in the given color
;;draw-hermite : Hermite Color Scene -> Scene
(define (draw-hermite h c scn)
    (draw-hermite-helper h c 0 1 0.05 scn)) ;;Use helper to draw each point in a loop

;;Draws a hermite function over interval T, with 0 <=  T <= 1.
;;t increases by the given step-size
;;draw-hermite-helper : Hermite Color Number Number Number Scene -> Scene
(define (draw-hermite-helper h c tcur tmax stepsize scn)
  (let* ((pos (get-pos-at h tcur)))
  (if (> tcur tmax)
      scn
      ;;Else, draw the point recursively on rest of the curve.
      (place-image (rectangle 2 2 "solid" c)
                    (posn-x pos)
                    (posn-y pos)
                    (draw-hermite-helper h c (+ tcur stepsize) tmax stepsize scn)))))

;;Fills vertically with a solid color, between a hermite and a given y-coordinate
;;(fill-hermite-vert : Hermite color number scene -> Scene
(define (fill-hermite-vert h c y scn)
  ;;The step size should be equivilant to the number of pixels in x.
  (let* ((dist (abs (- (posn-x (hermite-p0 h)) (posn-x (hermite-p1 h))))))
      (fill-hermite-vert-helper h c y 0 1 (/ 1 dist) scn))) ;;Use helper to draw each point in a loop

;;Draws a hermite function over interval T, with 0 <=  T <= 1.
;;t increases by the given step-size
;;draw-hermite-helper : Hermite Color Number Number Number Number Scene -> Scene
(define (fill-hermite-vert-helper h c y tcur tmax stepsize scn)
  (let* ((pos (get-pos-at h tcur))
         (height (max (- y (posn-y pos)) 0)))
  (if (> tcur tmax)
      scn
      ;;Else, draw the point recursively on rest of the curve.
      (place-image (rectangle 2 height "solid" c)
                    (posn-x pos)
                    (+ (posn-y pos) (/ height 2))
                    (fill-hermite-vert-helper h c y (+ tcur stepsize) tmax stepsize scn)))))
  

  
;;Returns the coordinates of a hermite cubic at a given t, over the interval 0 <= t <= 1
;;When t = 0, y = p0.y
;;When t = 1, y = p1.y


;;get-pos-at : Hermite number -> Posn
(define (get-pos-at h t)
  ;;Define these values based on the hermite curve formula
  (let* ((a0 (hermite-p0 h))
          (a1 (hermite-t0 h))
          (a2 
            (pos-add (scalar-product (hermite-p0 h) -3)
                     (pos-sub
                      (scalar-product (hermite-p1 h) 3)
                      (pos-add
                       (scalar-product (hermite-t0 h) 2)
                       (hermite-t1 h)))))
          
          (a3 (pos-add
                      (pos-add
                       (pos-sub (scalar-product (hermite-p0 h) 2)
                                (scalar-product (hermite-p1 h) 2))
                       (hermite-t0 h))
                      (hermite-t1 h))))
    (pos-add 
     a0
     (pos-add
      (scalar-product a1 t)
      (pos-add
       (scalar-product a2 (* t t))
       (scalar-product a3 (* t (* t t))))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Posn helper functions

;;Returns the scalar product of a posn
;;scalar-product : Posn number -> Posn
(define (scalar-product pos n)
  (make-posn (* (posn-x pos) n)
             (* (posn-y pos) n)))

;;Returns the addition of two posns
;;pos-add : Posn Posn -> Posn
(define (pos-add p1 p2)
  (make-posn (+ (posn-x p1) (posn-x p2))
             (+ (posn-y p1) (posn-y p2))))

;;Returns the difference of two posns
;;pos-subt : Posn Posn -> Posn
(define (pos-sub p1 p2)
  (make-posn (- (posn-x p1) (posn-x p2))
             (- (posn-y p1) (posn-y p2))))
          
          

;;TEST HERMITES

  
  (define h2 (make-hermite (make-posn 131 25)
                           (make-posn 195 55)
                           (make-posn 0 0)
                           (make-posn 0 100)))
  
  ;;(fill-hermite-vert h1 "red" 60 
   ;;                  (fill-hermite-vert h2 "red" 60 (draw-auto car1)))