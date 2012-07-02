#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define-struct player (x y))
(define-struct crocodile (x y direction))
(define-struct world (timer player crocs))

; http://www.bsohappykidsalmere.nl/nieuws.htm
(define player-image (bitmap "images/player.png"))
; http://clipartist.net/uncategorized/alligator-openclipart-org-commons-wikimedia-org/
(define up-croc-image (bitmap "images/up-enemy.png"))
(define down-croc-image (bitmap "images/down-enemy.png"))
(define bg-image (overlay/align "right" "middle"
                                (rectangle 200 800 "solid" "Medium Forest Green")
                                (rectangle 800 800 "solid" "Light Blue")))

(define (new-croc x)
  (if (zero? (random 2)) (make-crocodile x -80 "down") (make-crocodile x 880 "up")))

(define init-world (make-world 0 (make-player 0 400) (list (new-croc (+ 100 (random 450))))))

(define (world-key-handler w k)
  (cond
    [(key=? k "up") (if (> (player-y (world-player w)) 40)
                         (make-world (world-timer w) (make-player (player-x (world-player w)) (- (player-y (world-player w)) 30)) (world-crocs w))
                         w)]
    [(key=? k "down") (if (< (player-y (world-player w)) 760)
                           (make-world (world-timer w) (make-player (player-x (world-player w)) (+ (player-y (world-player w)) 30)) (world-crocs w))
                           w)]
    [(key=? k "left") (if (> (player-x (world-player w)) 0)
                          (make-world (world-timer w) (make-player (- (player-x (world-player w)) 30) (player-y (world-player w))) (world-crocs w))
                          w)]
    [(key=? k "right") (make-world (world-timer w) (make-player (+ (player-x (world-player w)) 30) (player-y (world-player w))) (world-crocs w))]
    [else w]))

(define (move-croc c)
  (cond
    [(equal? "up" (crocodile-direction c)) (make-crocodile (crocodile-x c) (- (crocodile-y c) 1) "up")]
    [(equal? "down" (crocodile-direction c)) (make-crocodile (crocodile-x c) (+ (crocodile-y c) 1) "down")]))

(define (update-crocs aloc)
  (cond
    [(empty? aloc) empty]
    [(and (> (crocodile-y (first aloc)) -100) (< (crocodile-y (first aloc)) 900))
     (cons (move-croc (first aloc)) (update-crocs (rest aloc)))]
    [else (update-crocs (rest aloc))])) 

(define (update-world w)
  (cond
    [(and (< (length (world-crocs w)) 5) (> (world-timer w) 60) (= 75 (random 150)))
     (make-world
      0
      (make-player (player-x (world-player w)) (player-y (world-player w)))
      (cons (new-croc (+ 100 (random 450))) (update-crocs (world-crocs w))))]
    [else (make-world 
          (+ (world-timer w) 1) 
          (make-player (player-x (world-player w)) (player-y (world-player w))) 
          (update-crocs (world-crocs w)))]))

(define (draw-world w)
  (overlay/align "middle" "top" 
                 (text "CROCOMANIA! Use the arrow keys to swim up, down, left or right." 18 "white")
                 (place-image (text "Swim to the shore, and make sure to avoid the crocodiles." 18 "white") 400 30
                 (foldl (lambda (c bg) (place-image (if (equal? "up" (crocodile-direction c)) up-croc-image down-croc-image) 
                              (crocodile-x c)
                              (crocodile-y c)
                              bg)) (place-image player-image (player-x (world-player w)) (player-y (world-player w)) bg-image) (world-crocs w)))))

(define (safe? w)
  (> (player-x (world-player w)) 675))

(define (collide? p c)
  (and (< (abs (- (player-x p) (crocodile-x c))) 110) (< (abs (- (player-y p) (crocodile-y c))) 125))) 

(define (game-over? w)
  (or (safe? w) (ormap (lambda (c) (collide? (world-player w) c)) (world-crocs w))))
  

(big-bang init-world
          (on-tick update-world (/ 1.0 60))
          (stop-when game-over?)
          (on-draw draw-world)
          (on-key world-key-handler))