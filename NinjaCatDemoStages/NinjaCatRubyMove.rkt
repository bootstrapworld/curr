;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname NinjaCatRubyMove) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)

; a Player is a (make-player x y)
(define-struct player (x y))
; a Thing is a (make-thing x y speed)
(define-struct thing (x y speed))
; a World is a (make-world score timer player thing1 thing2 thing3)
(define-struct world (score timer thing1 thing2 thing3))

; define initial world
;(define PLAYER1 (make-player 320 380))
(define ENEMY   (make-thing 600 390 5))
(define RUBY    (make-thing 1500 250 10))
(define CLOUD   (make-thing 700 100 5))
(define player-image (bitmap "NinjaCat/ninja.png"))
(define cloud-image (bitmap "NinjaCat/clouds.png"))
(define ruby-image (bitmap "NinjaCat/ruby.png"))
(define dog-image (bitmap "NinjaCat/dog.png"))
(define bg-image (bitmap "NinjaCat/bg.jpg"))
;; some sample worlds (at the start of the game, and at some random playing time)
(define START  (make-world 0 0  ENEMY RUBY CLOUD))
(define PLAY   (make-world 0 0 ENEMY (make-thing 300 250 20) (make-thing 100 100 20)))


; draw-world
(define (draw-world w)
  (overlay/align "middle" "top"
                 (text "NinjaCat!" 18 "white")
                 (place-image cloud-image
                              (thing-x (world-thing3 w))
                              (thing-y (world-thing3 w))
                              (place-image ruby-image
                                           (thing-x (world-thing2 w))
                                           (thing-y (world-thing2 w))
                                           (place-image dog-image
                                                        (thing-x (world-thing1 w))
                                                        (thing-y (world-thing1 w))
                                                        bg-image)))))
; update a thing
(define (update-thing t)
  (make-thing (- (thing-x t) (thing-speed t)) (thing-y t) (thing-speed t)))


; update the world
(define (update-world w)
  (cond
    ((< (thing-x (world-thing1 w)) 0) 
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (make-thing 700 390  5)
                 (update-thing (world-thing2 w))
                 (update-thing (world-thing3 w))))
    ((< (thing-x (world-thing2 w)) 0) 
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (update-thing (world-thing1 w))
                 (make-thing 1500 200 5)
                 (update-thing (world-thing3 w))))
    ((< (thing-x (world-thing3 w)) 0)
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (update-thing (world-thing1 w))
                 (update-thing (world-thing2 w))
                 (make-thing 700 (random 200) 5)))
    (else (make-world (world-score w)
                      (- (world-timer w) 1)
                      (update-thing (world-thing1 w))
                      (update-thing (world-thing2 w))
                      (update-thing (world-thing3 w))))))





(big-bang START
          (on-tick update-world .05)
          (on-draw draw-world))
;(on-key keypress)
; (stop-when game-over))