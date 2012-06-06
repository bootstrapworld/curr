#lang scribble/base

@(require scribble/manual
          planet/scribble
          (for-label (this-package-in lang)
                     scribble/base))


@title{A guide to the @racketmodname/this-package[main] Scribble library}

@author+email["Danny Yoo" "dyoo@hashcollision.org"]


@declare-exporting/this-package[lang]

The @racketmodname/this-package[main] library provides preliminary Scribble
document support for the @link["http://bootstrapworld.org"]{Bootstrap}
curriculum.  Specifically, it allows documents to include conditional content
(e.g. generating content for teachers or students), as well as commands to
embed forms and embedded WeScheme instances.

It will eventually include support for validating the content of these forms,
as well as saving the contents of the form to server-side storage.



@section{Getting started}
Let's start with the following document:

@filebox["example.scrbl"]{
@codeblock|{
#lang planet dyoo/scribble-bootstrap
@title{Example}
This is a Scribble document that includes conditional output.

@;; Let us declare the following tags.
@declare-tags[reading instruction pedagogy exercise skit]

@;; We can tag certain content to be generated conditionally:
@tag[reading]{This is text for reading.}

@tag[instruction]{
  This is text for instruction.
  @tag[pedagogy]{This is text for pedagogy.}}
}|}


We can then generate different renderings of this document based on the
audience, by using a @tt{SCRIBBLE_TAGS} environmental variable to provide the
necessary context.

For example, at the Unix command line:
@nested[#:style 'inset]{
@verbatim|{
$ SCRIBBLE_TAGS=reading scribble example.scrbl
}|}

should generate the file @filepath{example.html} with content for readers.

We can generate the code in an instructional context:
@nested[#:style 'inset]{@verbatim|{
$ SCRIBBLE_TAGS=instruction scribble example.scrbl
}|}
which omits the content for the reading context, and also excludes the 
pedagogic content.


To generate content that shows for both instruction and pedagogy, use quotes
(@litchar{"}) so the Unix shell allows you to assign multiple tags into
@tt{SCRIBBLE_TAGS}:

@nested[#:style 'inset]{
@verbatim|{
$ SCRIBBLE_TAGS="instruction pedagogy" scribble \
    example.scrbl
}|}
will show the content for both instruction and pedagogy.



@section{API}

The @racketmodname/this-package[main] library includes a Scribble-based
language that provides all the bindings of @racketmodname[scribble/base], as
well as the following forms:



@defform[(declare-tags tags ...)]{

Declares the set of tags that will be used in this document.  Any use of
@racket[tag] later in the document will verify that the tags have already been
declared in a @racket[declare-tags].

For example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap

@declare-tags[instruction pedagogy example]

}|
}




@defform[(tag tags body ...)]{

This form acts as an ifdef, and blocks off a section of the scribble document
with a tag.  Its content shows only in a context that includes the given tag.

For example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap
@declare-tags[student teacher]

@tag[student]{Can be seen by student.}
@tag[teacher]{Can be seen by teacher.}
}|



A section can be tagged with multiple tags at a time by providing a parenthesized
list of tags.

@verbatim|{
@tag[(student teacher)]{Can be seen by both students and teachers.}
}|

This acts as as a union: if the document is generated in a context including
any of the tags, then it will be rendered.



Nested tags act as intersection.  For example:
@codeblock|{
  @tag[teacher]{
    @tag[student]{
        Hello world.
    }
  }
}|
should generate no content unless both the @racket[teacher] and
@racket[student] tags are in play.


Using @racket[tag] with a tag that hasn't been previously declared with
@racket[declare-tags] is a compile-time error.


Tagged content will be generated during Scribble-generation time if the
@litchar{SCRIBBLE_TAGS} environmental variable includes them.  For example:
@nested[#:style 'inset]{
@verbatim|{
$ SCRIBBLE_TAGS=reading scribble example.scrbl
}|}
generates @filepath{example.scrbl} in a context that enables tagged content using the @tt{reading} tag.
}




