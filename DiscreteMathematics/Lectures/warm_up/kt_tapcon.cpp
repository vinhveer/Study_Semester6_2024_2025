#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InputArray(vector<int> &arr)
{
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    arr.resize(n);
    for (int i = 0; i < n; i++)
    {
        cout << "Enter element " << i + 1 << ": ";
        cin >> arr[i];
    }
}

// Kiểm tra tập con
bool IsSubset(vector<int> set_a, vector<int> set_b)
{
    sort(set_a.begin(), set_a.end());
    sort(set_b.begin(), set_b.end());

    int index = 0;
    for (int i = 0; i < set_b.size(); i++)
    {
        if (set_a[index] == set_b[i])
        {
            ++index;
            if (index == set_a.size()) return true;
        }
    }
    return false;
}

int main()
{
    vector<int> set_a, set_b;

    cout << "Input Set A:\n";
    InputArray(set_a);
    cout << "Input Set B:\n";
    InputArray(set_b);

    bool a_subset_b = IsSubset(set_a, set_b);
    bool b_subset_a = IsSubset(set_b, set_a);

    if (a_subset_b && b_subset_a)
        cout << "Set A and Set B are equal.\n";
    else if (a_subset_b)
        cout << "Set A is a subset of Set B.\n";
    else if (b_subset_a)
        cout << "Set B is a subset of Set A.\n";
    else
        cout << "Neither set is a subset of the other.\n";

    return 0;
}
