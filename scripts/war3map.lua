

local runtime	= require 'jass.runtime'
--将句柄等级设置为0(地图中所有的句柄均使用table封装)
runtime.handle_level = 0

--关闭等待
runtime.sleep = false

japi = require 'jass.japi'
jass = require 'jass.common'

message = require 'jass.message'
globals = require 'jass.globals'
hook = require "jass.hook"
slk = require "jass.slk"

local function main()
    require 'scripts.hook'
    -- japi.EXDisplayChat(jass.Player(0), 1, "LuaInit")
end

main()
