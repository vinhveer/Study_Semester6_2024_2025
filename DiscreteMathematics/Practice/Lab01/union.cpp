#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// Prototype
void InputArray(vector<int>& arr);
void UnionProcess(vector<int>& setA, vector<int>& setB);
void PrintArrayWithAsc(vector<int>& arr);

int main()
{
	vector<int> setA;
	vector<int> setB;
	
	InputArray(setA);
	InputArray(setB);
	
	UnionProcess(setA, setB);
	
	PrintArrayWithAsc(setA);
}

void InputArray(vector<int>& arr)
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

void UnionProcess(vector<int>& setA, vector<int>& setB)
{
	for (int valueB : setB)
	{
		bool exist = false;
		
		for (int valueA : setA)
			if (valueA == valueB)
			{
				exist = true;
				break;	
			}
			
		if (!exist) setA.push_back(valueB);
	}
}

void PrintArrayWithAsc(vector<int>& arr)
{
	// Sort Array
	sort(arr.begin(), arr.end(), greater<int>());
	
	for (int value : arr) cout << value << " ";
}
