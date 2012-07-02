#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define-struct world (size growing))
(define init-world (make-world 0.2 false))
(define limit (+ 0.5 (random)))

; http://www.polygonblog.com/3d-birthday-balloons-in-3ds-max/
(define balloon-image (bitmap "images/balloon.jpg"))
; http://mike44nh.deviantart.com/
(define popped-image (bitmap "images/game-over.jpg"))

(define (update-world w)
  (cond
    [(world-growing w)
     (make-world (+ 0.005 (world-size w)) true)]
    [else w]))

(define (world-mouse-handler w x y m)
  (cond
    [(mouse=? m "button-down") (make-world (world-size w) true)]
    [(mouse=? m "button-up") (make-world (world-size w) false)]
    [else w]))

(define (draw-world w)
  (if (>= (world-size w) limit)
      (crop 0 100 800 600 (scale .5 popped-image))
      (overlay/align "left" "top"
                     (text "How big can you make the balloon before it pops? Keep clicking or click and hold to find out!" 18 "black")
                     (overlay/align "middle" "bottom"
                                    (scale (world-size w) balloon-image)
                                    (rectangle 800 600 "solid" "white")))))

(define (game-over? w)
  (> (world-size w) limit))

(big-bang init-world
          (on-tick update-world (/ 1.0 60))
          (stop-when game-over?)
          (on-draw draw-world)
          (on-mouse world-mouse-handler))