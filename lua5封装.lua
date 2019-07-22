--[[
People = {age = 18}
function People:new()
	print(type(self))
	local p = {}
	setmetatable(p,self)
	print(p)
	print(self)
	self._index = self
	return p
end

function People:growup()
	self.age = self.age + 1
	print(self.age)
end

--对象p1

p1 = People:new()
p1:growup()
p1:growup()

--对象p2
p2  = People:new()
p2:growup()
--]]

People = {age=18}
function People:new()
    print(type(self))
    local p = {}
    setmetatable(p,self)
    print(p)
    print(self)
    self.__index = self
    return p
end



function People:growup()
    self.age = self.age +1
    print(self.age)
end


--对象p1
p1 = People:new()
p1:growup()
p1:growup()
--对象p2
p2 = People:new()
p2:growup()

--metatable 和__index实现的继承

People = {age =18}

function People:new()
	local p ={}
	setmetatable(p,self)
	self.__index = self
	return p
end

function People:growup()
	self.age = self.age +1
	print("People:"..self.age)
end

--man 等于p的表（p的元表是people）
Man = People:new()
--注意：定义这个方法其实就是向Man表添加函数
function Man:growup()
	self.age = self.age +1
	print("man:"..self.age)
end

--调用People的new方法因为p表没有键，所以去元表里找
man1 = Man:new()
man1:growup()


--[[

People = {age=18}

function People:new()

    local p = {}
    setmetatable(p,self)

    self.__index = self
    return p
end

function People:growup()
    self.age = self.age +1
    print("People:"..self.age)
end

--man 等于p的表(p的元表是People)
Man =People:new()
--注意:定义这个方法其实就是向Man 表添加函数
function Man:growup()
    self.age = self.age +1
    print("man："..self.age)
end

--调用People的new方法因为 p表没有键，所以去元表里找
man1 = Man:new()
-- function Man:growup()，这样我们的表其实已经有了这个函数
--所以不会去元表里找键了
man1:growup()

--]]

--lua的多态base
--使用Lua实现C++类似的多态，看起来略微难了一些，这个demo,默认提供了init类似构造函数的时机


--base.lua代码
--保存类类型的虚表
local _class = {}
function BaseClass(super)
    -- 生成一个类类型
    local class_type = {}
    -- 在创建对象的时候自动调用
    class_type.__init = false
    class_type.__delete = false
    class_type.super = super
    class_type.New = function(...)

        -- 生成一个类对象
        local obj = {}
        obj._class_type = class_type

        -- 在初始化之前注册基类方法
        setmetatable(obj, { __index = _class[class_type] })

        -- 调用初始化方法
        do
            local create
            create = function(c, ...)
                if c.super then
                    create(c.super, ...)
                end
                if c.__init then
                    c.__init(obj, ...)
                end
            end

            create(class_type, ...)
        end

        -- 注册一个delete方法
        obj.DeleteMe = function(self)
            local now_super = self._class_type
            while now_super ~= nil do
                if now_super.__delete then
                    now_super.__delete(self)
                end
                now_super = now_super.super
            end
        end

        return obj
    end

    local vtbl = {}
    _class[class_type] = vtbl

    setmetatable(class_type, {__newindex =
    --table key value
        function(t,k,v)
            vtbl[k] = v
        end
        ,
        __index = vtbl, --For call parent method
    })

    if super then
        setmetatable(vtbl, {__index =
            function(t,k)
                local ret = _class[super][k]

                return ret
            end
        })
    end

    return class_type
end


--main.lua代码
require"base"

father = father or BaseClass()
function father:__init()
    print("father:init")
end

function father:Bind()
    print("father:Bind")
end

function father:play()
    print("father:play")
end


son = son or BaseClass(father)

function son:__init()
    print("son:init")
end

function son:Bind()
    print("son:Bind")
end

function son:UnBind()

end


a = nil
a = son:New()
a:play()
a:Bind()

print("-----------------------------------")

--base.lua代码
--保存类类型的虚表


--[[
local _class = {}
function BaseClass(super)
	--生成一个类类型
	local class_type ={}
	--在创建对象的时候自动调用
	class_type.__init =false
	class_type.__delete =false
	class_type.super =super
	class_type.New = function(...)


	--生成一个类对象
	local obj = {}
	obj._class_type = class_type

--]]

--debug.lua

--debug.debug()
print('1')

print('2')
--debug.debug()
print('3')
--debug.debug()
print('4')

--debug.debug()








