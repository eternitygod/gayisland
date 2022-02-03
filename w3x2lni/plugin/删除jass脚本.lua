local mt = {}

mt.info = {
    name = '删除vjass脚本',
    version = 1.0,
    author = 'vcccv',
    description = '删除vjass脚本',
}

local w2l

local function removeJassResource()
    for _, filename in pairs(w2l.info.obj) do
        w2l:file_remove('Vjass', filename)
    end
end

function mt:on_full(w2l_)
	w2l = w2l_
    if not w2l.setting.mode == 'obj' then
        return
    end
    removeJassResource()
end

return mt
