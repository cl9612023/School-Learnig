#include <iostream>
#include<string>
#include <list>
using namespace std;

int main() 
{
	char a[120];//���ͦr���x�}
	int T;//��J����
	list <string> result;//���G�M��

	//���Ϳ�J���ܩM�ƤJ����
	cout << "�п�J���ơG" << endl;
	cin >> T;
	
	//�ھڿ�J�����ư���j��
	while (T > 0)
	{
		//�p�⦸�ƩM��J�n�p�⪺�r��
		cout << "��" << T << "��" << endl;
		cout << "�п�Jo��x�G" << endl;
		cin >> a;
		//�r������&�ֿn����&�`��
		int sz;
		int cont = 0;
		int sum = 0;
		string b = "";
		sz = strlen(a);
		//�i��P�_�Oo��x�i����Ʋֿn
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
			//�i����ƥ[�`
			sum = sum + cont;
		}
		//�N��J���r���ন�r��
		for (int i = 0; i < sz; i++) 
		{
			b += a[i] ;
			b +=  "+";
		}

		string sum_str = to_string(sum);//�Nint�নstr
		b += "=" ;
		b += sum_str;
		//�N���G�r���ilist��
		result.push_back(b);
	
		//��J���ƴ�@
		T = T - 1;
	}
	//�̫�Nlist���Ҧ����G�i��
	for (string element: result) {
		cout << element <<endl;
	}
	return 0;
}


