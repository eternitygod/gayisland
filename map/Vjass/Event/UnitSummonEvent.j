

scope UnitSummonEvent initializer Init
    
    function SummonIllusionUnit takes unit hIllusionUnit, unit hMasterUnit returns nothing
        call SyncIllusionUnitState(hIllusionUnit, hMasterUnit)
    endfunction

    function UnitSummonEventActions takes nothing returns boolean
        local unit hSummonedUnit = GetSummonedUnit()
        local unit hSnmmoingUnit = GetSummoningUnit()
        // 如果是马甲在召唤 则设置召唤者为真正的召唤者
        if GetUnitAbilityLevel(hSnmmoingUnit, 'Aloc') > 0 then
            set hSnmmoingUnit = GetMasterUnit(hSnmmoingUnit)
        endif
        if IsUnitIllusion(hSummonedUnit) then
            call SummonIllusionUnit(hSummonedUnit, hSnmmoingUnit)
        endif
        set hSummonedUnit = null
        set hSnmmoingUnit = null
        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger() 
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SUMMON)
        call TriggerAddCondition(trig, Condition(function UnitSummonEventActions))
        set trig = null 
    endfunction

endscope