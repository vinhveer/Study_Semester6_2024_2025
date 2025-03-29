#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void InputArray(vector<string>& arr)
{
	int size;
	cin >> size;
	
	string temp;
	
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
	
	return results;
}

void PrintArrayAsc(vector<string> arr)
{
	if (arr.empty())
	{
		cout << "none";
		return;
	}
	
	sort(arr.begin(), arr.end(), Compare())
	
	for (string value : arr)
		cout << value << " ";
}


bool isNumberic(string s)
{
	if (s.empty()) return false;
	for (char c : s)
		if (!isdigit(c))
			return false;
			
	return true;
}

bool Compare(const string& a, const string& b)
{
	bool a_is_number = isNumberic(a);
	bool b_is_number = isNumberic(b);
	
	if (a_is_number != b_is_number) return a_is_number;
	
	return a < b;
}

int main()
{
	vector<string> setA;
	vector<string> setB;
	
	InputArray(setA);
	InputArray(setB);
	
	PrintArrayAsc(SubtractionProcess(setA, setB));
}

