
string1 = "Lua"
print("\"字符串1是\"",string1)

string2 ='csdn.com'
print("字符串2是",string2)

string3 = [["Lua教程"]]  --
print("字符串3是",string3)


print("hello \n world")
print("hello \r------world")

print("-1---------转为大写")
a="aaa"
print(string.upper(a))

print("-2---------转为小写")
a="AAA"
print(string.lower(a))

print("-3---------替换")

a ="bbbbb"
print(string.gsub(a,"b","c",3))
print(a)

print("-4---------查找")
print(string.find("Hello Lua user", "Lua", 1))

print("-5---------反转")
print(string.reverse("Lua"))

print("-6---------格式化")
print(string.format("the value is:%d",4))
print("-7---------char 将整型数字转成字符并连接")

print(string.char(97,98,99,100))
print(string.byte("ABCD",4))
print(string.byte("ABCD"))


print("-8---------计算字符串长度")
print(string.len("abc"))
print("-9---------返回字符串的n个copy")
print(string.rep("abcd",2))
print("-10---------连接两个字符串")
print("www.csdn".."com")
print("-11---------gmatch")


for word in string.gmatch("Hello Lua user", "%a+")  --匹配多个字母
do
    print(word)
end

print("-12---------match")
print(string.match("I have 2 questions for you.", "%d+ %a+"))--数字 字母


string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20

-- 基本字符串格式化
print(string.format("基本格式化 %s %s",string1,string2))
-- 日期格式化
date = 2; month = 1; year = 2014
print(string.format("日期格式化 %02d/%02d/%09d", date, month, year))
-- 十进制格式化
print(string.format("%.9f",1/3))


--字符转换


print(string.byte("Lua"))
print(string.byte("Lua",3))
print(string.byte("Lua",-1))
print(string.byte("Lua",2))
print(string.byte("Lua",-2))

--5,匹配模式

s ="Deadline is 30/05/1999,firm"
date = "%d%d/%d%d/%d%d%d%d"

print(string.sub(s, string.find(s,date)))  --搜索dd/mm/yyyy格式的日期



print(string.gsub("hello,up-down!","%A","."))

--数组
--一维数组是最简单的数组，其逻辑结构是线性表

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

print("访问数组--------")
for row =1 ,maxRows do
	for col =1,maxColumns do
		print(array[row*maxColumns +col])
	end
end





















