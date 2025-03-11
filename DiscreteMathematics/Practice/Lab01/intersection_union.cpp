#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

void inputArray(vector<int>& arr);
vector<int> unionProcess(vector<int> setA, vector<int> setB);
vector<int> intersectionProcess(vector<int> setA, vector<int> setB);
void printArrayAsc(vector<int> arr);

int main()
{
	vector<int> setA;
	vector<int> setB;
	
	inputArray(setA);
	inputArray(setB);
	
	printArrayAsc(intersectionProcess(setA, setB));
	printArrayAsc(unionProcess(setA, setB));
	
	return 0;
}

void inputArray(vector<int>& arr)
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

vector<int> unionProcess(vector<int> setA, vector<int> setB)
{
	for (int valueB : setB)
	{
		bool exist = false;
		
		for (int valueA : setA)
		{
			if (valueA == valueB)
			{
				exist = true;
				break;
			}
		}
		
		if (!exist) setA.push_back(valueB);
	}
	
	return setA;
}

vector<int> intersectionProcess(vector<int> setA, vector<int> setB)
{
	vector<int> results;
	
	for (int valueB : setB)
	{
		bool exist = false;
		
		for (int valueA : setA)
		{
			if (valueA == valueB)
			{
				exist = true;
				break;
			}
		}
		
		if (exist) results.push_back(valueB);
	}
	
	return results;
}

void printArrayAsc(vector<int> arr)
{
	if (arr.empty())
	{
		cout << "none" << endl;
		return;
	}
	
	sort(arr.begin(), arr.end());
	
	for (size_t i = 0; i < arr.size(); i++)
	{
	    cout << arr[i];
	    if (i < arr.size() - 1)
	        cout << " ";
	}
	
	cout << endl;
}
