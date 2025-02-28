#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

void inputVector(vector<int>& vec, int n) {
    vec.resize(n);
    for (int i = 0; i < n; i++) {
        cin >> vec[i];
    }
}

void printVector(const vector<int>& vec) {
    for (int x : vec) {
        cout << x << " ";
    }
}

int main() {
    int n;
    cin >> n;
    vector<int> a;
    inputVector(a, n);

    int m;
    cin >> m;
    vector<int> b;
    inputVector(b, m);

    printVector(a);

    for (int i = 0; i < m; i++) {
        bool check = false;
        for (int j = 0; j < n; j++) {
            if (b[i] == a[j]) {
                check = true;
                break;
            }
        }

        if (!check) {
            cout << b[i] << " ";
        }
    }

    return 0;
}