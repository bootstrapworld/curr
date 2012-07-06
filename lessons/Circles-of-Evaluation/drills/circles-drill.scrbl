#lang curr/lib

@drill[]{
Get out a pencil and a piece of paper and draw the Circles of Evaluation for each mathematical expression. Then fill in the corresponding Racket expression in the blank, and check your answer.
  @itemlist[
     @item{3 * (2 + 4) @fill-in-the-blank[#:id "Circles-Eval1"] @check[(constraint:string-eq (value:string "(* 3 (+ 2 4))") (value:form "Circles-Eval1"))]}
     @item{(5 - 1) / 2 @fill-in-the-blank[#:id "Circles-Eval2"] @check[(constraint:string-eq (value:string "(/ (- 5 1) 2)") (value:form "Circles-Eval2"))]}
     @item{(1 + 2) * (3 + 4) @fill-in-the-blank[#:id "Circles-Eval3"] @check[(constraint:string-eq (value:string "(* (+ 1 2)(+ 3 4))") (value:form "Circles-Eval3"))]}
     @item{3 * ((4 + 3) - 2) @fill-in-the-blank[#:id "Circles-Eval4"] @check[(constraint:string-eq (value:string "(* 3 (- (+ 4 3) 2))") (value:form "Circles-Eval4"))]}
      ]}