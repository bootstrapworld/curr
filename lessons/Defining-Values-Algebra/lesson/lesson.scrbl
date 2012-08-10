#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Defining Values"
        #:duration "10 minutes"
        ]{
  @itemlist/splicing[
            @tag[pedagogy]{@item{For this activity write all Racket expressions on one side of the board, and all algebra expressions on the other.}}
            @item{In our programming language, we defined values this way: @code{(define x 4)}}
            @item{I can even define values in terms of values that came before: @code{(define y (+ x 10))}}
            @item{I want a volunteer who can define another value for me.} @tag[pedagogy]{@item{Copy their answers as you go. Encourage students to define values in terms of other ones.}}
            @item{In math class, you define values using the equals sign: @code{x = 4}}
            @tag[pedagogy]{@item{Write this on the other side of the board.}}
            @item{And, as with our programming language, you can define values in terms of other values: @code{y = x + 10}}
            @item{Turn to page 37 in your workbooks. You will see a bunch of value definitions written in code - take 2 minutes to convert this into math. GO!}
            
            ]}

