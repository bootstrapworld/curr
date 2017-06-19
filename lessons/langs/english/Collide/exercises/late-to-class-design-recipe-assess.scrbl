#lang curr/lib
@; Unit 8
@(assess-design-recipe "late-to-class?" 
                       "You will be late to class if you have to walk more than 25 pixels to get there. Write a function that takes in your x-coordinate and y-coordinate and the x-coordinate and y-coordinate of the classroom and returns true if you will be late to class and false if you will be on time."
                       #:domain-list (list "number" "number" "number" "number")
                       #:range "boolean"
                       #:purpose "Takes the coorindates of my location and a classroom and returns true if the distance is more than 25 and false if it is less than 25."                  
                       #:buggy-example-list '(((late-to-class? 40 55 65 80) (> 25 (distance 40 55 65 80)))
                                              ((late-to-class? 40 55 65 80) (< 25 (distance 40 55 65 80))))
                       #:param-list (list "student-x" "student-y" "school-x" "school-y")
                       #:body '((< 25 (distance student-x student-y school-x school-y)))
                       )
                       
                                
