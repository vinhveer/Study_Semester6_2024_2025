#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InputArray(vector<int> &arr)
{
    int n;
    cin >> n;

    int temp, i;

    for (i = 0; i < n; i++)
    {
        cin >> temp;
        arr.push_back(temp);
    }
}

vector<int> Difference(vector<int> &setA, vector<int> &setB)
{
    vector<int> results;

    for (int valueA : setA)
    {
        bool isset = false;
        for (int valueB : setB)
        {
            if (valueB == valueA)
            {
                isset = true;
                break;
            }
        }

        if (!isset) results.push_back(valueA);
    }

    return results;
}

void PrintArray(vector<int> arr)
{
    if (arr.empty())
    {
        cout << "none";
        return;
    }

    sort(arr.begin(), arr.end(), greater<int>());

    for (int value : arr)
        cout << value << " ";

    return;
}

int main()
{
    vector<int> setA;
    vector<int> setB;

    InputArray(setA);
    InputArray(setB);

    PrintArray(Difference(setA, setB));

    return 0;
}
