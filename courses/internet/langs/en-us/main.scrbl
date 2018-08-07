#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Internet")

The Internet module explores the structures and protocols that enable the Internet. We look at how programs can generate structured documents and how messages are sent and received using the Internet.

@; workbook link names and targets

@(apply itemlist
        (append
         (for/list ([n (in-range 1 (add1 1))])
           (unit-summary/links n))
         )
         #:style "BSUnitList"
)


            
@(copyright)
}
