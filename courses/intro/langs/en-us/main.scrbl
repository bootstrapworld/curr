#lang curr/lib

@(elem #:style bs-coursename-style "Introduction to Computer Science")

@boxed-text{Introduction to Computer Sciences explores the relationship between computational thinking and the standard high school curriculum through building games and animations, analyzing and presenting data, and sharing ourselves and our learning with the world. The course is organized into three modules, which we cycle throughout the year. Each module is further broken down into one week mini-units. In the *Algebra* module students create a simple video game and discover the relationships between math and computer science. In *Data Science* students explore a dataset they are interested in to and produce a detailed report on their analysis. Our work is collected into learning blogs that are enhanced by our studies of the *Internet* and its structures. Introduction to Computing is the first course in the AFSE computing sequence. The course aims to provide a initial foundation for future study in computing. Three pillars of the introductory course are academic habits, motivation/disposition/interest, and concepts.}

@; Change to number of units
@(for/list ([n (in-range 1 (add1 1))])
  (unit-summary/links n))



@(copyright)
