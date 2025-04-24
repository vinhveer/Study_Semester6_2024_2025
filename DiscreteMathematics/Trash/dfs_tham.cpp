#include <bits/stdc++.h>
using namespace std;

int n;
vector<vector<int>> adj;
int dinh_bat_dau;
vector<bool> visited;

void dfs(int u)
{
	visited[u] = true;
	
	cout << u << " ";
	for (int i = 0; i < n; i++)
		if (adj[u][i] == 1 && !visited[i])
			dfs(i);
}

int main()
{
	cin >> n;
	
	adj.assign(n, vector<int>(n));
	visited.assign(n, false);
	
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			cin >> adj[i][j];
			
	cin >> dinh_bat_dau;
	
	dfs(dinh_bat_dau);
	
	return 0;
}