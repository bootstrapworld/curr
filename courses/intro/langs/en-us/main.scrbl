#lang curr/lib

@(elem #:style bs-coursename-style "Introduction to Computer Science")

@boxed-text{Welcome to Introduction to Computer Science! This website is where you should look for information about the course, curriculum and lessons, and the policies that govern our work together.

We will also maintain a @(hyperlink "classroom.google.com" "Google Classroom") for the day to day administration of the course.

Google Classroom is used for submitting assignments and for important updates and announcements.

We will also post assessment feedback to @(hyperlink "https://jumpro.pe" "Jumprope"), our mastery based assessment platform.}

@; Change to number of units
@(for/list ([n (in-range 1 (add1 1))])
  (unit-summary/links n))



@(copyright)
