#ifndef GROUPCALCULATOR_H
#define GROUPCALCULATOR_H

#include <vector>
#include <set>

using namespace std;

class GroupCalculator
{
    public:
        GroupCalculator();
        void calculateGroups(int classSize, int groupSize);

    private:
        using Group = set<int>;
        using Assignment = vector<Group>;

        bool noConflicts(const Group& group, int student) const;
        void printResults() const;

        vector<Group> students; // For keeping track of who worked with who
        vector<Assignment> results; // For displaying the groups for each assignment
};

#endif
