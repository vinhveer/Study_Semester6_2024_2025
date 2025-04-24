#include <iostream>
#include <vector>
using namespace std;

// Hàm DFS từ đỉnh u để đánh dấu đỉnh có thể đến
void dfs(int u, const vector<vector<int>> &adjList, vector<bool> &visited) {
    visited[u] = true;
    for (int v : adjList[u]) {
        if (!visited[v]) dfs(v, adjList, visited);
    }
}

int main() {
    int n;
    cout << "Nhap so dinh n: ";
    cin >> n;

    // Đọc ma trận kề
    vector<vector<int>> adjMatrix(n, vector<int>(n));
    cout << "Nhap ma tran ke (" << n << "x" << n << ") voi 0/1:\n";
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> adjMatrix[i][j];
        }
    }

    // Chuyển sang danh sách kề để dễ DFS
    vector<vector<int>> adjList(n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (adjMatrix[i][j]) {
                adjList[i].push_back(j);
            }
        }
    }

    int vi, vj;
    cout << "Nhap hai dinh can kiem tra (vi vj): ";
    cin >> vi >> vj;
    // Giả sử người dùng nhập 1..n, chuyển về 0..n-1
    vi--; vj--;

    vector<bool> visited(n, false);
    dfs(vi, adjList, visited);

    if (visited[vj])
        cout << "ton tai";
    else
        cout << "khong ton tai";

    return 0;
}
