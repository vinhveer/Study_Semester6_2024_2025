#include <iostream>
using namespace std;

int Permutation(int number)
{
    int result = 1;
    for (int i = number; i > 0; i--) result *= i;

    return result;
}

int Combination(int n, int k)
{
    return Permutation(n) / (Permutation(k) * Permutation(n - k));
}

int main()
{
    cout << Combination(10, 10);
    return 0;
}
