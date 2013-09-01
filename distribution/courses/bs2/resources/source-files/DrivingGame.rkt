;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname DrivingGame) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")

;; GRAPHICS

(define ROAD (bitmap "Teachpacks/teachpack-images/ROAD.jpg"))
(define CAR-LEFT (scale .55 (bitmap "Teachpacks/teachpack-images/MYCARLEFT.png")))
(define CAR-REAR (scale .8 (bitmap "Teachpacks/teachpack-images/MYCAR.png")))
(define CAR-RIGHT (flip-horizontal CAR-LEFT))
(define CAR1 (scale .8 (bitmap "Teachpacks/teachpack-images/CAR1.png")))
(define CAR2 (scale .8 (bitmap "Teachpacks/teachpack-images/CAR2.png")))
(define CAR3 (scale .8 (bitmap "Teachpacks/teachpack-images/CAR3.png")))
(define CAR4 (scale .8 (bitmap "Teachpacks/teachpack-images/CAR4.png")))
(define CAR5 (scale .8 (bitmap "Teachpacks/teachpack-images/CAR5.png")))
(define CAR6 (scale .8 (bitmap "Teachpacks/teachpack-images/CAR6.png")))

(define DANGERS (list CAR1 CAR2 CAR3 CAR4 CAR5 CAR6))

;; DATA:
;; An object is a: number       image             number        number              number                               number    number                  
;;                 from 1 to 3, image of vehicle, scale factor, distance DOWN ROAD, speed at which the object is driving, x-coord, y-coord

(define-struct object (lane img scale dist speed x y))

(define thing1 (make-object (+ (random 3) 1) (list-ref DANGERS (random (length DANGERS))) 10 (+ 250 (random 250)) (+ 5 (random 8)) 60 60))
(define thing2 (make-object (+ (random 3) 1) (list-ref DANGERS (random (length DANGERS))) 10 (+ 250 (random 250)) (+ 5 (random 8)) 60 60))

;; The World is a: image number number number object-struct object-struct

(define-struct world (img lane timePassed timer obj1 obj2))

;; STARTING WORLD

