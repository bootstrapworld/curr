;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Game) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 0. Game title: Write the title of your game here
(define TITLE "My Game")
(define TITLE-COLOR "white")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Graphics - danger, target, projectile and player images
(define BACKGROUND (rectangle 640 480 "solid" "black"))
(define DANGER (triangle 30 "solid" "red"))
(define TARGET (circle 20 "solid" "green"))
(define PLAYER (bitmap "Teachpacks/teachpack-images/rocket.png"))

;; here's a screenshot of the game, with the PLAYER at (320, 240),
;; the TARGET at (400 500) and the DANGER at (150, 200)
(define SCREENSHOT (put-image DANGER
                                150 200
                                (put-image TARGET
                                           500 400
                                           (put-image PLAYER
                                                      320 240
                                                      BACKGROUND))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Making the Danger and the Target Move

; update-danger: Number -> Number
; Given the danger's OLD x-coordinate, output the NEXT x
(define (update-danger x) 
  x)
; Write your EXAMPLEs below this line:



; update-target : Number -> Number
; Given the target's OLD x-coordinate, output the NEXT x

(define (update-target x)
  x)
; Write EXAMPLEs here:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Making the Danger and the Target Come Back Again: 
;;    Are they still onscreen?

; safe-left? : Number -> Boolean
; Is the character protected on the left side of the screen?

(define (safe-left? x)
  true)
; Write an EXAMPLE that makes this true, and one that makes this false:


; safe-right? : Number -> Boolean
; Is the character protected on the right side of the screen?

(define (safe-right? x)
  true)
; Write an EXAMPLE that makes this true, and one that makes this false:


; onscreen? : Number -> Boolean
; Determines if the coordinates are within 100 pixels of the screen
(define (onscreen? x)
  true)
;; EXAMPLEs



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Get our Player moving!

; update-player : Number String -> Number
; Given the player's y-coordinate and the name of a keyboard key, 
; output the NEXT y.  The arrow keys are called "up" and "down".
(define (update-player y key)
  y)
; EXAMPLE that makes it go up, one for down, and one to stay the same.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Collisions: When the player is close enough to the Target
;;    or the Danger, then something should happen!
;;    We need to know what "close enough" means, and we need to
;;    know how far apart things are.

;; If *show-distances* is set to true, then the game will draw
;; a triangle between the player and each character using the TITLE-COLOR. 
;; That triangle will be labelled with line-length on the legs,
;; and with distance on the hypotenuse.
(define *show-distances* false)

; line-length : Number Number -> Number
; the distance between two points on a number line
(define (line-length a b)
  (cond
    [(> a b) (- a b)]
    [else (- b a)]))
(EXAMPLE (line-length 20 10) 10)
(EXAMPLE (line-length 10 20) 10)
  

; distance : Number Number Number Number -> Number
; We have the player's position (px, py), and a character's position (cx, cy).
; How far apart are they?
; HINT:   You can multiply a number x by itself using (sq x).
; HINT:   You can get the square root of a number x like (sqrt x).

(define (distance px py cx cy)
  0)
;(EXAMPLE (distance 20 20 20 20) 0)     ;; same point: distance is zero.
;(EXAMPLE (distance  1  0  0  0) 1)     ;; x difference of -1 only.
;(EXAMPLE (distance  0  2  0  0) 2)     ;; y difference of -2 only.
;(EXAMPLE (distance  0  0  3  0) 3)     ;; x difference of  3 only.
;(EXAMPLE (distance  0  0  0  4) 4)     ;; y difference of  4 only.
;(EXAMPLE (distance  0  0  3  4) 5)     ;; special right triangle at zero.
;(EXAMPLE (distance 15 22 10 10) 13)    ;; special right triangle.



; collide? : Number Number Number Number -> Boolean 
; We have (px, py) and (cx, cy). Are they close enough for a collision?
(define (collide? px py cx cy)
  false)
; EXAMPLEs



; A final secret:
(define mystery (radial-star 5 5 3 "solid" "silver"))
(define (update-mystery x) 
  x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROVIDED CODE

;; defines a game level, using all the images and functions
;; defined above.
(define g (make-game TITLE TITLE-COLOR 
                     BACKGROUND 
                     DANGER update-danger
                     TARGET update-target
                     PLAYER update-player
                     mystery update-mystery
                     *show-distances* line-length distance
                     collide? onscreen?))

;; starts the game, using the level "g"
(play g)
