
scope UnitEnterMapEvent initializer Init

    globals
        trigger EnterMapTrigger = CreateTrigger()
    endglobals

    function UnitEnterMapAction takes nothing returns boolean
        local unit whichUnit = GetFilterUnit()
        local integer typeId = GetUnitTypeId(whichUnit)
        if GetUnitAbilityLevel( whichUnit, 'Aloc') <= 0 then //受伤事件
            call TriggerRegisterUnitEvent(DamageEventTrigger, whichUnit, EVENT_UNIT_DAMAGED)
            // call InitUnitBonus(u)
        else
            set whichUnit = null
            return false
        endif
        if IsUnitType(whichUnit, UNIT_TYPE_HERO) then
            call QueuedUnitRestoreAdd(whichUnit)
            call RefreshUnitState(whichUnit)
            call TriggerRegisterUnitEvent(UnitSpellEffectTrigger, whichUnit, EVENT_UNIT_SPELL_EFFECT)//给单位注册发动技能事件
            call TriggerRegisterUnitEvent(AbilityEventTrigger, whichUnit, EVENT_UNIT_SPELL_CHANNEL)
            call TriggerRegisterUnitEvent(AbilityEventTrigger, whichUnit, EVENT_UNIT_HERO_SKILL)//学习技能事件
            call TriggerRegisterUnitEvent(HeroLevelUpTrigger, whichUnit, EVENT_UNIT_HERO_LEVEL)//英雄升级事件
        endif
        if typeId == 'ndum' then
            call ShowUnit(whichUnit, false)
            call SetUnitPathing(whichUnit, false)
            call SetUnitInvulnerable(whichUnit, true)
            call UnitApplyTimedLife(whichUnit,'BTLF', 20.)
        elseif typeId == 'HI02' then
            call RefreshAbilityCost(whichUnit)
        elseif typeId == 'nfoh' then
            //call PercentRestoreAura(u, 0.02, 650, 'Ab18', 'B018', function RestoreAura_Filter)
        endif
        set whichUnit = null
        return false
    endfunction

    private function Init takes nothing returns nothing
        call TriggerRegisterEnterRegion(EnterMapTrigger, WorldRegion, Condition(function UnitEnterMapAction))
    endfunction

endscope
