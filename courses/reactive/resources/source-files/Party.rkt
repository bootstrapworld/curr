;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Party) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; a party is a (make-party String String Number)
(define-struct party (location theme guests))

(define Halloween (make-party "school" "costume" 10))
(define Summer (make-party "beach" "luau" 7))
(define JulyFourth (make-party "backyard" "barbecue" 12))
