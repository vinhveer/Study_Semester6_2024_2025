#include <iostream>
#include <string>
#include <algorithm>
#include <vector>
using namespace std;

// Utility function to remove leading zeros from a numeric string
string removeLeadingZeros(const string &num) {
    size_t pos = 0;
    while (pos < num.size() - 1 && num[pos] == '0') {
        pos++;
    }
    return num.substr(pos);
}

// Addition of two large integers represented as strings
string addLargeInt(const string &a, const string &b) {
    // Make copies, reverse them (least significant digit first)
    string x(a.rbegin(), a.rend());
    string y(b.rbegin(), b.rend());

    int carry = 0;
    string result;
    // Pad the shorter string
    while (x.size() < y.size()) x.push_back('0');
    while (y.size() < x.size()) y.push_back('0');

    for (size_t i = 0; i < x.size(); i++) {
        int sum = (x[i] - '0') + (y[i] - '0') + carry;
        carry = sum / 10;
        result.push_back((sum % 10) + '0');
    }
    if (carry) {
        result.push_back(carry + '0');
    }
    // Reverse result back and remove leading zeros
    reverse(result.begin(), result.end());
    return removeLeadingZeros(result);
}

// Subtraction of two large integers represented as strings (assumes a >= b)
string subtractLargeInt(const string &a, const string &b) {
    // Make copies
    string x(a), y(b);

    // Remove leading zeros for safety
    x = removeLeadingZeros(x);
    y = removeLeadingZeros(y);

    // Check if x < y
    if (x.size() < y.size() || (x.size() == y.size() && x < y)) {
        // Return negative result if needed, or handle differently
        return "-" + subtractLargeInt(y, x);
    }

    // Reverse them
    reverse(x.begin(), x.end());
    reverse(y.begin(), y.end());

    while (y.size() < x.size()) {
        y.push_back('0');
    }

    int carry = 0;
    string result;
    for (size_t i = 0; i < x.size(); i++) {
        int diff = (x[i] - '0') - (y[i] - '0') - carry;
        carry = 0;
        if (diff < 0) {
            diff += 10;
            carry = 1;
        }
        result.push_back(diff + '0');
    }

    // Reverse result and remove leading zeros
    reverse(result.begin(), result.end());
    return removeLeadingZeros(result);
}

// Multiplication of two large integers represented as strings
string multiplyLargeInt(const string &a, const string &b) {
    // Remove leading zeros for safety
    string x = removeLeadingZeros(a);
    string y = removeLeadingZeros(b);

    if (x == "0" || y == "0") return "0";

    vector<int> result(x.size() + y.size(), 0);

    for (int i = x.size() - 1; i >= 0; i--) {
        for (int j = y.size() - 1; j >= 0; j--) {
            int prod = (x[i] - '0') * (y[j] - '0') + result[i + j + 1];
            result[i + j + 1] = prod % 10;
            result[i + j] += prod / 10;
        }
    }

    // Convert vector to string
    string res;
    for (int val : result) {
        if (!(res.empty() && val == 0)) {
            res.push_back(val + '0');
        }
    }
    return res.empty() ? "0" : res;
}

// Division of two large integers represented as strings (returns quotient)
string divideLargeInt(const string &numStr, const string &denStr) {
    // Remove leading zeros
    string numerator = removeLeadingZeros(numStr);
    string denominator = removeLeadingZeros(denStr);

    if (denominator == "0") {
        return "NaN"; // or handle division by zero error
    }
    if (numerator == "0") {
        return "0";
    }

    // If numerator < denominator, result is 0
    if (numerator.size() < denominator.size() ||
        (numerator.size() == denominator.size() && numerator < denominator)) {
        return "0";
    }

    // Long division
    string result, current;
    for (char c : numerator) {
        current.push_back(c);
        current = removeLeadingZeros(current);
        int count = 0;
        while (current.size() > denominator.size() ||
               (current.size() == denominator.size() && current >= denominator)) {
            current = subtractLargeInt(current, denominator);
            count++;
        }
        result.push_back(count + '0');
    }
    // Remove leading zeros from final result
    return removeLeadingZeros(result);
}

int main() {
    cout << "Add: " << addLargeInt("100", "200") << endl;            // 300
    cout << "Subtract: " << subtractLargeInt("1000", "450") << endl; // 550
    cout << "Multiply: " << multiplyLargeInt("999", "999") << endl;  // 998001
    cout << "Divide: " << divideLargeInt("1000", "50") << endl;      // 20
    return 0;
}