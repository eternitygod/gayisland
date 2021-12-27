
library UnitRestore initializer InitUnitRestore
    
    globals
        // 单位状态恢复 生命/魔法
        // 计时器RESTORE_FRAME秒回调一次
        // timer UnitRestoreTimer = null 
        // 恢复队列
        // 单位恢复间隔
	    constant real RESTORE_FRAME = 0.2 

        unit array UnitLifeRestoreQueue
        unit array UnitManaRestoreQueue
        real array LifeRestoreValue
        real array ManaRestoreValue
        // 恢复队列最大值
        integer UnitLifeRestoreNumber = 0
        integer UnitManaRestoreNumber = 0

        constant key UNIT_LIFERESTORE
        constant key UNIT_MANARESTORE

        /* 力量回血 智力回蓝 */
        constant real STR_REGEN_BONUS = 0.05
        constant real INT_REGEN_BONUS = 0.05

    endglobals

    /* 恢复值 = ( 基础恢复 + 属性额外恢复 + 恢复速度奖励 ) * RESTORE_FRAME  */

    //生命恢复,所有生命恢复都以这条函数来进行	/*不包括生命移除*/
    function UnitRestoreLife takes unit u, real r returns nothing
        static if IS_ISLAND then
            if r != 0 then
                if IsUnitType(u, UNIT_TYPE_UNDEAD) then	//不死族单位在荒芜地表享受两倍生命恢复效果
                    if IsPointBlighted(GetUnitX(u), GetUnitY(u)) then
                        set r = r * 2.00
                    endif
                endif
                call SetWidgetLife(u, GetWidgetLife(u) + r)
            endif
        else
            call SetWidgetLife(u, GetWidgetLife(u) + r)
        endif
    endfunction
    
    //魔法恢复,所有魔法恢复都以这条函数来进行  /*不包括魔法移除*/
    function UnitRestoreMana takes unit u, real r returns nothing
        if r != 0 then
            call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+ r)
        endif
    endfunction

    globals
        constant key OBJ_UNIT_LIFE_RESTORE
        constant key OBJ_UNIT_MANA_RESTORE
    endglobals

    // 储存单位的恢复数据, 在地图开始时就初始化
    function SaveBaseRestoreData takes integer whichType, real life, real mana returns nothing
        if life != 0 then
            call SaveReal( ObjectData, OBJ_UNIT_LIFE_RESTORE, whichType, life )
        endif
        if mana != 0 then
            call SaveReal( ObjectData, OBJ_UNIT_MANA_RESTORE, whichType, mana )
        endif
    endfunction

    function GetBaseLifeRestore takes unit whichUnit returns real
        return LoadReal( ObjectData, OBJ_UNIT_LIFE_RESTORE, GetUnitTypeId( whichUnit ) )
    endfunction

    function GetBaseManaRestore takes unit whichUnit returns real
        return LoadReal( ObjectData, OBJ_UNIT_MANA_RESTORE, GetUnitTypeId( whichUnit ) )
    endfunction

    // 获取单位的恢复数据 (重新计算一遍)
    /* 基础恢复 + 属性额外恢复 + 恢复速度奖励 */
    private function GetUnitLifeRestore takes integer h, unit u returns real
        return ( LoadReal(DynamicData, h, LIFE_RESTORE_BONUS) + GetBaseLifeRestore(u) + (GetHeroStr(u, true) * STR_REGEN_BONUS) ) 
    endfunction

    private function GetUnitManaRestore takes integer h, unit u returns real
        return ( LoadReal(DynamicData, h, MANA_RESTORE_BONUS) + GetBaseManaRestore(u) + (GetHeroInt(u, true) * INT_REGEN_BONUS) ) 
    endfunction

    private function GetRestoreIndex takes integer h, integer key returns integer
        return LoadInteger(DynamicData, h, key)
    endfunction

    function RefreshLifeUnitRestore takes unit u returns nothing
        local integer h = GetHandleId(u)
        local integer index = GetRestoreIndex(h, UNIT_LIFERESTORE)
        set LifeRestoreValue[index] = GetUnitLifeRestore(h, u) * RESTORE_FRAME
    endfunction
    function RefreshManaUnitRestore takes unit u returns nothing
        local integer h = GetHandleId(u)
        local integer index = GetRestoreIndex(h, UNIT_MANARESTORE)
        set ManaRestoreValue[index] = GetUnitManaRestore(h, u) * RESTORE_FRAME
    endfunction

    function RefreshUnitRestore takes unit u returns nothing
        local integer h = GetHandleId(u)
        set LifeRestoreValue[GetRestoreIndex(h, UNIT_LIFERESTORE)] = GetUnitLifeRestore(h, u) * RESTORE_FRAME
        set ManaRestoreValue[GetRestoreIndex(h, UNIT_MANARESTORE)] = GetUnitManaRestore(h, u) * RESTORE_FRAME
    endfunction


   

    // 单位是否有进入恢复队列?
    function UnitCanRestoreLife takes unit whichUnit returns boolean
        return HaveSavedInteger(DynamicData, GetHandleId(whichUnit), UNIT_LIFERESTORE)
    endfunction

    function UnitCanRestoreMana takes unit whichUnit returns boolean
        return HaveSavedInteger(DynamicData, GetHandleId(whichUnit), UNIT_MANARESTORE)
    endfunction

    // 使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitLifeRestoreAdd takes unit whichUnit returns nothing
        set UnitLifeRestoreNumber = UnitLifeRestoreNumber + 1
        set UnitLifeRestoreQueue[UnitLifeRestoreNumber] = whichUnit
        set LifeRestoreValue[UnitLifeRestoreNumber] = 0.	//可能不需要set 0
        call SaveInteger(DynamicData, GetHandleId(whichUnit), UNIT_LIFERESTORE, UnitLifeRestoreNumber)
        call RefreshLifeUnitRestore(whichUnit)
    endfunction
    //使 单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitManaRestoreAdd takes unit whichUnit returns nothing
        set UnitManaRestoreNumber = UnitManaRestoreNumber + 1
        set UnitManaRestoreQueue[UnitManaRestoreNumber] = whichUnit
        set ManaRestoreValue[UnitManaRestoreNumber] = 0.
        call SaveInteger(DynamicData, GetHandleId(whichUnit), UNIT_MANARESTORE, UnitManaRestoreNumber)
        call RefreshManaUnitRestore(whichUnit)
    endfunction

    // 使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitRestoreAdd takes unit whichUnit returns nothing
        call QueuedUnitLifeRestoreAdd(whichUnit)
        call QueuedUnitManaRestoreAdd(whichUnit)
    endfunction

    // 将单位移出恢复队列,禁用其恢复 生命
    function QueuedUnitLifeRestoreRemove takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer index = LoadInteger(DynamicData, iHandleId, UNIT_LIFERESTORE)
        if index != UnitLifeRestoreNumber then
            set UnitLifeRestoreQueue[index] = UnitLifeRestoreQueue[UnitLifeRestoreNumber]
            set LifeRestoreValue[index] = LifeRestoreValue[UnitLifeRestoreNumber]
            call SaveInteger(DynamicData, iHandleId, UNIT_LIFERESTORE, 0)

            set iHandleId = GetHandleId(UnitLifeRestoreQueue[UnitLifeRestoreNumber])
            call SaveInteger(DynamicData, iHandleId, UNIT_LIFERESTORE, index)
        endif
        set UnitLifeRestoreQueue[UnitLifeRestoreNumber] = null
        set LifeRestoreValue[UnitLifeRestoreNumber] = 0.

        set UnitLifeRestoreNumber = UnitLifeRestoreNumber - 1
    endfunction

    //将单位移出恢复队列,禁用其恢复 魔法
    function QueuedUnitManaRestoreRemove takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer index = LoadInteger(DynamicData, iHandleId, UNIT_MANARESTORE)
        if index != UnitManaRestoreNumber then
            set UnitManaRestoreQueue[index] = UnitManaRestoreQueue[UnitManaRestoreNumber]
            set ManaRestoreValue[index] = ManaRestoreValue[UnitManaRestoreNumber]
            call SaveInteger(DynamicData, iHandleId, UNIT_MANARESTORE, 0)
	
            set iHandleId = GetHandleId(UnitManaRestoreQueue[UnitManaRestoreNumber])
            call SaveInteger(DynamicData, iHandleId, UNIT_MANARESTORE, index)
        endif
        set UnitManaRestoreQueue[UnitManaRestoreNumber] = null
        set ManaRestoreValue[UnitManaRestoreNumber] = 0.

        set UnitManaRestoreNumber = UnitManaRestoreNumber - 1
    endfunction

    //将单位移出恢复队列,禁用其恢复 生命/魔法
    function QueuedUnitRestoreRemove takes unit whichUnit returns nothing
        call QueuedUnitLifeRestoreRemove(whichUnit)
        call QueuedUnitManaRestoreRemove(whichUnit)
    endfunction

     /*==========================================================================*/
    /* 额外恢复奖励 */
    /*==========================================================================*/

    // 
    private function GetUnitLifeRestoreBonus takes integer h returns real
        return LoadReal( DynamicData, h, UNIT_LIFERESTORE )
    endfunction

    private function GetUnitManaRestoreBonus takes integer h returns real
        return LoadReal( DynamicData, h, MANA_RESTORE_BONUS )
    endfunction
    
    //设置单位生命恢复速度 这里GetHandleId用了三次 待优化
    function UnitSetLifeRestoreBonus takes unit whichUnit, real newValue returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer index = GetRestoreIndex(h, UNIT_LIFERESTORE)
        if index == 0 then
            call QueuedUnitLifeRestoreAdd(whichUnit)
        endif
        call SaveReal( DynamicData, h, LIFE_RESTORE_BONUS, newValue ) 
        call RefreshLifeUnitRestore( whichUnit )
    endfunction
    
    //设置单位魔法恢复速度奖励
    function UnitSetManaRestoreBonus takes unit whichUnit, real newValue returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer index = GetRestoreIndex(h, UNIT_MANARESTORE)
        if index == 0 then
            call QueuedUnitManaRestoreAdd(whichUnit)
        endif
        call SaveReal( DynamicData, h, MANA_RESTORE_BONUS, newValue ) 
        call RefreshManaUnitRestore( whichUnit )
    endfunction

    function UnitAddLifeRestore takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId( whichUnit )
        if value == 0 then
            return
        endif
        call UnitSetLifeRestoreBonus( whichUnit, GetUnitLifeRestoreBonus(h) + value )
    endfunction
    function UnitReduceLifeRestore takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId( whichUnit )
        if value == 0 then
            return
        endif
        call UnitSetLifeRestoreBonus( whichUnit, GetUnitLifeRestoreBonus(h) - value )
    endfunction

    function UnitAddManaRestore takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId( whichUnit )
        if value == 0 then
            return
        endif
        call UnitSetManaRestoreBonus( whichUnit, GetUnitManaRestoreBonus(h) + value )
    endfunction
    function UnitReduceManaRestore takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId( whichUnit )
        if value == 0 then
            return
        endif
        call UnitSetManaRestoreBonus( whichUnit, GetUnitManaRestoreBonus(h) - value )
    endfunction

    /* 由于30w字节码限制, 全地图单位过多时可能恢复不完整, 将生命值和魔法值分开进行恢复. */

    function RestoreAllUnitLife takes nothing returns boolean
        local integer i = 1
        loop
            exitwhen i > UnitLifeRestoreNumber
            if UnitAlive(UnitLifeRestoreQueue[i]) then
                call UnitRestoreLife(UnitLifeRestoreQueue[i], LifeRestoreValue[i])
                //call UnitRestoreMana(UnitRestoreQueue[i], ManaRestoreValue[i])
            endif
            set i = i + 1
        endloop
        return false
    endfunction

    function RestoreAllUnitMana takes nothing returns boolean
        local integer i = 1
        loop
            exitwhen i > UnitManaRestoreNumber
            if UnitAlive(UnitManaRestoreQueue[i]) then
                call UnitRestoreMana(UnitManaRestoreQueue[i], ManaRestoreValue[i])
            endif
            set i = i + 1
        endloop
        return false
    endfunction


    function InitUnitRestore takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterTimerEvent(trig, RESTORE_FRAME, true)
        call TriggerAddCondition(trig, Condition( function RestoreAllUnitLife))

        set trig = CreateTrigger()
        call TriggerRegisterTimerEvent(trig, RESTORE_FRAME, true)
        call TriggerAddCondition(trig, Condition( function RestoreAllUnitMana))
    endfunction


endlibrary