(define START (make-world CAR-REAR 2 0 0 thing1 thing2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS FUNCTIONS:

;; draw-world: world -> Image
;; place DANGER, TARGET, and PLAYER onto BACKGROUND at the right coordinates

(define (draw-world w)
  (cond
    [(gameover? w)         (put-image (text (string-append "OH NO! YOU LOST! You drove for " (number->string (world-timePassed w)) " seconds.") 30 "green")
                                          500 400
                                          (rectangle 1000 800 "solid" "black"))]
    
    [(= (world-lane w) 1)      (put-image (img-time (world-timer w) w)
                                          200 40
                                          (put-image (image-scale (world-obj1 w))
                                                     (object-x (world-obj1 w)) (object-y (world-obj1 w))
                                                     (put-image (image-scale (world-obj2 w))
                                                                (object-x (world-obj2 w)) (object-y (world-obj2 w))
                                                     ROAD)))]
    
    [(= (world-lane w) 2)      (put-image (img-time (world-timer w) w)
                                          500 40
                                          (put-image (image-scale (world-obj1 w))
                                                     (object-x (world-obj1 w)) (object-y (world-obj1 w))
                                                     (put-image (image-scale (world-obj2 w))
                                                                (object-x (world-obj2 w)) (object-y (world-obj2 w))
                                                                ROAD)))]
    
    [(= (world-lane w) 3)      (put-image (img-time (world-timer w) w)
                                          800 40
                                          (put-image (image-scale (world-obj1 w))
                                                     (object-x (world-obj1 w)) (object-y (world-obj1 w))
                                                     (put-image (image-scale (world-obj2 w))
                                                                (object-x (world-obj2 w)) (object-y (world-obj2 w))        
                                                                ROAD)))]))
             

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATING FUNCTIONS:

;; update-world: world -> world
;; What does your update-world function do?

(define (update-world w)
 (cond
   [(gameover? w)     w]
   
   [(off-bottom? (object-y (world-obj1 w)))   (make-world (world-img w)
                                                       (world-lane w)
                                                       (+ (world-timePassed w) 1)
                                                       (+ (world-timer w) 1)
                                                       (reset-object w (world-obj1 w))
                                                       (world-obj2 w))]
   
   [(off-bottom? (object-y (world-obj2 w)))   (make-world (world-img w)
                                                       (world-lane w)
                                                       (+ (world-timePassed w) 1)
                                                       (+ (world-timer w) 1)
                                                       (world-obj1 w)
                                                       (reset-object w (world-obj2 w)))]
   
   [else             (make-world (world-img w)
                                 (world-lane w)
                                 (+ (world-timePassed w) 1)
                                 (+ (world-timer w) 1)
                                 (move-object (world-obj1 w))
                                 (move-object (world-obj2 w)))]))
    


;; image-scale: object -> image
;; How large should the image be, based on its y-coordinate?

(define (image-scale o)
  (scale (/ (+ 102 (/ (object-y o) -5.25)) 100) (object-img o)))

;; move-object: object -> object
;; Apply the functions which update distance, x, and y coordinates

(define (move-object o)
  (make-object 
    (object-lane o)
    (object-img o)
    (object-scale o)
    (update-dist o)
    (object-speed o)
    (update-x o)
    (update-y o)))

;; update-dist: object -> number
;; Change the distance, at a rate dependant on the speed of the object

(define (update-dist o)
  (- (object-dist o) (object-speed o)))

;; update-y: object -> number
;; Uses arctan to approximate a constant speed approach

(define (update-y o)
   (- 1000 (* 450 (/ 1 (atan (* (object-dist o) (/ pi 1100)) )))))
 
;; update-x: object -> number
;; Update's the object's x-coordinate, depending on the lane it is in

(define (update-x o)
  (cond
    [(= (object-lane o) 2) 500]
    [(= (object-lane o) 3) (+ 925 (* -16/20 (object-y o)))]
    [(= (object-lane o) 1) (+ 75 (* 16/20 (object-y o)))]))
    
;; reset-object: world -> object
;; Resets the object at the vanishing point (new image, new lane, speed based on time that has passed)

(define (reset-object w o)
  (make-object  
    (+ (random 3) 1)
    (list-ref DANGERS (random (length DANGERS)))
    (object-scale o)
    500
    (+ 10 (/ (world-timePassed w) 100))
    (update-x o) 
    (update-y o))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY EVENTS:

;; keypress: world string -> world
;; Left and Right control the movement of your car between lanes

(define (keypress w key) 
  (cond
    [(gameover? w) (make-world CAR-LEFT (world-lane w)  (world-timePassed w) 0 (world-obj1 w) (world-obj2 w) )]
    [else  (cond
             [(and (string=? key "left") (> (world-lane w) 1))      (make-world CAR-LEFT (- (world-lane w) 1) (world-timePassed w) 0 (world-obj1 w) (world-obj2 w))]
             [(and (string=? key "right") (< (world-lane w) 3))     (make-world CAR-RIGHT (+ (world-lane w) 1) (world-timePassed w) 0 (world-obj1 w) (world-obj2 w))]
             [else                                                  w])]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TESTS FOR COND:

;; img-time : number -> image
;; Is the world's timer field greater than 5? If so, you should see the back of the car. 
;; If not? Check the world for the appropriately turned image.

(define (img-time timer w) 
  (cond
    [(> timer 5) CAR-REAR]
    [else (world-img w)]))
    
    
;; off-bottom? : number -> boolean
;; Checks whether an object has gone off the right side of the screen

(define (off-bottom? y) 
  (< y 5))

;; lane-collide? : world -> boolean
;; checks whether object-dist is zero and object-lane = car lane

(define (lane-collide? w o)
  (and (<= (object-dist o) 200)
       (= (object-lane o) (world-lane w))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RESULTS FOR COND:

;; gameover? : world -> boolean
;; Should the program end?

(define (gameover? w)
  (or (lane-collide? w (world-obj1 w))
      (lane-collide? w (world-obj2 w))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; big-bang using the START world
;; on a tick-event, use update-world
;; on a draw-event, use draw-world 
;; on a key-event, use keypress

(big-bang START
          (on-tick update-world)
          (on-draw draw-world)
          (on-key keypress)
          )