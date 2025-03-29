#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InitArray(vector<int>& perArr, int n)
{
    for (int i = 1; i <= n; i++) perArr.push_back(i);
}

bool Generate(vector<int>& perArr, int n)
{
    int i = n - 2;

    while (i >= 0 && perArr[i] >= perArr[i + 1]) i--;

    if (i < 0) return true;

    int j = n - 1;
    while (perArr[j] < perArr[i]) j--;
    
    swap(perArr[i], perArr[j]);
    reverse(perArr.begin() + i + 1, perArr.end());

    return false;
}

int main()
{
    int n;
    cin >> n;

    vector<int> perArr;
    InitArray(perArr, n);

    do
    {
        for (int x : perArr)
            cout << x << " ";
        
        cout << endl;
    } while (!Generate(perArr, n));

    return 0;
}