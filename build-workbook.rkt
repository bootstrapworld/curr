#!/usr/bin/env racket
#lang racket
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         "lib/paths.rkt"
         (lib "curr/lib/system-parameters.rkt")
         scribble/render
         file/zip)

;; NOTE: This defn is a hack.  Ideally, we should be using the
;;  get-workbook-dir function from paths.rkt.  However, that is
;;  capturing a binding for the current-course parameter that
;;  I haven't figured out how to access when setting the current-course.
;;  As a result, we'd always generate the bs1 workbook, even when our
;;  current-course is set to bs2.
(define (kf-get-workbook-dir) (build-path courses-base (current-course) "resources" "workbook"))

(define (run-scribble scribble-file)
  (printf "Scribbling ~a~n" scribble-file)
  (define output-dir (current-deployment-dir))
  (define-values (base name dir?) (split-path scribble-file))
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  (parameterize ([current-directory base]
                 [current-document-output-path output-path])
    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (list name)
            #:dest-dir output-dir))
  (void))

; converts list of pages to having all pdf extensions
(define (pdf-pagenames pages)
  (map (lambda (p) (regexp-replace #px"\\.scrbl$" p ".pdf")) pages))

; cross-platform helper for locating executables.  Looks for progname with and without .exe extension
(define (get-prog-cmd progname)
 (let ([progpath (or (find-executable-path progname) 
                     (find-executable-path (string-append progname ".exe")))])
   (if progpath progpath
       (error (format "Unable to find program ~a~n" progname)))))

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
                           (list "output" output))])
      (apply system* (cons (get-prog-cmd "pdftk") arglist)))))

;; invoke latex to add page numbers to the document
(define (add-pagenums)
  (parameterize ([current-directory (kf-get-workbook-dir)])
    (system*/exit-code (get-prog-cmd "pdflatex") "workbook.tex")))

; report on any contentlist.rkt files that don't actually exist in filesystem
; remove non-existing files so that rest of build process works on clean data
(define (check-contents-exist ctlist basedir)
  (let ([missing (filter (lambda (f) (not (file-exists? (build-path basedir f)))) ctlist)])
    (if (empty? missing) ctlist
        (begin
          (printf "Content list references missing files ~a ~n" missing)
          (filter (lambda (f) (file-exists? (build-path basedir f))) ctlist)))))

;; delete files if they are present.  Arg can be a single path or a list of paths
(define (delete-if-exists files)
  (for-each (lambda (f)
              (when (file-exists? f)
                (delete-file f)))
            (if (list? files) files (list files))))

;; the MAIN function to build the workbook
(define (build-workbook)
  (let* ([pages-spec (with-input-from-file (build-path (kf-get-workbook-dir) "contentlist.rkt") read)]
         [pagesdir (build-path (kf-get-workbook-dir) "pages")]
         [pages (check-contents-exist pages-spec pagesdir)])
    (if (empty? pages)
        (printf "WARNING: Empty workbook contents for ~a, no workbook generated~n" (current-course))
        (parameterize ([current-deployment-dir pagesdir])
          ; scribble the scrbl pages and run wkhtmltopdf on the resulting html
          (for-each (lambda (f)
                      (when (regexp-match #px".*\\.scrbl$" f)
                        (run-scribble (build-path pagesdir f))
                        (let ([fhtml (regexp-replace #px"\\.scrbl$" f ".html")]
                              [fpdf (regexp-replace #px"\\.scrbl$" f ".pdf")])
                          ; -q option is for "quiet" operation
                          (system (format "wkhtmltopdf --print-media-type -q ~a ~a" 
                                          (path->string (build-path pagesdir fhtml))
                                          (path->string (build-path pagesdir fpdf)))))))
                    pages)
          (let* ([pdfpagenames (pdf-pagenames pages)])
            (gen-wkbk-index pdfpagenames)
            (merge-pages pdfpagenames)
            ; add page numbers to final PD
            (add-pagenums)
            ; clean out auxiliary tex files (ie, texwipe, intermed no page nums file)
            (delete-if-exists (list (build-path (kf-get-workbook-dir) "workbook.aux")
                                    (build-path (kf-get-workbook-dir) "workbook.log")))
            )))))



(define bootstrap-courses '("bs1" "bs2"))

; use this to tell scribble to use the workbook.css file
(putenv "BOOTSTRAP-TARGET" "workbook")

(for ([course (in-list bootstrap-courses)])
  (parameterize ([current-course course])
    (build-workbook)))