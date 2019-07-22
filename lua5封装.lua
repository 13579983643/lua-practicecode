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

--����p1

p1 = People:new()
p1:growup()
p1:growup()

--����p2
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


--����p1
p1 = People:new()
p1:growup()
p1:growup()
--����p2
p2 = People:new()
p2:growup()

--metatable ��__indexʵ�ֵļ̳�

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

--man ����p�ı�p��Ԫ����people��
Man = People:new()
--ע�⣺�������������ʵ������Man����Ӻ���
function Man:growup()
	self.age = self.age +1
	print("man:"..self.age)
end

--����People��new������Ϊp��û�м�������ȥԪ������
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

--man ����p�ı�(p��Ԫ����People)
Man =People:new()
--ע��:�������������ʵ������Man ����Ӻ���
function Man:growup()
    self.age = self.age +1
    print("man��"..self.age)
end

--����People��new������Ϊ p��û�м�������ȥԪ������
man1 = Man:new()
-- function Man:growup()���������ǵı���ʵ�Ѿ������������
--���Բ���ȥԪ�����Ҽ���
man1:growup()

--]]

--lua�Ķ�̬base
--ʹ��Luaʵ��C++���ƵĶ�̬����������΢����һЩ�����demo,Ĭ���ṩ��init���ƹ��캯����ʱ��


--base.lua����
--���������͵����
local _class = {}
function BaseClass(super)
    -- ����һ��������
    local class_type = {}
    -- �ڴ��������ʱ���Զ�����
    class_type.__init = false
    class_type.__delete = false
    class_type.super = super
    class_type.New = function(...)

        -- ����һ�������
        local obj = {}
        obj._class_type = class_type

        -- �ڳ�ʼ��֮ǰע����෽��
        setmetatable(obj, { __index = _class[class_type] })

        -- ���ó�ʼ������
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

        -- ע��һ��delete����
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


--main.lua����
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

--base.lua����
--���������͵����


--[[
local _class = {}
function BaseClass(super)
	--����һ��������
	local class_type ={}
	--�ڴ��������ʱ���Զ�����
	class_type.__init =false
	class_type.__delete =false
	class_type.super =super
	class_type.New = function(...)


	--����һ�������
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








