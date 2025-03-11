#include <iostream>

int main()
{	
	int n = 1000

	for (int x = 0; x < n; i++)
		for (int y = 0; y < n; y++)
			for (int z = 0; z < n; z++)
			{
				if ((x + y + z) == 1000)
				{
					cout << x << " x " << y << " x " << z << " = " << 1000 << endl;	
				}
			}
			
	return 0;
}
