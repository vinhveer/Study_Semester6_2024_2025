#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InputArray(vector<int> &array_temp)
{
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    // Allocating memory for the array
    array_temp.resize(n);
    
    for (int i = 0; i < n; i++)
    {
        int temp;
        cout << "Enter element " << i + 1 << ": ";
        cin >> temp;
        array_temp.push_back(temp);
    }
}

bool Check(vector<int> &set_a, vector<int> &set_b)
{
    // First: Check if the two sets have the same size
    if (set_a.size() != set_b.size())
    {
        return false;
    }

    // Second: Sort the two sets
    sort(set_a.begin(), set_a.end());
    sort(set_b.begin(), set_b.end());

    // Third: Check if the two sets are equal
    for (int i = 0; i < set_a.size(); i++)
    {
        if (set_a[i] != set_b[i])
        {
            return false;
        }
    }

    return true;
}

int main()
{
    vector<int> set_a;
    vector<int> set_b;

    InputArray(set_a);
    InputArray(set_b);

    if (Check(set_a, set_b))
    {
        cout << "The two sets are equal." << endl;
    }
    else
    {
        cout << "The two sets are not equal." << endl;
    }

    return 0;
}