
--迭代器是一种对象，他能够用来遍历标准模板容器中的部分或全部元素


--1.泛型for迭代器，泛型for在自己内部保存迭代函数，实际上他保存三个值：迭代函数、状态常量、控制变量

array = {"Lua","C++"}
for key, value in ipairs(array)
do
   print(key,value)
end

array ={ "Lua","C++",a=1,b=2,"java"}
for key,value in ipairs(array)
do
   print(key,value)
end



local tabFiles = {
  [3] ="test2",
  [6] = "test3",
  [4]  ="test1"
}

for k,v in ipairs(tabFiles) do
   print(k,v)
end


print(tabFiles[5])

a = { "Hello","World"; a=1,b=2,z=3 ,x=10,y=20;"Good" ,"Bye" }
for i, v in ipairs(a) do
	print(v)
end

a={"Hello","World";a=1,b=2,z=3,x=10,y=20;"Good","Bye"}
for i, v in pairs(a) do
    print(v)
end

function values(t)
     local i = 0
     return function()
         i = i + 1
         return t[i]
     end
 end


 t = {10, 20, 30}
 it = values(t)
 while true do
     local element = it()  --这个函数的生命周期可以理解为在while函数内
     if element == nil then
         break
     end
     print(element)
 end


 --2.无状态迭代器，不保留任何状态

 function square(iteratorMaxCount,currentNumber)
	if currentNumber < iteratorMaxCount
	then
		currentNumber = currentNumber +1
	return currentNumber,currentNumber*currentNumber
	end
end

 for i,n in square ,3,0
 do
	print(i,n)
 end

--3.多状态的迭代器

array ={"Lua","Tutorial" }

function elementIterator(collection)
	local index =0
	local count = #collection

--闭包函数
	return function()
		index = index + 1
		if index <= count then
			return collection[index]
		end
	end
end

for element in elementIterator(array)
do
	print(element)
end


--在Lua 提供了元表（Metatable�    �
--允许我们改变table的行为，每个行为关联了对应的元方法

--setmetatable(table, metatable)
--getmetatable(table)

mytable ={}   --普通表
mymetatable ={}  --元表
setmetatable(mytable, mymetatable)  --把mymetable 设为mytable的元表

--以上代码也可以直接写成一行

mytable = setmetatable({},{})


 --以下为返回对象元表
 getmetatable(mytable)


--如果_index方法是一个表，则重复1、2、3
--如果_index方法是一个函数，则返回该函数的返回值（table和键会作为参数传递）


mytable = setmetatable( {key1 = "value1"},{
     __index = function(mytable,key)
		if key == "key2" then
			return "metatablevalue"
		else
			return nil
		end
	 end
})

print(mytable.key1,mytable.key2)

--简化版

mytable = setmetatable({ key1 = "value1"},{ __index = { key2 = "metatablevalue"}})
print(mytable.key1, mytable.key2)


mytable = setmetatable({key1 = "value1"}, {
  __index = function(mytable, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end
})

print(mytable.key1,mytable.key2)


--简化版
mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)


 --__newindex 用来对表更新，__index则用来对表访问

mymetatable = {}
mytable =setmetatable({key1 = "value1"},{__newindex = mymetatable})
print(mytable.key1)

mytable.newkey = "新值2"

print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)

print("---------------------------")
mytable = setmetatable( {key1 = "value1"},{
	__newindex = function(mytable,key,value)
		rawset(mytable,key,"\""..value.."\"")
end
})

mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1,mytable.key2)


--表的相加操作符  __add
--自定义计算表中最大键值函数table_maxn ,即计算表的元素个数

function table_maxn(t)
	local mn = 0
	for k,v in pairs(t)  do
		if mn < k  then
			mn =k
		end
	end
	return mn
end

--两表相加操作
mytable = setmetatable({1,2,3},{
	__add = function(mytable,newtable)
		for i =1,table_maxn(newtable) do
			table.insert(mytable,table_maxn(mytable)+1,newtable[i])
		end
		return mytable
	end
})

secondtable = {4,5,6}

mytable = mytable + secondtable

for k,v in ipairs(mytable) do
	print(k,v)
end


--__call元方法在Lua调用一个值时调用

function table_maxn(t)
	local mn =0
	for k,v in pairs(t)  do
		if mn < k then
			 mn = k
		end
	end
	return mn
end

--定义元方法__call
mytable = setmetatable({10},{
	__call = function(mytable,newtable)
		sum =0
		for i =1,table_maxn(mytable) do
			sum = sum + mytable[i]
		end
		for i =1,table_maxn(newtable) do
			sum = sum +newtable[i]
		end
		return sum
	end
})

newtable = {10,20,30}
print(mytable(newtable))


--__tostring 元方法用于修改表的输出行为

mytable = setmetatable({10,20,30},{
	__tostring = function(mytable)
		sum =0
		for k, v in pairs(mytable) do
			sum = sum +v
		end
		return"表中所有元素的和为"..sum
	end
})

print(mytable)




























