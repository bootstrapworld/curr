#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define-struct player (x y))
(define-struct world (player field))

(define player-image (bitmap "images/paintbrush.png"))
(define field-image (rectangle 500 500 "solid" "Dark Gray"))
(define background-image (place-image (text "Press the spacebar to change the colors!" 18 "white") 300 30 (overlay/align "middle" "top" (text "Use the arrow keys to navigate." 18 "white") (rectangle 600 650 "solid" "Dark Gray"))))
(define color-list (list "Indian Red" "Coral" "Gold" "Aquamarine" "Light Blue" "Thistle"))

(define init-field (build-list 5 (lambda (x) (build-list 5 (lambda (x) "white")))))
(define init-world (make-world (make-player 0 0) init-field))

(define (update-row row col)
  (cond
    [(empty? row) empty]
    [(zero? col) (cons (list-ref color-list (random 6)) (update-row (rest row) (- col 1)))]
    [else (cons (first row) (update-row (rest row) (- col 1)))]))

(define (update-field row col fld)
  (cond
    [(empty? fld) empty]
    [(zero? row) (cons (update-row (first fld) col) (update-field (- row 1) col (rest fld)))]
    [else (cons (first fld) (update-field (- row 1) col (rest fld)))]))

(define (world-key-handler w k)
  (cond
    [(and (key=? k "up") (< 0 (player-y (world-player w)))) (make-world (make-player (player-x (world-player w)) (- (player-y (world-player w)) 1)) (world-field w))]
    [(and (key=? k "down") (> 4 (player-y (world-player w)))) (make-world (make-player (player-x (world-player w)) (+ 1 (player-y (world-player w)))) (world-field w))]
    [(and (key=? k "left") (< 0 (player-x (world-player w)))) (make-world (make-player (- (player-x (world-player w)) 1) (player-y (world-player w))) (world-field w))]
    [(and (key=? k "right") (> 4 (player-x (world-player w)))) (make-world (make-player (+ 1 (player-x (world-player w))) (player-y (world-player w))) (world-field w))]
    [(key=? k " ") (make-world (world-player w) (update-field (player-y (world-player w)) (player-x (world-player w)) (world-field w)))]
    [else w]))

(define (draw-row colors column)
  (cond
    [(empty? colors) (rectangle 500 100 "solid" "Dark Gray")]
    [(cons? colors) (place-image (rectangle 99 99 "solid" (first colors)) (+ 50 (* 100 column)) 50 (draw-row (rest colors) (+ 1 column)))]))
 
(define (draw-field f row)
  (cond
    [(empty? f) field-image]
    [(cons? f) (place-image (draw-row (first f) 0) 250 (+ 50 (* 100 row)) (draw-field (rest f) (+ 1 row)))]))

(define (draw-world w)
  (overlay (place-image player-image (+ 50 (* 100 (player-x (world-player w)))) (+ 50 (* 100 (player-y (world-player w)))) (draw-field (world-field w) 0)) background-image))


(big-bang init-world
          (on-draw draw-world)
          (on-key world-key-handler))