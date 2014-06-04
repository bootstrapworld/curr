#lang racket

;; API for build modes set through env parameters

(provide (all-defined-out))

;;;;;;;;; Solutions ;;;;;;;;;;;;;;;;

(define (solutions-mode?)
  (equal? (getenv "CURRENT-SOLUTIONS-MODE") "on"))

(define (solutions-mode-on)
  (putenv "CURRENT-SOLUTIONS-MODE" "on"))

(define (solutions-mode-off)
  (putenv "CURRENT-SOLUTIONS-MODE" "off"))

;;;;;;;;;; Build for ;;;;;;;;;;;;;;;
  
(define (build-for-codeorg?) (string=? (getenv "BUILD-FOR") "codeorg"))

(define (build-for-bootstrap?) (string=? (getenv "BUILD-FOR") "bootstrap"))