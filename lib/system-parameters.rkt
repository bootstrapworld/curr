#lang racket/base

(provide current-deployment-dir
	 root-deployment-dir
	 deploy-resources-dir
	 unit-to-resources-path
 	 current-solutions-mode?
         current-generate-pdf?
         current-course
         current-lesson-xref
         current-document-output-path
         current-worksheet-links-refer-to-pdf?
         current-lesson-name)


;; Parameters for controlling the distribution directories.  The top-level build.rkt
;;  must set these parameters
;; - root-deployment-dir: the root directory for files meant for deployment
;; - current-deployment-dir: the directory into which files for deployment are currently generated
;;   (should always be a subdir of root-deployment-dir) 
;; - deploy-resources-dir: directory built from root-deployment-dir where resources will be stored
;; - unit-to-resources-path: used in resource-link to generate relative paths from a the-unit.html
;;   file to the resources folder on a web installation.  Cannot use deploy-resources-dir for this
;;   because we may copy a subdirectory of the generated distribution to a site (such as copying 
;;   just the algebra/units directory over to code.org)
(define current-deployment-dir (make-parameter #f))
(define root-deployment-dir (make-parameter #f))
(define deploy-resources-dir (make-parameter #f))
(define unit-to-resources-path (make-parameter #f))

;; Generate solutions?
(define current-solutions-mode? (make-parameter #f))


;; Generate pdf files after scribbling?
(define current-generate-pdf? (make-parameter #f))


;; The current coures being built.  Should be the name of one of the
;; subdirectories under "courses".
(define current-course (make-parameter "algebra"))


;; This language currently being worked in. This should remain an environment variable, but because
;; paths does not seem to be able to recognize environment variables, this is our current solution
(define current-language (make-parameter "english"))

;; The output path of the current document.
(define current-document-output-path (make-parameter #f))


;; The current-lesson-xref is a hashtable from lesson names to
;; records that describe where they can be found.
(define current-lesson-xref (make-parameter (make-hash)))


;; Should worksheet links refer to the actual html files, or to the pdf?
(define current-worksheet-links-refer-to-pdf? (make-parameter #f))


;; current-lesson-name: (or/c #f string)
;; Defines the current lesson name.  Cooperates with lesson and include-lesson.
(define current-lesson-name (make-parameter #f))

