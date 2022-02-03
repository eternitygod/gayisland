


#include "JapiConstant.j" // japi常量
#include "math.j"

#include "UnitRestore.j" // 单位恢复 生命值 魔法值
#include "CustomAnyEvent.j" // 任意单位受伤和任意物品死亡

#include "Order.j" // 命令Id

#include "CommonFunc.j" // 大部分的常用函数

#include "Filter.j" // 单位选取的过滤条件 和一些选取单位的函数

#include "UnitStateRefresh.j"  // 刷新单位的属性

#include "UnitBonusSystem.j" // 

#include "ItemSystem.j" // 物品相关事件包含在ItemSystem.j

#include "Event.j" // 一些事件

#include "Buff\BuffSystem.j" // 关于Buff的定义 add以及remove

#include "Test.j"

library base initializer Init requires math, YDWEJapi

    // 单位存活
    native UnitAlive takes unit whichUnit returns boolean

    globals
        // 最常用的哈希表 一般动态注册的东西都用这个
        hashtable HT = InitHashtable()
        // 位移坐标修正
        real CorrectionMinX
        real CorrectionMaxX
        real CorrectionMinY
        real CorrectionMaxY
      
        // 中心计时器，游戏运行时间
        private constant timer GameTimer = CreateTimer()
        // 本地玩家 每个玩家的此变量值不同
        player LocalPlayer = null

        location Tmp__Location = Location(0, 0) // 用来间接获取目标点Z轴

    endglobals

    //创建一个计时器事件触发器，返回值是触发器的整数地址，需要手动销毁。注意func为触发器的条件Condition而不是动作Action。
    function CreateTimerEventTrigger takes real timeout, boolean periodic, code func returns integer
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)
    
        call TriggerAddCondition(trig, Condition( func))
        call TriggerRegisterTimerEvent(trig, timeout, periodic)
    
        set trig = null
        return iHandleId
    endfunction

    function GetNewTimerHandleId takes real timeout, boolean periodic, code func returns integer
        local timer t = CreateTimer()
        local integer i = GetHandleId( t )
        call TimerStart( t, timeout, periodic, func )
        set t = null
        return i
    endfunction

    // 游戏进行时间
    function GetGameTime takes nothing returns real
        return TimerGetElapsed( GameTimer )
    endfunction

    //==============================================================================
    // Triggers
    //==============================================================================
    globals
        // 定期清除Trigger
        private integer DestroyQueueNumber = 0
        private trigger array DestroyQueue
        private real array ElapsedTime
    endglobals

    private function DestroyError takes string s returns nothing
        //if bj_isSinglePlayer then
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303内部检验失败|r")
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303这可能不是一个严重的故障，但对我来说这个信息十分重要|r")
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303错误代码: " + s + "|r")
        //endif
    endfunction

    function ClearTrigger takes trigger t returns nothing
        call DisableTrigger(t)
        set DestroyQueueNumber = DestroyQueueNumber + 1
        set DestroyQueue[DestroyQueueNumber]= t
        set ElapsedTime[DestroyQueueNumber]= (GetGameTime() ) + 60
        if DestroyQueueNumber > 8000 then
            call DestroyError("8k")
        endif
    endfunction

    private function SetNull takes integer i returns nothing
        if i != DestroyQueueNumber then
            set DestroyQueue[i]= DestroyQueue[DestroyQueueNumber]
            set ElapsedTime[i]= ElapsedTime[DestroyQueueNumber]
        endif
        set DestroyQueue[DestroyQueueNumber]= null
        set ElapsedTime[DestroyQueueNumber]= 0
        set DestroyQueueNumber = DestroyQueueNumber - 1
    endfunction

    function TimedCleanupTrigger takes nothing returns boolean
        local real r = GetGameTime() 
        local integer i
        set i = 1
        loop
            exitwhen i > DestroyQueueNumber
            if ElapsedTime[i] < r then
                if DestroyQueue[i] == null then
                    call DestroyError("nil")
                elseif IsTriggerEnabled(DestroyQueue[i]) then
                    call DestroyError(I2S(GetHandleId(DestroyQueue[i] ) ) )
                else
                    call DestroyTrigger(DestroyQueue[i])
                endif
                call SetNull(i)
            else
                set i = i + 1
            endif
        endloop
        return false
    endfunction
    //==============================================================================

    //==============================================================================
    // Groups
    //==============================================================================
    //实际上比直接Create和Destroy效率差了2.5倍左右
    //好处是不需要set g = null 因为这些预先创建的单位组不会被销毁

    globals
        //单位组线性表 实际上比直接Create和Destroy效率差了2.5倍左右
        private constant integer MaxGroupAmount = 200 //单位组最大值
        private integer OverflowValue = 0
        private integer GroupIdleValue = 0
        private group array MainGroup
        private boolean array GroupInUse
        private integer MaxGroupHandle = 0
    endglobals

    function LogoutGroup takes group g returns nothing
        local integer i = GetHandleId(g)- MaxGroupHandle
        if i < 0 or i > MaxGroupAmount then
        else
            call GroupClear(g)
            set GroupInUse[i]= false
            set GroupIdleValue = i
        endif
    endfunction
    function LoginGroup takes nothing returns group
        local integer i = GroupIdleValue
        loop
            exitwhen i == GroupIdleValue - 1
            if not GroupInUse[i] then
                set GroupIdleValue = i + 1
                if GroupIdleValue == MaxGroupAmount then
                    set GroupIdleValue = 1
                endif
                set GroupInUse[i]= true
                return MainGroup[i]
            endif
            set i = i + 1
            if i == MaxGroupAmount then
                set i = 0
            endif
        endloop
        call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 20, "|c00ff0303严重错误: 找不到可用的单位组。|r")
        return CreateGroup()
    endfunction

    function CreateMainGroup takes nothing returns nothing
        local integer i = 0
        set MainGroup[i]= CreateGroup()
        set i = i + 1
        set MaxGroupHandle = GetHandleId(MainGroup[0])
        loop
            exitwhen i == MaxGroupAmount
            set MainGroup[i]= CreateGroup()
            set i = i + 1
        endloop
    endfunction

    //==============================================================================
    // Coordinate
    //==============================================================================
    //修正坐标X 防止SetUnitX超出地图
    function CoordinateX takes real x returns real
        if x < CorrectionMinX then
            return CorrectionMinX
        endif
        if x > CorrectionMaxX then
            return CorrectionMaxX
        endif
        return x
    endfunction
    //修正坐标Y 防止SetUnitY超出地图
    function CoordinateY takes real y returns real
        if y < CorrectionMinY then
            return CorrectionMinY
        endif
        if y > CorrectionMaxY then
            return CorrectionMaxY
        endif
        return y
    endfunction
    //==============================================================================

    private function Init takes nothing returns nothing
        
        set LocalPlayer = GetLocalPlayer()
        // 启动中心计时器?
        call TimerStart( GameTimer, 999999, false, null )
        // 定期清触发器
        call CreateTimerEventTrigger(15, true, function TimedCleanupTrigger)
        // 初始化单位组线性表
        call CreateMainGroup()
        //用于修正坐标
        set CorrectionMinX = GetRectMinX(bj_mapInitialPlayableArea)+ 75
        set CorrectionMaxX = GetRectMaxX(bj_mapInitialPlayableArea)- 75
        set CorrectionMinY = GetRectMinY(bj_mapInitialPlayableArea)+ 75
        set CorrectionMaxY = GetRectMaxY(bj_mapInitialPlayableArea)- 75
        
        // 玩家数量和玩家能拥有的英雄数量
        if M_OnlinePlayerAmount == 1 then
            set PlayerMaxHeroAmount = 4
        elseif M_OnlinePlayerAmount == 2 then
            set PlayerMaxHeroAmount = 2
        endif
    endfunction

endlibrary


