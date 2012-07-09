#lang curr/lib
@declare-tags[group pedagogy selftaught]

@title{The Design Recipe}

@overview{

Students are introduced to the Design Recipe and apply it to simple problems.

@objectives[@item{Students will become familiar with the steps of the Design Recipe.}]

@product-outcomes[@item{Students will write functions to solve simple problems by using the Design Recipe}]

@(language-table (list "Number" @code{+ - * / sq sqrt expt})
                 (list "String" @code{string-append string-length})
                 (list "Image"  @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))
}

@(include-lesson (lib "curr/lessons/Introducing-the-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Practicing-the-Design-Recipe/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Even-More-Practice-for-Design-Recipe/lesson/lesson.scrbl"))

What you have learned is powerful: a structured way to approach solving any problem. 
First you state the problem as clearly as you can, then think about the data. 
Then you come up with examples of how the finished product should look, and write a template using only what you know. 
Only then do you solve!

Engineers use this when they design cars. Journalists use this when they write articles. 
Chefs use it when they make food. Everyone, in every profession, needs to solve problems. 
What you have learned is a way of approaching problems that will work in many different places - not just programming. 
To succeed in this course, you need to be masters of problem solving. If you only learn one thing, let it be these steps.

@copyright[]

                                

                   
                                 
                              
               
                           
   