{-|
   Usage:          ./assignment3 students groupSize
   Project:        Assignment 3
   Class:          CMSC 331 Fall 2014
   Authors:        Eric Hebert, Katie Swanson, 
   Description:    Calculates unique groups of student IDs.
-}

import System.Environment
import System.IO
import Data.List
import qualified Data.Set as Set

-- Returns unique combinations, gotten from class
combo :: Integer -> [a] -> [[a]]
combo 0 _ = [[]]
combo n [] = []
combo n (x:xs) = (map (x:) $ combo (n-1) xs) ++ combo n xs

--Returns 1 if was inserted into assignment, 0 if needs to be deleted (not sure how to implement, wrote algorithm out)
--whatToDo :: Set -> Set -> Integer
--If exactly one of Set to insert is already in the assignment, try all other groups, if no groups work, return 0
--whatToDo 
--If groupSize > 2 and two of Set to insert is already in the assignment *in the same group*, return 0
--whatToDo
--Else add into a1
--whatToDo


main = do
   -- Read command line arguments
   args <- getArgs
   let students = read (head args) :: Integer
   let groupSize = read (last args) :: Integer

   -- Print command line input (for debugging only)
   putStr "Students: "
   print students
   putStr "Group size: "
   print groupSize

-- let a1, a2, a3, a4, a5, a6, a7, a8 = Set
-- let numCombos = length (combo groupSize [1..students])

-- again, I know the algorithm, just difficult to implement in haskell
-- if ((students % groupSize == 0) and numCombos > 8*(students/groupSize)) then do
--    1. create set of 8 sets of sets of all combinations
--    	 let allCombos = (Set.fromList $ combo groupSize [1..students])
--    2. delete all sets that have 2 ppl that have worked together
--    	 function where it takes a set and compares each number in it to all of the other numbers in the assignment,
--    	 if all are not unique and at least one repeat, return false, else return true, 2 versions
--    	 call this function on allCombos which adds groups to assignments if they belong or returns 0
--    	 if whatToDo allCombos[0] a1 ... whatToDo allCombos[groupSize-1] a8 == 0 then do delete allCombos[x]
--    3. end up with 8 sets of assignments with all unique groups
-- else
--	putStr "this is not possible"
   
   return ()
   
   {-|
      There are a few possible algorithms we could use:
         Have a list associated with each student, containing all of the students they already worked with.
            Then, while the students are being grouped together, it would ensure nobody is in the same group.
         Calculate all possible combinations of groups, then figure out a way to split them between assignments.
            The second part of this may be difficult.
   -}
