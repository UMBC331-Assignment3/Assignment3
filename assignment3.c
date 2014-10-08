//
//  Usage:          ./assignment3 students groupSize
//  Project:        Assignment 3
//  Class:          CMSC 331 Fall 2014
//  Authors:        Eric Hebert, Katie Swanson, 
//  Description:    Calculates unique groups of student IDs.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Returns unique combinations, gotten from class
//combo :: Integer -> [a] -> [[a]]
//combo 0 _ = [[]]
//combo n [] = []
//combo n (x:xs) = (map (x:) $ combo (n-1) xs) ++ combo n xs

int* combinationUtil(int arr[], int data[], int start, int end, int index, int r);

// The main function that prints all combinations of size r
// in arr[] of size n. This function mainly uses combinationUtil()
int* makeCombinations(int arr[], int n, int r)
{
  // A temporary array to store all combination one by one
  int data[r];
 
  // Print all combination using temprary array 'data[]'
  return combinationUtil(arr, data, 0, n-1, 0, r);
}
 
// arr[]  ---> Input Array
// data[] ---> Temporary array to store current combination
// start & end ---> Staring and Ending indexes in arr[]
// index  ---> Current index in data[]
// r ---> Size of a combination to be printed
int* combinationUtil(int arr[], int data[], int start, int end, int index, int r)
{
  
  int* returnArr;
  // Current combination is ready to be printed, print it
  if (index == r)
    {
      int j;
      for (j=0; j<r; j++)
	returnArr[j] = data[j];
      return returnArr;
      free(returnArr);
    }
 
  // replace index with all possible elements. The condition
  // "end-i+1 >= r-index" makes sure that including one element
  // at index will make a combination with remaining elements
  // at remaining positions
  int i;
  for (i=start; i<=end && end-i+1 >= r-index; i++)
    {
      data[index] = arr[i];
      combinationUtil(arr, data, i+1, end, index+1, r);
      // Since the elements are sorted, all occurrences of an element
      // must be together
      while (arr[i] == arr[i+1])
	i++; 
    }

  return;
  free(returnArr);
}  


//Returns 1 if was inserted into assignment, 0 if needs to be deleted (not sure how to implement, wrote algorithm out)
//whatToDo :: Set -> Set -> Integer
//If exactly one of Set to insert is already in a1, try all other groups, if no groups work, return 0
//whatToDo 
//if 
//If groupSize > 2 and two of Set to insert is already in the assignment *in the same group*, return 0
//whatToDo
//Else add into a1
//whatToDo


int main(int argc, char** argv) {
  printf("test");
  int students = atoi(argv[1]);
  int groupSize = atoi(argv[2]);
  int studentArr[students];
  int i;
  for (i = 0; i < students; i++) {
    studentArr[i] = i + 1;
  }
  int* combos = makeCombinations(studentArr, students, groupSize);

  int j;
  int mySize = sizeof(combos) / sizeof(combos[0]);
  for (j = 0; j < mySize; j++) {
    printf("%d ", combos[j]);
  }
  free(combos);
  return 0;
}

//main = do
  // Read command line arguments
//args <- getArgs
//   let students = read (head args) :: Integer
//   let groupSize = read (last args) :: Integer

     // Print command line input (for debugging only)
// putStr "Students: "
// print students
// putStr "Group size: "
//  print groupSize
 
//   let a1, a2, a3, a4, a5, a6, a7, a8 = Set
//   let numCombos = length (combo groupSize [1..students])

     //again, I know the algorithm, just difficult to implement in haskell
//   if ((students % groupSize == 0) and numCombos > 8*(students/groupSize)) then do
//   1. create set of 8 sets of sets of all combinations
//     let allCombos = (Set.fromList $ combo groupSize [1..students])
//   2. delete all sets that have 2 ppl that have worked together
//     function where it takes a set and compares each number in it to all of the other numbers in the assignment,
//     if all are not unique and at least one repeat, return false, else return true, 2 versions
//									        --     call this function on allCombos which adds groups to assignments if they belong or returns 0
//      if whatToDo allCombos[0] a1 ... whatToDo allCombos[groupSize-1] a8 == 0 then do delete allCombos[x]
//   3. end up with 8 sets of assignments with all unique groups
// else
	      // putStr "this is not possible"
   
//   return ()
   
//
// There are a few possible algorithms we could use:
// Have a list associated with each student, containing all of the students they already worked with.
// Then, while the students are being grouped together, it would ensure nobody is in the same group.
// Calculate all possible combinations of groups, then figure out a way to split them between assignments.
//           The second part of this may be difficult.

