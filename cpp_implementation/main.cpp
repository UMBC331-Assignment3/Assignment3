#include <iostream>
#include "groupcalculator.h"

using namespace std;

int main()
{
    int classSize, groupSize;
    cout << "Enter number of students and group size: ";
    cin >> classSize >> groupSize;
    if (classSize % groupSize != 0)
    {
        cout << "Error: Cannot equally split class into groups of this size.\n";
        return 0;
    }
    GroupCalculator groupCalc;
    groupCalc.calculateGroups(classSize, groupSize);
    return 0;
}
