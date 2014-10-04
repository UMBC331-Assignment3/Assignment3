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
