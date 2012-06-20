#lang curr/lib

@drill[]{
  @itemlist[
     @item{Evaluate the following expressions and check your answers.}
     @item{(+ 3 (* 2 4)) @fill-in-the-blank[#:id "Circles-Eval1"] @check[(constraint:string-eq (value:string "11") (value:form "Circles-Eval1"))]}
     @item{(/ (- 5 1) 2) @fill-in-the-blank[#:id "Circles-Eval2"] @check[(constraint:string-eq (value:string "2") (value:form "Circles-Eval2"))]}
     @item{(* (+ 1 2)(+ 3 4)) @fill-in-the-blank[#:id "Circles-Eval3"] @check[(constraint:string-eq (value:string "21") (value:form "Circles-Eval3"))]}
     @item{Challenge question! @linebreak[]
           (* 3 (- (+ 4 3) 2)) @fill-in-the-blank[#:id "Circles-Eval4"] @check[(constraint:string-eq (value:string "15") (value:form "Circles-Eval4"))]}
      ]}