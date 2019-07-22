
--��������һ�ֶ������ܹ�����������׼ģ�������еĲ��ֻ�ȫ��Ԫ��


--1.����for������������for���Լ��ڲ��������������ʵ��������������ֵ������������״̬���������Ʊ���

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
     local element = it()  --����������������ڿ������Ϊ��while������
     if element == nil then
         break
     end
     print(element)
 end


 --2.��״̬���������������κ�״̬

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

--3.��״̬�ĵ�����

array ={"Lua","Tutorial" }

function elementIterator(collection)
	local index =0
	local count = #collection

--�հ�����
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


--��Lua �ṩ��Ԫ��Metatable�    �
--�������Ǹı�table����Ϊ��ÿ����Ϊ�����˶�Ӧ��Ԫ����

--setmetatable(table, metatable)
--getmetatable(table)

mytable ={}   --��ͨ��
mymetatable ={}  --Ԫ��
setmetatable(mytable, mymetatable)  --��mymetable ��Ϊmytable��Ԫ��

--���ϴ���Ҳ����ֱ��д��һ��

mytable = setmetatable({},{})


 --����Ϊ���ض���Ԫ��
 getmetatable(mytable)


--���_index������һ�������ظ�1��2��3
--���_index������һ���������򷵻ظú����ķ���ֵ��table�ͼ�����Ϊ�������ݣ�


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

--�򻯰�

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


--�򻯰�
mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)


 --__newindex �����Ա���£�__index�������Ա����

mymetatable = {}
mytable =setmetatable({key1 = "value1"},{__newindex = mymetatable})
print(mytable.key1)

mytable.newkey = "��ֵ2"

print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "��ֵ1"
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


--�����Ӳ�����  __add
--�Զ�������������ֵ����table_maxn ,��������Ԫ�ظ���

function table_maxn(t)
	local mn = 0
	for k,v in pairs(t)  do
		if mn < k  then
			mn =k
		end
	end
	return mn
end

--������Ӳ���
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


--__callԪ������Lua����һ��ֵʱ����

function table_maxn(t)
	local mn =0
	for k,v in pairs(t)  do
		if mn < k then
			 mn = k
		end
	end
	return mn
end

--����Ԫ����__call
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


--__tostring Ԫ���������޸ı�������Ϊ

mytable = setmetatable({10,20,30},{
	__tostring = function(mytable)
		sum =0
		for k, v in pairs(mytable) do
			sum = sum +v
		end
		return"��������Ԫ�صĺ�Ϊ"..sum
	end
})

print(mytable)




























