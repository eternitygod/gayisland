

scope Stun

    globals
        constant integer UNITBUFF_STUN = 'BPSE'
    endglobals
    // 模拟行为限制
    // 模拟晕眩
    // EXPauseUnit内部自带计数 为true时+1 false时-1 计数 <=0 时单位不再晕眩
    // 移除晕眩
    function UnitRemoveStun takes unit u returns boolean
        local integer h
        local integer uh = GetHandleId(u)
        local timer t = null
        if HaveSavedHandle(UnitBuffData, uh, UNITBUFF_STUN) then
            set t = LoadTimerHandle(UnitBuffData, uh, UNITBUFF_STUN)
            set h = GetHandleId(t)
            call RemoveSavedHandle(UnitBuffData, uh, UNITBUFF_STUN)
            call RemoveSavedHandle(HT, h, 0)
            call DestroyTimer(t)
            call EXPauseUnit(u, false) //此函数内部自带计数
            call UnitRemoveAbility(u, 'Aasl')
            call UnitRemoveAbility(u, 'BPSE')
            set t = null
            return true
        endif
        return false
    endfunction

    function UnitStun_Actions takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 0)
        local integer uh = GetHandleId(u)
        //call SaveInteger(UnitBuffData, uh, UNITBUFF_STUN,  LoadInteger(UnitBuffData, uh, UNITBUFF_STUN) - 1 )
        call RemoveSavedHandle(UnitBuffData, uh, UNITBUFF_STUN)
        call RemoveSavedHandle(HT, h, 0)
        call PauseTimer(t)
        call DestroyTimer(t)
        call EXPauseUnit(u, false) //此函数内部自带计数
        call UnitRemoveAbility(u, 'Aasl')
        call UnitRemoveAbility(u, 'BPSE')
        set t = null
        set u = null
    endfunction
    // 单位、持续时间、是否无视魔免
    function UnitSetStun takes unit u, real dur returns boolean
        local timer t
        local integer h = GetHandleId(u)
        local real time = 0
        if HaveSavedHandle(UnitBuffData, h, UNITBUFF_STUN) then
            set t = LoadTimerHandle(UnitBuffData, h, UNITBUFF_STUN)
            set time = TimerGetRemaining(t)
        else
            set t = CreateTimer()
            call EXPauseUnit(u, true)
            //call SaveInteger(UnitBuffData, h, UNITBUFF_STUN, LoadInteger(UnitBuffData, h, UNITBUFF_STUN) + 1)
            call UnitAddAbility(u, 'Aasl')
            call UnitMakeAbilityPermanent(u, true, 'Aasl')
            call SaveTimerHandle(UnitBuffData, h, UNITBUFF_STUN, t)
            call SaveUnitHandle(HT, GetHandleId(t), 0, u)
        endif
        if time < dur then
            set time = dur
        endif
        if time != 0 then
            call TimerStart(t, time, false, function UnitStun_Actions)
        endif
        set t = null
        return true
    endfunction
    // 封装了一层本质上是使用UnitSetStun 参数b为是否无视魔法免疫
    function M_UnitSetStun takes unit u, real dur, real herodur, boolean b returns boolean
        if IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE) and not b then//检查是否魔免
            return false
        endif
        if GetUnitAbilityLevel(u, 'AHer') == 1 then //如果单位为英雄 那么就会有此技能
            set dur = herodur
        endif
        return UnitSetStun(u, dur)
    endfunction

endscope

    