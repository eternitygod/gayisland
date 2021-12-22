--本地命令
local japi = require 'jass.japi'
local message = require 'jass.message'
local jass = require 'jass.common'
local g = require 'jass.globals'

--require "jass.console".enable = true
--message.order_enable_debug = true
local hook = require "jass.hook"
local slk = require "jass.slk"

function hook.GetDetectedUnit()
    return message.selection()
end

--遍历misc表
--function hook.OrderId2String(s)
--    for k, v in pairs(slk.misc) do
--        for z, j in pairs(v) do
--            print(k, v, z, j)
--        end
--    end
--end

function hook.GetStartLocPrioSlot(x,y)
    return message.button(x, y)
end

function hook.AbilityId2String(s)
    local data = slk[g.SlkType][s][g.SlkdataType]
    if data then
        return data
    end
    return nil
end

function Init()
    japi.EXDisplayChat(jass.Player(0), 2, "LuaInit")
end

Init()

