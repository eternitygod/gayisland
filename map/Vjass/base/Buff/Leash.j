
// 枷锁
scope Leash
    
    globals

    endglobals

    // 移除单位枷锁
    function UnitRemoveLeash takes unit u, integer abid, integer buffId returns nothing
	
    endfunction

    //GetTriggerEventId() == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 50)//
    //似乎不需要记录技能Id
    private function CallBack takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 1)
        local unit target = LoadUnitHandle(HT, h, 0)
        local integer c = GetTriggerEvalCount(t)
        local real damage
        local eventid trigEventId = GetTriggerEventId()
        //时间到期 或 Buff等级为0 或 单位死亡
        if c == LoadInteger(HT, h, 30) or GetUnitAbilityLevel(target, LoadInteger(HT, h, 2)) == 0 or trigEventId == EVENT_WIDGET_DEATH or ( trigEventId == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 55) ) then
            call DestroyLightning(LoadLightningHandle(HT, h, 10))
            call EXPauseUnit(target, false)
            call RemoveSavedHandle(UnitBuffData, GetHandleId(u), UNITBUFF_STUN)
            //call SaveInteger(DynamicData, h, UNITBUFF_STUN, LoadInteger(DynamicData, h, UNITBUFF_STUN ) - 1)
            call UnitRemoveAbility(target, LoadInteger(HT, h, 1) )
            call UnitRemoveAbility(target, LoadInteger(HT, h, 2) )
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        else
            if HaveSavedHandle(HT, h, 10) then
                call MoveLightning(LoadLightningHandle(HT, h, 10), true, GetUnitX(u), GetUnitY(u), GetUnitX(target), GetUnitY(target))
                if ModuloInteger(c, 20) == 1 then //伤害单位
                    set damage = LoadReal(HT, h, 30)
                    if damage != 0 then
                        call DamageUnit(u, target, 1, damage) //枷锁只会造成法术攻击 魔法伤害
                    endif
                endif
            else
                set damage = LoadReal(HT, h, 30)
                if damage != 0 then
                    call DamageUnit(u, target, 1, damage) //如果没存闪电效果则每次回调造成一次伤害
                endif
            endif
        endif
        set trigEventId = null
        set t = null
        set target = null
        set u = null
        return false
    endfunction

    //关于单位枷锁，Buff的叠加类型为 同idBuff重复释放刷新持续时间。
    //codeName填 "_" 则不会有闪电效果 如果需要单位持续施法，使用UnitSetLeashByAbility。
    function UnitSetLeash takes unit spellUnit, unit targetUnit, string codeName, integer spellAbility,integer abilityId, integer buffId, real dur, real herodur, real damage, boolean ignoreMagicImmunes returns boolean
        local integer h
        local trigger t
        local real time = 0.
        if IsUnitType(targetUnit, UNIT_TYPE_MAGIC_IMMUNE) and not ignoreMagicImmunes then
            return false
        endif
        set h = GetHandleId(targetUnit)
        if GetUnitAbilityLevel(targetUnit, 'AHer') == 1 then
            set dur = herodur
        endif
        if GetUnitAbilityLevel(targetUnit, buffId) == 1 then
            set t = LoadTriggerHandle(UnitBuffData, h, buffId)//防止buff的key冲突所以加一下
        else
            call EXPauseUnit(targetUnit, true)
            //call SaveInteger(DynamicData, h, UNITBUFF_STUN, LoadInteger(DynamicData, h, UNITBUFF_STUN ) + 1)
            set t = CreateTrigger()
            call TriggerAddCondition(t, Condition( function CallBack))
            call SaveTriggerHandle(UnitBuffData, h, buffId, t)
            set h = GetHandleId(t)
            if spellAbility != 0 then
                call SaveInteger(HT, h, 55, spellAbility)
                call TriggerRegisterUnitEvent(t, spellUnit, EVENT_UNIT_SPELL_ENDCAST)
            endif
            call UnitAddAbility(targetUnit, abilityId)
            call UnitMakeAbilityPermanent(targetUnit, true, abilityId)
            call SaveUnitHandle(HT, h, 0, targetUnit)
            call SaveUnitHandle(HT, h, 1, spellUnit)
            if codeName != "_" then
                call SaveLightningHandle(HT, h, 10, AddLightning(codeName, true, GetUnitX(spellUnit), GetUnitY(spellUnit), GetUnitX(targetUnit), GetUnitY(targetUnit)))
                call TriggerRegisterTimerEvent(t, LeashFrame, true) //
            else
                call TriggerRegisterTimerEvent(t, 1, true) //如果没有闪电特效，则一秒回调一次。
            endif
            if damage != 0 then //直接存入伤害值
                call SaveReal(HT, h, 30, damage)
            endif
            call SaveInteger(HT, h, 1, abilityId)
            call SaveInteger(HT, h, 2, buffId)
            call SaveInteger(HT, h, 30, R2I( dur / LeashFrame ) ) //此项为最大赋值次数(持续时间)  dur / (LeashFrame)
        endif
        if time < dur then
            set time = dur
        endif
        if time != 0 then
            call TriggerRegisterDeathEvent(t, spellUnit)
            call TriggerRegisterDeathEvent(t, targetUnit)
        endif
        set t = null
        return true
    endfunction

endscope
