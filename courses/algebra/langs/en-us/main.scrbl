#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Algebra")

The Algebra Module, based on the Bootstrap:Algebra curriculum supports the introduction of computation design using structured diagramming and problem solving techniques. Students program their own video game by learning to solve a series of computational word problems. All of the learning in the Algebra module supports skills in Mathematics and on their state exams.

@(logosplash "../../splash.png" "AlgebraLogo.png")

@; workbook link names and targets

@(apply itemlist
        
         (for/list ([n (in-range 1 (add1 9))])
           (unit-summary/links n))
	
        #:style "BSUnitList"
 )
            
@(copyright)
}
