--[[
unilight.debug = function(...)
	go.logging.Debug(...)
end


function class:Debug(...)
 		unilight.debug(self:GetLogPrefix() .. unpack(arg))
	end


--]]


print(os.time())

print(os.date("%m/%d/%y,%H:%M:%S",os.time({day=26,month=5,year=2014,hour =0,min=0,sec=0})))
print("===============os.date()==",os.date("%Y-%m-%d%H:%M:%S",1479892620))


--lua �����еĵ㣬ð����self

girl ={money = 200 }

function girl.goToMarket(girl,someMoney)--��Ŷ���
	girl.money = girl.money - someMoney
end

girl.goToMarket(girl,100) --��ŵ���
print(girl.money)


boy = {money =2000}
function boy:goToMarket(someMoney)
	self.money = self.money - someMoney
end
boy:goToMarket(100)  --�ѵ�һ�����ز���ʡ��
print(boy.money)


boy= {money =2001}
function boy.goToMarket(self,someMoney)
	self.money = self.money -someMoney
end

boy:goToMarket(100)
print(boy.money)

--lua --string ֮ string.gsub  ȫ���滻���ַ���

x = string.gsub("hello world", "(%w+)", "%1 %1")
print(x)

x = string.gsub("hello world", "%w+", "%0 %0", 1)  --%0�������е�ƥ��
print(x)

x = string.gsub("hello world from Lua", "(%w+)%s*(%w+)", "%2 %1")
print(x)

x = string.gsub("home = $HOME, user = $USER", "%$(%w+)", os.getenv)  --���ص�ǰ���̵Ļ�������varname��ֵ,������û�ж���ʱ����nil
print(x)

x = string.gsub("4+5 = $return 4+5$", "%$(.-)%$", function (s)
 return loadstring(s)()
end)
print(x)

local t = {name="lua", version="5.1"}
     x = string.gsub("$name-$version.tar.gz", "%$(%w+)", t)
print(x)



--lua �е� loadstring()
i =1
local i =0
f = loadstring("i = 1+i ;print(i)")  --��������ȫ�ֱ���
g = function()      --�������Ǿֲ�����
		i = 1+i
		print(i)
	end
f()
g()



--lau �е� string.rep()

local sourcestr ="this is a string"
print("\nsourcestr is :"..sourcestr)

local first_ret = string.rep(sourcestr,3)
print(" \nfirst_ret is:"..first_ret)


-- �ַ��������`\0`
local otherstr = "this is a string \0 hahaha "
print("\notherstr is : "..string.format("%q", otherstr))

-- �ٴ�ʹ�ú���ƴ��
first_ret = string.rep(otherstr, 3)
print("\nfirst_ret is : "..string.format("%q", first_ret))

-- �ٴ�ʹ�ò�����`..`ƴ��
second_ret = otherstr
for i=1, 2 do
    second_ret = second_ret..otherstr
end
print("\nsecond_ret is : "..string.format("%q", second_ret))












