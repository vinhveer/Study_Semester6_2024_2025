#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

bool compare(string a, string b) {
    bool a_is_num = isdigit(a[0]) || (a[0] == '-' && a.length() > 1 && isdigit(a[1]));
    bool b_is_num = isdigit(b[0]) || (b[0] == '-' && b.length() > 1 && isdigit(b[1]));
    
    if (a_is_num && !b_is_num) return true;
    if (!a_is_num && b_is_num) return false;
    
    return a < b;
}

int main() {
    int na;
    cin >> na;
    
    vector<string> a(na);
    for (int i = 0; i < na; i++) {
        cin >> a[i];
    }
    
    int nb;
    cin >> nb;
    
    vector<string> b(nb);
    for (int i = 0; i < nb; i++) {
        cin >> b[i];
    }
    
    vector<string> difference;
    
    for (int i = 0; i < na; i++) {
        bool found_in_b = false;
        
        for (int j = 0; j < nb; j++) {
            if (a[i] == b[j]) {
                found_in_b = true;
                break;
            }
        }
        
        if (!found_in_b) {
            bool already_in_result = false;
            for (string elem : difference) {
                if (elem == a[i]) {
                    already_in_result = true;
                    break;
                }
            }
            
            if (!already_in_result) {
                difference.push_back(a[i]);
            }
        }
    }
    
    sort(difference.begin(), difference.end(), compare);
    
    if (difference.empty()) {
        cout << "none";
    } else {
        for (string elem : difference) {
            cout << elem << " ";
        }
    }
    
    return 0;
}