--[[
mytable ={}  --��ʼ���� ��lua tableʹ�ù��������飬��������������͵�ֵ�������������

mytable[1] = "Lua"

--�Ƴ�����
mytable = nil

t={"sunday","monday","tuesday","wednesday","thursday","friday","saturday"}

print(t[1])
print(#t)

t1={
	name="��Ů",
	age=18,
	"��Ů���������1",
	"��Ů���������2"

}

print(t1[1].."\n"..t[2])
print(#t1)

print(t1[2])

print(t1.name)



mytable ={}

print("mytable��������",type(mytable))


mytable[1] = "Lua"
mytable["wow"] ="�޸�ǰ"

print("mytable ����Ϊ1��Ԫ����",mytable[1])
print("mytable ����Ϊwow��Ԫ����",mytable["wow"])

alternatetable = mytable

print("alternatetable ����Ϊ 1 ��Ԫ���� ", alternatetable[1])
print("alternatetable ����Ϊ wow ��Ԫ���� ", alternatetable["wow"])

alternatetable["wow"] ="�޸ĺ�"

print("mytable����Ϊwow��Ԫ����",mytable["wow"])


--�ͷű���
alternatetable =nil
print("alternatetable��",alternatetable)

--mytable ��Ȼ���Է���

print("mytable ����Ϊwow ��Ԫ����",mytable["wow"]  )

mytable = nil
print("mytable��",mytable)
print("mytable���ױ��ͷ�")


fruits = {"banana","orange","apple"}

print("���Ӻ���ַ���",table.concat(fruits))

print("���Ӻ���ַ���",table.concat(fruits,","))

print("���Ӻ���ַ���",table.concat(fruits,",",2,3))


fruits ={"banana","orange","apple"}

table.insert(fruits,"mango")

print("����Ϊ4��Ԫ��Ϊ",fruits[4])

table.insert(fruits,2,"grapes")
print("����Ϊ2��Ԫ��",fruits[2])


print("���һ��Ԫ��Ϊ",fruits[5])

table.remove(fruits)
print("�Ƴ����һ��Ԫ��Ϊ",fruits[5])



fruits = {"banana","orange","apple","grapes"}
print("����ǰ")
for k,v in ipairs(fruits) do
    print(k,v)
end

table.sort(fruits)
print("�����")
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
print("tbl����",#tbl)

print("tbl ���ֵ��",table_maxn(tbl))
print("tbl����",#tbl)

print(tbl[1])
print(tbl[2])
print(tbl[3])
print(tbl[4])


tbl ={[1] =2,[2]=6, [35]=34,[4]=55 }
print("tbl����",#tbl)


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
   print("a С��20");
end
   print("a��ֵΪ��",a);
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

--�������Ǳ��ʽֻ������һ��

for i=1,f(5) do print(i)
end
print("\n".."----------------")


--for (4-1)������forѭ��

--for var = start ,end,step  do

--��ֵѭ��
for i = 10,1,-1 do
   print(i)
end

print("\n".."..................")


--(4.2)����forѭ��

--�����ӡ

days = {"sunday","Monday","Tuesday","Wednesday","Thursday","Friday","saturday"  }

for i,v in ipairs(days)  do
    print(v)
end

--��������io.lines���ڱ�����
--pairs���ڱ���tableԪ��
--ipairs������������Ԫ��
--string.gmatch���ڵ����ַ����еĵ���

function func() end


--������������ֵ�����ֵ

function max(num1,num2)

   if(num1 > num2) then
       result = num1;
    else
	   result = num2;
    end

	return result;
end

--���ú���
print("��",max(10,4))
print("��ֵ�Ƚ����ֵΪ",max(5,6))


function foo()
  return 3,4

end

x,y= foo()
print(x,y)

s, e = string.find("www.csdn.com", "csdn")
print(s, e)


function maximum(a)
	local   mi = 1  --���ֵ����
	local   m= a[mi]
	for i, val in ipairs(a)  do  --�Զ�ʶ���Ӧ��i�ű�
		if val > m then
			mi = i
			m = val
		end
	end
	return m, mi
end

print(maximum({8,2,1,12,5}))


myprint = function(param)
   print("���Ǵ�ӡ���� - ##",param,"##")
end

function add(num1,num2,functionPrint)
	result = num1 +num2
	functionPrint(result)
end

myprint(10)
--myprint ������Ϊ��������

add(2,5,myprint)


function average(...)
	result =0
	local arg = {...}
	for i, v in ipairs(arg)  do
		result = result +v
	end
	print("�ܹ�����".. #arg .."����")
	return result/(#arg)
end

print("Ʒ��ֵΪ",average(10,5,3,4,5,6))


print(unpack{10,20,30})
a,b = unpack{10,20,30}
print(a,b)


a={"hello","11"}

print(string.find(unpack(a)))

--�հ�������ָһ������ж����һ����������λ���ڲ��ĺ���
--���Է����ⲿ�����еľֲ�����


class = {}  --һ������

function class.func1()

end

function class:func2()

end

--lua��":"��","������

--lua���á�:���ᴫ��һ����Ϊself�ı�����selfͬC++thisһ������ʾ��ǰ�����ָ��

function class.fun1(self) end
function class:fun2() end   --����һ��self��Ϊ����






















