#!/usr/bin/env racket
#lang racket

;; This is the build file for the workbook.  This script assumes:
;; that courses/*/resources/workbook contains:
;;   - a file contentlist.rkt with the contents of the numbered portion
;;     (this file contains a list of scrbl and pdf filenames)
;;   - a file frontmatterlist.rkt with the contents of the unnumbered portion
;;     that will appear at the front of the workbook
;;   - a pages directory containing the files named in contentlist.rkt and frontmatterlist.rkt

(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         "lib/paths.rkt"
         "lib/system-parameters.rkt"
         "lib/scribble-pdf-helpers.rkt"
         "lib/build-modes.rkt"
         scribble/render
         file/zip)

;; NOTE: This defn is a hack.  Ideally, we should be using the
;;  get-workbook-dir function from paths.rkt.  However, that is
;;  capturing a binding for the current-course parameter that
;;  I haven't figured out how to access when setting the current-course.
;;  As a result, we'd always generate the algebra workbook, even when our
;;  current-course is set to reactive.
(define (kf-get-workbook-dir) (build-path courses-base (current-course) "resources" "workbook"))

; converts list of pages to having all pdf extensions
(define (pdf-pagenames pages)
  (map (lambda (p) 
         (if (string? p) 
             (regexp-replace #px"\\.scrbl$" p ".pdf")
             (string-append (second p) ".pdf")))
       pages))

; generate index of entire workbook by computing page sizes per PDF
(define (gen-wkbk-index pdfpages 
                        #:pdfdir [pdfdir (build-path (get-workbook-dir) "pages")] 
                        #:startpage [startpage 1]
                        #:indexfile [indexfile (build-path (get-workbook-dir) "workbook-index.rkt")]
                        )
  ; map and get pdf size, create pairs of page name and page number
  (let loop ([pages pdfpages] [nextpage startpage] [indexlist '()])
    (if (empty? pages) 
        (with-output-to-file #:exists 'replace indexfile 
          (lambda ()
            (printf ";; This file is generated automatically.  DO NOT EDIT IT MANUALLY!~n~n")
            (write (reverse indexlist))))
        (let ([p (first pages)])
          (let* ([output (with-output-to-string 
                          (lambda () (system* (get-prog-cmd "pdftk") (build-path pdfdir p) "dump_data")))]
                 [match (regexp-match #px".*NumberOfPages: ([0-9]*).*" output)]
                 [numpages (if match (string->number (second match)) 
                               (error 'gen-wkbk-index 
                                      (format "regexp failed to find the number of pages for pdf ~a" p)))]
                 [pbasename (regexp-replace #px"\\.pdf" p "")])
            (loop (rest pages) (+ nextpage numpages) (cons (list pbasename nextpage) indexlist)))))))

; create a single PDF from the files named in pdfpages, output filename is optional
(define (merge-pages pdfpages 
                     #:pagesdir [pagesdir (build-path (kf-get-workbook-dir) "pages")]
                     #:outputdir [outputdir (kf-get-workbook-dir)]
                     #:output [output "workbook-no-pagenums.pdf"])
  (parameterize ([current-directory (kf-get-workbook-dir)])
    (let ([arglist (append (map (lambda (f) (build-path "pages" f)) pdfpages)
                           (list "output" output "dont_ask"))])
      (apply system* (cons (get-prog-cmd "pdftk") arglist)))))

;; invoke latex to add page numbers to the document
(define (add-pagenums)
  (parameterize ([current-directory (kf-get-workbook-dir)])
    (system*/exit-code (get-prog-cmd "pdflatex") "workbook-numbered.tex")))

