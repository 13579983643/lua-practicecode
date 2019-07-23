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


--lua 语言中的点，冒号与self

girl ={money = 200 }

function girl.goToMarket(girl,someMoney)--点号定义
	girl.money = girl.money - someMoney
end

girl.goToMarket(girl,100) --点号调用
print(girl.money)


boy = {money =2000}
function boy:goToMarket(someMoney)
	self.money = self.money - someMoney
end
boy:goToMarket(100)  --把第一个隐藏参数省略
print(boy.money)


boy= {money =2001}
function boy.goToMarket(self,someMoney)
	self.money = self.money -someMoney
end

boy:goToMarket(100)
print(boy.money)

--lua --string 之 string.gsub  全局替换子字符串

x = string.gsub("hello world", "(%w+)", "%1 %1")
print(x)

x = string.gsub("hello world", "%w+", "%0 %0", 1)  --%0代表所有的匹配
print(x)

x = string.gsub("hello world from Lua", "(%w+)%s*(%w+)", "%2 %1")
print(x)

x = string.gsub("home = $HOME, user = $USER", "%$(%w+)", os.getenv)  --返回当前进程的环境变量varname的值,若变量没有定义时返回nil
print(x)

x = string.gsub("4+5 = $return 4+5$", "%$(.-)%$", function (s)
 return loadstring(s)()
end)
print(x)

local t = {name="lua", version="5.1"}
     x = string.gsub("$name-$version.tar.gz", "%$(%w+)", t)
print(x)



--lua 中的 loadstring()
i =1
local i =0
f = loadstring("i = 1+i ;print(i)")  --操作的是全局变量
g = function()      --操作的是局部变量
		i = 1+i
		print(i)
	end
f()
g()



--lau 中的 string.rep()

local sourcestr ="this is a string"
print("\nsourcestr is :"..sourcestr)

local first_ret = string.rep(sourcestr,3)
print(" \nfirst_ret is:"..first_ret)


-- 字符串里包括`\0`
local otherstr = "this is a string \0 hahaha "
print("\notherstr is : "..string.format("%q", otherstr))

-- 再次使用函数拼接
first_ret = string.rep(otherstr, 3)
print("\nfirst_ret is : "..string.format("%q", first_ret))

-- 再次使用操作符`..`拼接
second_ret = otherstr
for i=1, 2 do
    second_ret = second_ret..otherstr
end
print("\nsecond_ret is : "..string.format("%q", second_ret))












