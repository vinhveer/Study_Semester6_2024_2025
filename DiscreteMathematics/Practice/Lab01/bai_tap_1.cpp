#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int na;
    cin >> na;

    vector<int> a(na);
    for (int i = 0; i < na; i++)
    {
        cin >> a[i];
    }

    int nb;
    cin >> nb;

    vector<int> b(nb);
    for (int i = 0; i < nb; i++)
    {
        cin >> b[i];
    }

    vector<int> result = a;

    for (int num : b)
    {
        bool exists = false;
        for (int element : result)
        {
            if (element == num)
            {
                exists = true;
                break;
            }
        }

        if (!exists)
        {
            result.push_back(num);
        }
    }

    sort(result.begin(), result.end());

    for (int num : result)
    {
        cout << num << " ";
    }

    return 0;
}