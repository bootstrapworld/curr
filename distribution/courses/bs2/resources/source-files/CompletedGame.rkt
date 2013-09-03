;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname CompletedGame) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")



;; This is an example of what students might accomplish with the final two classes of coding their games.
;; The final two classes are necessary for students to finish what they had originally planned.

;; Changes include: adding batY to the world struct, and causing them to drop down randomly
;;                  adding another test, to see whether the wumpus is "awake", and causing it to move when awake
;;                  adding a game-over test, to draw a new screen when the wumpus is shot

;; DATA:

; a world is a string number number number number
(define-struct world (wstatus archerY wumpusX batX arrowX batY))

;; STARTING WORLD
(define START (make-world "asleep" 40 210 620 800 500))
(define NEXT (make-world "asleep" 40 210 580 820 100))

;; GRAPHICS
(define BACKGROUND (bitmap "Teachpacks/teachpack-images/BG.jpg"))
(define DANGER (scale .7 (bitmap "Teachpacks/teachpack-images/wumpus.png")))
(define FLOCK (bitmap "Teachpacks/teachpack-images/bats.png"))
(define PLAYER (scale .7 (bitmap "Teachpacks/teachpack-images/archer.png")))
(define ARROW (scale .5 (bitmap "Teachpacks/teachpack-images/arrow.png")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS FUNCTIONS:

;; draw-world: world -> Image
;; place FLOCK, PLAYER, ARROW, and DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (cond
    [(gameover? w) (put-image (text "Congratulations! You've defeated the wumpus!" 30 "green")
                              320
                              240
                              (rectangle 640 480 "solid" "black"))]
    [else (put-image FLOCK
                     (world-batX w)  (world-batY w)
                     (put-image PLAYER
                                50 (world-archerY w)
                                (put-image ARROW
                                           (world-arrowX w) (+ 25 (world-archerY w))
                                           (put-image DANGER 
                                                      (world-wumpusX w) 210
                                                      (put-image (text "Use spacebar to shoot the wumpus." 30 "green")
                                                                 400 85
                                                                 (put-image (text "Be quiet, or you'll wake it up!" 30 "red")
                                                                            400 50 
                                                                            BACKGROUND))))))]))






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATING FUNCTIONS:

;; update-world: world -> world
;; update-world adds 20 to arrowX and subtracts 40 from batX

(define (update-world w)
  (cond
    
    
    [(off-left? (world-batX w))   (make-world (world-wstatus w)
                                              (world-archerY w)
                                              (world-wumpusX w)
                                              800
                                              (world-arrowX w)
                                              500)]
    
    
    [(off-left? (world-wumpusX w))(make-world (world-wstatus w)
                                              (world-archerY w)
                                              800
                                              (world-batX w)
                                              (world-arrowX w)
                                              (- (world-batY w) (random 40)))]
    [(collide? (world-wumpusX w) 210 50 (world-archerY w)) (make-world (world-wstatus w)
                                                                       480
                                                                       1000
                                                                       (world-batX w)
                                                                       (world-arrowX w)
                                                                       (- (world-batY w) (random 40)))]
    [(collideBats?  (world-batX w) (world-batY w) 50 (world-archerY w)) (make-world "awake"
                                                                     0
                                                                     (world-wumpusX w)
                                                                     1500
                                                                     (world-arrowX w)
                                                                     (- (world-batY w) (random 40)))]
    [(collideBats? (world-batX w) 440 (world-arrowX w)(+ 25 (world-archerY w))) (make-world (world-wstatus w)
                                                                                        (world-archerY w)
                                                                                        (world-wumpusX w)
                                                                                        5000
                                                                                        (world-arrowX w)
                                                                                        (- (world-batY w) (random 40)))]
    
    [(collide? (world-wumpusX w) 210 (world-arrowX w)(+ 25 (world-archerY w))) (make-world "dead"
                                                                                        (world-archerY w)
                                                                                        (world-wumpusX w)
                                                                                        5000
                                                                                        (world-arrowX w)
                                                                                        (- (world-batY w) (random 40)))]
    
    [(string=? (world-wstatus w) "awake") (make-world (world-wstatus w)
                                                      (world-archerY w)
                                                      (- (world-wumpusX w) 30)
                                                      (- (world-batX w) 50)
                                                      (+ (world-arrowX w) 20)
                                                      (- (world-batY w) (random 40)))]
     
    [else (make-world (world-wstatus w)
                      (world-archerY w)
                      (world-wumpusX w)
                      (- (world-batX w) 40)
                      (+ (world-arrowX w) 20)
                      (- (world-batY w) (random 40)))]))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY EVENTS:

;; keypress: world string -> world
;; Moves the archer up and down by 10

(define (keypress w key)
  (cond
    [(string=? key "up") (make-world (world-wstatus w)
                                     (+ (world-archerY w) 15)
                                     (world-wumpusX w)
                                     (world-batX w)
                                     (world-arrowX w)
                                     (- (world-batY w) (random 20)))]
    [(string=? key "down") (make-world (world-wstatus w)
                                       (- (world-archerY w) 15)
                                       (world-wumpusX w)
                                       (world-batX w)
                                       (world-arrowX w)
                                       (- (world-batY w) (random 20)))]
    [(string=? key "w") (make-world (world-wstatus w)
                                    (+ (world-archerY w) 3)
                                    (world-wumpusX w)
                                    (world-batX w)
                                    (world-arrowX w)
                                    (- (world-batY w) (random 20)))]
    [(string=? key "s") (make-world (world-wstatus w)
                                    (- (world-archerY w) 3)
                                    (world-wumpusX w)
                                    (world-batX w)
                                    (world-arrowX w)
                                    (- (world-batY w) (random 20)))]
    [(string=? key " ") (make-world (world-wstatus w)
                                    (world-archerY w)
                                    (world-wumpusX w)
                                    (world-batX w)
                                    50
                                    (- (world-batY w) (random 20)))]
    [else (make-world (world-wstatus w)
                      (world-archerY w)
                      (world-wumpusX w)
                      (world-batX w)
                      (world-arrowX w)
                      (- (world-batY w) (random 20)))]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TESTS:


;; off-left? : number -> boolean
;; Checks whether an object has gone off the left side of the screen
(define (off-left? x) (< x 0))


;; off-right? : number -> boolean
;; Checks whether an object has gone off the right side of the screen
(define (off-right? x) (> x 640))


;; line-length : number number -> number
;; Finds 1D distance 

(define (line-length a b)
  (cond
    [(< a b) (- b a)]
    [else (- a b)]))

;; distance : number number number number -> number
;; Finds the 2D distance between two points

(define (distance x1 y1 x2 y2)
  (sqrt (+ (sq (line-length x1 x2)) (sq (line-length y1 y2)))))

;; collide? : number number number number -> boolean
;; determines whether two objects are within 50 pixels of each other

(define (collide? x1 y1 x2 y2)
  (< (distance x1 y1 x2 y2) 25))

(define (collideBats? x1 y1 x2 y2)
  (< (distance x1 y1 x2 y2) 70))



;; gameover? : world -> boolean
;; Should the program end?

(define (gameover? w)
  (string=? (world-wstatus w) "dead"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; big-bang using the START world
;; on a tick-event, use update-world
;; on a draw-event, use draw-world 
;; on a key-event, use keypress

(big-bang START
          (on-tick update-world)
          (on-draw draw-world)
          (on-key keypress)
          (stop-when gameover?)
          )