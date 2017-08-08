#lang curr/lib

@title{The Distance Formula, with Numbers}
@worksheet{
     The distance between the points (4, 0) and (0, 3) is given by:
     
     @bitmap{images/distance-formula.png}
     
     Now get a piece of paper and a pencil, and convert it into a Circle of Evaluation.
     
     Convert it into Racket code:
     
     @free-response[#:id "code" #:answer "(sqrt (+ (sq (line-length 4 0)) (sq (line-length 3 0))))"]
     
     }
