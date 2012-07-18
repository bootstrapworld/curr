#lang racket/base

(provide deployment-dir
         current-course)


;; The production deployment directory is, by default, #f.
;; Under deployment mode, the worksheets and drills are written as subdirectories of the deployment directory.
(define deployment-dir (make-parameter #f))


;; The current coures being built.  Should be the name of one of the
;; subdirectories under "courses".
(define current-course (make-parameter "bs1"))
