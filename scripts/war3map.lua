
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
