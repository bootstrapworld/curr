#lang curr/lib

@title{BSL}

@(define max-unit-index 9)

@;; Helper function to hyperlink the units
@(define (unit-link n)
   @hyperlink[(format "units/unit~a/the-unit.html" n)]{Unit @(number->string n)})

@(apply itemlist
  (for/list ([n (in-range 1 (add1 max-unit-index))])
    @item{@unit-link[n]}))
