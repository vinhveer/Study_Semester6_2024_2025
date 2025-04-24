#include <bits/stdc++.h>
using namespace std;

// Kiểm tra đồ thị có hướng hay không
bool isDirected(const vector<vector<int>>& a) {
    int n = a.size();
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            if (a[i][j] != a[j][i])
                return true;
    return false;
}

// Kiểm tra đồ thị có khuyên (loop) hay không
bool hasLoop(const vector<vector<int>>& a) {
    int n = a.size();
    for (int i = 0; i < n; ++i)
        if (a[i][i] == 1)
            return true;
    return false;
}

// Tính bán bậc ra (out-degree) cho mỗi đỉnh
vector<int> outDegrees(const vector<vector<int>>& a) {
    int n = a.size();
    vector<int> out(n, 0);
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            out[i] += a[i][j];
    return out;
}

// Tính bán bậc vào (in-degree) cho mỗi đỉnh
vector<int> inDegrees(const vector<vector<int>>& a) {
    int n = a.size();
    vector<int> in(n, 0);
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            in[i] += a[j][i];
    return in;
}

// Đếm tổng số cung (directed edges)
int countArcs(const vector<vector<int>>& a) {
    int n = a.size(), sum = 0;
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            sum += a[i][j];
    return sum;
}

// Đếm tổng số cạnh (undirected edges), bao gồm cả loops
int countEdges(const vector<vector<int>>& a) {
    int n = a.size();
    int sum = 0, loops = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            if (i == j)
                loops += a[i][j];
            else
                sum += a[i][j];
        }
    }
    return sum / 2 + loops;
}

// Đếm số khuyên (loops)
int countLoops(const vector<vector<int>>& a) {
    int n = a.size();
    int loops = 0;
    for (int i = 0; i < n; ++i)
        loops += a[i][i];
    return loops;
}

int main() {
    int n;
    cin >> n;
    vector<vector<int>> a(n, vector<int>(n));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            cin >> a[i][j];

    bool directed = isDirected(a);
    bool loopsExist = hasLoop(a);

    if (directed) {
        cout << "Directed graph\n";
        if (loopsExist)
            cout << "Contains " << countLoops(a) << " loop(s)\n";
        auto out = outDegrees(a);
        auto in = inDegrees(a);
        for (int i = 0; i < n; ++i)
            cout << "Vertex " << i << ": out = " << out[i]
                 << ", in = " << in[i] << "\n";
        cout << "Total arcs: " << countArcs(a) << "\n";
    } else {
        cout << "Undirected graph\n";
        if (loopsExist)
            cout << "Contains " << countLoops(a) << " loop(s)\n";
        auto deg = outDegrees(a);  // với vô hướng, outDegrees == degree
        for (int i = 0; i < n; ++i)
            cout << "Vertex " << i << ": degree = " << deg[i] << "\n";
        cout << "Total edges: " << countEdges(a) << "\n";
    }

    return 0;
}
