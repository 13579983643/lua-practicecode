local bit = require("bit")  --MUSHclient为此提供了一套专门用于二进制操作的函数
require"math"

print(bit.band(18,2)) --按位与
print(bit.band(15,7,3))

print(bit.bor(1,2,8)) --按位或
--print(bit.mod(17,4))  --取模函数  lua 5.1版本无法运营lua二进制.lua:8: attempt to call field 'mod' (a nil value)
--print(bit.neg(1))  --按位“非“运算

--rint(bit.shl(4,6))--按位左移

--print(bit.shr(1024,6))

--print(bit.xor(15,1)) --按位”异或“--按位操作


function __operaByBit(bitFunc, ...)
	local bDataLst = {}    --Lua 的模块是由变量、函数等已知元素组成的 table，
						   --因此创建一个模块很简单，就是创建一个 table，然后把需要导出的常量、函数放入其中，最后返回这个 table 就行。

	for i = 1, select("#", ...) do
		local bData = itob(select(i, ...))  --10进制转换成2进制
		table.insert(bDataLst, bData)
	end
	--print(bDataLst)

	for _, bData in ipairs(bDataLst) do --泛型for循环，哑元变量。。用在for _,v 这里，就是表示不想接收key的值。。
		for i = #bData + 1, __bitNum do   --默认按32位
			table.insert(bData, 1, 0) --在table 表中指定的index位置插入value ，前面空位0
		end
	end

	local resData = {}
	for i = 1, __bitNum do
		local args = {}
		for _, bData in ipairs(bDataLst) do
			table.insert(args, bData[i])
		end
		table.insert(resData, bitFunc(unpack(args))) --unpack( )函数是接受一个数组来作为输入参数，并默认从下标为1开始返回所有元素。
	end

	return btoi(resData)
end




do
function foo(...)
		for i = 1, select('#', ...) do --get the count of the params
			local arg = select(i, ...);  --select the param,返回它的第n个可变实参
			print("arg", arg);
		end
end
	foo(1, 2, 8, 75575);
end


