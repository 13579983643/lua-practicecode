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







var ="hello".."hello"  --连接字符串

print(var)

var = "hello".."hello"
print(var)
print(#var)  --获取字符串长度



   long_str = [==[ i am am

   "long",

   long

    str]==]

    print(long_str )


       print(#long_str)





t = {a = "test1", b= "test2"} --table 类似C++的 map,比map 繁琐

 print(t)


a = 21
b = 10
c = a+b
print("Line 1 -c 的值为 ",c)

c = a-b
print("Line 2 -c 的值为",c)

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
Line 1 -c 的值为 	31
Line 2 -c 的值为	11
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
Line 1 -c 的值为 	31
Line 2 -c 的值为	11
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
    print("Line1 -a 等于b")
else
    print("Line1 -a 不等于b")

end

if(a ~= b)

then
   print("Line2 -a 不等于b")
else
   print("Line2 -a 等于b")
end

if(a<b)
then
  print("Line3 -a 小于b")
else
   print("Line3 -a 大于dengyub")
end

print("好的，班长")

a = false

b = true

if(a and b)
then
  print("a and b - 条件为 true")

else
  print("a and b - 条件为 false")
end


if(not(a and b))

then
  print("not(a and b) -条件为 true")

else
   print("not(a and b) - 条件为 false")
end

a = "hello"

b = "world"

print("连接字符串a和b",a..b)

print("b 字符串长度",#b)

--print("字符串Test长度"，#"Test")



a=20
b=10
c=15
d=5

e=(a+b)*c/d;  --(30*15)/5

print(e)





