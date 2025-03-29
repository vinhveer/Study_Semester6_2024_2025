#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

// H�m t�nh t�ch c�c ph?n t? c?a m?t d�y s?
long long product(const vector<int>& arr) {
    long long prod = 1;
    for (int num : arr) {
        prod *= num;
    }
    return prod;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int t;
    cin >> t;

    while (t--) {
        int n, m;
        cin >> n >> m;

        vector<int> A(n), B(m);

        for (int i = 0; i < n; i++) cin >> A[i];
        for (int i = 0; i < m; i++) cin >> B[i];

        // So s�nh t�ch c?a hai d�y s?
        if (product(A) == product(B))
            cout << "YES\n";
        else
            cout << "NO\n";
    }

    return 0;
}

