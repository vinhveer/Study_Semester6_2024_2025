#include <iostream>
using namespace std;

void inputArray(int n, vector<vector<int>>& arr)
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            cin >> arr[i][j];
}

int main()
{
    int n;
    cin >> n;
    vector<vector<int>> arr;
    inputArray(n, arr);

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (a[i][j] != a[j][i])
            {
                cout << "co_huong";
                return 0;
            }

    cout << "vo_huong"
    return 0;
}
