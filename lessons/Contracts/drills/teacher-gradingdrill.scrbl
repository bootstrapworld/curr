#lang curr/lib

@title{Grading Drill}

Look at the student's answers for the task and determine whether or not the answer is correct. If not, explain what the student needs to change to get the correct answer.

@think-about[#:question "Create a contract for buying groceries at the store. 
                        Student's answer: money -> groceries"
             #:answer "This answer is correct"]

@think-about[#:question "Create a contract for making a sandwich. 
                        Student's answer: sandwich -> bread cheese meat lettuce"
             #:answer "This answer is incorrect. The format of contracts is for the inputs to go on the left of -> and the ouputs to go the right. This answer is backwards. In order for this answer to be correct, the student should instead write something like 'bread cheese meat lettuce -> sandwich'."]

@think-about[#:question "Create a contract for buying groceries at the store. 
                        Student's answer: money -> groceries receipt"
             #:answer "This answer is correct. Though the answer is different from the first question, it is still valid as the contract for this situation can be quite flexible. However, feel free to guide your students appropriately in order to prevent them from getting confused/becoming too extravagant with their answers"]

@think-about[#:question "Create a contract for getting the square plus one of a number. 
                        Student's answer: number number -> number"
             #:answer "This answer is incorrect. The student may be confused because you are doing two things to the number (squaring it, and adding one to the result). You should clarify that though there are two operations being done on the number, the student should focus on the input and output of the function when writing the contract. In this case, you are inputing a number (ex: 3), and outputting a number (ex: 10)."]

@think-about[#:question "Create a contract for the sum of two numbers. 
                        Student's answer: num num -> num"
             #:answer "This answer is correct"]