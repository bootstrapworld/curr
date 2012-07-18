;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Cage) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "Teachpacks/cage-teachpack.ss")

;;;; YOUR CODE HERE
; Don't forget to include a contract and purpose statement.

; protect-left? : Number -> Boolean
; is any part of the butterfly still visible on the left?
(define (protect-left? x)
  true)


; protect-right : Number -> Boolean
; is any part of the butterfly still visible on the right?
(define (protect-right? x)
  true)


; onscreen? :  Number -> Boolean
; is any part of the butterfly still on the screen?
(define (onscreen? x)
  true)


;; don't touch anything below this line!
(start onscreen?)