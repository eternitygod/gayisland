require 'filesystem'
local root = fs.path(arg[1])
local cj=root/'tools'/'jasshelper'/'scripts'/'common.j'
local bj=root/'scripts'/'blizzard.j'
local jh=root/'tools'/'jasshelper'/'jasshelper.exe'
local script = root / 'map'/ 'main.j'
local s1="--scriptonly"
local s2="--scriptonly --nopreprocessor"--通过jasshelper调用pjass进行jass语法检查
local watch = arg[2] == '--watch'
-- 使用JassHelper编译地图 默认用新版pjass
-- jh_path - jasshelper.exe路径
-- common_j_path - common.j路径
-- blizzard_j_path - blizzard.j路径
-- map_path - 地图路径
--备注：特殊情况下jasshelper可能谜之出错，可以找一个原生warmap.j文件清空内容复制粘贴代码。
--http://www.wc3c.net/vexorian/jasshelpermanual.html


local function for_directory(path, f)
	for p in path:list_directory() do
		if fs.is_directory(p) then
			for_directory(p, f)
		else
			f(p)
		end
	end
end

function jasshelper(jh_path,common_j_path,blizzard_j_path,map_path)			  
            local temp=''
            --[[if(arg[4]~='.j')then
               print("不是jass文件")
            return
            end]]
            if arg[2]~='--watch' then
                temp=s1
                --print('jass编译不会自动清除war3map.vj')
            else
                --print("只能检查原生jass")
                temp=s2
            end
            --print("必须在有这个函数的基础上进行语法检查\nfunction main takes nothing returns nothing\nendfunction")
            --print(map_path)
            -- 生成命令行
            local command_line = string.format("%s %s %s %s %s %s",
                    jh_path,
                    temp,
                    common_j_path,
                    blizzard_j_path,
                    map_path,
                    root / 'map'/ 'war3map.j'
                )
                --print(command_line)
                return os.execute(command_line)
end

local b=jasshelper(jh,cj,bj,script)
if(b==true and arg[2]=='--watch')then
    local temp = string.format("%s%s",script,".vj")
    print(temp)
    -- 语法检查时生成命令行删除自动生成的war3map.vj
    local command = string.format("del /q %s",temp)
    os.execute(command)
end

