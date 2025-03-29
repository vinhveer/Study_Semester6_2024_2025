#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    string s;
    getline(cin, s);

    int sumDigits = 0;
    vector<string> words;
    string word = "";

    // Duy?t t?ng k� t? trong chu?i s
    for (char c : s) {
        if (isdigit(c)) {
            sumDigits += c - '0';  // C?ng t?ng c�c ch? s?
        } else if (c != ' ') {
            word += c;  // Th�m k� t? v�o t? hi?n t?i
        } else if (!word.empty()) {
            reverse(word.begin(), word.end()); // �?o ngu?c t?
            words.push_back(word);  
            word = "";
        }
    }

    // X? l� t? cu?i c�ng n?u c�
    if (!word.empty()) {
        reverse(word.begin(), word.end());
        words.push_back(word);
    }

    // In k?t qu?
    cout << sumDigits;
    for (const string &w : words) {
        cout << " " << w;
    }

    return 0;
}

