//�ؼ�:��J�۹��������l��(ex:C6H5OH)�A��X���������l�q

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
	int T;//��J����
	int sz;//�r�����
	char buf[256];//�r��x�}

	//�ϥ�map(dict)�Ӧs�񤸯��Ÿ���������l�q
	map<char, double> w = { {'C',12.01},{'H',1.008},{'O',16.0},{'N',14.01} };
	//�̫᪺���G
	list<string> finalresilt;
	
	//��J�n�i��p�⪺���l������
	cout << "�п�J���ơG" << endl;
	cin >> T;
	

	while(T>0)
	{	
		string b = "";//�s��C�@�����l���e�{���G
		double result = 0;//���l�q
		
		//��J���l���M�p��r���Ӽ�(sz)
		cout << "�п�J���l��(c�Bh�Bo�Bn)�G" << endl;
		cin >> buf;
		sz = strlen(buf);

		//���l�q���p��
		for (int i = 0; i < sz; i++)
		{
			double cnt = 0;//�ӧO��l�q
			double sum = 0;//��l�q�e�W��l��
			char z = buf[i];//�C�@�Ӧr��
			char y ;//�Ψ��ˬd�U�@�Ӧr��
			int x = 0;//��l��

			//�ˬd�C�@�Ӧr���O�Ʀr�έ^��(�^�媺�ܥ������ন�j�g)
			if (z >= 'a'&& z <= 'z' || z >= 'A'&& z <= 'Z') {
				bool t = isupper(z);//�O�_���j�g
				if (t != 1) {
					z -= 32;
				}
				else  z = z;
			}
			cnt = w[z];//�ӧO��l�ơA���A�r�夤����l�q�|�O0

			//�ˬd������l�U�@�Ӧr�����Ʀr�έ^��
			if (cnt != 0)
			{
				if (i + 1 < sz)//�ˬd�U�@�Ӧr����m���S���W�L�r���d��
				{
					y = buf[i + 1];//�U�@�Ӧr��

					//�p�G�O�Ʀr�A��l�Ƭ��ӼƦr�A�p�G���^��h��l�Ƭ�1
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
			sum = cnt * x;//�i��o�@�ӭ�l���p��
			

			result = result + sum;//�`���l�ƪ��[�`
			
		}
		//�N��ӵ��G�i�槹�㪺�e�{(ex:c*6+h*2 = 74.....)
		for (int i = 0; i < sz; i++)
		{
			char z = buf[i];
			char y = buf[i + 1];
			b += z;
			//�p�G�᭱�O�^��['+'�A�Ʀr�['*'�A�̫�['='�[���G
			if (y >= 'a'&& y <= 'z' || y >= 'A'&& y <= 'Z') b += "+";
			if (y >= '0'&& y <= '9')b += "*";
			if (i == sz - 1){ 
				b += "=";
				string result_str = to_string(result);
				b += result_str;
			}
		}	
	//�N���G��J���Glist��
	finalresilt.push_back(b);
	//��J���ƴ�@
	T = T - 1;
	}

	//�N���G����e�{(�C�@�Ӥ��l��)
	for (string element : finalresilt)
	{
		cout << element << endl;
	}
	return 0;
}