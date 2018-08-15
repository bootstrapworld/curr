#lang curr/lib

@title{Unit 1: Videogames & Coordinate Planes}


@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
  @unit-descr{The Internet module explores the structures and protocols that enable the Internet. We look at how programs can generate structured documents and how messages are sent and received using the Internet.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Intro"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket with the 
                                   bootstrap-teachpack installed}
                           @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbooks"], and something to write with}
                            @item{Class poster (List of rules, language table, course calendar)}
                           @item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Dog"]
                                 and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
                                 @item{Overhead projector}]

     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1USFPXkeO5AbGOzm_U0tMv4NV3RrxTMTyg-bqIKUf4q4/edit?usp=sharing" "Warmup activity sheet")}
     
                             @item{"NinjaCat" [NinjaCat.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] (If using DrRacket) | @(hyperlink "http://www.wescheme.org/view?publicId=sggzRzgU5T" "WeScheme")] preloaded on students' machines}
                              @item{OPTIONAL: @(hyperlink "https://quizizz.com/admin/quiz/5a146afd3b4ad115000fcb57?from=quizEditor" "Quizizz Unit 1 Review Quiz")}
                             @item{OPTIONAL: @(hyperlink "https://teacher.desmos.com/activitybuilder/custom/5a15e2388c08800a6024c091" "Desmos Activity: Unit 1 Review - Circles of Evalation & Code Practice")}
                             @item{OPTIONAL: @(hyperlink "https://teacher.desmos.com/activitybuilder/custom/5a1c805bbfc8c40614d3904a" "Desmos Activity: Circles of Evaluation & Code Practice(Blank Template)")}
                              ]
     
     
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{@student[#:title "Welcome to Bootstrap!"]{@noSlideText{Welcome to Bootstrap!} In this course, you'll be learning a new @vocab{programming language} - a way to tell computers exactly what you want them to do. @noSlideText{Just like English, Spanish or French, a programming language has its own vocabulary and grammar that you'll have to learn. Fortunately, the language you'll be using here has a lot in common with simple math that you already know!}}
                     @teacher{Set expectations and rules for the class.
                              
                              Connect the material to come with things students already know:
                              @itemlist[@item{What makes a language? Do some students already speak more than one language?}
                                         @item{Programming is very much a language, with its own syntax, semantics, etc}
                                         @item{Ask students about their favorite videogames. Be open about the scale of a modern game: they cost millions of dollars, are built by huge teams of programmers and artists, and are developed over years.}
                                         @item{Set expectations about what can be accomplished in a single, introductory programming class.}]}
                     }
              ]
         }
}
