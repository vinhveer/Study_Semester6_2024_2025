#include <iostream>
#include <string>
using namespace std;

int feedbackX(string reg) 
{
    return (reg[5] - '0') ^ (reg[4] - '0') ^ (reg[1] - '0') ^ (reg[0] - '0');
}

int feedbackY(string reg) 
{
    return (reg[7] - '0') ^ (reg[5] - '0') ^ (reg[3] - '0') ^ (reg[0] - '0');
}

int feedbackZ(string reg) 
{
    return (reg[8] - '0') ^ (reg[4] - '0') ^ (reg[3] - '0') ^ (reg[0] - '0');
}

int main() 
{
    string X, Y, Z, plain;
    cin >> X >> Y >> Z >> plain;
    
    string cipher = "";
    
    for (char c : plain) 
	{
        int ks = (X.back() - '0') ^ (Y.back() - '0') ^ (Z.back() - '0');
        cipher += (ks ^ (c - '0')) + '0';
        
        int x_clk = X[2] - '0';
        int y_clk = Y[4] - '0';
        int z_clk = Z[4] - '0';
        int majority = (x_clk + y_clk + z_clk) >= 2 ? 1 : 0;
        
        if (x_clk == majority) 
		{
            X = (char)(feedbackX(X) + '0') + X.substr(0, 5);
        }
        
        if (y_clk == majority) 
		{
            Y = (char)(feedbackY(Y) + '0') + Y.substr(0, 7);
        }
        
        if (z_clk == majority) 
		{
            Z = (char)(feedbackZ(Z) + '0') + Z.substr(0, 8);
        }
    }
    
    cout << cipher;
    return 0;
}

