#lang curr/lib
@;put in differently, since segment not a whole page
@(elem #:style "BSCourseName" "BS1 Course Materials")

Start teaching Bootstrap today, and 
@(hyperlink "https://docs.google.com/a/brown.edu/spreadsheet/viewform?formkey=dEJSZzNIdk5TekthRVJ6N2oyTlItZHc6MQ#gid=0" "be counted!") 
We'll make sure to keep you updated on curricular changes, Bootstrap events, and workshops in your area!

Curious about how Bootstrap aligns with the math standards in your area? 
Our @(hyperlink "https://spreadsheets.google.com/a/brown.edu/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Standards Matrix") 
compares each lesson to a variety of state standards, as well as the new Common Core Standards.

@; workbook link names and styling inside the item

@(apply itemlist
        (append
         (list (summary-item/links "Student Workbook" "FIXME" "The lesson plans linked below are tightly integrated into the Student Workbook, which should be used with the curriculum. A Teacher's Edition is also available upon request. Please fill out a request using our online form, and we'll get back to you right away."))
         (for/list ([n (in-range 1 (add1 9))])
           (unit-summary/links n))
         (list 
          (summary-item/links "Supplemental Lessons" "foo" "for teachers looking for additional exercises, we have compiled many activities for students to go deeper into the material. Have students use composition and coordinates to create flags for their countries of origin, or for a country they want to make up! Have them use randomness and trigonometric functions for more sophisticated motion, or introduce data structures for more sophisticated games! ")
          (summary-item/links "Teacher's Guide" "resources/teachers-guide/teachers-guide" 
                              "are also available for teachers who'd like a \"quick start\" reference to all the various functionality in the Game Template. ")
          )))

@;supplemental lessons and teachers guide need formatting/links in the text

@(copyright)
