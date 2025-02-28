#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    int na;
    cin >> na;
    
    vector<int> a(na);
    for (int i = 0; i < na; i++) {
        cin >> a[i];
    }
    
    int nb;
    cin >> nb;
    
    vector<int> b(nb);
    for (int i = 0; i < nb; i++) {
        cin >> b[i];
    }
    
    vector<int> intersection;
    
    for (int i = 0; i < na; i++) {
        bool found = false;
        
        for (int j = 0; j < nb; j++) {
            if (a[i] == b[j]) {
                found = true;
                break;
            }
        }
        
        if (found) {
            bool already_in_result = false;
            for (int k = 0; k < intersection.size(); k++) {
                if (intersection[k] == a[i]) {
                    already_in_result = true;
                    break;
                }
            }
            
            if (!already_in_result) {
                intersection.push_back(a[i]);
            }
        }
    }
    
    sort(intersection.begin(), intersection.end());
    
    if (intersection.empty()) {
        cout << "none";
    } else {
        for (int num : intersection) {
            cout << num << " ";
        }
    }
    
    return 0;
}