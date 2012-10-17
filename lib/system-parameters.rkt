#lang racket/base

(provide current-deployment-dir
         current-course
         current-worksheet-links-refer-to-pdf?)


;; The production deployment directory is, by default, "deploy".
;; Under deployment mode, the worksheets and drills are written as subdirectories of the deployment directory.
(define current-deployment-dir (make-parameter "deploy"))


;; The current coures being built.  Should be the name of one of the
;; subdirectories under "courses".
(define current-course (make-parameter "bs1"))



;; Should worksheet links refer to the actual html files, or to the pdf?
(define current-worksheet-links-refer-to-pdf? (make-parameter #f))