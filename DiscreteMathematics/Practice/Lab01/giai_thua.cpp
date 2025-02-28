#include <iostream>
using namespace std;

int main() {
    int n;
    long long factorial = 1;
    
    cin >> n;
    
    if (n < 0) {
        cout << "none" << endl;
    } else if (n == 0) {
        cout << 1 << endl;
    }
    else {
        for (int i = 1; i <= n; i++) {
            factorial *= i;
        }
        cout << factorial << endl;
    }
    
    return 0;
}