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
;;  As a result, we always generate the bs1 workbook, even when our
;;  current-course is set to bs2.
(define (kf-get-workbook-dir) (build-path courses-base (current-course) "resources" "workbook"))

(define (run-scribble scribble-file)
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

; combines all PDF filenames into a string with an optional dir prefixed
; used to create command-line arguments for system calls 
(define (pdflist-to-argstring pdfpages #:pdfdir [pdfdir (build-path (get-workbook-dir) "pages")])
  (apply string-append 
         (map (lambda (p) (string-append (path->string (build-path pdfdir p)) " ")) 
              pdfpages)))

; generate index of entire workbook by computing page sizes per PDF
(define (gen-wkbk-index pdfpages 
                        #:pdfdir [pdfdir (build-path (get-workbook-dir) "pages")] 
                        #:startpage [startpage 1]
                        #:indexfile [indexfile (build-path (get-workbook-dir) "workbook-index.rkt")]
                        )
  ; map and get pdf size, create pairs of page name and page number
  (let loop ([pages pdfpages] [nextpage startpage] [indexlist '()])
    (if (empty? pages) 
        (with-output-to-file #:exists 'replace indexfile (lambda () (pretty-print (reverse indexlist))))
        (let ([p (first pages)])
          (let* ([output (with-output-to-string 
                          (lambda () (system (format "pdftk ~a dump_data" 
                                                     (path->string (build-path pdfdir p))))))]
                 [match (regexp-match #px".*NumberOfPages: ([0-9]*).*" output)]
                 [numpages (if match (string->number (second match)) 
                               (error 'gen-wkbk-index 
                                      (format "regexp failed to find the number of pages for pdf ~a" p)))]
                 [pbasename (regexp-replace #px"\\.pdf" p "")])
            (loop (rest pages) (+ nextpage numpages) (cons (list pbasename nextpage) indexlist)))))))

; create a single PDF from the files named in pdfpages, output filename is optional
(define (merge-pages pdfpages 
                     #:pagesdir [pagesdir (build-path (get-workbook-dir) "pages")]
                     #:outputdir [outputdir (get-workbook-dir)]
                     #:output [output "workbook.pdf"])
  (system (format "pdftk ~a output ~a" 
                  (pdflist-to-argstring pdfpages #:pdfdir pagesdir)
                  (build-path outputdir output))))

;; the MAIN function to build the workbook
(define (build-workbook)
  (let ([pages (with-input-from-file (build-path (kf-get-workbook-dir) "contentlist.rkt") read)]
        [pagesdir (build-path (kf-get-workbook-dir) "pages")])
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
                          (system (format "wkhtmltopdf -q ~a ~a" 
                                          (path->string (build-path pagesdir fhtml))
                                          (path->string (build-path pagesdir fpdf)))))))
                    pages)
          (let* ([pdfpagenames (pdf-pagenames pages)])
            (gen-wkbk-index pdfpagenames)
            (merge-pages pdfpagenames)
            ; add page numbers to final PD
            )))))

(define bootstrap-courses '("bs1" "bs2"))
(for ([course (in-list bootstrap-courses)])
  (parameterize ([current-course course])
    (build-workbook)))