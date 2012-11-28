#lang racket/base

(provide current-deployment-dir
         current-generate-pdf?
         current-course
         current-lesson-xref
         current-document-output-path
         current-worksheet-links-refer-to-pdf?)


;; Under deployment mode, the worksheets and drills are written as subdirectories of the deployment directory.
;; The toplevel build.rkt script will initialize this parameter.
(define current-deployment-dir (make-parameter #f))


;; Generate pdf files after scribbling?
(define current-generate-pdf? (make-parameter #f))


;; The current coures being built.  Should be the name of one of the
;; subdirectories under "courses".
(define current-course (make-parameter "bs1"))


;; The output path of the current document.
(define current-document-output-path (make-parameter #f))


;; The current-lesson-xref is a hashtable from lesson names to
;; records that describe where they can be found.
(define current-lesson-xref (make-parameter (make-hash)))


;; Should worksheet links refer to the actual html files, or to the pdf?
(define current-worksheet-links-refer-to-pdf? (make-parameter #f))
