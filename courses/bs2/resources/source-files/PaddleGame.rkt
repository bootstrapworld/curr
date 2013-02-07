;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname PaddleGame) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Number manipulation

;; deg2rad : number -> number
;; Changes degrees into radians

(define (deg2rad d)
  (/ (* pi d) 180))

;; rad2deg : number -> number
;; Changes radians into degrees

(define (rad2deg d)
  (/ (* 180 d) pi))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DATA:
;; The World is a: number number number number number

(define-struct world (p1y p2y p1score p2score ballX ballY ballAngle timer))

;; STARTING WORLD
(define START (make-world 240 240 0 0 320 240 (deg2rad (random 360)) 0))

;; GRAPHICS
(define BACKGROUND (put-image (rectangle 1 480 "solid" "white") 320 240 (rectangle 640 480 "solid" "black")))
(define PADDLE (rectangle 5 25 "solid" "white"))
(define BALL (rectangle 8 8 "solid" "white"))

; How fast does the ball move? How hard is the game?
(define SPEED 6) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS FUNCTIONS:

;; draw-world: world -> Image
;; place DANGER, TARGET, CLOUD and PLAYER onto BACKGROUND at the right coordinates

(define (draw-world w)
  (put-image BALL
             (world-ballX w) (world-ballY w)
             (put-image PADDLE                   ;Player 1
                        100 (world-p1y w)
                        (put-image PADDLE
                                   540 (world-p2y w)   ;Player 2
                                   (put-image (text (number->string (world-p1score w)) 30 "white")
                                              280 420
                                              (put-image (text (number->string (world-p2score w)) 30 "white")
                                                         360 420
                                                         BACKGROUND))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATING FUNCTIONS:

;; update-world: world -> world
;; What does your update-world function do?

(define (update-world w)
  (cond
    [(off-left? (world-ballX w))   (score2 w)]
    [(off-right? (world-ballX w))  (score1 w)]
    [(hit-top? w)    (Tcollide w)]
    [(hit-bottom? w) (Bcollide w)]
    [(Lpaddle-collide? w)          (Lcollide w)]
    [(Rpaddle-collide? w)          (Rcollide w)]
    [else     (make-world (world-p1y w)
                          (world-p2y w)
                          (world-p1score w)
                          (world-p2score w)
                          (update-ballx w)
                          (update-bally w)
                          (world-ballAngle w)
                          (+ (world-timer w) 1))]))

;; update-ballx : world -> number
;; What is the next x position of the ball?

(define (update-ballx w)
  (+ (* SPEED (cos (world-ballAngle w)))(world-ballX w)))
  
;; update-bally : world -> number
;; What is the next y position of the ball?

(define (update-bally w)
  (+ (* SPEED (sin (world-ballAngle w)))(world-ballY w)))

;; new-angle : number -> number
;; Generates a new angle, from 0-360, and converts it into radians

(define (new-angle n)
  (deg2rad (random 360)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY EVENTS:

;; keypress: world string -> world
;; What does your keypress function do?

(define (keypress w key)
  (cond
    [(string=? "up" key) (make-world (world-p1y w)
                                     (+ (world-p2y w) 10)
                                     (world-p1score w)
                                     (world-p2score w)
                                     (world-ballX w)
                                     (world-ballY w) 
                                     (world-ballAngle w)
                                     (world-timer w))]
    [(string=? "down" key) (make-world (world-p1y w)
                                       (- (world-p2y w) 10)
                                       (world-p1score w)
                                       (world-p2score w)
                                       (world-ballX w)
                                       (world-ballY w) 
                                       (world-ballAngle w)
                                       (world-timer w))]    
    [(string=? "w" key) (make-world (+ (world-p1y w) 10)
                                    (world-p2y w) 
                                    (world-p1score w)
                                    (world-p2score w)
                                    (world-ballX w)
                                    (world-ballY w) 
                                    (world-ballAngle w)
                                    (world-timer w))]
    [(string=? "s" key) (make-world (- (world-p1y w) 10)
                                    (world-p2y w)
                                    (world-p1score w)
                                    (world-p2score w)
                                    (world-ballX w)
                                    (world-ballY w) 
                                    (world-ballAngle w)
                                    (world-timer w))]
    [else w]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TESTS FOR COND:


;; off-left? : number -> boolean
;; Checks whether an object has gone off the left side of the screen

(define (off-left? x) (< x 10))


;; off-right? : number -> boolean
;; Checks whether an object has gone off the right side of the screen

(define (off-right? x) (> x 630))

;; hit-top? : number -> boolean
;; Has the ball hit the top? Is it residual from the last check?

(define (hit-top? w) 
  (and (> (world-ballY w) 476)
       (> (world-timer w) 2)))

;; hit-bottom? number -> boolean
;; Has the ball hit the bottom? Is it residual from the last check?

(define (hit-bottom? w) 
  (and (< (world-ballY w) 4)
       (> (world-timer w) 2)))

;; line-length : number number -> number
;; Finds 1D distance 

(define (line-length a b)
  (cond
    [(< a b) (- b a)]
    [else (- a b)]))

;; Lpaddle-collide : world -> boolean
;; Has the ball hit the left paddle? Is it residual from the last check?
  
(define (Lpaddle-collide? w)
  (and (and (< (line-length (world-ballX w) 100) 5)
            (< (line-length (world-ballY w) (world-p1y w)) 20))
       (> (world-timer w) 3)))

;; Rpaddle-collide : world -> boolean
;; Has the ball hit the right paddle? Is it residual from the last check?

(define (Rpaddle-collide? w)
  (and (and (< (line-length (world-ballX w) 540) 5)
            (< (line-length (world-ballY w) (world-p2y w)) 20))
       (> (world-timer w) 3)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RESULTS FOR COND

;; Rcollide : world -> world
;; What happens when the ball collides with the paddle on the right side of the screen?

(define (Rcollide w)
  (make-world (world-p1y w)
              (world-p2y w)
              (world-p1score w)
              (world-p2score w)
              (world-ballX w)
              (world-ballY w) 
              (- (deg2rad 180) (world-ballAngle w))
              0))

;; Lcollide : world -> world
;; What happens when the ball collides with the paddle on the left side of the screen?

(define (Lcollide w)
  (make-world (world-p1y w)
              (world-p2y w)
              (world-p1score w)
              (world-p2score w)
              (world-ballX w)
              (world-ballY w) 
              (- (world-ballAngle w) (deg2rad 180))
              0))

;; Tcollide : world -> world
;; What happens when the ball collides with the top of the screen?

(define (Tcollide w)
  (make-world (world-p1y w)
              (world-p2y w)
              (world-p1score w)
              (world-p2score w)
              (world-ballX w)
              (world-ballY w) 
              (- (deg2rad 0) (world-ballAngle w))
              0))

;; Bcollide : world -> world
;; What happens when the ball collides with the bottom of the screen?

(define (Bcollide w)
  (make-world (world-p1y w)
              (world-p2y w)
              (world-p1score w)
              (world-p2score w)
              (world-ballX w)
              (world-ballY w) 
              (- (deg2rad 360) (world-ballAngle w))
              0))

;; score1 : world -> world
;; Gives player one a point

(define (score1 w)
  (make-world (world-p1y w)
              (world-p2y w)
              (+ 1 (world-p1score w))
              (world-p2score w)
              320 240 (new-angle w)
              (world-timer w)))

;; score2 : world -> world
;; Gives player two a point

(define (score2 w)
  (make-world (world-p1y w)
              (world-p2y w)
              (world-p1score w)
              (+ 1 (world-p2score w))
              320 240 (new-angle w)
              (world-timer w)))

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