; report on any contentlist.rkt files that don't actually exist in filesystem
; remove non-existing files so that rest of build process works on clean data
; each element of ctlist is either a filename or a pair with a filename in the first position
(define (check-contents-exist ctlist basedir)
  (let ([havefile? (lambda (f) 
                     (if (string? f) 
                         (file-exists? (build-path basedir f))
                         (file-exists? (build-path basedir 'up (first f)))))])
    (let ([missing (filter (lambda (f) (not (havefile? f))) ctlist)])
      (if (empty? missing) ctlist
          (begin
            (printf "Pages listing references missing files ~a ~n" missing)
            (filter havefile? ctlist))))))

;; delete files if they are present.  Arg can be a single path or a list of paths
(define (delete-if-exists files)
  (for-each (lambda (f)
              (when (file-exists? f)
                (delete-file f)))
            (if (list? files) files (list files))))

;; get the page number associated with given pagename in manualpages-index.rkt
(define (get-manual-page pagename)
  (let ([pageindex (with-input-from-file (build-path (kf-get-workbook-dir) "manualpages-index.rkt") read)])
    (let ([pageinfo (assoc pagename pageindex)])
      (if pageinfo (second pageinfo)
          (error 'get-manual-page "No manual page entry for page name ~a" pagename)))))

;; in solutions mode, want to extract page from the solutions version of the file
;; solutions files, when they exist will have "Sols" as the last part of the base filename
(define (source-pdf/sols-mode filename)
  (if (solutions-mode?)
      (let* ([fileparts (string-split filename ".")]
             [solsfile (string-append (first fileparts) "Sols" "." (second fileparts))])
        (if (file-exists? (build-path (kf-get-workbook-dir) solsfile)) solsfile filename))
      filename))

;; extract single PDF pages for each page due to pull from an existing PDF file
;; assumes existing PDF file is in workbook directory
;; wkbk-mod-sec could be #f if the previous workbook file is not available
(define (extract-PDF-pages pages wkbk-mod-sec)
  (parameterize ([current-directory (kf-get-workbook-dir)])
    (for-each (lambda (pspec)
                (when (and (list? pspec)
                           (or #t
                               (not (file-exists? (build-path "pages" (string-append (second pspec) ".pdf"))))
                               (not wkbk-mod-sec)
                               (< wkbk-mod-sec (file-or-directory-modify-seconds (first pspec)))
                               (and (solutions-mode?) 
                                    (< wkbk-mod-sec (file-or-directory-modify-seconds (source-pdf/sols-mode (first pspec)))))
                               (< wkbk-mod-sec (file-or-directory-modify-seconds "manualpages-index.rkt"))
                               ))
                  (printf "Extracting PDF for ~a from ~a~n" pspec (current-directory))
                  (let* ([fromfile (source-pdf/sols-mode (first pspec))]
                         [tofile (second pspec)]
                         [loc (get-manual-page tofile)])
                    (system* (get-prog-cmd "pdftk") fromfile "cat" (format "~a" loc) 
                             "output" (format "pages/~a.pdf" tofile) "dont_ask"))))
              pages)))

;; the MAIN function to build the workbook
(define (build-workbook)
  (let* ([pages-spec (with-input-from-file (build-path (kf-get-workbook-dir) "contentlist.rkt") read)]
         [front-spec (with-input-from-file (build-path (kf-get-workbook-dir) "frontmatterlist.rkt") read)]
         [back-spec (with-input-from-file (build-path (kf-get-workbook-dir) "backmatterlist.rkt") read)]
         [pagesdir (build-path (kf-get-workbook-dir) "pages")]
         [pages (check-contents-exist pages-spec pagesdir)]
         [frontpages (check-contents-exist front-spec pagesdir)]
         [backpages (check-contents-exist back-spec pagesdir)]
         [workbook-file (if (solutions-mode?) "workbooksols.pdf" "workbook.pdf")]
         [workbook-last-gen-sec 
          (if (file-exists? (build-path (kf-get-workbook-dir) workbook-file))
              (file-or-directory-modify-seconds (build-path (kf-get-workbook-dir) workbook-file))
              #f)]
         )
    (if (empty? pages)
        (printf "WARNING: Empty workbook contents for ~a, no workbook generated~n" (current-course))
        (parameterize ([current-deployment-dir pagesdir])
          ; scribble the scrbl pages and run wkhtmltopdf on the resulting html
          (scribble-files pages pagesdir workbook-last-gen-sec)
          ; extract any manual PDF pages from their source file
          (extract-PDF-pages pages workbook-last-gen-sec)
          (let* ([pdfpagenames (pdf-pagenames pages)])
            (gen-wkbk-index pdfpagenames)
            (merge-pages pdfpagenames)
            (add-pagenums)
            ; add front and back pages
	    ; current assumes both or neither front/back pages -- can adjust later if needed
            (if (and (empty? frontpages) (empty? backpages))
                (copy-file (build-path (kf-get-workbook-dir) "workbook-numbered.pdf")
                           (build-path (kf-get-workbook-dir) workbook-file)
                           #:exists-ok? #t)
                (begin (extract-PDF-pages frontpages workbook-last-gen-sec)
                       (merge-pages (pdf-pagenames frontpages) #:output "front-matter.pdf")
                       (extract-PDF-pages backpages workbook-last-gen-sec)
                       (merge-pages (pdf-pagenames backpages) #:output "back-matter.pdf")
                       (let ([frontpdf (build-path (kf-get-workbook-dir) "front-matter.pdf")]
                             [backpdf (build-path (kf-get-workbook-dir) "back-matter.pdf")]
                             [workbooknums (build-path (kf-get-workbook-dir) "workbook-numbered.pdf")]
                             [workbook (build-path (kf-get-workbook-dir) workbook-file)])
                         (system* (get-prog-cmd "pdftk") frontpdf workbooknums backpdf "output" workbook "dont_ask"))))
            ; clean out auxiliary tex files (ie, texwipe, intermed no page nums file)
            (delete-if-exists (list (build-path (kf-get-workbook-dir) "workbook-numbered.aux")
                                    (build-path (kf-get-workbook-dir) "workbook-numbered.log")
                                    (build-path (kf-get-workbook-dir) "workbook-numbered.pdf")
                                    (build-path (kf-get-workbook-dir) "workbook-no-pagenums.pdf")
                                    ))
            )))))


<<<<<<< HEAD
; for now, only bs1 is set up for auto-building
(define bootstrap-courses '("data-science"))
=======
; for now, only algebra is set up for auto-building
(define bootstrap-courses '("algebra" "reactive"))
>>>>>>> ce48862221f4bff438c64b2419c158b9901d817d

; use this to tell scribble to use the workbook.css file
(putenv "BOOTSTRAP-TARGET" "workbook")

; by default, generate student workbook, not solutions workbook
(solutions-mode-off)

; parse command-line arguments
(command-line #:program "build-workbook"
              #:once-each
              [("--solutions") "Generate workbook with solutions"
                               (solutions-mode-on)])

; is there a workbook to build?
(define (workbook-to-build?)
  (let ([contentlistfile (build-path (kf-get-workbook-dir) "contentlist.rkt")]) 
    (printf "checking ~a~n" contentlistfile)
    (and (file-exists? contentlistfile)
         (cons? (with-input-from-file contentlistfile read)))))

(printf "Building workbook (solutions-mode is ~a) ~n" (solutions-mode?))
(for ([course (in-list bootstrap-courses)])
  (parameterize ([current-course course])
    (if (workbook-to-build?)
        (build-workbook)
        ; else need to setup file named workbook.pdf in order for distribution build to work
        ; assuming that master file is called StudentWorkbook.pdf
        (unless (file-exists? (build-path (kf-get-workbook-dir) "workbook.pdf"))
          (copy-file (build-path (kf-get-workbook-dir) "StudentWorkbook.pdf")
                     (build-path (kf-get-workbook-dir) "workbook.pdf")
                     #t)))))