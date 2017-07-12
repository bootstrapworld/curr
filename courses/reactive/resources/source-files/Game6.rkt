;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Game6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")

;; DATA:

; a world is a string number number number number
(define-struct world (wstatus archerY wumpusX batX arrowX))

;; STARTING WORLD
(define START (make-world "asleep" 40 210 620 800))
(define NEXT (make-world "asleep" 40 210 580 820))

;; GRAPHICS
(define BACKGROUND (bitmap "Teachpacks/teachpack-images/BG.jpg"))
(define DANGER (scale .7 (bitmap "Teachpacks/teachpack-images/wumpus.png")))
(define FLOCK (bitmap "Teachpacks/teachpack-images/bats.png"))
(define PLAYER (scale .7 (bitmap "Teachpacks/teachpack-images/archer.png")))
(define ARROW (scale .5 (bitmap "Teachpacks/teachpack-images/arrow.png")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS FUNCTIONS:

;; draw-world: world -> Image
;; place FLOCK, PLAYER, ARROW, and DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image FLOCK
             (world-batX w)  210
             (put-image PLAYER
                        50 (world-archerY w)
                        (put-image ARROW
                                   (world-arrowX w) (+ 25 (world-archerY w))
                                   (put-image DANGER 
                                              (world-wumpusX w) 210
                                              BACKGROUND)))))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATING FUNCTIONS:

;; update-world: world -> world
;; What does your update-world function do?

(define (update-world w) (make-world (world-wstatus w)
                                     (world-archerY w)
                                     (world-wumpusX w)
                                     (- (world-batX w) 10)
                                     (+ (world-arrowX w) 20)))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY EVENTS:

;; keypress: world string -> world
;; What does your keypress function do?

(define (keypress w key)
  (cond
    [(string=? key "up") (make-world (world-wstatus w)
                                     (+ (world-archerY w) 10)
                                     (world-wumpusX w)
                                     (world-batX w)
                                     (world-arrowX w))]
    [(string=? key "down") (make-world (world-wstatus w)
                                       (- (world-archerY w) 10)
                                       (world-wumpusX w)
                                       (world-batX w)
                                       (world-arrowX w))]
    [(string=? key " ") (make-world "awake"
                                       (world-archerY w)
                                       (world-wumpusX w)
                                       (world-batX w)
                                       50)]
    [else (make-world (world-wstatus w)
                      (world-archerY w)
                      (world-wumpusX w)
                      (world-batX w)
                      (world-arrowX w))]))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TESTS FOR COND:


;; off-left? : number -> boolean
;; Checks whether an object has gone off the left side of the screen



;; off-right? : number -> boolean
;; Checks whether an object has gone off the right side of the screen



;; line-length : number number -> number
;; Finds 1D distance 


;; distance : number number number number -> number
;; Finds the 2D distance between two points



;; collide? : number number number number -> boolean
;; determines whether two objects are within 50 pixels of eachother






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