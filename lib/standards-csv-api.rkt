#lang racket

;; API to extract standards/objectives/evidence data from spreadsheet

(require (planet neil/csv:1:=7) ; csv library
         racket/runtime-path
         "paths.rkt"          ; needed while we load the standards from csv file
         )
         
(provide get-standard-descr
         get-learnobj-tree
         get-evid-statment/tag
         get-evid-summary
         )

;; location of the standards csv file (must be a path)
(define-runtime-path lib-path (build-path 'up "lib"))
(define STDS-CSV-FILE (build-path lib-path "standards.csv"))
(define STDS-GDRIVE-SOURCE "https://docs.google.com/spreadsheet/ccc?key=0AjzMl1BJlJDkdFRkR0RRRUJqa21oZHJ3WEhHWE1IVHc&usp=sharing#gid=0")

;;;;; STANDARDS TREE DATA DEFN ;;;;;;;;;;;;;;;;;;;;;;;;;

;; (make-standard string string list[learnobj])
(define-struct standard (tag descr learnobjs))
;; (make-learnobj (number string list[evidstmt])
(define-struct learnobj (id descr evidence))
;; (make-evidstmt (number string string))
(define-struct evidstmt (id descr coverage))

;; the standardslist is a list of standards

;;;;; CSV TO STANDARDS TREE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The csv file has four columns: a tag (combining standard and objective label),
;; a description of the objective, the evidence statements, and whether or not
;; we claim to cover the objective.
;;
;; The original design of these data structures separated the standard and the
;; objective.  The description of each standard will now be taken from the
;; single learning objective per tag (thus we will have replication between the
;; standard description and the learning objective.  Might want to rewrite later
;; but duplication preserves the rest of the code for now.

(define (read-csv filename)
  (call-with-input-file filename
    (lambda (p)
      (csv->list (make-csv-reader p '((separator-chars #\,)))))))

(define csv-raw (read-csv STDS-CSV-FILE))

(define (cluster-lines-by-firstcol csvlist)
  (let loop ([unprocessed csvlist] [currstd empty] [finishedstds empty])
    (if (empty? unprocessed) ;; include currstd in finishedstds list
        (append finishedstds (list currstd))
        (cond [(string=? "" (caar unprocessed)) ;; line still part of currstd
               (loop (rest unprocessed) 
                     (append currstd (list (first unprocessed))) 
                     finishedstds)]
              [else ;; current line starts a new standard; archive previous and start new one
               (loop (rest unprocessed) 
                     (list (first unprocessed))
                     (if (empty? currstd) ;; base-case -- processing first standard 
                         empty
                         (append finishedstds (list currstd))))]))))

;; takes strings of form "num. text" and decomposes into two
;;   values, one for number and one for text.  If string
;;   doesn't have that form, returns #f and the original string
(define (extract-id-descr str)
  (let ([labeled? (regexp-match #rx"([0-9]+)\\.(.*)" str)])
    (if labeled?
        (values (string->number (second labeled?)) (third labeled?))
        (values #f str))))

;; converts the csv contents (as a list) into a tree of standards,
;;   learning objectives, and evidence statements.  Need to refine
;;   once KF and ES agree on the spreadsheet format
(define (csvlist-to-standards-tree csvlist)
  (let ([clusters (cluster-lines-by-firstcol csvlist)])
    (map (lambda (cluster)
           (make-standard 
            (caar cluster) (cadar cluster)
            (map (lambda (learnobj-cluster)
                   (let-values ([(id descr) (extract-id-descr (caar learnobj-cluster))])
                     (make-learnobj id descr
                                    (map (lambda (evstr coveragestr) 
                                           (let-values ([(id descr) (extract-id-descr evstr)])
                                             (make-evidstmt id descr coveragestr)))
                                         (map second learnobj-cluster) (map third learnobj-cluster)))))
                 (cluster-lines-by-firstcol (map cdr cluster)))))
         clusters)))

;; use rest to strip out the header line on the spreadsheet
(define standards-tree (csvlist-to-standards-tree (rest csv-raw)))  

;;;;; EXTRACT DATA FROM TREE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (find-std/tag tag)
  (let ([matches (filter (lambda (std) (string=? tag (standard-tag std))) 
                         standards-tree)])
    (if (empty? matches)
        (printf (format "WARNING: find-std/tag finds no standard for tag ~a~n" tag))
        (first matches))))

;; given a standard id-tag, extract the description string for that id
(define (get-standard-descr tag)
  (let ([std (find-std/tag tag)])
    (if (void? std) #f (standard-descr std))))

;; determine whether evidence statement is considered covered versus a list of coverage tags
;; uses string-trim to protect against whitespace in spreadsheet values
(define (evid-covered-by taglist)
  (lambda (e)
    (member (string-trim (evidstmt-coverage e)) taglist)))

;; return list of descriptions of all covered evidence statements
(define (get-evidence-descrs/coverage evidstmtlst coverage-tags)
  (map evidstmt-descr (filter (evid-covered-by coverage-tags) evidstmtlst)))

;; given standard id-tag, produce list of ((lobj (evidence ...) tag) ...) for that standard
;; optionally include tag name with lobj name (reasonable since spreadsheet conflates std and lobj)
(define (get-learnobj-tree std-tag 
                           #:include-tag [include-tag? #t] 
                           #:with-coverage [with-coverage (list "Y")])
  (let* ([std (find-std/tag std-tag)]
         [lobjs (if (void? std) '() (standard-learnobjs std))])
    (map (lambda (lobj)
           (list ;std-tag
                 (learnobj-descr lobj)
                 ;(if include-tag? 
                 ;    (format "~a: ~a" std-tag (learnobj-descr lobj))
                 ;    (learnobj-descr lobj))
                 (get-evidence-descrs/coverage (learnobj-evidence lobj) with-coverage)
                 std-tag))
         lobjs)))

;; returns evidence statement for given std string and numeric labels for 
;;   learning objective and evidence statement
(define (get-evid-statement std learnindex evidindex)
  (let ([report-problem (lambda (msg) (printf "WARNING: get-evid-stmt: ~a~n" msg) #f)]
        [lotree (get-learnobj-tree std)])
    (cond [(not lotree) (report-problem (format "no learning objectives for standard ~a" std))]
          [(or (< learnindex 1) (> learnindex (length lotree))) 
           (report-problem (format "no learning objective with index ~a for standard ~a" learnindex std))]
          [(or (< evidindex 1) (> evidindex (length (second (list-ref lotree (sub1 learnindex)))))) 
           (report-problem (format "no evidence statement with index ~a for standard ~a and objective ~a" 
                                   evidindex std learnindex))]
          [else (list-ref (second (list-ref lotree (sub1 learnindex))) (sub1 evidindex))])))

(define (get-evid-statment/tag evidtag)
  (let-values ([(std lonum esnum) (evidtag-data evidtag)])
    (if (not (or std lonum esnum)) #f
        (get-evid-statement std lonum esnum))))

;; the evidence tag list is coming in quoted, so need to remove the leading list operator
;;   if it is there
(define (get-evid-summary evidtag)
  (if (list? evidtag)
      (map get-evid-statment/tag (if (eq? 'list (first evidtag)) (rest evidtag) evidtag))
      (get-evid-statment/tag evidtag)))

;; an evidence tag has the form std&learnobj&evid, where learnobj and evid are numbers
(define evidtag-regexp #rx"(.+)&([0-9]+)&([0-9]+)")

;; returns values for the standard, learning objective number, and evidence number from a tag
;;   if the given string has the wrong format, returns #f
(define (evidtag-data evidtagstr)
  (let ([data (regexp-match evidtag-regexp evidtagstr)])
    (if data 
        (values (second data) (string->number (third data)) (string->number (fourth data)))
        (begin
          (printf "WARNING: malformed evidence tag ~a~n" evidtagstr)
          (values #f #f #f)))))

;;;;; ATTIC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; convert master spreadsheet to csv
;(system (format "cscript xls2csv.vbs ~a ~a" MASTER-SPREADSHEET MASTER-CSV))
;(define MASTER-CSVLIST (make-parameter #f))
