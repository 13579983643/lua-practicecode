
string1 = "Lua"
print("\"�ַ���1��\"",string1)

string2 ='csdn.com'
print("�ַ���2��",string2)

string3 = [["Lua�̳�"]]  --
print("�ַ���3��",string3)


print("hello \n world")
print("hello \r------world")

print("-1---------תΪ��д")
a="aaa"
print(string.upper(a))

print("-2---------תΪСд")
a="AAA"
print(string.lower(a))

print("-3---------�滻")

a ="bbbbb"
print(string.gsub(a,"b","c",3))
print(a)

print("-4---------����")
print(string.find("Hello Lua user", "Lua", 1))

print("-5---------��ת")
print(string.reverse("Lua"))

print("-6---------��ʽ��")
print(string.format("the value is:%d",4))
print("-7---------char ����������ת���ַ�������")

print(string.char(97,98,99,100))
print(string.byte("ABCD",4))
print(string.byte("ABCD"))


print("-8---------�����ַ�������")
print(string.len("abc"))
print("-9---------�����ַ�����n��copy")
print(string.rep("abcd",2))
print("-10---------���������ַ���")
print("www.csdn".."com")
print("-11---------gmatch")


for word in string.gmatch("Hello Lua user", "%a+")  --ƥ������ĸ
do
    print(word)
end

print("-12---------match")
print(string.match("I have 2 questions for you.", "%d+ %a+"))--���� ��ĸ


string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20

-- �����ַ�����ʽ��
print(string.format("������ʽ�� %s %s",string1,string2))
-- ���ڸ�ʽ��
date = 2; month = 1; year = 2014
print(string.format("���ڸ�ʽ�� %02d/%02d/%09d", date, month, year))
-- ʮ���Ƹ�ʽ��
print(string.format("%.9f",1/3))


--�ַ�ת��


print(string.byte("Lua"))
print(string.byte("Lua",3))
print(string.byte("Lua",-1))
print(string.byte("Lua",2))
print(string.byte("Lua",-2))

--5,ƥ��ģʽ

s ="Deadline is 30/05/1999,firm"
date = "%d%d/%d%d/%d%d%d%d"

print(string.sub(s, string.find(s,date)))  --����dd/mm/yyyy��ʽ������



print(string.gsub("hello,up-down!","%A","."))

--����
--һά��������򵥵����飬���߼��ṹ�����Ա�

array ={ "Lua","C++"}

for i = 0,2 do
   print(array[i])
end

print(array[0])


array ={}

for i = -2 ,2 do
   array[i]  = i*2
end

for i = -2, 2 do
    print(array[i])
end


array ={}
for i =1,3 do
   array[i] = {}
		for j =1,3 do
			array[i][j] = i*j
		end
end

for i = 1,3 do
	for j =1,3 do
		print(array[i][j])
	end
end

array ={}
maxRows = 3
maxColumns =3
for row =1 ,maxRows do
	for col =1 , maxColumns do
		array[row*maxColumns +col] = row*col
	end
end

print("��������--------")
for row =1 ,maxRows do
	for col =1,maxColumns do
		print(array[row*maxColumns +col])
	end
end





















