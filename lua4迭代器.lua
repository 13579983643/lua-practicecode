
--µü´úÆ÷ÊÇÒ»ÖÖ¶ÔÏó£¬ËûÄÜ¹»ÓÃÀ´±éÀú±ê×¼Ä£°åÈİÆ÷ÖĞµÄ²¿·Ö»òÈ«²¿ÔªËØ


--1.·ºĞÍforµü´úÆ÷£¬·ºĞÍforÔÚ×Ô¼ºÄÚ²¿±£´æµü´úº¯Êı£¬Êµ¼ÊÉÏËû±£´æÈı¸öÖµ£ºµü´úº¯Êı¡¢×´Ì¬³£Á¿¡¢¿ØÖÆ±äÁ¿

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
     local element = it()  --Õâ¸öº¯ÊıµÄÉúÃüÖÜÆÚ¿ÉÒÔÀí½âÎªÔÚwhileº¯ÊıÄÚ
     if element == nil then
         break
     end
     print(element)
 end


 --2.ÎŞ×´Ì¬µü´úÆ÷£¬²»±£ÁôÈÎºÎ×´Ì¬

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

--3.¶à×´Ì¬µÄµü´úÆ÷

array ={"Lua","Tutorial" }

function elementIterator(collection)
	local index =0
	local count = #collection

--±Õ°üº¯Êı
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


--ÔÚLua Ìá¹©ÁËÔª±í£¨Metatable£    ©
--ÔÊĞíÎÒÃÇ¸Ä±ätableµÄĞĞÎª£¬Ã¿¸öĞĞÎª¹ØÁªÁË¶ÔÓ¦µÄÔª·½·¨

--setmetatable(table, metatable)
--getmetatable(table)

mytable ={}   --ÆÕÍ¨±í
mymetatable ={}  --Ôª±í
setmetatable(mytable, mymetatable)  --°Ñmymetable ÉèÎªmytableµÄÔª±í

--ÒÔÉÏ´úÂëÒ²¿ÉÒÔÖ±½ÓĞ´³ÉÒ»ĞĞ

mytable = setmetatable({},{})


 --ÒÔÏÂÎª·µ»Ø¶ÔÏóÔª±í
 getmetatable(mytable)


--Èç¹û_index·½·¨ÊÇÒ»¸ö±í£¬ÔòÖØ¸´1¡¢2¡¢3
--Èç¹û_index·½·¨ÊÇÒ»¸öº¯Êı£¬Ôò·µ»Ø¸Ãº¯ÊıµÄ·µ»ØÖµ£¨tableºÍ¼ü»á×÷Îª²ÎÊı´«µİ£©


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

--¼ò»¯°æ

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


--¼ò»¯°æ
mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)


 --__newindex ÓÃÀ´¶Ô±í¸üĞÂ£¬__indexÔòÓÃÀ´¶Ô±í·ÃÎÊ

mymetatable = {}
mytable =setmetatable({key1 = "value1"},{__newindex = mymetatable})
print(mytable.key1)

mytable.newkey = "ĞÂÖµ2"

print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "ĞÂÖµ1"
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


--±íµÄÏà¼Ó²Ù×÷·û  __add
--×Ô¶¨Òå¼ÆËã±íÖĞ×î´ó¼üÖµº¯Êıtable_maxn ,¼´¼ÆËã±íµÄÔªËØ¸öÊı

function table_maxn(t)
	local mn = 0
	for k,v in pairs(t)  do
		if mn < k  then
			mn =k
		end
	end
	return mn
end

--Á½±íÏà¼Ó²Ù×÷
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


--__callÔª·½·¨ÔÚLuaµ÷ÓÃÒ»¸öÖµÊ±µ÷ÓÃ

function table_maxn(t)
	local mn =0
	for k,v in pairs(t)  do
		if mn < k then
			 mn = k
		end
	end
	return mn
end

--¶¨ÒåÔª·½·¨__call
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


--__tostring Ôª·½·¨ÓÃÓÚĞŞ¸Ä±íµÄÊä³öĞĞÎª

mytable = setmetatable({10,20,30},{
	__tostring = function(mytable)
		sum =0
		for k, v in pairs(mytable) do
			sum = sum +v
		end
		return"±íÖĞËùÓĞÔªËØµÄºÍÎª"..sum
	end
})

print(mytable)




























