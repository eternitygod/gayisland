local mt = {}

mt.info = {
    name = '引用声明',
    version = 1.0,
    author = '最萌小汐',
    description = '对只在lua中使用的对象进行引用声明。',
}

local list = {}

--list['Anei'] = true
list['AInv'] = true

local firsts = 'ehbnH'
local chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
for x = 0, 1 do
    for y = 1, #chars do
        for z = 1, #firsts do
            list[firsts:sub(z,z)..'0'..x..chars:sub(y,y)] = true
        end
    end
end

function mt:on_mark()
    return list
end

return mt
