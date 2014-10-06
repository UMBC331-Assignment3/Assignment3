{-|
   Usage:          ./assignment3 students groupSize
   Project:        Assignment 3
   Class:          CMSC 331 Fall 2014
   Authors:        Eric Hebert, <insert names here>
   Description:    Calculates unique groups of student IDs.
-}

import System.Environment
import System.IO
import Data.List

main = do
   -- Read command line arguments
   args <- getArgs
   let students = read (head args) :: Int
   let groupSize = read (last args) :: Int
   
   -- Print command line input (for debugging only)
   putStr "Students: "
   print students
   putStr "Group size: "
   print groupSize

   -- Calculate groups for each assignment.
   
   --Possible way to do this?
   --1. in a for loop, create a list for each student to store who they have already worked with
   
   --2. Calcluate all possible combinations (permutation(students, groupSize)??)
   
   --3. If the possible combos > number of projects
   --     create groups for all projects (when deciding who is in which group, compare if that person is in any of the
   --                                     previous people's "worked with before" list to see if they can be added to the group).
   
   --   else print "not possible", return()
   
   {-|
      There are a few possible algorithms we could use:
         Have a list associated with each student, containing all of the students they already worked with.
            Then, while the students are being grouped together, it would ensure nobody is in the same group.
         Calculate all possible combinations of groups, then figure out a way to split them between assignments.
            The second part of this may be difficult.
   -}
   let firstGroup = [1 .. students]
   print firstGroup
   return ()
