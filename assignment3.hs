{-|
   Usage:          ./assignment3 students groupSize
   Project:        Assignment 3
   Class:          CMSC 331 Fall 2014
   Authors:        Eric Hebert, Katie Swanson, John Gordon, Anna Taylor
   Description:    Calculates unique groups of student IDs.
-}

import System.Environment
import System.IO
import Data.List
import qualified Data.Set as Set

{-|
   New algorithm:
      Generate all possible combinations
         Make sure these are unique and there are no conlicts
      Iterate through the combinations, and try to insert each group into an assignment.
         If there are conflicts, try the next assignment.
      Print results lists.
-}

-- Checks if a list intersects with another list
intersect xs ys = length [x | x <- xs, elem x ys]

-- Used for generating unique combinations with combo
-- Second parameter would be a list of lists, to keep track of students who were already in groups together
checkConflict :: [Int] -> [[Int]] -> [Int]
checkConflict xs results = intersects xs results

-- Returns unique combinations, gotten from class
-- TODO: Make sure this returns only unique combinations using a filter or something.
--    Will need to keep track of this using a list of lists, or sets.
combo :: Int -> [a] -> [[a]]
combo 0 _ = [[]]
combo n [] = []
combo n (x:xs) = (checkConflict (map (x:) $ combo (n-1) xs)) ++ combo n xs

-- Tries to insert a group into the results
-- Will try every assignment until it inserts one
insertGroup :: [Int] -> [[Int]] -> [[Int]]
insertGroup group results assignmentId =
   if $ checkConflict group then
      (insert group results)
   else
      (insertGroup group results (assignmentId + 1))
insertGroup group results _ = insertGroup group results 1

-- Define a set type
type Set a = a -> Bool

main = do
   -- Read command line arguments
   args <- getArgs
   let students = read (head args) :: Int
   let groupSize = read (last args) :: Int

   -- Print command line input
   putStr "Students: "
   print students
   putStr "Group size: "
   print groupSize

   -- Store all of the possible combinations of groups of students
   let allCombinations = (Set.fromList $ combo groupSize [1..students])

   -- Get the number of possible combinations
   let numCombos = length allCombinations

   -- Make sure the input will produce a valid result
   if ((mod students groupSize == 0) and numCombos > 8 * (students / groupSize)) then do
      -- Insert the unique combinations of groups into different assignments
      let results = (map (insertGroup group [1..8]) allCombinations)
      print results
   else
      putStrLn "Cannot pair students into groups across eight assignments."

-- Other possible algorithms:

--Returns 1 if was inserted into assignment, 0 if needs to be deleted (not sure how to implement, wrote algorithm out)
--whatToDo :: Set -> Set -> Integer
--If exactly one of Set to insert is already in the assignment, try all other groups, if no groups work, return 0
--whatToDo 
--If groupSize > 2 and two of Set to insert is already in the assignment *in the same group*, return 0
--whatToDo
--Else add into a1
--whatToDo

-- again, I know the algorithm, just difficult to implement in haskell
-- if ((students % groupSize == 0) and numCombos > 8*(students/groupSize)) then do
--    1. create set of 8 sets of sets of all combinations
--        let allCombos = (Set.fromList $ combo groupSize [1..students])
--    2. delete all sets that have 2 ppl that have worked together
--        function where it takes a set and compares each number in it to all of the other numbers in the assignment,
--        if all are not unique and at least one repeat, return false, else return true, 2 versions
--        call this function on allCombos which adds groups to assignments if they belong or returns 0
--        if whatToDo allCombos[0] a1 ... whatToDo allCombos[groupSize-1] a8 == 0 then do delete allCombos[x]
--    3. end up with 8 sets of assignments with all unique groups
-- else
-- putStr "this is not possible"
   
   return ()
