//目標:輸入相對應的分子式(ex:C6H5OH)，算出對應的分子量

#include <iostream>
#include <map>
#include<string>
#include<list>

using std::cout;
using std::endl;
using std::cin;
using std::map;
using std::string;
using std::list;
using std::to_string;


int main()
{
	int T;//輸入次數
	int sz;//字串長度
	char buf[256];//字串矩陣

	//使用map(dict)來存放元素符號對應的原子量
	map<char, double> w = { {'C',12.01},{'H',1.008},{'O',16.0},{'N',14.01} };
	//最後的結果
	list<string> finalresilt;
	
	//輸入要進行計算的分子式次數
	cout << "請輸入次數：" << endl;
	cin >> T;
	

	while(T>0)
	{	
		string b = "";//存放每一次分子式呈現結果
		double result = 0;//分子量
		
		//輸入分子式和計算字元個數(sz)
		cout << "請輸入分子式(c、h、o、n)：" << endl;
		cin >> buf;
		sz = strlen(buf);

		//分子量的計算
		for (int i = 0; i < sz; i++)
		{
			double cnt = 0;//個別原子量
			double sum = 0;//原子量呈上原子數
			char z = buf[i];//每一個字元
			char y ;//用來檢查下一個字元
			int x = 0;//原子數

			//檢查每一個字元是數字或英文(英文的話全部都轉成大寫)
			if (z >= 'a'&& z <= 'z' || z >= 'A'&& z <= 'Z') {
				bool t = isupper(z);//是否為大寫
				if (t != 1) {
					z -= 32;
				}
				else  z = z;
			}
			cnt = w[z];//個別原子數，不再字典中的原子量會是0

			//檢查對應原子下一個字元為數字或英文
			if (cnt != 0)
			{
				if (i + 1 < sz)//檢查下一個字元位置有沒有超過字元範圍
				{
					y = buf[i + 1];//下一個字元

					//如果是數字，原子數為該數字，如果為英文則原子數為1
					if (y >= '0'&& y <= '9')
					{
						x = y - '0';
					}
					else
					{
						x = 1;
					}

				}
				else
				{
					x = 1;
				}

			}
			else
			{
				x = 1;

			}
			sum = cnt * x;//進行這一個原子的計算
			

			result = result + sum;//總分子數的加總
			
		}
		//將整個結果進行完整的呈現(ex:c*6+h*2 = 74.....)
		for (int i = 0; i < sz; i++)
		{
			char z = buf[i];
			char y = buf[i + 1];
			b += z;
			//如果後面是英文加'+'，數字加'*'，最後加'='加結果
			if (y >= 'a'&& y <= 'z' || y >= 'A'&& y <= 'Z') b += "+";
			if (y >= '0'&& y <= '9')b += "*";
			if (i == sz - 1){ 
				b += "=";
				string result_str = to_string(result);
				b += result_str;
			}
		}	
	//將結果放入結果list中
	finalresilt.push_back(b);
	//輸入次數減一
	T = T - 1;
	}

	//將結果完整呈現(每一個分子數)
	for (string element : finalresilt)
	{
		cout << element << endl;
	}
	return 0;
}