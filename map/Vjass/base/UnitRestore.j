
library UnitRestore initializer InitUnitRestore
    
    globals
        //单位状态恢复 生命/魔法
        //计时器RestoreFrame秒回调一次
        //timer UnitRestoreTimer = null 
        //恢复队列
        unit array UnitLifeRestoreQueue
        unit array UnitManaRestoreQueue
        real array LifeRestoreValue
        real array ManaRestoreValue
        //恢复队列最大值
        integer UnitLifeRestoreNumber = 0
        integer UnitManaRestoreNumber = 0
    endglobals

    function UnitCanRestoreLife takes unit whichUnit returns boolean
        return HaveSavedInteger(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE)
    endfunction

    function UnitCanRestoreMana takes unit whichUnit returns boolean
        return HaveSavedInteger(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE)
    endfunction

    //生命恢复,所有生命恢复都以这条函数来进行	/*不包括生命移除*/
    function UnitRestoreLife takes unit u, real r returns nothing
        if r != 0 then
            if IsUnitType(u, UNIT_TYPE_UNDEAD) then	//不死族单位在荒芜地表享受两倍生命恢复效果
                if IsPointBlighted(GetUnitX(u), GetUnitY(u)) then
                    set r = r * 2.00
                endif
            endif
            call SetWidgetLife(u, GetWidgetLife(u) + r)
        endif
    endfunction

    //魔法恢复,所有魔法恢复都以这条函数来进行  /*不包括魔法移除*/
    function UnitRestoreMana takes unit u, real r returns nothing
        if r != 0 then
            call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+ r)
        endif
    endfunction

    //使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitLifeRestoreAdd takes unit whichUnit returns nothing
        set UnitLifeRestoreNumber = UnitLifeRestoreNumber + 1
        set UnitLifeRestoreQueue[UnitLifeRestoreNumber] = whichUnit
        set LifeRestoreValue[UnitLifeRestoreNumber] = 0.	//可能不需要set 0
        call SaveInteger(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE, UnitLifeRestoreNumber)
    endfunction
    //使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitManaRestoreAdd takes unit whichUnit returns nothing
        set UnitManaRestoreNumber = UnitManaRestoreNumber + 1
        set UnitManaRestoreQueue[UnitManaRestoreNumber] = whichUnit
        set ManaRestoreValue[UnitManaRestoreNumber] = 0.
        call SaveInteger(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE, UnitManaRestoreNumber)
    endfunction

    //使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitRestoreAdd takes unit whichUnit returns nothing
        call QueuedUnitLifeRestoreAdd(whichUnit)
        call QueuedUnitManaRestoreAdd(whichUnit)
    endfunction

    //将单位移出恢复队列,禁用其恢复 生命
    function QueuedUnitLifeRestoreRemove takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer index = LoadInteger(UnitData, iHandleId, UNIT_LIFERESTORE)
        if index != UnitLifeRestoreNumber then
            set UnitLifeRestoreQueue[index] = UnitLifeRestoreQueue[UnitLifeRestoreNumber]
            set LifeRestoreValue[index] = LifeRestoreValue[UnitLifeRestoreNumber]
            call SaveInteger(UnitData, iHandleId, UNIT_LIFERESTORE, 0)

            set iHandleId = GetHandleId(UnitLifeRestoreQueue[UnitLifeRestoreNumber])
            call SaveInteger(UnitData, iHandleId, UNIT_LIFERESTORE, index)
        endif
        set UnitLifeRestoreQueue[UnitLifeRestoreNumber] = null
        set LifeRestoreValue[UnitLifeRestoreNumber] = 0.

        set UnitLifeRestoreNumber = UnitLifeRestoreNumber - 1
    endfunction

    //将单位移出恢复队列,禁用其恢复 魔法
    function QueuedUnitManaRestoreRemove takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer index = LoadInteger(UnitData, iHandleId, UNIT_MANARESTORE)
        if index != UnitManaRestoreNumber then
            set UnitManaRestoreQueue[index] = UnitManaRestoreQueue[UnitManaRestoreNumber]
            set ManaRestoreValue[index] = ManaRestoreValue[UnitManaRestoreNumber]
            call SaveInteger(UnitData, iHandleId, UNIT_MANARESTORE, 0)
	
            set iHandleId = GetHandleId(UnitManaRestoreQueue[UnitManaRestoreNumber])
            call SaveInteger(UnitData, iHandleId, UNIT_MANARESTORE, index)
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



    //RestoreFrame秒回调一次,恢复单位 生命/魔法
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
        call TriggerRegisterTimerEvent(trig, RestoreFrame, true)
        call TriggerAddCondition(trig, Condition( function RestoreAllUnitLife))

        set trig = CreateTrigger()
        call TriggerRegisterTimerEvent(trig, RestoreFrame, true)
        call TriggerAddCondition(trig, Condition( function RestoreAllUnitMana))
    endfunction

endlibrary

