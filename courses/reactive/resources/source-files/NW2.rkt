;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname NW2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")

;; DATA:
;; The World is the x position of the dog
(define-struct world (dogX))

;; STARTING WORLD
(define START (make-world 0))

(define BACKGROUND (bitmap "Teachpacks/teachpack-images/bg.jpg"))
(define DANGER (bitmap "Teachpacks/teachpack-images/dog.png"))
(define TARGET (scale .3 (bitmap "Teachpacks/teachpack-images/ruby.png")))
(define PLAYER (bitmap "Teachpacks/teachpack-images/ninja.png"))
(define CLOUD (bitmap "Teachpacks/teachpack-images/clouds.png"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS FUNCTIONS:

;; draw-world: world -> Image
;; place DANGER onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image DANGER 
               0 400
               BACKGROUND))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATING FUNCTIONS:

;; update-world: world -> world
;; increase dogX by 10
(define (update-world w)
  (make-world (+ (world-dogX w) 10) ))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; big-bang using the START world
;; on a tick-event, use update-world
;; on a draw-event, use draw-world 
;; on a key-event, use keypress

(big-bang START
          (on-tick update-world)
          (to-draw draw-world)
          )