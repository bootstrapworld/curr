;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname NW3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/bootstrap-teachpack.rkt")

;; DATA:
;; The World is the x position of the dog and x position of the ruby
(define-struct world (dogX rubyX))

;; STARTING WORLD
(define START (make-world 0 600))
(define NEXT (make-world 10 595))

(define BACKGROUND (bitmap "Teachpacks/teachpack-images/bg.jpg"))
(define DANGER (bitmap "Teachpacks/teachpack-images/dog.png"))
(define TARGET (scale .3 (bitmap "Teachpacks/teachpack-images/ruby.png")))
(define PLAYER (bitmap "Teachpacks/teachpack-images/ninja.png"))
(define CLOUD (bitmap "Teachpacks/teachpack-images/clouds.png"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS FUNCTIONS:

;; draw-world: world -> Image
;; place DANGER, TARGET, and CLOUD onto BACKGROUND at the right coordinates
(define (draw-world w)
  (put-image TARGET
               (world-rubyX w) 300
               (put-image CLOUD
                            500 400  
                            (put-image DANGER 
                                         (world-dogX w) 400
                                         BACKGROUND))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATING FUNCTIONS:

;; update-world: world -> world
;; increase dogX by 10, decrease rubyX by 5
(define (update-world w)
  (make-world (+ (world-dogX w) 10) 
              (- (world-rubyX w) 5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY EVENTS:

;; keypress: world string -> world
;; make catY respond to key events




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; big-bang using the START world
;; on a tick-event, use update-world
;; on a draw-event, use draw-world 
;; on a key-event, use keypress

(big-bang START
          (on-tick update-world) 
          (to-draw draw-world)
          )
          