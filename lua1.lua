--[[
print("hello world")

print(type(var))

var = 20

print(type(var))

var = "helloworld"

print(type(var))

var = print

print(type(var))

var(type(var))

var ={}

print(type(var))

         var= nil

    if var then

         print("true")

     else

         print("false")

     end
--]]

	long_str = [====[ i am am

     "long",

     long

      str]====]

     print(long_str)







var ="hello".."hello"  --�����ַ���

print(var)

var = "hello".."hello"
print(var)
print(#var)  --��ȡ�ַ�������



   long_str = [==[ i am am

   "long",

   long

    str]==]

    print(long_str )


       print(#long_str)





t = {a = "test1", b= "test2"} --table ����C++�� map,��map ����

 print(t)


a = 21
b = 10
c = a+b
print("Line 1 -c ��ֵΪ ",c)

c = a-b
print("Line 2 -c ��ֵΪ",c)

--[[
     "long",

     long

      str
hellohello
hellohello
10
 i am am

   "long",

   long

    str
38
table: 0059A308
Line 1 -c ��ֵΪ 	31
Line 2 -c ��ֵΪ	11
>Exit code: 0
>lua -e "io.stdout:setvbuf 'no'" "lua1.lua"
 i am am

     "long",

     long

      str
hellohello
hellohello
10
 i am am

   "long",

   long

    str
38
table: 0052A268
Line 1 -c ��ֵΪ 	31
Line 2 -c ��ֵΪ	11
>Exit code: 0
>lua -e "io.stdout:setvbuf 'no'" "lua1.lua"
 i am am

     "long",

     long

      str
hellohello
hellohello
10
 i am am

   "long",

   long

    str
38
--]]

a = 21
b = 10

if(a == b)

then
    print("Line1 -a ����b")
else
    print("Line1 -a ������b")

end

if(a ~= b)

then
   print("Line2 -a ������b")
else
   print("Line2 -a ����b")
end

if(a<b)
then
  print("Line3 -a С��b")
else
   print("Line3 -a ����dengyub")
end

print("�õģ��೤")

a = false

b = true

if(a and b)
then
  print("a and b - ����Ϊ true")

else
  print("a and b - ����Ϊ false")
end


if(not(a and b))

then
  print("not(a and b) -����Ϊ true")

else
   print("not(a and b) - ����Ϊ false")
end

a = "hello"

b = "world"

print("�����ַ���a��b",a..b)

print("b �ַ�������",#b)

--print("�ַ���Test����"��#"Test")



a=20
b=10
c=15
d=5

e=(a+b)*c/d;  --(30*15)/5

print(e)





