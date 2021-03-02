#include <iostream>
#include<string>
#include <list>
using namespace std;

int main() 
{
	char a[120];//產生字元矩陣
	int T;//輸入次數
	list <string> result;//結果清單

	//產生輸入提示和數入次數
	cout << "請輸入次數：" << endl;
	cin >> T;
	
	//根據輸入的次數執行迴圈
	while (T > 0)
	{
		//計算次數和輸入要計算的字元
		cout << "剩" << T << "次" << endl;
		cout << "請輸入o或x：" << endl;
		cin >> a;
		//字元長度&累積分數&總分
		int sz;
		int cont = 0;
		int sum = 0;
		string b = "";
		sz = strlen(a);
		//進行判斷是o或x進行分數累積
		for (int i = 0; i < sz; i++)
		{
			if (a[i] == 'o')
			{
				cont = cont + 1;
			}
			else
			{
				cont = 0;
			}
			//進行分數加總
			sum = sum + cont;
		}
		//將輸入的字元轉成字串
		for (int i = 0; i < sz; i++) 
		{
			b += a[i] ;
			b +=  "+";
		}

		string sum_str = to_string(sum);//將int轉成str
		b += "=" ;
		b += sum_str;
		//將結果字串放進list中
		result.push_back(b);
	
		//輸入次數減一
		T = T - 1;
	}
	//最後將list中所有結果展示
	for (string element: result) {
		cout << element <<endl;
	}
	return 0;
}


