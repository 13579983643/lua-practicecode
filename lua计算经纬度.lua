require"math"

local EARTH_RADIUS = 6378.137
local function rad(d)
	return  (d * math.pi / 180.0)
end

local function getDistance(lat1,lng1,lat2,lng2)



	local radLat1 =   rad(lat1)
	local radLat2 =   rad(lat2)
	local a = radLat1 - radLat2
	local b = rad(lng1) - rad(lng2)
	local s = 2 * math.asin(math.sqrt(math.pow(math.sin(a/2),2) + math.cos(radLat1)*math.cos(radLat2)*math.pow(math.sin(b/2),2)))
	s = s * EARTH_RADIUS
	return s*1000 -- ��λ��
end

print(getDistance(10,11,9,10))

--���幫ʽ�Ƶ�������԰

--��ȡ��ǰ������ʱ���룺local date=os.date(��%Y-%m-%d %H:%M:%S��);
--��ȡ��ǰ��  os.time()

local date = os.date("%Y-%m-%d %H:%M:%S")

print(date)

--����x��y����	math.pow(2,16)

--unixtime ʱ���


--lua�ڴ泣�����Ż� ��string.gsub �� string.gmatch

function getTextLen(str)
    local result = 0
    for uchar in string.gmatch(str, "[%z\1-\127\194-\244][\128-\191]*") do  --
        result = result + 1
    end
    return result
end

print(getTextLen("123zxc��"))


function getTextLen111(str)
    local byteLen = #str
    local strLen = 0
    local i = 1
    local curByte
    local count = 1
    while i <= byteLen do
		curByte = string.byte(str, i)
		count = 1
        if curByte > 0 and curByte <= 127 then   --��ͨ��ĸ��һ���ֽ�
            count = 1
        elseif curByte >= 192 and curByte < 223 then --����
            count = 2
        elseif curByte >= 224 and curByte < 239 then
            count = 3
        elseif curByte >= 240 and curByte < 247 then
            count = 4
        end

        i = i + count
        strLen = strLen + 1
    end
    return strLen
end


print(getTextLen111("123zxc��"))



local tab = { "R", "O", "��", "��", "��", "˵" }

function getName()
     local ret = ""
     for i = 3, #tab do
         ret = ret .. tab[i]
     end
     return ret
end

print(getName())
print("---------------------")
function getName111()
     return table.concat(tab,_,3,#tab)
end

print(getName111())




















