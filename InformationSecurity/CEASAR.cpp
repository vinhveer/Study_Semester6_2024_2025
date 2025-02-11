#include <iostream>
#include <string>
using namespace std;

int main()
{
    string ciphertext;
    getline(cin, ciphertext);

    int k;
    cin >> k;

    string plaintext = "";

    for (char c : ciphertext)
    {
        if (c >= 'a' && c <= 'z')
        {
            int pos = c - 'a';
            int new_pos = (pos - k + 26) % 26;
            plaintext.push_back('a' + new_pos);
        }
        else
        {
            plaintext.push_back(c);
        }
    }

    cout << plaintext << endl;

    return 0;
}
    