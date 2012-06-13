;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname NinjaCatEnemyMove) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)

; a Player is a (make-player x y)
(define-struct player (x y))
; a Thing is a (make-thing x y speed)
(define-struct thing (x y speed))
; a World is a (make-world score timer player thing1 thing2 thing3)
(define-struct world (score timer thing1 ))

; define initial world
;(define PLAYER1 (make-player 320 380))
(define ENEMY   (make-thing 600 390 5))
;(define RUBY    (make-thing 1500 250 10))
(define dog-image (bitmap "NinjaCat/dog.png"))
(define bg-image (bitmap "NinjaCat/bg.jpg"))
;; some sample worlds (at the start of the game, and at some random playing time)
(define START  (make-world 0 0  ENEMY))
(define PLAY   (make-world 0 0 ENEMY))


; draw-world
(define (draw-world w)
  (overlay/align "middle" "top"
                 (text (string-append "NinjaCat!                   Score:"
                                      (number->string (world-score w))) 18 "white")
                 (place-image (text "Use arrow keys to move. Jump on the dog and catch the ruby!" 12 "white")
                              320 30
                 (place-image dog-image
                                                                   (thing-x (world-thing1 w))
                                                                   (thing-y (world-thing1 w))
                                                                   bg-image))))
; update a thing
(define (update-thing t)
  (make-thing (- (thing-x t) (thing-speed t)) (thing-y t) (thing-speed t)))


; update the world
(define (update-world w)
  (cond
    ((< (thing-x (world-thing1 w)) 0) 
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (make-thing 700 390  5)))
    (else (make-world (world-score w)
                      (- (world-timer w) 1)
                      (update-thing (world-thing1 w))))))

(big-bang START
          (on-tick update-world .05)
          (on-draw draw-world))