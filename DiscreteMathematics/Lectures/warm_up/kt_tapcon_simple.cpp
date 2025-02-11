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

bool Check(vector<int> set_a, vector<int> set_b)
{
    int count = 0;

    for (int i : set_a)
    {
        for (int j : set_b)
        {
            if (i == j)
            {
                count++;
                break;
            }
        }
    }

    if (count == set_a.size())
    {
        return true;
    }
    else
    {
        return false;
    }
}


int main()
{
    vector<int> set_a, set_b;

    cout << "Input Set A:\n";
    InputArray(set_a);
    cout << "Input Set B:\n";
    InputArray(set_b);

    if (Check(set_a, set_b))
    {
        cout << "Set A is a subset of Set B.\n";
    }
    else
    {
        cout << "Set A is not a subset of Set B.\n";
    }

    return 0;
}