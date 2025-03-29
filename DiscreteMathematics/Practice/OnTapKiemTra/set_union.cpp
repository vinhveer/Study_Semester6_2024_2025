#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InputArray(vector<int> &arr)
{
    int n;
    cin >> n;

    int temp;

    for (int i = 0; i < n; i++)
    {
        cin >> temp;
        arr.push_back(temp);
    }
}

vector<int> Union(vector<int> setA, vector<int> setB)
{
    vector<int> results = setA;

    for (int valueB : setB)
    {
        bool isset = false;
        for (int valueResults : results)
            if (valueB == valueResults)
            {
                isset = true;
                break;
            }

        if (!isset) results.push_back(valueB);
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

    for (int value : arr)
        cout << value << " ";
}

int main()
{
    vector<int> setA;
    vector<int> setB;

    InputArray(setA);
    InputArray(setB);

    PrintArray(Union(setA, setB));

    return 0;
}
