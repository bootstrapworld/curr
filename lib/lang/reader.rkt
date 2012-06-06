#lang s-exp scribble/base/reader
(planet dyoo/scribble-bootstrap/lang)
#:wrapper1 (lambda (t) (cons 'doc (t)))
