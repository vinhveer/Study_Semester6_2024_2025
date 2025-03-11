#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InputArray(vector<string>& arr);
vector<string> SubtractionProcess(vector<string> setA, vector<string> setB);
void PrintArrayAsc(vector<string> arr);

int main()
{
	vector<string> setA;
	vector<string> setB;
	
	InputArray(setA);
	InputArray(setB);
	
	
}

void InputArray(vector<string>& arr)
{
	int size;
	cin >> size;
	
	int temp;
	
	for (int i = 0; i < size; i++)
	{
		cin >> temp;
		arr.push_back(temp);
	}	
}

vector<string> SubtractionProcess(vector<string> setA, vector<string> setB)
{
	vector<string> results;
	
	for (string valueA : setA)
	{
		bool exist_in_b = false;
		
		for (string valueB : setB)
			if (valueA == valueB)
			{
				exist_in_b = true;
				break;
			}
			
		if (!exist_in_b)
		{
			bool exist_in_result = false;
			for (string valueResult : results)
				if (valueResult == valueA)
				{
					exist_in_result = true;
					break;
				}
				
			if (!exist_in_result) results.push_back(valueA);
		}
	}
}
