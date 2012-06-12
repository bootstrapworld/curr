#lang curr/lib

@title{BSL}

@;; Helper function to hyperlink the units
@(define (unit-link n)
   @hyperlink[(format "units/unit~a/the-unit.html" n)]{Unit @(number->string n)})

@(apply itemlist
  (for/list ([n (in-range 1 10)])
    @item{@unit-link[n]}))
