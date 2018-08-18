#lang racket

(require csv-reading)

(define next-row
  (make-csv-reader
   (open-input-file "lo.csv")
   '((separator-chars            #\,))))

(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)(next-row)