@defproc[(fill-in-the-blank [#:id id string?]
                            [#:columns columns number? 50]
                            [#:label label (or/c string? #f) #f])
         element?]{

Creates an empty one-line text element.  The @racket[#:columns] allows
customization of the number of columns of the element.  The @racket[#:label]
element shows placeholder text content when the element is empty.


Example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap
This is a fill in the blank: @fill-in-the-blank[#:id "name" 
                                                #:label "What's your name?"]
}|
}



@defproc[(free-response [#:id id string?]
                        [#:columns columns number? 50]
                        [#:rows rows number? 20]
                        [#:label label (or/c string? #f) #f])
         element?]{
Creates an empty multi-line element.  The @racket[#:columns] and
@racket[#:rows] keywords allow customization of the number of columns and
rows of the element.  The @racket[#:label] element shows placeholder text
content when the element is empty.

Example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap
This is a free-response: @free-response[#:id "summary"]
}|
}





@defproc[(embedded-wescheme [#:id id string?]
                            [#:width width (or/c number string?) "90%"]
                            [#:height height (or/c number string?) "500px"]

                            [#:public-id pid (or/c string? #f) #f]
                            [#:interactions-text interactions-text (or/c string #f) #f]

                            [#:hide-header? hide-header boolean? #f]
                            [#:hide-footer? hide-footer boolean? #t]
                            [#:hide-definitions? hide-definitions? boolean? #f])
         element?]{
Creates an embedded WeScheme instance.  The keywords @racket[#:width] and
@racket[#:height] control the dimensions of the embedded instance.

If provided a @racket[#:public-id], the embedded instance will load the
published WeScheme program with that id.

If provided a @racket[#:interactions-text], the embedded instance will
initialize the interactions window with the given string.


For example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap
@embedded-wescheme[#:id "example3"
                   #:interactions-text "(+ 1 2 3)"
                   #:hide-header? #t
                   #:hide-footer? #t
                   #:hide-definitions? #t]
}|
}




@defform[(row #:count [count number?] body ...)]{
Creates a number of rows with the same content across the body.

For example, the following generates five rows of name/contract
@racket[fill-in-the-blank] fields:
@codeblock|{
#lang planet dyoo/scribble-bootstrap
@row[#:count 5]{@fill-in-the-blank[#:id "name" #:label "name"] 
                @fill-in-the-blank[#:id "contract" #:label "contract"]} 
}|


In the context of a @racket[row], the parameter @racket[current-row] can be
dereferenced to get the current row number.
@codeblock|{
#lang planet dyoo/scribble-bootstrap
@row[#:count 5]{@(number->string (add1 (current-row)))
                @fill-in-the-blank[#:id "name" #:label "name"] 
                @fill-in-the-blank[#:id "contract" #:label "contract"]
               }
}|
}

@defthing[current-row (parameterof (or/c number? #f))]{
The current row number.  Counting starts from zero.  Outside the context
of a @racket[row], defined as @racket[#f].
}





@defproc[(worksheet [body (listof pre-flow?)] ...) element]{
Construct a worksheet.

For example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap

@worksheet{
This is a worksheet.

Here are a few fields: @fill-in-the-blank[#:id "f1"]
}

}|

The selection will have the CSS style @litchar{BootstrapWorksheet}.

}



@defproc[(lesson [body (listof pre-flow?)] ...) element]{
Construct a lesson.

For example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap

@lesson{
This is a lesson.

Here are a few fields: @fill-in-the-blank[#:id "f1"]
}

}|

The selection will have the CSS style @litchar{BootstrapLesson}.

}




@defproc[(drill [body (listof pre-flow?)] ...) element?]{
Construct a drill.

For example:
@codeblock|{
#lang planet dyoo/scribble-bootstrap

@drill{
This is a drill.

Here are a few fields: @fill-in-the-blank[#:id "f1"]
}

}|

The selection will have the CSS style @litchar{BootstrapDrill}.

}




@defproc[(materials [items (listof item?)] ...) element?]{
An @racket[itemlist] that collects a point-itemized list of material items.

For example:

@codeblock|{
#lang planet dyoo/scribble-bootstrap

@materials[@item{Rock}
           @item{Paper}
           @item{Scissors}
          ]
}|

The list will have the CSS style @litchar{BootstrapMaterialsList}, and each item will
have the CSS style @litchar{BootstrapMaterialsListItem}.

}




@defproc[(goals [items (listof item?)] ...) element?]{
An @racket[itemlist] that collects a point-itemized list of goal items.

For example:

@codeblock|{
#lang planet dyoo/scribble-bootstrap

@goals[@item{Eat}
       @item{Sleep}
       @item{Study}
      ]
}|

The list will have the CSS style @litchar{BootstrapGoalsList}, and each item will
have the CSS style @litchar{BootstrapGoalsListItem}.

}





@section{Caveats}

At the moment, the conditional tag logic is performed at compile-time rather
than run-time.  This means that if you compile a @filepath{.scrbl} file with
@litchar{raco make}, that decision has been committed to the bytecode, so that
if you re-render the document, @litchar{scribble} does not revisit the choice.


Scribble itself uses the term "tag" as a mechanism for cross-referencing and
linking.  The bootstrap support's use of the "tag" term is not the same.  (We
may want to use different terminology to avoid this conflict.)