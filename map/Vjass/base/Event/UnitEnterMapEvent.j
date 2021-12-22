
scope UnitEnterMapEvent initializer Init

    globals
        trigger EnterMapTrigger = CreateTrigger()
    endglobals

    function UnitEnterMapAction takes nothing returns boolean
        local unit u = GetFilterUnit()
        local integer typeId = GetUnitTypeId(u)
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then //受伤事件
            call TriggerRegisterUnitEvent(DamageEventTrigger, u, EVENT_UNIT_DAMAGED)
            // call InitUnitBonus(u)
        endif
        if IsUnitType(u, UNIT_TYPE_HERO) then
            call QueuedUnitRestoreAdd(u)
            call RefreshUnitState(u)
            call TriggerRegisterUnitEvent(UnitSpellEffectTrigger, u, EVENT_UNIT_SPELL_EFFECT)//给单位注册发动技能事件
            call TriggerRegisterUnitEvent(AbilityEventTrigger, u, EVENT_UNIT_SPELL_CHANNEL)
            call TriggerRegisterUnitEvent(AbilityEventTrigger, u, EVENT_UNIT_HERO_SKILL)//学习技能事件
            call TriggerRegisterUnitEvent(HeroLevelUpTrigger, u, EVENT_UNIT_HERO_LEVEL)//英雄升级事件
        endif
        if typeId == 'ndum' then
            call ShowUnit(u, false)
            call SetUnitPathing(u, false)
            call SetUnitInvulnerable(u, true)
            call UnitApplyTimedLife(u,'BTLF', 20.)
        elseif typeId == 'HI02' then
            call RefreshAbilityCost(u)
        elseif typeId == 'nfoh' then
            //call PercentRestoreAura(u, 0.02, 650, 'Ab18', 'B018', function RestoreAura_Filter)
        endif
        set u = null
        return false
    endfunction

    private function Init takes nothing returns nothing
        call TriggerRegisterEnterRegion(EnterMapTrigger, WorldRegion, Condition(function UnitEnterMapAction))
    endfunction

endscope

