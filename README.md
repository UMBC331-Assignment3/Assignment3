Assignment 3
============

Due Oct 07
----------

There are 40 students in this class. There are also 8 graded projects that allow group work, although we are forbidden from being in a group with the same person twice. While the instructor may have claimed that it is possible for everyone to be in a full group of four for every graded assignment, you have your doubts!

Write a program that accepts two command-line arguments: the number of students, and the maximum size of a group. The program should then print out one possible class breakdown of students grouped for each assignment.

You do not need to print out all possible combinations of groups (if there were more than one way to split the class across the eight assignments, for example). You need only limit yourself to eight assignments. Your output can be 0-indexed, 1-indexed, or even every student's name. Your formatting may be as different from these samples as you like, provided that:

Each line of output is a grouping for one graded assessment
There is a clear indication as to which students are in a given group
If it is not possible to generate 8 such groupings, such that each person is in a maximally-sized group, simply print a message to that effect. The program need not be fast, but it should return a value for "40 students, group size 4" in less than one minute.

WTF
---

Yes, this problem is harder than the other assignments so far. For those of you in algorithms classes, you may even recognize this problem as NP-complete. Remember, the purpose and goal of assignments in this class is not the most efficient or perfect algorithm, but making the code that you write clear, readable, and understandable, making use of features and capabilities of the language chosen.

Recommended Languages
---------------------

* Haskell
* Scheme
* Python
* C++


Sample Output
-------------
```
> ./assignment3 10 2
Assignment 1: (1 2) (3 4) (5 6) (7 8) (9 10)
Assignment 2: (1 3) (2 4) (5 7) (6 9) (8 10)
Assignment 3: (1 4) (2 3) (5 8) (8 9) (7 10)
Midterm     : (1 5) (2 9) (3 8) (4 7) (6 10)
Assignment 4: (1 6) (2 8) (3 7) (4 9) (5 10)
Assignment 5: (1 7) (2 5) (3 9) (6 8) (4 10)
Assignment 6: (1 8) (2 7) (4 6) (5 9) (3 10)
Final Exam  : (1 9) (3 5) (4 8) (6 7) (2 10)

> ./assignment3 5 1
Assignment 1: (1) (2) (3) (4) (5)
Assignment 2: (1) (2) (3) (4) (5)
Assignment 3: (1) (2) (3) (4) (5)
Midterm     : (1) (2) (3) (4) (5)
Assignment 4: (1) (2) (3) (4) (5)
Assignment 5: (1) (2) (3) (4) (5)
Assignment 6: (1) (2) (3) (4) (5)
Final Exam  : (1) (2) (3) (4) (5)

> ./assignment3 7 2
 Cannot pair up 7 students into groups of 2 across eight assignments

> ./assignment3 8 4
 Cannot pair up 8 students into groups of 4 across eight assignments
```