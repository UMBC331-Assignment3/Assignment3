#include "groupcalculator.h"
#include <iostream>

GroupCalculator::GroupCalculator()
{
}

void GroupCalculator::calculateGroups(int classSize, int groupSize)
{
    int numGroups = classSize / groupSize;
    results.resize(8);
    students.resize(classSize);
    for (int id = 0; id < classSize; ++id)
        students[id].insert(id);
    int assignmentId = 0;
    for (auto& result: results)
    {
        result.resize(numGroups);
        // Take each student, and try to put them in a group
        for (int student = 0; student < classSize; ++student)
        {
            // Go through the groups, to try and add this student
            for (int group = 0; group < numGroups; ++group)
            {
                // Skip full groups
                if ((int)result[group].size() >= groupSize)
                    continue;
                // Check for conflicts (if the student worked with anyone in the group before)
                if (noConflicts(result[group], student))
                {
                    // Add the student to the group
                    result[group].insert(student);

                    // Add all of the group members to the student's set of partners
                    students[student].insert(result[group].begin(), result[group].end());

                    break; // Would be better to make this a condition in the loop
                }
                // Otherwise try the next group
            }
        }
        ++assignmentId;
    }
    printResults();
}

bool GroupCalculator::noConflicts(const Group& group, int student) const
{
    for (int groupMember: group)
    {
        if (students[student].find(groupMember) != students[student].end())
            return false;
    }
    return true;
}

void GroupCalculator::printResults() const
{
    int assignmentId = 0;
    for (const auto& result: results)
    {
        cout << "Assignment " << assignmentId << ": ";
        for (const auto& group: result)
        {
            cout << "(";
            int counter = group.size();
            for (int student: group)
            {
                --counter;
                if (counter != 0)
                    cout << student + 1 << ", ";
                else
                    cout << student + 1;
            }
            cout << ") ";
        }
        cout << endl;
        ++assignmentId;
    }
}
