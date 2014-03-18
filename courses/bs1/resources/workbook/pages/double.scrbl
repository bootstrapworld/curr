#lang curr/lib

@; this is a sample of a standalone design-recipe worksheet for Bootstrap
@; all of the component arguments and their show configurations are optional
@;  - omitted or unspecified components are simply generated with blank lines
@; if a component is specified, but its show is omitted, it will not be generated
@; these defaults might make it easier to generate a solutions version later

@(design-recipe-exercise "double" "Write a function called double that consumes a number and multiplies it by 2." 
                         #:show-funname-contract? #t
                         #:domain-list (list "Number")
                         #:show-domains? #t
                         #:range "Number"
                         #:show-range? #t
                         #:purpose "multiply given number by 2"
                         #:show-purpose? #t
                         #:num-examples 3
                         #:example-list '((5 (* 5 2)))
                         #:show-examples '((#t #f #f))
                         #:show-funname-defn? #t
                         #:param-list (list "x")
                         #:show-params? #t
                         #:body "(* x 2)"
                         #:show-body? #t
                         )