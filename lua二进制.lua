local bit = require("bit")  --MUSHclientΪ���ṩ��һ��ר�����ڶ����Ʋ����ĺ���
require"math"

print(bit.band(18,2)) --��λ��
print(bit.band(15,7,3))

print(bit.bor(1,2,8)) --��λ��
--print(bit.mod(17,4))  --ȡģ����  lua 5.1�汾�޷���Ӫlua������.lua:8: attempt to call field 'mod' (a nil value)
--print(bit.neg(1))  --��λ���ǡ�����

--rint(bit.shl(4,6))--��λ����

--print(bit.shr(1024,6))

--print(bit.xor(15,1)) --��λ�����--��λ����


function __operaByBit(bitFunc, ...)
	local bDataLst = {}    --Lua ��ģ�����ɱ�������������֪Ԫ����ɵ� table��
						   --��˴���һ��ģ��ܼ򵥣����Ǵ���һ�� table��Ȼ�����Ҫ�����ĳ����������������У���󷵻���� table ���С�

	for i = 1, select("#", ...) do
		local bData = itob(select(i, ...))  --10����ת����2����
		table.insert(bDataLst, bData)
	end
	--print(bDataLst)

	for _, bData in ipairs(bDataLst) do --����forѭ������Ԫ������������for _,v ������Ǳ�ʾ�������key��ֵ����
		for i = #bData + 1, __bitNum do   --Ĭ�ϰ�32λ
			table.insert(bData, 1, 0) --��table ����ָ����indexλ�ò���value ��ǰ���λ0
		end
	end

	local resData = {}
	for i = 1, __bitNum do
		local args = {}
		for _, bData in ipairs(bDataLst) do
			table.insert(args, bData[i])
		end
		table.insert(resData, bitFunc(unpack(args))) --unpack( )�����ǽ���һ����������Ϊ�����������Ĭ�ϴ��±�Ϊ1��ʼ��������Ԫ�ء�
	end

	return btoi(resData)
end




do
function foo(...)
		for i = 1, select('#', ...) do --get the count of the params
			local arg = select(i, ...);  --select the param,�������ĵ�n���ɱ�ʵ��
			print("arg", arg);
		end
end
	foo(1, 2, 8, 75575);
end


