#lang scribble/base
@(require "lib/all.rkt")

@title{Example}

@; Note: this document can be generated in different contexts.
@;
@; E.g.:    $ SCRIBBLE_TAGS=student scribble example.scrbl
@;      vs  $ SCRIBBLE_TAGS=teacher scribble example.scrbl
@;      vs  $ SCRIBBLE_TAGS="student teacher" scribble example.scrbl


@declare-tags[student teacher robot]

@declare-data-repository["bootstrap-data-repository.hashcollision.org"]



@image["bootstrap.gif"]

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@section{Conditional output}
Untagged content shows for everyone.

@tag[student]{
@subsection{For students}
This is a message that a stupendous student should be able to see.
}

@student{For syntactic convenience, each tag itself is bound to a form that does
the exclusion, like this.}


@tag[teacher]{
@subsection{For teachers}
This is a message that a terrific teacher can take in.
}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@tag[(student teacher)]{
@subsection{For either students or teachers}
This is a message that either a student or teacher can see.
A robot would not see this message, however.
}

@tag[teacher]{
    @tag[student]{
        @subsection{Only when both teacher and student tags are enabled}
        Hello world.
    }
}
@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


@section{Fill in the blank}

Here is a fill-in-the-blank: @fill-in-the-blank[#:id "first-example"].

And another: @fill-in-the-blank[#:id "first-name"
                                #:label "First name"
                                #:columns 90]
@fill-in-the-blank[#:id "last-name"
                                #:label "Last name"
                                #:columns 90].



@section{Free response}
This is a free-response: @free-response[#:id "mytext"].




@section{Embedded wescheme}
This is an embedded-wescheme instance:
@embedded-wescheme[#:id "example1"
                   #:public-id "champ-neigh-stoop-sinew-overt"
                   #:width "70%"]


Here is another one:
@embedded-wescheme[#:id "example3"
                   #:interactions-text "(+ 1 2 3)"
                   #:hide-header? #t
                   #:hide-footer? #t
                   #:hide-definitions? #t]

@section{Think-Abouts}

Here are four think-abouts, with various parts optional

@think-about[#:question "How did I make this"
             #:answer "With Scribble, of course!"]

@think-about[#:question "Where's the nearest exit"
             #:hint "Look for a door"]

@think-about[#:question "What is the meaning of life?"]

@think-about[#:question "No, really, what is the meaning of life?"
             #:hint "The answer isn't prime"
             #:answer "42"]

@section{Code}

Here is some formatted code

@code{
      (+ 2 3)
      (* 4 5)
}

And one with a contract

@code[#:contract "foo: number -> number"]{
  (define (foo b)
     (+ 4 b 7))
}
      
And one with contract and purpose

@code[#:contract "foo: number -> number"
      #:purpose "testing my code"]{
  (define (foo b)
     (+ 4 b 7))
}

How about a contract only?

@code[#:contract "circle : number string number"]{}

@section{Parts of the curriculum}

Here is a 
@(hyperlink "http://www.bootstrap-world.org/" "link")

@lesson[#:title "getting started"
        #:duration "10 minutes"] {
   In this lesson, we'll learn some stuff
}

@worksheet{
  This is an example of a worksheet.  It's a section of the document.

  What do you see here?
}




@worksheet{
  This is an example of another worksheet.

  @materials[
    @item{Rock}
    @item{Paper}
    @item{Scissors}
  ]

  @row[#:count 5]{@(number->string (add1 (current-row)))
                  @fill-in-the-blank[#:id "name" #:label "name"] 
                  @fill-in-the-blank[#:id "contract" #:label "contract"]
                 }

}

@exercise{
  Here is something for you to do now.
}

@demo{
  Here we want to show you something.
}

@skit{
  Time to sing and dance, everyone!
}

@review{
  Who can tell me what we learned today?
  Scribble, scrabble
  }

@section{Lists with Specific Titles}

@goals[
@item{Plant a flower}
@item{Pack suitcase}
@item{Go home}
]

@objectives[
@item{Test Scribble}
@item{Upload to PLaneT}
@item{Go home}
]

@product-outcomes[
@item{learn this}
@item{and this}
]

@preparation[
@item{prepare this}
@item{and this}
]

@section{Tables}

A language table showing how to include code in cells

@(language-table (list @code{(+ 4 5)} "forth") 
                 (list "and" @code{conquer})
                 (list "this and" "that")
                 (list @code{she stoops to} "conquer")
                 )

