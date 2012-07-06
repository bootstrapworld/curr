#lang racket/base

(provide deployment-dir)


;; The production deployment directory is, by default, #f.
;; Under deployment mode, the worksheets and drills are written as subdirectories of the deployment directory.
(define deployment-dir (make-parameter #f))