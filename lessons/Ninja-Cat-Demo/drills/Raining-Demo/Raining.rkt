#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define-struct player (x))
(define-struct animal (x y type-bool))
(define-struct world (score player animal))

; http://areason2write.wordpress.com/
(define player-image (bitmap "images/player.png"))
; http://gallerywallpaperbestcartoon.blogspot.com/
(define cat-image (bitmap "images/cat.png"))
; http://a-flower-guides.blogspot.com/
(define dog-image (bitmap "images/dog.png"))
; http://xn--90azb2e.xn--p1ai/preview.php?p=884217
(define bg-image (bitmap "images/bg.jpg"))

(define init-world (make-world 0 (make-player 300) (make-animal (+ 50 (random 500)) 0 (random 2))))

(define (world-key-handler w k)
  (cond
    [(key=? k "left") (if (> (player-x (world-player w)) 75)
                          (make-world (world-score w) (make-player (- (player-x (world-player w)) 30)) (world-animal w))
                          w)]
    [(key=? k "right") (if (< (player-x (world-player w)) 525)
                           (make-world (world-score w) (make-player (+ (player-x (world-player w)) 30)) (world-animal w))
                           w)]
    [else w]))

(define (animal-caught? w)
  (cond
    [(zero? (animal-type-bool (world-animal w))) 
     (and (< (abs (- (animal-x (world-animal w)) (player-x (world-player w)))) 100) (> (animal-y (world-animal w)) 325))]
    [(= 1 (animal-type-bool (world-animal w)))
     (and (< (abs (- (animal-x (world-animal w)) (player-x (world-player w)))) 90) (> (animal-y (world-animal w)) 320))]))

(define (update-world w)
  (cond
    [(animal-caught? w) (make-world (+ (world-score w) 10) (world-player w) (make-animal (+ 50 (random 500)) 0 (random 2)))]
    [else (make-world (world-score w) (world-player w) (make-animal (animal-x (world-animal w)) (+ (animal-y (world-animal w)) 2) (animal-type-bool (world-animal w))))]))

(define (draw-world w)
  (overlay/align "middle" "top" 
                 (text (string-append "It's raining cats and dogs!                                                            Score: " 
                                      (number->string (world-score w))) 18 "white")
                 (place-image (text "Use the right and left arrow keys to move the frog from side to side." 14 "white") 230 30
                              (place-image (text "Position the frog under the falling cats and dogs to catch them." 14 "white") 215 44
                 (place-image (if (zero? (animal-type-bool (world-animal w))) cat-image dog-image) 
                              (animal-x (world-animal w))
                              (animal-y (world-animal w))
                              (place-image player-image (player-x (world-player w)) 370 bg-image))))))

(define (game-over? w)
  (cond
    [(zero? (animal-type-bool (world-animal w))) 
     (and (> (abs (- (animal-x (world-animal w)) (player-x (world-player w)))) 100) (> (animal-y (world-animal w)) 380))]
    [(= 1 (animal-type-bool (world-animal w)))
     (and (> (abs (- (animal-x (world-animal w)) (player-x (world-player w)))) 90) (> (animal-y (world-animal w)) 375))]))

(big-bang init-world
          (on-tick update-world (/ 1.0 60))
          (stop-when game-over?)
          (on-draw draw-world)
          (on-key world-key-handler))