#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n;
    cout << "Nhap so dinh n: ";
    cin >> n;

    vector<vector<int>> adj(n, vector<int>(n));
    cout << "Nhap ma tran ke (" << n << "x" << n << "), cac phan tu 0 hoac 1:\n";
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            cin >> adj[i][j];
        }
    }

    // Tinh bac cua moi dinh
    vector<int> degree(n, 0);
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(adj[i][j]) degree[i]++;
        }
    }

    // Tao thu tu cac dinh giam dan theo bac
    vector<int> order(n);
    for(int i = 0; i < n; i++) order[i] = i;
    sort(order.begin(), order.end(), [&](int u, int v) {
        return degree[u] > degree[v];
    });

    vector<int> color(n, 0); // 0 = chua duoc to mau
    int maxColor = 0;

    // Welsh-Powell: to mau tung dinh theo thu tu
    for(int idx = 0; idx < n; idx++) {
        int v = order[idx];
        if(color[v] == 0) {
            maxColor++;
            color[v] = maxColor;
            // To mau nhung dinh khac cung mau neu khong ke voi v
            for(int jdx = idx + 1; jdx < n; jdx++) {
                int u = order[jdx];
                if(color[u] == 0) {
                    bool canColor = true;
                    // Kiem tra u co ke voi bat ky dinh nao da duoc to mau hien tai
                    for(int k = 0; k < n; k++) {
                        if(color[k] == maxColor && adj[u][k]) {
                            canColor = false;
                            break;
                        }
                    }
                    if(canColor) {
                        color[u] = maxColor;
                    }
                }
            }
        }
    }

    // In ket qua
    cout << "So mau can dung: " << maxColor << "\n";
    cout << "Phan bo mau cho cac dinh:\n";
    for(int i = 0; i < n; i++) {
        cout << "Dinh " << i+1 << " -> Mau " << color[i] << "\n";
    }

    return 0;
}
