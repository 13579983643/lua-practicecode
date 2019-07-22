--[[
mytable ={}  --初始化表 ，lua table使用关联型数组，你可以用任意类型的值来做数组的索引

mytable[1] = "Lua"

--移除索引
mytable = nil

t={"sunday","monday","tuesday","wednesday","thursday","friday","saturday"}

print(t[1])
print(#t)

t1={
	name="美女",
	age=18,
	"美女背后的男人1",
	"美女背后的男人2"

}

print(t1[1].."\n"..t[2])
print(#t1)

print(t1[2])

print(t1.name)



mytable ={}

print("mytable的类型是",type(mytable))


mytable[1] = "Lua"
mytable["wow"] ="修改前"

print("mytable 索引为1的元素是",mytable[1])
print("mytable 索引为wow的元素是",mytable["wow"])

alternatetable = mytable

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("alternatetable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] ="修改后"

print("mytable索引为wow的元素是",mytable["wow"])


--释放变量
alternatetable =nil
print("alternatetable是",alternatetable)

--mytable 仍然可以访问

print("mytable 索引为wow 的元素是",mytable["wow"]  )

mytable = nil
print("mytable是",mytable)
print("mytable彻底被释放")


fruits = {"banana","orange","apple"}

print("链接后的字符串",table.concat(fruits))

print("连接后的字符串",table.concat(fruits,","))

print("链接后的字符串",table.concat(fruits,",",2,3))


fruits ={"banana","orange","apple"}

table.insert(fruits,"mango")

print("索引为4的元素为",fruits[4])

table.insert(fruits,2,"grapes")
print("索引为2的元素",fruits[2])


print("最后一个元素为",fruits[5])

table.remove(fruits)
print("移除最后一个元素为",fruits[5])



fruits = {"banana","orange","apple","grapes"}
print("排序前")
for k,v in ipairs(fruits) do
    print(k,v)
end

table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
  print(k,v)
end

function table_maxn(t)
   local mn = nil;
    for k,v in pairs(t) do
        if(mn == nil) then
            mn= v
        end
        if mn < v then
			mn = v
		end
    end
    return mn
end

tbl ={[1] =2,[2]=6, [3]=34,[26]=5 }
print("tbl长度",#tbl)

print("tbl 最大值：",table_maxn(tbl))
print("tbl长度",#tbl)

print(tbl[1])
print(tbl[2])
print(tbl[3])
print(tbl[4])


tbl ={[1] =2,[2]=6, [35]=34,[4]=55 }
print("tbl长度",#tbl)


a=20
b=30

a,b=b,a

print(a,b)


function someValue()
	local a,b = 10,20
	return  a,b
end
print(someValue)


if true then
  do
    local a=20
	print(a)
  end
end


if(a < 20)
then
   print("a 小于20");
end
   print("a的值为：",a);
--]]


a=1

while a<35 do
   a=a+1
end
print(a)


local i = 0
repeat
	i =i+1
	print(i..",")
until i>3


function f(x)
	print("function")
	return x*2
end

--函数或是表达式只会运行一次

for i=1,f(5) do print(i)
end
print("\n".."----------------")


--for (4-1)数字型for循环

--for var = start ,end,step  do

--数值循环
for i = 10,1,-1 do
   print(i)
end

print("\n".."..................")


--(4.2)泛型for循环

--数组打印

days = {"sunday","Monday","Tuesday","Wednesday","Thursday","Friday","saturday"  }

for i,v in ipairs(days)  do
    print(v)
end

--迭代函数io.lines用于遍历行
--pairs用于遍历table元素
--ipairs遍历迭代数组元素
--string.gmatch用于迭代字符串中的单词

function func() end


--函数返回两个值的最大值

function max(num1,num2)

   if(num1 > num2) then
       result = num1;
    else
	   result = num2;
    end

	return result;
end

--调用函数
print("两",max(10,4))
print("两值比较最大值为",max(5,6))


function foo()
  return 3,4

end

x,y= foo()
print(x,y)

s, e = string.find("www.csdn.com", "csdn")
print(s, e)


function maximum(a)
	local   mi = 1  --最大值索引
	local   m= a[mi]
	for i, val in ipairs(a)  do  --自动识别对应的i脚标
		if val > m then
			mi = i
			m = val
		end
	end
	return m, mi
end

print(maximum({8,2,1,12,5}))


myprint = function(param)
   print("这是打印函数 - ##",param,"##")
end

function add(num1,num2,functionPrint)
	result = num1 +num2
	functionPrint(result)
end

myprint(10)
--myprint 函数作为参数传递

add(2,5,myprint)


function average(...)
	result =0
	local arg = {...}
	for i, v in ipairs(arg)  do
		result = result +v
	end
	print("总共传入".. #arg .."个数")
	return result/(#arg)
end

print("品均值为",average(10,5,3,4,5,6))


print(unpack{10,20,30})
a,b = unpack{10,20,30}
print(a,b)


a={"hello","11"}

print(string.find(unpack(a)))

--闭包函数是指一个函数卸载另一个函数里，这个位于内部的函数
--可以访问外部函数中的局部变量


class = {}  --一个对象

function class.func1()

end

function class:func2()

end

--lua中":"与","的区别

--lua中用“:”会传入一个名为self的变量，self同C++this一样，表示当前对象的指针

function class.fun1(self) end
function class:fun2() end   --传入一个self作为参数






















