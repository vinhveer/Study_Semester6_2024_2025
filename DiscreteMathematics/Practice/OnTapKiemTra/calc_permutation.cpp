#include <iostream>
using namespace std;

int Permutation(int number)
{
    int result = 1;
    for (int i = number; i > 0; i--) result *= i;

    return result;
}

int main()
{
    cout << Permutation(5);
    return 0;
}
