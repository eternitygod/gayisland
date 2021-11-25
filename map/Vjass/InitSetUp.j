
library InitSetUp initializer Init

    globals
        //-----------------------------------------------------------------------
        // Constants
        //
        //新的变量
        player LocalPlayer = null
        real CorrectionMinX
        real CorrectionMaxX
        real CorrectionMinY
        real CorrectionMaxY
        //prd算法的哈希表
        hashtable Prd = InitHashtable()

        //常用哈希表
        hashtable HT = InitHashtable()
        //类型转换需要用到的哈希表,可以在同继承关系下转换
        hashtable TypeConversion = InitHashtable()

        //单位组线性表 实际上比直接Create和Destroy效率差了2.5倍左右
        constant integer MaxGroupAmount = 200 //单位组最大值
        integer OverflowValue = 0
        integer GroupIdleValue = 0
        group array MainGroup
        boolean array GroupInUse
        integer MaxGroupHandle = 0

        //定期清除Trigger
        integer DestroyQueueNumber = 0
        trigger array DestroyQueue
        real array ElapsedTime

        //捕获物品死亡
        trigger ItemDeathEventTrigger = CreateTrigger()

        //中心计时器，游戏运行时间
        constant timer GameTimer = CreateTimer() 

        //YDWE的伤害事件 1.33带排泄事件
        trigger DamageEventTrigger = null
        conditionfunc DamageEventCondition = null
        constant integer DAMAGE_EVENT_SWAP_TIMEOUT = 600  // 每隔这个时间(秒), DAMAGE_EVENT_SWAP_ENABLE 会被移入销毁队列
        constant boolean DAMAGE_EVENT_SWAP_ENABLE = true  // 若为 false 则不启用销毁机制

    endglobals

    
    //单位存活
    native UnitAlive takes unit id returns boolean

    native EXGetUnitAbility takes unit u, integer abilcode returns ability
    native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
    native EXGetAbilityId takes ability abil returns integer
    native EXGetAbilityState takes ability abil, integer state_type returns real
    native EXSetAbilityState takes ability abil, integer state_type, real value returns boolean
    native EXGetAbilityDataReal takes ability abil, integer level, integer data_type returns real
    native EXSetAbilityDataReal takes ability abil, integer level, integer data_type, real value returns boolean
    native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
    native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
    native EXGetAbilityDataString takes ability abil, integer level, integer data_type returns string
    native EXSetAbilityDataString takes ability abil, integer level, integer data_type, string value returns boolean
    native EXGetEventDamageData takes integer edd_type returns integer
    native EXSetEventDamage takes real amount returns boolean
    native EXPauseUnit takes unit u, boolean flag returns nothing
    native EXExecuteScript takes string script returns string
    native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
    native EXGetUnitString takes integer unitcode, integer Type returns string
    native EXSetUnitString takes integer unitcode,integer Type,string value returns boolean
    native EXGetItemDataString takes integer itemcode, integer data_type returns string
    native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
            
    native EXGetEffectX takes effect e returns real
    native EXGetEffectY takes effect e returns real
    native EXGetEffectZ takes effect e returns real
    native EXSetEffectXY takes effect e, real x, real y returns nothing
    native EXSetEffectZ takes effect e, real z returns nothing
    native EXGetEffectSize takes effect e returns real
    native EXSetEffectSize takes effect e, real size returns nothing
    native EXEffectMatRotateX takes effect e, real angle returns nothing
    native EXEffectMatRotateY takes effect e, real angle returns nothing
    native EXEffectMatRotateZ takes effect e, real angle returns nothing //特效面对方向
    native EXEffectMatScale takes effect e, real x, real y, real z returns nothing
    native EXEffectMatReset takes effect e returns nothing
    native EXSetEffectSpeed takes effect e, real speed returns nothing
    //Buff的Japi在1.27a不可用 直到最新的YDWE修复，但官方平台上似乎不可用。
    native EXGetBuffDataString takes integer buffcode, integer data_type returns string
    native EXSetBuffDataString takes integer buffcode, integer data_type, string value returns boolean
            
    //YDWE封装
                
    function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer state_type returns real
        return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type)
    endfunction
            
    function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
        return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
            
    function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
        return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
            
    function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
        return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
            
    function YDWESetUnitAbilityState takes unit u, integer abilcode, integer state_type, real value returns boolean
        return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value)
    endfunction
            
    function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns boolean
        return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
            
    function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns boolean
        return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
            
    function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns boolean
        return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction

    //初始化prd的值
    function InitPrd takes nothing returns nothing
        call SaveReal(Prd,- 1, 0, .0038)
        call SaveReal(Prd,- 1, 1, .0147)
        call SaveReal(Prd,- 1, 2, .0322)
        call SaveReal(Prd,- 1, 3, .0557)
        call SaveReal(Prd,- 1, 4, .0847)
        call SaveReal(Prd,- 1, 5, .1189)
        call SaveReal(Prd,- 1, 6, .1579)
        call SaveReal(Prd,- 1, 7, .2015)
        call SaveReal(Prd,- 1, 8, .2493)
        call SaveReal(Prd,- 1, 9, .3021)
        call SaveReal(Prd,- 1, 10, .3604)
        call SaveReal(Prd,- 1, 11, .4226)
        call SaveReal(Prd,- 1, 12, .4811)
        call SaveReal(Prd,- 1, 13, .5714)
        call SaveReal(Prd,- 1, 14, .6666)
        call SaveReal(Prd,- 1, 15, .75)
        call SaveReal(Prd,- 1, 16, .8235)
        call SaveReal(Prd,- 1, 17, .8888)
        call SaveReal(Prd,- 1, 18, .9473)
        call SaveReal(Prd,- 1, 19, 1.)
    endfunction

    //========================================================
    //Group
    //========================================================


    //实际上比直接Create和Destroy效率差了2.5倍左右
    //好处是不需要set g = null 因为这些预先创建的单位组不会被销毁
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


    //========================================================
    //TriggerClear
    //========================================================

    function destroy_error takes string s returns nothing
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
        set ElapsedTime[DestroyQueueNumber]= (TimerGetElapsed(GameTimer) ) + 60
        if DestroyQueueNumber > 8000 then
            call destroy_error("8k")
        endif
    endfunction

    function setnil takes integer i returns nothing
        if i != DestroyQueueNumber then
            set DestroyQueue[i]= DestroyQueue[DestroyQueueNumber]
            set ElapsedTime[i]= ElapsedTime[DestroyQueueNumber]
        endif
        set DestroyQueue[DestroyQueueNumber]= null
        set ElapsedTime[DestroyQueueNumber]= 0
        set DestroyQueueNumber = DestroyQueueNumber - 1
    endfunction

    function TimedCleanupTrigger takes nothing returns boolean
        local real r = TimerGetElapsed(GameTimer) 
        local integer i
        set i = 1
        loop
            exitwhen i > DestroyQueueNumber
            if ElapsedTime[i] < r then
                if DestroyQueue[i] == null then
                    call destroy_error("nil")
                elseif IsTriggerEnabled(DestroyQueue[i]) then
                    call destroy_error(I2S(GetHandleId(DestroyQueue[i] ) ) )
                else
                    call DestroyTrigger(DestroyQueue[i])
                endif
                call setnil(i)
            else
                set i = i + 1
            endif
        endloop
        return false
    endfunction

    //创建一个计时器事件触发器，返回值是触发器的整数地址，需要手动销毁。注意func为触发器的条件Condition而不是动作Action。
    function CreateTimerEventTrigger takes real timeout, boolean periodic, code func returns integer
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)

        call TriggerAddCondition(trig, Condition( func))
        call TriggerRegisterTimerEvent(trig, timeout, periodic)

        set trig = null
        return iHandleId
    endfunction

    //将物件转成物品
    function Widget2Item takes widget whichWidget returns item
        call SaveFogStateHandle(TypeConversion, 0, 0, ConvertFogState(GetHandleId(whichWidget)))
        return LoadItemHandle(TypeConversion, 0, 0)
    endfunction

    function ItemDelayRemove takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local item deathItem = LoadItemHandle(HT, iHandleId, 0)

   

        if GetHandleId(deathItem) > 0 then
            call SetWidgetLife(deathItem, 1)
            call RemoveItem(deathItem)
        endif

        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)

        set trig = null
        set deathItem = null
        return false
    endfunction

    function ItemDeathEventTriggerCallBack takes nothing returns boolean
        local item deathItem = Widget2Item(GetTriggerWidget())
        local integer iHandleId
        //call SetWidgetLife(deathItem, 1)
        //等待,让物品播放完死亡动画,3.633秒是大部分书的死亡时间,似乎物品模型里死亡动画没有比这个更高的.
        //注意 普通物品死亡时间为0.5,书虽然3.633,但后面很大一部分时间都是播放最小化的书
        set iHandleId = CreateTimerEventTrigger(1., false, function ItemDelayRemove)
        call SaveItemHandle(HT, iHandleId, 0, deathItem)
        set deathItem = null
        return false
    endfunction

    //封装的创建物品,因为物品被a掉后会永久存在于地图之中,所以要特殊操作一下.
    function EXCreateItem takes integer itemid, real x, real y returns item
        set bj_lastCreatedItem = CreateItem(itemid, x, y)
        call TriggerRegisterDeathEvent(ItemDeathEventTrigger, bj_lastCreatedItem)
        return bj_lastCreatedItem
    endfunction

    //得到XY之间的角度
    function AngleBetweenXY takes real x1, real y1, real x2, real y2 returns real
        return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
    endfunction

    //单位之间的角度
    function AngleBetweenUnit takes unit u1, unit u2 returns real
        return bj_RADTODEG * Atan2(GetUnitY(u2) - GetUnitY(u1), GetUnitX(u2) - GetUnitX(u1))
    endfunction

    //xy距离
    function GetDistanceBetween takes real x1, real y1, real x2, real y2 returns real
        return SquareRoot((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    endfunction

    //单位之间的距离
    function GetDistanceBetweenUnits takes unit u1, unit u2 returns real
        return SquareRoot((GetUnitX(u1) - GetUnitX(u2)) * (GetUnitX(u1) - GetUnitX(u2)) + (GetUnitY(u1) - GetUnitY(u2)) * (GetUnitY(u1) - GetUnitY(u2)))
    endfunction

    //添加技能并且设置永久性
    function UnitAddPermanentAbility takes unit u, integer id returns boolean
        return UnitAddAbility(u, id) and UnitMakeAbilityPermanent(u, true, id)
    endfunction

    //添加技能并且设置永久性和技能等级
    function UnitAddPermanentAbilitySetlevel takes unit u, integer id, integer lv returns nothing
        if GetUnitAbilityLevel(u, id) == 0 then
            call UnitAddPermanentAbility(u, id)
        endif
        call SetUnitAbilityLevel(u, id, lv)
    endfunction

    //Prd随机数 取5的整数
    function PrdRandom takes unit u, integer abId, real value returns boolean
        local integer h = GetHandleId(u)
        local real newValue
        if not IsUnitType(u, UNIT_TYPE_HERO) then
            return GetRandomInt(1, 100)< value	//如果不是英雄 则直接返回随机数
        endif
        set newValue = LoadReal(Prd,- 1, R2I( R2I(value * .2 )* 5. * .2)- 1)  + LoadReal(Prd, h, abId)
        //call Debug("log","几率: " + R2S(newValue) )
        if GetRandomReal(.0, 1.) < newValue then
            call SaveReal(Prd, h, abId, .0)
            return true
        else
            call SaveReal(Prd, h, abId, newValue)
            return false
        endif
    endfunction

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



    //========================================================
    //从单位组以某个条件获取单位
    //========================================================

    //Nearest Farthest
    //得到单位组距离xy最远的单位
    function GetFarthestUnitByGroup takes group whichGroup, real x, real y returns unit
        local group dummyGroup = LoginGroup()
        local real rFarthestDistance = 0
        local unit dummyUnit
        local unit farthestUnit = null
        local real rDistance = .0
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit = FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rDistance = GetDistanceBetween(GetUnitX(dummyUnit), GetUnitY(dummyUnit), x, y)
            if rDistance > rFarthestDistance then
                set farthestUnit = dummyUnit
                set rFarthestDistance = rDistance
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        set TmpUnit2 = farthestUnit
        call LogoutGroup(dummyGroup)
        set dummyUnit = null
        set farthestUnit = null
        set dummyGroup = null
        return TmpUnit2
    endfunction

    //得到单位组距离xy最近的单位
    function GetNearestUnitByGroup takes group whichGroup, real x, real y returns unit
        local group dummyGroup = LoginGroup()
        local real rNearestDistance = 99999
        local unit dummyUnit
        local unit neareststUnit = null
        local real rDistance = 0.
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit = FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rDistance = GetDistanceBetween(GetUnitX(dummyUnit), GetUnitY(dummyUnit), x, y)
            if rDistance < rNearestDistance then
                set neareststUnit = dummyUnit
                set rNearestDistance = rDistance
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        set TmpUnit2 = neareststUnit
        call LogoutGroup(dummyGroup)
        set dummyUnit = null
        set neareststUnit = null
        set dummyGroup = null
        return TmpUnit2
    endfunction

    //得到单位组中生命值百分比最小的单位
    function GetMinPercentLifeUnitByGroup takes group whichGroup returns unit
        local group dummyGroup = LoginGroup()
        local real rMinPercentLife = 101
        local unit dummyUnit
        local unit minPercentLifeUnit = null
        local real rPercentLife = 0.
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit = FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rPercentLife = GetUnitStatePercent(dummyUnit, UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE)
            if rPercentLife < rMinPercentLife then
                set minPercentLifeUnit = dummyUnit
                set rMinPercentLife = rPercentLife
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        call LogoutGroup(dummyGroup)
        set dummyGroup = null
        set dummyUnit = null
        set TmpUnit2 = minPercentLifeUnit
        set minPercentLifeUnit = null
        return TmpUnit2
    endfunction

    //得到单位组中生命值最小的单位
    function GetMinLifeUnitByGroup takes group whichGroup returns unit
        local group dummyGroup = LoginGroup()
        local real rMinLife = 999999
        local unit dummyUnit
        local unit minLifeUnit = null
        local real rLife = 0.
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit = FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rLife = GetWidgetLife(dummyUnit)
            if rLife < rMinLife then
                set minLifeUnit = dummyUnit
                set rMinLife = rLife
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        call LogoutGroup(dummyGroup)
        set dummyGroup = null
        set dummyUnit = null
        set TmpUnit2 = minLifeUnit
        set minLifeUnit = null
        return TmpUnit2
    endfunction


    function YDWEAnyUnitDamagedFilter takes nothing returns boolean     
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then 
            call TriggerRegisterUnitEvent(DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
        endif
        return false
    endfunction

    function AnyItemDeathFilter takes nothing returns boolean
        local item it = GetFilterItem()
        if GetWidgetLife(it) > 0 then 
            call TriggerRegisterDeathEvent(ItemDeathEventTrigger, it)
        endif
        set it = null
        return false
    endfunction

    function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
        local group g = LoginGroup()
        local integer i = 0
        loop
            call GroupEnumUnitsOfPlayer(g, Player(i), Condition(function YDWEAnyUnitDamagedFilter))
            set i = i + 1
            exitwhen i == bj_MAX_PLAYER_SLOTS
        endloop
        call LogoutGroup(g)
        set g = null
    endfunction


    //重建物品死亡事件
    function M_AnyItemDeathEnumItem takes nothing returns nothing
        local rect world = GetWorldBounds()
        call EnumItemsInRect(world, Condition(function AnyItemDeathFilter), null)
        call RemoveRect(world)
        set world = null
    endfunction
    // 将 DamageEventTrigger 移入销毁队列, 从而排泄触发器事件
    function YDWESyStemAnyUnitDamagedSwap takes nothing returns nothing
        local boolean isEnabled = IsTriggerEnabled(DamageEventTrigger)

        call ClearTrigger(DamageEventTrigger)
        set DamageEventTrigger = CreateTrigger()
        if not isEnabled then
            call DisableTrigger(DamageEventTrigger)
        endif

        set isEnabled = IsTriggerEnabled(ItemDeathEventTrigger)
        call ClearTrigger(ItemDeathEventTrigger)
        set ItemDeathEventTrigger = CreateTrigger()
        if not isEnabled then
            call DisableTrigger(ItemDeathEventTrigger)
        endif

        call TriggerAddCondition(DamageEventTrigger, DamageEventCondition) 
        call TriggerAddCondition(ItemDeathEventTrigger, Condition( function ItemDeathEventTriggerCallBack)) 
        call YDWEAnyUnitDamagedEnumUnit()
        call M_AnyItemDeathEnumItem()
    endfunction
    //改装了一下YDWE的任意单位受伤。
    function YDWESyStemAnyUnitDamagedRegistTrigger takes nothing returns nothing

        set DamageEventTrigger = CreateTrigger()
        call TriggerAddCondition(DamageEventTrigger, DamageEventCondition) 

        if DAMAGE_EVENT_SWAP_ENABLE then
            // 每隔 DAMAGE_EVENT_SWAP_TIMEOUT 秒, 将正在使用的 DamageEventTrigger 和 ItemDeathEventTrigger 移入销毁队列
            call TimerStart(CreateTimer(), DAMAGE_EVENT_SWAP_TIMEOUT, true, function YDWESyStemAnyUnitDamagedSwap)
        endif

    endfunction

    //给所有玩家共享此单位的视野
    function UnitShareVisionToAllPlayer takes unit whichUnit, boolean share returns nothing
        local integer i = 0
        loop
            call UnitShareVision(whichUnit, Player(i), share)
            set i = i + 1
            exitwhen i == bj_MAX_PLAYER_SLOTS
        endloop
    endfunction

    private function Init takes nothing returns nothing
        call InitPrd()
        set LocalPlayer = GetLocalPlayer()
        // 使用 TimerGetElapsed(GameTimer) 获取游戏逝去时间
        call TimerStart(GameTimer, 99999., false, null)
        // 定期清触发器
        call CreateTimerEventTrigger(15, true, function TimedCleanupTrigger)
        // 物品被a掉
        call TriggerAddCondition(ItemDeathEventTrigger, Condition( function ItemDeathEventTriggerCallBack))
        call M_AnyItemDeathEnumItem()
        // 初始化单位组线性表
        call CreateMainGroup()

        //用于修正坐标
        set CorrectionMinX = GetRectMinX(bj_mapInitialPlayableArea)+ 75
        set CorrectionMaxX = GetRectMaxX(bj_mapInitialPlayableArea)- 75
        set CorrectionMinY = GetRectMinY(bj_mapInitialPlayableArea)+ 75
        set CorrectionMaxY = GetRectMaxY(bj_mapInitialPlayableArea)- 75
    
    endfunction

endlibrary

