#lang racket
(require racket/runtime-path
         racket/system
         racket/string
         racket/cmdline
         racket/path
         racket/file
         "lib/translate-pdfs.rkt"
         "lib/paths.rkt"
         (lib "curr/lib/system-parameters.rkt")
         scribble/render
         file/zip)

;;;;;;;;; STUFF FROM OTHER FILES
       
(define (make-fresh-document-namespace)
  (define ns (make-base-namespace))
  (for ([mod shared-modules])
    (namespace-attach-module (namespace-anchor->namespace this-anchor) mod ns))
  ns)

(define-namespace-anchor this-anchor)
(define shared-modules (list 'scribble/render
                             '(lib "curr/lib/system-parameters.rkt")))

(define document-namespace (make-fresh-document-namespace))

(define (run-scribble scribble-file #:never-generate-pdf? [never-generate-pdf? #f]
                                    #:include-base-path? [include-base-path? #f])
  (define output-dir (cond [(current-deployment-dir)
                            ;; Rendering to a particular deployment directory.
                            (if include-base-path?
                                (let-values ([(base name dir?)
                                              (split-path
                                               (find-relative-path (simple-form-path root-path)
                                                                   (simple-form-path scribble-file)))])
                                            (simple-form-path (build-path (current-deployment-dir) base)))
                                (current-deployment-dir))]
                           [else
                            (error 'run-scribble "No deployment directory?")
                            ;; In-place rendering
                            #;(let-values ([(base name dir?)
                                            (split-path (simple-form-path scribble-file))])
                                base)]))
  (define-values (base name dir?) (split-path scribble-file))
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  (parameterize ([current-directory base]
                 [current-namespace document-namespace]
                 [current-document-output-path output-path])
      (printf "Current course is ~a~n" (current-course))

    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (list name)
            #:dest-dir output-dir)
    (when (and (not never-generate-pdf?) (current-generate-pdf?))
      (translate-html-to-pdf
       (build-path output-dir
                   (regexp-replace #px".scrbl$"
                                   (path->string name)
                                   ".html")))))
  (void))

;;;;;;;;;;;;;;

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
  (let ([pages (with-input-from-file (build-path (get-workbook-dir) "contentlist.rkt") read)]
        [pagesdir (build-path (get-workbook-dir) "pages")])
    (parameterize ([current-deployment-dir pagesdir])
      (printf "Current course is ~a~n" (current-course))
      (printf "Wkbk dir is ~a~n" (get-workbook-dir))
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
      )
    (let* ([pdfpagenames (pdf-pagenames pages)])
      (gen-wkbk-index pdfpagenames)
      (merge-pages pdfpagenames)
      ; add page numbers to final PD
      )))



(define bootstrap-courses '("bs1" "bs2"))
(for ([course (in-list bootstrap-courses)])
  (parameterize ([current-course course])
    (printf "Starting to generate ~a ~n" course)
    (build-workbook))) 